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
| hive-router | v0.0.84 | 3,102 | 3,370 | 3,050 | 3.5% |  |
| fusion-nightly | 16.6.0-p.6 | 2,660 | 2,769 | 2,644 | 1.7% |  |
| fusion | 16.5.1 | 2,568 | 2,681 | 2,506 | 2.1% |  |
| fusion-nightly-net11 | 16.6.0-p.6 | 2,568 | 2,704 | 2,543 | 2.2% |  |
| grafbase | 0.53.5 | 2,233 | 2,349 | 2,213 | 2.1% |  |
| cosmo | 0.334.0 | 1,307 | 1,355 | 1,300 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 619 | 638 | 616 | 1.3% |  |
| apollo-router | v2.16.1 | 483 | 494 | 467 | 1.5% |  |
| apollo-gateway | 2.14.3 | 281 | 286 | 279 | 0.9% |  |
| hive-gateway | 2.10.8 | 272 | 280 | 271 | 1.1% |  |
| feddi | 5ff8b6165878 | 0 | 0 | 0 | 0.0% | non-compatible response (177 across 1/2 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,588 | 2,769 | 2,546 | 2.8% |  |
| fusion-nightly | 16.6.0-p.6 | 2,451 | 2,561 | 2,391 | 1.9% |  |
| fusion-nightly-net11 | 16.6.0-p.6 | 2,414 | 2,518 | 2,404 | 1.7% |  |
| fusion | 16.5.1 | 2,312 | 2,424 | 2,300 | 2.0% |  |
| fusion-nightly-fed | 16.6.0-p.6 | 2,189 | 2,298 | 2,175 | 1.9% |  |
| grafbase | 0.53.5 | 1,656 | 1,715 | 1,649 | 1.3% |  |
| cosmo | 0.334.0 | 1,196 | 1,244 | 1,191 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 585 | 606 | 578 | 1.5% |  |
| apollo-router | v2.16.1 | 446 | 465 | 444 | 1.6% |  |
| hive-gateway | 2.10.8 | 270 | 279 | 269 | 1.2% |  |
| apollo-gateway | 2.14.3 | 266 | 271 | 262 | 1.0% |  |
| feddi | 5ff8b6165878 | 19 | 20 | 19 | 2.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1118343     ✗ 0     
     data_received..................: 33 GB   272 MB/s
     data_sent......................: 448 MB  3.7 MB/s
     http_req_blocked...............: avg=3.05µs   min=942ns   med=2.36µs  max=21.27ms  p(90)=3.74µs  p(95)=4.38µs   p(99.9)=36.89µs
     http_req_connecting............: avg=225ns    min=0s      med=0s      max=3.32ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.88ms  min=1.42ms  med=15.17ms max=338.64ms p(90)=23.01ms p(95)=26.31ms  p(99.9)=46.4ms 
       { expected_response:true }...: avg=15.88ms  min=1.42ms  med=15.17ms max=338.64ms p(90)=23.01ms p(95)=26.31ms  p(99.9)=46.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 372881
     http_req_receiving.............: avg=108.03µs min=25.13µs med=45.6µs  max=271.19ms p(90)=85.84µs p(95)=172.09µs p(99.9)=8.53ms 
     http_req_sending...............: avg=49.22µs  min=4.51µs  med=8.8µs   max=36.41ms  p(90)=15.82µs p(95)=101.89µs p(99.9)=6.34ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.72ms  min=1.38ms  med=15.06ms max=72.47ms  p(90)=22.82ms p(95)=26.03ms  p(99.9)=45.23ms
     http_reqs......................: 372881  3102.57907/s
     iteration_duration.............: avg=16.08ms  min=2ms     med=15.36ms max=348.8ms  p(90)=23.21ms p(95)=26.55ms  p(99.9)=47.26ms
     iterations.....................: 372781  3101.747014/s
     success_rate...................: 100.00% ✓ 372781      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 959415      ✗ 0     
     data_received..................: 28 GB   233 MB/s
     data_sent......................: 384 MB  3.2 MB/s
     http_req_blocked...............: avg=2.41µs   min=851ns  med=1.85µs  max=17.82ms  p(90)=2.96µs  p(95)=3.51µs  p(99.9)=27.13µs 
     http_req_connecting............: avg=116ns    min=0s     med=0s      max=1.91ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.55ms  min=1.96ms med=16.03ms max=293.57ms p(90)=29.97ms p(95)=36.37ms p(99.9)=109.11ms
       { expected_response:true }...: avg=18.55ms  min=1.96ms med=16.03ms max=293.57ms p(90)=29.97ms p(95)=36.37ms p(99.9)=109.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 319905
     http_req_receiving.............: avg=539.76µs min=51.7µs med=88.89µs max=169.97ms p(90)=1.02ms  p(95)=1.84ms  p(99.9)=24.21ms 
     http_req_sending...............: avg=41.5µs   min=4.7µs  med=8.17µs  max=127.26ms p(90)=14.12µs p(95)=81.96µs p(99.9)=3.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=17.97ms  min=1.86ms med=15.54ms max=293.14ms p(90)=29.12ms p(95)=35.35ms p(99.9)=107.61ms
     http_reqs......................: 319905  2660.258702/s
     iteration_duration.............: avg=18.75ms  min=2.76ms med=16.22ms max=309.8ms  p(90)=30.19ms p(95)=36.62ms p(99.9)=109.91ms
     iterations.....................: 319805  2659.427125/s
     success_rate...................: 100.00% ✓ 319805      ✗ 0     
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

     checks.........................: 100.00% ✓ 926370      ✗ 0     
     data_received..................: 27 GB   225 MB/s
     data_sent......................: 371 MB  3.1 MB/s
     http_req_blocked...............: avg=2.77µs   min=891ns   med=2.07µs  max=16.95ms  p(90)=3.39µs  p(95)=3.99µs  p(99.9)=33.51µs 
     http_req_connecting............: avg=298ns    min=0s      med=0s      max=4.04ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.21ms  min=2.02ms  med=16.53ms max=288.92ms p(90)=31.2ms  p(95)=37.71ms p(99.9)=122.68ms
       { expected_response:true }...: avg=19.21ms  min=2.02ms  med=16.53ms max=288.92ms p(90)=31.2ms  p(95)=37.71ms p(99.9)=122.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 308890
     http_req_receiving.............: avg=554.68µs min=49.41µs med=89.74µs max=157.01ms p(90)=1.05ms  p(95)=1.88ms  p(99.9)=25.73ms 
     http_req_sending...............: avg=40.85µs  min=4.28µs  med=8.17µs  max=168.75ms p(90)=14.48µs p(95)=77.39µs p(99.9)=3.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.62ms  min=1.9ms   med=16.02ms max=288.84ms p(90)=30.27ms p(95)=36.63ms p(99.9)=121.49ms
     http_reqs......................: 308890  2568.953308/s
     iteration_duration.............: avg=19.42ms  min=2.8ms   med=16.72ms max=295.79ms p(90)=31.42ms p(95)=37.95ms p(99.9)=123.56ms
     iterations.....................: 308790  2568.121636/s
     success_rate...................: 100.00% ✓ 308790      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 926262      ✗ 0     
     data_received..................: 27 GB   225 MB/s
     data_sent......................: 371 MB  3.1 MB/s
     http_req_blocked...............: avg=3.14µs  min=1.02µs  med=2.42µs   max=16.52ms  p(90)=3.73µs  p(95)=4.33µs  p(99.9)=34.76µs
     http_req_connecting............: avg=274ns   min=0s      med=0s       max=3.42ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.2ms  min=1.96ms  med=18.33ms  max=314.08ms p(90)=27.62ms p(95)=31.3ms  p(99.9)=51.75ms
       { expected_response:true }...: avg=19.2ms  min=1.96ms  med=18.33ms  max=314.08ms p(90)=27.62ms p(95)=31.3ms  p(99.9)=51.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 308854
     http_req_receiving.............: avg=692.1µs min=51.61µs med=115.31µs max=99.64ms  p(90)=1.72ms  p(95)=2.54ms  p(99.9)=20.17ms
     http_req_sending...............: avg=43.95µs min=4.58µs  med=9.16µs   max=267.02ms p(90)=16.79µs p(95)=93.5µs  p(99.9)=3.52ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.47ms min=1.85ms  med=17.6ms   max=313.51ms p(90)=26.75ms p(95)=30.34ms p(99.9)=49.85ms
     http_reqs......................: 308854  2568.470112/s
     iteration_duration.............: avg=19.42ms min=3.34ms  med=18.53ms  max=325.14ms p(90)=27.83ms p(95)=31.53ms p(99.9)=52.33ms
     iterations.....................: 308754  2567.638498/s
     success_rate...................: 100.00% ✓ 308754      ✗ 0     
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

     checks.........................: 100.00% ✓ 805077      ✗ 0     
     data_received..................: 24 GB   196 MB/s
     data_sent......................: 323 MB  2.7 MB/s
     http_req_blocked...............: avg=3.57µs  min=1.04µs  med=2.76µs  max=13.2ms   p(90)=4.33µs  p(95)=5.09µs   p(99.9)=38.23µs
     http_req_connecting............: avg=352ns   min=0s      med=0s      max=3.92ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.13ms min=1.78ms  med=21.88ms max=303.03ms p(90)=26.4ms  p(95)=28.36ms  p(99.9)=48.69ms
       { expected_response:true }...: avg=22.13ms min=1.78ms  med=21.88ms max=303.03ms p(90)=26.4ms  p(95)=28.36ms  p(99.9)=48.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 268459
     http_req_receiving.............: avg=90.79µs min=27.58µs med=53.86µs max=149.45ms p(90)=93.23µs p(95)=126.89µs p(99.9)=6.93ms 
     http_req_sending...............: avg=41.23µs min=5.02µs  med=10.22µs max=168.49ms p(90)=17.02µs p(95)=55.63µs  p(99.9)=2.44ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22ms    min=1.69ms  med=21.78ms max=302.53ms p(90)=26.26ms p(95)=28.17ms  p(99.9)=47.81ms
     http_reqs......................: 268459  2233.039347/s
     iteration_duration.............: avg=22.34ms min=3.07ms  med=22.08ms max=315.55ms p(90)=26.6ms  p(95)=28.58ms  p(99.9)=49.25ms
     iterations.....................: 268359  2232.207548/s
     success_rate...................: 100.00% ✓ 268359      ✗ 0     
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

     checks.........................: 100.00% ✓ 471372      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 189 MB  1.6 MB/s
     http_req_blocked...............: avg=2.96µs  min=942ns   med=2.05µs  max=3.8ms    p(90)=3.45µs  p(95)=4.08µs  p(99.9)=25.44µs 
     http_req_connecting............: avg=608ns   min=0s      med=0s      max=3.76ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=37.96ms min=2.01ms  med=37.57ms max=287.62ms p(90)=52.95ms p(95)=57.63ms p(99.9)=80.37ms 
       { expected_response:true }...: avg=37.96ms min=2.01ms  med=37.57ms max=287.62ms p(90)=52.95ms p(95)=57.63ms p(99.9)=80.37ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 157224
     http_req_receiving.............: avg=71.21µs min=26.01µs med=58.34µs max=117.9ms  p(90)=93.65µs p(95)=108.8µs p(99.9)=767.56µs
     http_req_sending...............: avg=23.71µs min=4.69µs  med=9.83µs  max=120.39ms p(90)=16.27µs p(95)=20.14µs p(99.9)=990.14µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=37.86ms min=1.94ms  med=37.48ms max=287.16ms p(90)=52.86ms p(95)=57.54ms p(99.9)=80ms    
     http_reqs......................: 157224  1307.077731/s
     iteration_duration.............: avg=38.18ms min=3.86ms  med=37.77ms max=308.01ms p(90)=53.15ms p(95)=57.83ms p(99.9)=80.66ms 
     iterations.....................: 157124  1306.246383/s
     success_rate...................: 100.00% ✓ 157124      ✗ 0     
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

     checks.........................: 100.00% ✓ 223503     ✗ 0    
     data_received..................: 6.6 GB  54 MB/s
     data_sent......................: 90 MB   744 kB/s
     http_req_blocked...............: avg=3.6µs   min=1.02µs  med=2.36µs  max=3.62ms   p(90)=3.81µs   p(95)=4.41µs   p(99.9)=46.14µs 
     http_req_connecting............: avg=955ns   min=0s      med=0s      max=3.6ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.21ms min=3.6ms   med=78.38ms max=304.77ms p(90)=98.66ms  p(95)=108.17ms p(99.9)=187.13ms
       { expected_response:true }...: avg=80.21ms min=3.6ms   med=78.38ms max=304.77ms p(90)=98.66ms  p(95)=108.17ms p(99.9)=187.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74601
     http_req_receiving.............: avg=78.73µs min=26.97µs med=65.14µs max=112.46ms p(90)=102.55µs p(95)=115.89µs p(99.9)=610.67µs
     http_req_sending...............: avg=23.3µs  min=4.8µs   med=11.97µs max=125.94ms p(90)=19.21µs  p(95)=21.43µs  p(99.9)=579.33µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.11ms min=3.54ms  med=78.29ms max=296.67ms p(90)=98.54ms  p(95)=108.06ms p(99.9)=186.54ms
     http_reqs......................: 74601   619.154019/s
     iteration_duration.............: avg=80.54ms min=17.84ms med=78.61ms max=323.34ms p(90)=98.9ms   p(95)=108.47ms p(99.9)=188.49ms
     iterations.....................: 74501   618.324065/s
     success_rate...................: 100.00% ✓ 74501      ✗ 0    
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

     checks.........................: 100.00% ✓ 174774     ✗ 0    
     data_received..................: 5.1 GB  43 MB/s
     data_sent......................: 70 MB   581 kB/s
     http_req_blocked...............: avg=4.66µs   min=1.03µs  med=2.76µs   max=4.02ms   p(90)=4.14µs   p(95)=4.65µs   p(99.9)=66.77µs 
     http_req_connecting............: avg=1.67µs   min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=102.58ms min=4.71ms  med=102.3ms  max=332.5ms  p(90)=123.95ms p(95)=130.41ms p(99.9)=161.4ms 
       { expected_response:true }...: avg=102.58ms min=4.71ms  med=102.3ms  max=332.5ms  p(90)=123.95ms p(95)=130.41ms p(99.9)=161.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 58358
     http_req_receiving.............: avg=81.49µs  min=30.28µs med=74.59µs  max=100.93ms p(90)=107.04µs p(95)=120.29µs p(99.9)=584.94µs
     http_req_sending...............: avg=18.93µs  min=5.24µs  med=14.74µs  max=24.42ms  p(90)=20.77µs  p(95)=22.63µs  p(99.9)=528.2µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.48ms min=4.58ms  med=102.2ms  max=331.92ms p(90)=123.85ms p(95)=130.3ms  p(99.9)=161.21ms
     http_reqs......................: 58358   483.970433/s
     iteration_duration.............: avg=103ms    min=33.26ms med=102.57ms max=346.29ms p(90)=124.2ms  p(95)=130.67ms p(99.9)=163.1ms 
     iterations.....................: 58258   483.14112/s
     success_rate...................: 100.00% ✓ 58258      ✗ 0    
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

     checks.........................: 100.00% ✓ 101985     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   339 kB/s
     http_req_blocked...............: avg=5.86µs   min=1.08µs  med=2.96µs   max=3.55ms   p(90)=4.22µs   p(95)=4.72µs   p(99.9)=1.6ms   
     http_req_connecting............: avg=2.72µs   min=0s      med=0s       max=3.5ms    p(90)=0s       p(95)=0s       p(99.9)=1.57ms  
     http_req_duration..............: avg=175.83ms min=7.41ms  med=181.57ms max=372.12ms p(90)=227.5ms  p(95)=233.21ms p(99.9)=303.94ms
       { expected_response:true }...: avg=175.83ms min=7.41ms  med=181.57ms max=372.12ms p(90)=227.5ms  p(95)=233.21ms p(99.9)=303.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34095
     http_req_receiving.............: avg=86.7µs   min=30.44µs med=81.07µs  max=93.72ms  p(90)=111.23µs p(95)=122.27µs p(99.9)=495.09µs
     http_req_sending...............: avg=27.29µs  min=5.43µs  med=15.86µs  max=83.06ms  p(90)=19.97µs  p(95)=21.63µs  p(99.9)=493.87µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.72ms min=7.31ms  med=181.47ms max=371.75ms p(90)=227.41ms p(95)=233.08ms p(99.9)=303.63ms
     http_reqs......................: 34095   281.960871/s
     iteration_duration.............: avg=176.59ms min=23.78ms med=181.83ms max=378.82ms p(90)=227.78ms p(95)=233.5ms  p(99.9)=305.79ms
     iterations.....................: 33995   281.133885/s
     success_rate...................: 100.00% ✓ 33995      ✗ 0    
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

     checks.........................: 100.00% ✓ 98427      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   327 kB/s
     http_req_blocked...............: avg=5.86µs   min=1.13µs  med=2.94µs   max=3.57ms   p(90)=4.2µs    p(95)=4.7µs    p(99.9)=1.5ms   
     http_req_connecting............: avg=2.75µs   min=0s      med=0s       max=3.52ms   p(90)=0s       p(95)=0s       p(99.9)=1.48ms  
     http_req_duration..............: avg=182.23ms min=5.83ms  med=166.55ms max=675.72ms p(90)=211.22ms p(95)=254.68ms p(99.9)=546.64ms
       { expected_response:true }...: avg=182.23ms min=5.83ms  med=166.55ms max=675.72ms p(90)=211.22ms p(95)=254.68ms p(99.9)=546.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32909
     http_req_receiving.............: avg=89.67µs  min=31.4µs  med=83.49µs  max=66.66ms  p(90)=112.88µs p(95)=125µs    p(99.9)=707.66µs
     http_req_sending...............: avg=30.56µs  min=5.16µs  med=15.96µs  max=92.18ms  p(90)=20.39µs  p(95)=22.09µs  p(99.9)=417.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.11ms min=5.75ms  med=166.44ms max=675.6ms  p(90)=211.1ms  p(95)=254.58ms p(99.9)=546.47ms
     http_reqs......................: 32909   272.062187/s
     iteration_duration.............: avg=183.04ms min=24.99ms med=166.88ms max=675.95ms p(90)=211.64ms p(95)=255.55ms p(99.9)=546.86ms
     iterations.....................: 32809   271.235476/s
     success_rate...................: 100.00% ✓ 32809      ✗ 0    
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
data_received..................: 3.2 MB 53 kB/s
     data_sent......................: 41 kB  679 B/s
     http_req_blocked...............: avg=9.04µs   min=2.38µs  med=3.55µs   max=172.59µs p(90)=5.6µs    p(95)=9.49µs   p(99.9)=167.39µs
     http_req_connecting............: avg=2.96µs   min=0s      med=0s       max=97.72µs  p(90)=0s       p(95)=0s       p(99.9)=94.59µs 
     http_req_duration..............: avg=940.4ms  min=28.21ms med=30.77ms  max=30.01s   p(90)=37.08ms  p(95)=40.87ms  p(99.9)=29.05s  
       { expected_response:true }...: avg=940.4ms  min=28.21ms med=30.77ms  max=30.01s   p(90)=37.08ms  p(95)=40.87ms  p(99.9)=29.05s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 33  
     http_req_receiving.............: avg=146.07µs min=78.01µs med=129.29µs max=304.89µs p(90)=231.84µs p(95)=276.58µs p(99.9)=304.11µs
     http_req_sending...............: avg=28.55µs  min=13.44µs med=18.06µs  max=202.33µs p(90)=22.84µs  p(95)=86.86µs  p(99.9)=200.43µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=940.23ms min=28.05ms med=30.52ms  max=30.01s   p(90)=36.96ms  p(95)=40.73ms  p(99.9)=29.05s  
     http_reqs......................: 33     0.549997/s
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

     checks.........................: 100.00% ✓ 933363      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 374 MB  3.1 MB/s
     http_req_blocked...............: avg=2.9µs   min=871ns   med=2.16µs  max=6.98ms   p(90)=3.81µs  p(95)=4.6µs    p(99.9)=37.27µs
     http_req_connecting............: avg=304ns   min=0s      med=0s      max=3.35ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.06ms min=1.62ms  med=18.67ms max=308.81ms p(90)=26.46ms p(95)=28.94ms  p(99.9)=48.07ms
       { expected_response:true }...: avg=19.06ms min=1.62ms  med=18.67ms max=308.81ms p(90)=26.46ms p(95)=28.94ms  p(99.9)=48.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 311221
     http_req_receiving.............: avg=87.99µs min=24.78µs med=48.14µs max=115.33ms p(90)=89.32µs p(95)=129.31µs p(99.9)=7.27ms 
     http_req_sending...............: avg=43.05µs min=4.66µs  med=9.04µs  max=254.99ms p(90)=17.13µs p(95)=74.25µs  p(99.9)=3.71ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=18.93ms min=1.54ms  med=18.56ms max=303.08ms p(90)=26.31ms p(95)=28.73ms  p(99.9)=47.15ms
     http_reqs......................: 311221  2588.831172/s
     iteration_duration.............: avg=19.27ms min=2.81ms  med=18.87ms max=320.8ms  p(90)=26.67ms p(95)=29.16ms  p(99.9)=48.67ms
     iterations.....................: 311121  2587.999342/s
     success_rate...................: 100.00% ✓ 311121      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 883701      ✗ 0     
     data_received..................: 26 GB   215 MB/s
     data_sent......................: 354 MB  2.9 MB/s
     http_req_blocked...............: avg=3.55µs   min=982ns   med=2.63µs  max=20.74ms  p(90)=4.16µs  p(95)=4.87µs  p(99.9)=38.06µs 
     http_req_connecting............: avg=329ns    min=0s      med=0s      max=4.24ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.13ms  min=1.55ms  med=16.88ms max=485.84ms p(90)=33.24ms p(95)=40.76ms p(99.9)=143.95ms
       { expected_response:true }...: avg=20.13ms  min=1.55ms  med=16.88ms max=485.84ms p(90)=33.24ms p(95)=40.76ms p(99.9)=143.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 294667
     http_req_receiving.............: avg=584.18µs min=51.32µs med=95.74µs max=133.5ms  p(90)=1.11ms  p(95)=1.99ms  p(99.9)=27.62ms 
     http_req_sending...............: avg=46.31µs  min=4.74µs  med=9.95µs  max=146.82ms p(90)=18.04µs p(95)=92.24µs p(99.9)=4.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.5ms   min=1.42ms  med=16.35ms max=482.8ms  p(90)=32.21ms p(95)=39.61ms p(99.9)=143.01ms
     http_reqs......................: 294667  2451.518111/s
     iteration_duration.............: avg=20.35ms  min=2.5ms   med=17.09ms max=486.13ms p(90)=33.48ms p(95)=41.01ms p(99.9)=144.43ms
     iterations.....................: 294567  2450.686148/s
     success_rate...................: 100.00% ✓ 294567      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 870525      ✗ 0     
     data_received..................: 25 GB   212 MB/s
     data_sent......................: 349 MB  2.9 MB/s
     http_req_blocked...............: avg=2.72µs   min=852ns   med=1.98µs   max=16.46ms  p(90)=3.56µs  p(95)=4.32µs  p(99.9)=29.76µs
     http_req_connecting............: avg=215ns    min=0s      med=0s       max=3.17ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.45ms  min=1.53ms  med=19.65ms  max=319.41ms p(90)=29.41ms p(95)=32.94ms p(99.9)=53.37ms
       { expected_response:true }...: avg=20.45ms  min=1.53ms  med=19.65ms  max=319.41ms p(90)=29.41ms p(95)=32.94ms p(99.9)=53.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 290275
     http_req_receiving.............: avg=787.29µs min=52.16µs med=133.03µs max=77.8ms   p(90)=1.95ms  p(95)=2.85ms  p(99.9)=19.78ms
     http_req_sending...............: avg=41.37µs  min=4.45µs  med=8.37µs   max=181.2ms  p(90)=17.83µs p(95)=69.91µs p(99.9)=3.25ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.62ms  min=1.42ms  med=18.8ms   max=318.84ms p(90)=28.45ms p(95)=31.91ms p(99.9)=51.55ms
     http_reqs......................: 290275  2414.973103/s
     iteration_duration.............: avg=20.66ms  min=3.22ms  med=19.85ms  max=329.8ms  p(90)=29.62ms p(95)=33.16ms p(99.9)=53.8ms 
     iterations.....................: 290175  2414.141143/s
     success_rate...................: 100.00% ✓ 290175      ✗ 0     
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

     checks.........................: 100.00% ✓ 833499      ✗ 0     
     data_received..................: 24 GB   203 MB/s
     data_sent......................: 334 MB  2.8 MB/s
     http_req_blocked...............: avg=3.3µs    min=891ns   med=2.48µs  max=13.44ms  p(90)=4.02µs  p(95)=4.73µs  p(99.9)=39.01µs 
     http_req_connecting............: avg=310ns    min=0s      med=0s      max=3.43ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.36ms  min=1.63ms  med=17.85ms max=375.53ms p(90)=35.22ms p(95)=43.28ms p(99.9)=147.72ms
       { expected_response:true }...: avg=21.36ms  min=1.63ms  med=17.85ms max=375.53ms p(90)=35.22ms p(95)=43.28ms p(99.9)=147.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 277933
     http_req_receiving.............: avg=617.55µs min=51.94µs med=98.34µs max=279.75ms p(90)=1.14ms  p(95)=1.98ms  p(99.9)=28.61ms 
     http_req_sending...............: avg=43.22µs  min=4.44µs  med=9.33µs  max=159.47ms p(90)=17.44µs p(95)=80.71µs p(99.9)=3.71ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.7ms   min=1.5ms   med=17.27ms max=375.45ms p(90)=34.15ms p(95)=42.03ms p(99.9)=146.34ms
     http_reqs......................: 277933  2312.030553/s
     iteration_duration.............: avg=21.58ms  min=2.76ms  med=18.05ms max=375.71ms p(90)=35.44ms p(95)=43.5ms  p(99.9)=148.6ms 
     iterations.....................: 277833  2311.198687/s
     success_rate...................: 100.00% ✓ 277833      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 789579      ✗ 0     
     data_received..................: 23 GB   192 MB/s
     data_sent......................: 316 MB  2.6 MB/s
     http_req_blocked...............: avg=3.64µs  min=1.09µs med=2.73µs   max=18.93ms  p(90)=4.26µs  p(95)=4.98µs  p(99.9)=40.25µs 
     http_req_connecting............: avg=356ns   min=0s     med=0s       max=4.17ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.56ms min=1.93ms med=18.78ms  max=452.51ms p(90)=36.58ms p(95)=45.17ms p(99.9)=171.15ms
       { expected_response:true }...: avg=22.56ms min=1.93ms med=18.78ms  max=452.51ms p(90)=36.58ms p(95)=45.17ms p(99.9)=171.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 263293
     http_req_receiving.............: avg=613.2µs min=53.5µs med=105.23µs max=301.63ms p(90)=1.13ms  p(95)=1.96ms  p(99.9)=28.48ms 
     http_req_sending...............: avg=42.51µs min=4.98µs med=10.44µs  max=182.62ms p(90)=18.24µs p(95)=73.34µs p(99.9)=2.45ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.9ms  min=1.83ms med=18.21ms  max=452.4ms  p(90)=35.56ms p(95)=43.97ms p(99.9)=169.36ms
     http_reqs......................: 263293  2189.210547/s
     iteration_duration.............: avg=22.78ms min=2.83ms med=18.99ms  max=452.73ms p(90)=36.81ms p(95)=45.42ms p(99.9)=172.29ms
     iterations.....................: 263193  2188.379074/s
     success_rate...................: 100.00% ✓ 263193      ✗ 0     
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

     checks.........................: 100.00% ✓ 597552      ✗ 0     
     data_received..................: 18 GB   145 MB/s
     data_sent......................: 239 MB  2.0 MB/s
     http_req_blocked...............: avg=3.35µs  min=912ns   med=2.28µs  max=5ms      p(90)=4.5µs    p(95)=5.62µs   p(99.9)=40.67µs
     http_req_connecting............: avg=461ns   min=0s      med=0s      max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.87ms min=2.19ms  med=29.37ms max=343.62ms p(90)=39.41ms  p(95)=42.8ms   p(99.9)=63.51ms
       { expected_response:true }...: avg=29.87ms min=2.19ms  med=29.37ms max=343.62ms p(90)=39.41ms  p(95)=42.8ms   p(99.9)=63.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 199284
     http_req_receiving.............: avg=125.9µs min=27.16µs med=54.55µs max=313.73ms p(90)=125.29µs p(95)=205.39µs p(99.9)=4.77ms 
     http_req_sending...............: avg=41.02µs min=4.74µs  med=9.56µs  max=30.14ms  p(90)=24.16µs  p(95)=108.92µs p(99.9)=3.3ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.7ms  min=2.12ms  med=29.25ms max=87.39ms  p(90)=39.25ms  p(95)=42.6ms   p(99.9)=61.74ms
     http_reqs......................: 199284  1656.777451/s
     iteration_duration.............: avg=30.11ms min=5.42ms  med=29.6ms  max=356.43ms p(90)=39.63ms  p(95)=43.01ms  p(99.9)=63.91ms
     iterations.....................: 199184  1655.946086/s
     success_rate...................: 100.00% ✓ 199184      ✗ 0     
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

     checks.........................: 100.00% ✓ 431361      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 173 MB  1.4 MB/s
     http_req_blocked...............: avg=3.24µs  min=972ns  med=2.27µs  max=4ms      p(90)=3.78µs   p(95)=4.46µs   p(99.9)=30.04µs 
     http_req_connecting............: avg=635ns   min=0s     med=0s      max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.47ms min=2.15ms med=41.09ms max=300.45ms p(90)=57.61ms  p(95)=62.63ms  p(99.9)=86.1ms  
       { expected_response:true }...: avg=41.47ms min=2.15ms med=41.09ms max=300.45ms p(90)=57.61ms  p(95)=62.63ms  p(99.9)=86.1ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 143887
     http_req_receiving.............: avg=76.71µs min=27.5µs med=63.68µs max=85.92ms  p(90)=103.52µs p(95)=120.84µs p(99.9)=845.06µs
     http_req_sending...............: avg=24.9µs  min=5.07µs med=11.43µs max=136.47ms p(90)=18.51µs  p(95)=22.12µs  p(99.9)=937.2µs 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.37ms min=2.08ms med=40.99ms max=300.08ms p(90)=57.51ms  p(95)=62.51ms  p(99.9)=85.95ms 
     http_reqs......................: 143887  1196.12185/s
     iteration_duration.............: avg=41.72ms min=4.52ms med=41.31ms max=311.28ms p(90)=57.83ms  p(95)=62.85ms  p(99.9)=86.71ms 
     iterations.....................: 143787  1195.290557/s
     success_rate...................: 100.00% ✓ 143787      ✗ 0     
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

     checks.........................: 100.00% ✓ 211302     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   703 kB/s
     http_req_blocked...............: avg=4.83µs  min=1.25µs  med=3.33µs  max=3.51ms   p(90)=4.9µs    p(95)=5.58µs   p(99.9)=58.14µs 
     http_req_connecting............: avg=1.22µs  min=0s      med=0s      max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.82ms min=4.05ms  med=83.13ms max=329.44ms p(90)=104.73ms p(95)=115.01ms p(99.9)=201.17ms
       { expected_response:true }...: avg=84.82ms min=4.05ms  med=83.13ms max=329.44ms p(90)=104.73ms p(95)=115.01ms p(99.9)=201.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70534
     http_req_receiving.............: avg=92.93µs min=31.96µs med=79.15µs max=229.31ms p(90)=115.42µs p(95)=130.14µs p(99.9)=752.91µs
     http_req_sending...............: avg=26.6µs  min=5.44µs  med=15.5µs  max=111.67ms p(90)=22.36µs  p(95)=24.8µs   p(99.9)=669.25µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.7ms  min=3.97ms  med=83.04ms max=329.33ms p(90)=104.61ms p(95)=114.87ms p(99.9)=200.52ms
     http_reqs......................: 70534   585.067565/s
     iteration_duration.............: avg=85.2ms  min=15.29ms med=83.4ms  max=337.61ms p(90)=105ms    p(95)=115.29ms p(99.9)=204.27ms
     iterations.....................: 70434   584.238082/s
     success_rate...................: 100.00% ✓ 70434      ✗ 0    
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

     checks.........................: 100.00% ✓ 161385     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   536 kB/s
     http_req_blocked...............: avg=5.04µs   min=1.06µs  med=3.21µs   max=3.59ms   p(90)=4.71µs   p(95)=5.28µs   p(99.9)=67.33µs 
     http_req_connecting............: avg=1.61µs   min=0s      med=0s       max=3.55ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.07ms min=5.38ms  med=108.97ms max=350.08ms p(90)=146.96ms p(95)=158.14ms p(99.9)=202.01ms
       { expected_response:true }...: avg=111.07ms min=5.38ms  med=108.97ms max=350.08ms p(90)=146.96ms p(95)=158.14ms p(99.9)=202.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53895
     http_req_receiving.............: avg=88.04µs  min=29.36µs med=84.56µs  max=79.8ms   p(90)=115.34µs p(95)=127.29µs p(99.9)=511.39µs
     http_req_sending...............: avg=30.59µs  min=4.93µs  med=17.56µs  max=245.49ms p(90)=22.71µs  p(95)=24.57µs  p(99.9)=555.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.95ms min=5.24ms  med=108.85ms max=315.23ms p(90)=146.85ms p(95)=158.01ms p(99.9)=201.02ms
     http_reqs......................: 53895   446.684581/s
     iteration_duration.............: avg=111.55ms min=26.82ms med=109.28ms max=350.31ms p(90)=147.27ms p(95)=158.47ms p(99.9)=204.4ms 
     iterations.....................: 53795   445.855776/s
     success_rate...................: 100.00% ✓ 53795      ✗ 0    
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

     checks.........................: 100.00% ✓ 97845      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=6.79µs   min=1.5µs   med=3.82µs   max=3.61ms   p(90)=5.33µs   p(95)=5.96µs   p(99.9)=1.34ms  
     http_req_connecting............: avg=2.7µs    min=0s      med=0s       max=3.57ms   p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=183.21ms min=5.89ms  med=168.06ms max=674.21ms p(90)=212.14ms p(95)=254.67ms p(99.9)=580.6ms 
       { expected_response:true }...: avg=183.21ms min=5.89ms  med=168.06ms max=674.21ms p(90)=212.14ms p(95)=254.67ms p(99.9)=580.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32715
     http_req_receiving.............: avg=98.3µs   min=31.95µs med=93.74µs  max=10.55ms  p(90)=125.57µs p(95)=138.54µs p(99.9)=656.84µs
     http_req_sending...............: avg=32.42µs  min=6.5µs   med=18.72µs  max=194.59ms p(90)=23.28µs  p(95)=25.11µs  p(99.9)=580.88µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.08ms min=5.75ms  med=167.93ms max=674.1ms  p(90)=212.02ms p(95)=254.51ms p(99.9)=580.48ms
     http_reqs......................: 32715   270.755786/s
     iteration_duration.............: avg=184.05ms min=30.95ms med=168.41ms max=674.47ms p(90)=212.56ms p(95)=255.84ms p(99.9)=580.85ms
     iterations.....................: 32615   269.928166/s
     success_rate...................: 100.00% ✓ 32615      ✗ 0    
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

     checks.........................: 100.00% ✓ 96348      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=6.78µs   min=1.35µs  med=3.66µs   max=4.15ms   p(90)=5.07µs   p(95)=5.66µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=2.82µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=1.27ms  
     http_req_duration..............: avg=186.07ms min=8.01ms  med=197.04ms max=408.43ms p(90)=207.69ms p(95)=211.75ms p(99.9)=290.54ms
       { expected_response:true }...: avg=186.07ms min=8.01ms  med=197.04ms max=408.43ms p(90)=207.69ms p(95)=211.75ms p(99.9)=290.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32216
     http_req_receiving.............: avg=102.99µs min=37.6µs  med=90.84µs  max=119.64ms p(90)=121.73µs p(95)=134.31µs p(99.9)=525.4µs 
     http_req_sending...............: avg=42.3µs   min=6.56µs  med=18.12µs  max=206.59ms p(90)=22.85µs  p(95)=24.66µs  p(99.9)=545.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.93ms min=7.85ms  med=196.93ms max=407.83ms p(90)=207.56ms p(95)=211.63ms p(99.9)=290.34ms
     http_reqs......................: 32216   266.250783/s
     iteration_duration.............: avg=186.94ms min=36.34ms med=197.33ms max=417.7ms  p(90)=208ms    p(95)=212.07ms p(99.9)=296ms   
     iterations.....................: 32116   265.424328/s
     success_rate...................: 100.00% ✓ 32116      ✗ 0    
     vus............................: 5       min=5        max=50 
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

     checks.........................: 100.00% ✓ 7251      ✗ 0   
     data_received..................: 241 MB  1.9 MB/s
     data_sent......................: 3.0 MB  24 kB/s
     http_req_blocked...............: avg=41.69µs min=1.14µs   med=3.09µs  max=5.72ms p(90)=4.61µs   p(95)=5.58µs   p(99.9)=4.73ms 
     http_req_connecting............: avg=36.56µs min=0s       med=0s      max=5.67ms p(90)=0s       p(95)=0s       p(99.9)=4.62ms 
     http_req_duration..............: avg=2.4s    min=27.1ms   med=2.45s   max=4.63s  p(90)=3.28s    p(95)=3.48s    p(99.9)=4.13s  
       { expected_response:true }...: avg=2.4s    min=27.1ms   med=2.45s   max=4.63s  p(90)=3.28s    p(95)=3.48s    p(99.9)=4.13s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2517
     http_req_receiving.............: avg=90.64µs min=29.31µs  med=89.08µs max=1.07ms p(90)=125.86µs p(95)=139.96µs p(99.9)=400.1µs
     http_req_sending...............: avg=61.3µs  min=5.33µs   med=17.67µs max=20.3ms p(90)=22.86µs  p(95)=26.42µs  p(99.9)=3.52ms 
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.4s    min=26.95ms  med=2.45s   max=4.63s  p(90)=3.28s    p(95)=3.48s    p(99.9)=4.13s  
     http_reqs......................: 2517    19.982416/s
     iteration_duration.............: avg=2.5s    min=348.68ms med=2.48s   max=4.63s  p(90)=3.3s     p(95)=3.5s     p(99.9)=4.13s  
     iterations.....................: 2417    19.188518/s
     success_rate...................: 100.00% ✓ 2417      ✗ 0   
     vus............................: 45      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

