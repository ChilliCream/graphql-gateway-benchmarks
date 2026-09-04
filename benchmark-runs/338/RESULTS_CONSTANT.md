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
| hive-router | v0.0.84 | 3,066 | 3,378 | 3,022 | 3.8% |  |
| fusion-nightly-net11 | 16.7.0-p.2 | 2,722 | 2,877 | 2,676 | 2.4% |  |
| fusion | 16.6.3 | 2,706 | 2,802 | 2,623 | 2.3% |  |
| fusion-nightly | 16.7.0-p.2 | 2,639 | 2,761 | 2,609 | 1.9% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 2,444 | 2,534 | 2,431 | 1.3% |  |
| grafbase | 0.53.5 | 2,115 | 2,239 | 2,082 | 2.4% |  |
| cosmo | 0.334.0 | 1,328 | 1,371 | 1,323 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 614 | 635 | 610 | 1.4% |  |
| apollo-router | v2.16.1 | 447 | 478 | 439 | 3.3% |  |
| apollo-gateway | 2.14.3 | 283 | 287 | 282 | 0.6% |  |
| hive-gateway | 2.10.8 | 273 | 281 | 273 | 1.2% |  |
| feddi | 5ff8b6165878 | 0 | 0 | 0 | 0.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.2 | 2,457 | 2,582 | 2,445 | 1.9% |  |
| fusion-nightly | 16.7.0-p.2 | 2,425 | 2,540 | 2,388 | 2.1% |  |
| hive-router | v0.0.84 | 2,412 | 2,583 | 2,385 | 2.8% |  |
| fusion | 16.6.3 | 2,383 | 2,504 | 2,370 | 2.0% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 2,309 | 2,412 | 2,302 | 1.7% |  |
| grafbase | 0.53.5 | 1,649 | 1,709 | 1,640 | 1.4% |  |
| cosmo | 0.334.0 | 1,226 | 1,269 | 1,221 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 574 | 595 | 572 | 1.4% |  |
| apollo-router | v2.16.1 | 407 | 428 | 403 | 2.3% |  |
| hive-gateway | 2.10.8 | 268 | 275 | 265 | 1.3% |  |
| apollo-gateway | 2.14.3 | 265 | 270 | 264 | 0.8% |  |
| feddi | 5ff8b6165878 | 21 | 21 | 20 | 2.1% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1105263     ✗ 0     
     data_received..................: 32 GB   269 MB/s
     data_sent......................: 443 MB  3.7 MB/s
     http_req_blocked...............: avg=3.27µs  min=981ns  med=2.36µs  max=21.03ms  p(90)=3.78µs  p(95)=4.45µs   p(99.9)=36.88µs
     http_req_connecting............: avg=258ns   min=0s     med=0s      max=4ms      p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.06ms min=1.39ms med=15.38ms max=285.95ms p(90)=23.05ms p(95)=26.48ms  p(99.9)=47.32ms
       { expected_response:true }...: avg=16.06ms min=1.39ms med=15.38ms max=285.95ms p(90)=23.05ms p(95)=26.48ms  p(99.9)=47.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 368521
     http_req_receiving.............: avg=97.56µs min=25µs   med=45.35µs max=219.64ms p(90)=88.16µs p(95)=177.89µs p(99.9)=8.56ms 
     http_req_sending...............: avg=50.66µs min=4.65µs med=8.87µs  max=102.78ms p(90)=16.1µs  p(95)=102µs    p(99.9)=7.19ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.91ms min=1.34ms med=15.26ms max=285.73ms p(90)=22.85ms p(95)=26.16ms  p(99.9)=46.04ms
     http_reqs......................: 368521  3066.465001/s
     iteration_duration.............: avg=16.27ms min=1.91ms med=15.57ms max=310.83ms p(90)=23.26ms p(95)=26.72ms  p(99.9)=48.07ms
     iterations.....................: 368421  3065.6329/s
     success_rate...................: 100.00% ✓ 368421      ✗ 0     
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

     checks.........................: 100.00% ✓ 981957      ✗ 0     
     data_received..................: 29 GB   239 MB/s
     data_sent......................: 393 MB  3.3 MB/s
     http_req_blocked...............: avg=2.65µs  min=881ns   med=1.89µs  max=15.4ms   p(90)=3.06µs  p(95)=3.63µs  p(99.9)=26.32µs
     http_req_connecting............: avg=271ns   min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.11ms min=1.87ms  med=17.26ms max=293.89ms p(90)=26.16ms p(95)=29.69ms p(99.9)=50.28ms
       { expected_response:true }...: avg=18.11ms min=1.87ms  med=17.26ms max=293.89ms p(90)=26.16ms p(95)=29.69ms p(99.9)=50.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 327419
     http_req_receiving.............: avg=469µs   min=51.23µs med=91.49µs max=194.45ms p(90)=1.14ms  p(95)=1.77ms  p(99.9)=17.99ms
     http_req_sending...............: avg=40.35µs min=4.55µs  med=7.99µs  max=116.74ms p(90)=14.26µs p(95)=83.81µs p(99.9)=3.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.6ms  min=1.81ms  med=16.77ms max=293.14ms p(90)=25.53ms p(95)=28.97ms p(99.9)=49.1ms 
     http_reqs......................: 327419  2722.886874/s
     iteration_duration.............: avg=18.32ms min=3.28ms  med=17.45ms max=310.42ms p(90)=26.37ms p(95)=29.91ms p(99.9)=50.79ms
     iterations.....................: 327319  2722.055252/s
     success_rate...................: 100.00% ✓ 327319      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 975912      ✗ 0     
     data_received..................: 29 GB   237 MB/s
     data_sent......................: 391 MB  3.3 MB/s
     http_req_blocked...............: avg=2.92µs   min=882ns   med=2.26µs  max=16.55ms  p(90)=3.55µs  p(95)=4.15µs  p(99.9)=33.04µs
     http_req_connecting............: avg=125ns    min=0s      med=0s      max=1.82ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.22ms  min=1.94ms  med=15.74ms max=283.32ms p(90)=29.92ms p(95)=35.97ms p(99.9)=95.92ms
       { expected_response:true }...: avg=18.22ms  min=1.94ms  med=15.74ms max=283.32ms p(90)=29.92ms p(95)=35.97ms p(99.9)=95.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 325404
     http_req_receiving.............: avg=557.01µs min=51.88µs med=91.01µs max=153.44ms p(90)=1.06ms  p(95)=1.92ms  p(99.9)=25.61ms
     http_req_sending...............: avg=45.96µs  min=4.69µs  med=8.56µs  max=99.51ms  p(90)=14.69µs p(95)=92.6µs  p(99.9)=4.93ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.62ms  min=1.86ms  med=15.22ms max=272.5ms  p(90)=28.99ms p(95)=34.98ms p(99.9)=94.93ms
     http_reqs......................: 325404  2706.361241/s
     iteration_duration.............: avg=18.43ms  min=3.07ms  med=15.93ms max=299.01ms p(90)=30.14ms p(95)=36.21ms p(99.9)=96.48ms
     iterations.....................: 325304  2705.529548/s
     success_rate...................: 100.00% ✓ 325304      ✗ 0     
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

     checks.........................: 100.00% ✓ 951930      ✗ 0     
     data_received..................: 28 GB   231 MB/s
     data_sent......................: 381 MB  3.2 MB/s
     http_req_blocked...............: avg=2.62µs   min=802ns   med=1.87µs  max=23.33ms  p(90)=3.08µs  p(95)=3.67µs  p(99.9)=28.39µs 
     http_req_connecting............: avg=259ns    min=0s      med=0s      max=3.35ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.69ms  min=2.02ms  med=16.18ms max=311.9ms  p(90)=30.24ms p(95)=36.47ms p(99.9)=114.5ms 
       { expected_response:true }...: avg=18.69ms  min=2.02ms  med=16.18ms max=311.9ms  p(90)=30.24ms p(95)=36.47ms p(99.9)=114.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 317410
     http_req_receiving.............: avg=555.74µs min=49.62µs med=88.38µs max=271.66ms p(90)=1.04ms  p(95)=1.84ms  p(99.9)=24.58ms 
     http_req_sending...............: avg=42.15µs  min=4.19µs  med=8.12µs  max=275.45ms p(90)=14.61µs p(95)=76.52µs p(99.9)=4.16ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.1ms   min=1.89ms  med=15.66ms max=311.81ms p(90)=29.35ms p(95)=35.47ms p(99.9)=109.91ms
     http_reqs......................: 317410  2639.481833/s
     iteration_duration.............: avg=18.9ms   min=2.8ms   med=16.37ms max=321.31ms p(90)=30.45ms p(95)=36.7ms  p(99.9)=114.8ms 
     iterations.....................: 317310  2638.650264/s
     success_rate...................: 100.00% ✓ 317310      ✗ 0     
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

     checks.........................: 100.00% ✓ 881436      ✗ 0     
     data_received..................: 26 GB   215 MB/s
     data_sent......................: 353 MB  2.9 MB/s
     http_req_blocked...............: avg=2.71µs   min=901ns   med=1.93µs  max=16.58ms  p(90)=3.16µs  p(95)=3.74µs  p(99.9)=29.26µs 
     http_req_connecting............: avg=322ns    min=0s      med=0s      max=3.78ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.2ms   min=1.73ms  med=16.38ms max=576.52ms p(90)=33.93ms p(95)=43.11ms p(99.9)=163.31ms
       { expected_response:true }...: avg=20.2ms   min=1.73ms  med=16.38ms max=576.52ms p(90)=33.93ms p(95)=43.11ms p(99.9)=163.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 293912
     http_req_receiving.............: avg=583.67µs min=51.13µs med=88.33µs max=290.45ms p(90)=1.03ms  p(95)=1.84ms  p(99.9)=31.01ms 
     http_req_sending...............: avg=39.45µs  min=4.38µs  med=8.3µs   max=71.22ms  p(90)=15.29µs p(95)=43.39µs p(99.9)=3.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.58ms  min=1.6ms   med=15.87ms max=574.84ms p(90)=32.94ms p(95)=41.86ms p(99.9)=161.76ms
     http_reqs......................: 293912  2444.810295/s
     iteration_duration.............: avg=20.41ms  min=2.43ms  med=16.58ms max=576.64ms p(90)=34.15ms p(95)=43.34ms p(99.9)=164.21ms
     iterations.....................: 293812  2443.978477/s
     success_rate...................: 100.00% ✓ 293812      ✗ 0     
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

     checks.........................: 100.00% ✓ 762762      ✗ 0     
     data_received..................: 22 GB   186 MB/s
     data_sent......................: 306 MB  2.5 MB/s
     http_req_blocked...............: avg=3.39µs  min=1.05µs  med=2.55µs  max=11.89ms  p(90)=3.98µs  p(95)=4.67µs   p(99.9)=38.23µs
     http_req_connecting............: avg=392ns   min=0s      med=0s      max=3.7ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.37ms min=1.75ms  med=23.13ms max=291.25ms p(90)=27.85ms p(95)=29.77ms  p(99.9)=49.27ms
       { expected_response:true }...: avg=23.37ms min=1.75ms  med=23.13ms max=291.25ms p(90)=27.85ms p(95)=29.77ms  p(99.9)=49.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 254354
     http_req_receiving.............: avg=92.51µs min=27.46µs med=56.38µs max=121.85ms p(90)=94.43µs p(95)=120.66µs p(99.9)=6.84ms 
     http_req_sending...............: avg=37.9µs  min=4.95µs  med=10.5µs  max=161.76ms p(90)=16.72µs p(95)=26.7µs   p(99.9)=1.84ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.24ms min=1.68ms  med=23.03ms max=289.77ms p(90)=27.71ms p(95)=29.59ms  p(99.9)=48.28ms
     http_reqs......................: 254354  2115.622495/s
     iteration_duration.............: avg=23.58ms min=3.04ms  med=23.33ms max=322.62ms p(90)=28.06ms p(95)=29.98ms  p(99.9)=49.79ms
     iterations.....................: 254254  2114.790732/s
     success_rate...................: 100.00% ✓ 254254      ✗ 0     
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

     checks.........................: 100.00% ✓ 479184      ✗ 0     
     data_received..................: 14 GB   117 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=3.33µs  min=1.07µs med=2.56µs  max=3.39ms   p(90)=4.01µs  p(95)=4.67µs   p(99.9)=34.18µs
     http_req_connecting............: avg=440ns   min=0s     med=0s      max=3.28ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.33ms min=1.92ms med=36.96ms max=298.71ms p(90)=52.1ms  p(95)=56.71ms  p(99.9)=79.1ms 
       { expected_response:true }...: avg=37.33ms min=1.92ms med=36.96ms max=298.71ms p(90)=52.1ms  p(95)=56.71ms  p(99.9)=79.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 159828
     http_req_receiving.............: avg=92.25µs min=25.4µs med=61.43µs max=205.49ms p(90)=98.08µs p(95)=114.85µs p(99.9)=1.18ms 
     http_req_sending...............: avg=27.64µs min=4.88µs med=10.86µs max=186.44ms p(90)=17.46µs p(95)=21.8µs   p(99.9)=1.07ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.21ms min=1.85ms med=36.86ms max=142.45ms p(90)=51.99ms p(95)=56.59ms  p(99.9)=78.65ms
     http_reqs......................: 159828  1328.942113/s
     iteration_duration.............: avg=37.55ms min=3.45ms med=37.16ms max=308.16ms p(90)=52.3ms  p(95)=56.91ms  p(99.9)=79.5ms 
     iterations.....................: 159728  1328.11063/s
     success_rate...................: 100.00% ✓ 159728      ✗ 0     
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

     checks.........................: 100.00% ✓ 221679     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   738 kB/s
     http_req_blocked...............: avg=4.51µs  min=1.2µs   med=3.02µs  max=4.04ms   p(90)=4.46µs   p(95)=5.13µs   p(99.9)=46µs    
     http_req_connecting............: avg=1.21µs  min=0s      med=0s      max=4ms      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.87ms min=3.65ms  med=78.96ms max=325.38ms p(90)=98.94ms  p(95)=108.6ms  p(99.9)=193.03ms
       { expected_response:true }...: avg=80.87ms min=3.65ms  med=78.96ms max=325.38ms p(90)=98.94ms  p(95)=108.6ms  p(99.9)=193.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73993
     http_req_receiving.............: avg=81.04µs min=29.99µs med=68.43µs max=150.03ms p(90)=104.71µs p(95)=118.14µs p(99.9)=650.53µs
     http_req_sending...............: avg=23.69µs min=5.11µs  med=13.31µs max=114.42ms p(90)=20.08µs  p(95)=22.41µs  p(99.9)=605.75µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.76ms min=3.56ms  med=78.87ms max=325.27ms p(90)=98.84ms  p(95)=108.48ms p(99.9)=192.38ms
     http_reqs......................: 73993   614.038008/s
     iteration_duration.............: avg=81.22ms min=13.96ms med=79.2ms  max=332.32ms p(90)=99.21ms  p(95)=108.89ms p(99.9)=196.27ms
     iterations.....................: 73893   613.208148/s
     success_rate...................: 100.00% ✓ 73893      ✗ 0    
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

     checks.........................: 100.00% ✓ 161487     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   537 kB/s
     http_req_blocked...............: avg=4.75µs   min=1.3µs   med=3.11µs   max=3.26ms   p(90)=4.41µs   p(95)=4.97µs   p(99.9)=72.42µs 
     http_req_connecting............: avg=1.41µs   min=0s      med=0s       max=3.22ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.05ms min=4.87ms  med=110.82ms max=318.31ms p(90)=134.29ms p(95)=141.44ms p(99.9)=174.8ms 
       { expected_response:true }...: avg=111.05ms min=4.87ms  med=110.82ms max=318.31ms p(90)=134.29ms p(95)=141.44ms p(99.9)=174.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 53929
     http_req_receiving.............: avg=81.44µs  min=31.5µs  med=73.44µs  max=80.07ms  p(90)=106.22µs p(95)=118.9µs  p(99.9)=571.74µs
     http_req_sending...............: avg=19.82µs  min=5.62µs  med=14.26µs  max=53.87ms  p(90)=19.61µs  p(95)=21.56µs  p(99.9)=550.03µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.95ms min=4.74ms  med=110.72ms max=317.51ms p(90)=134.19ms p(95)=141.33ms p(99.9)=174.39ms
     http_reqs......................: 53929   447.109096/s
     iteration_duration.............: avg=111.5ms  min=24.69ms med=111.09ms max=339.41ms p(90)=134.54ms p(95)=141.74ms p(99.9)=177.72ms
     iterations.....................: 53829   446.280026/s
     success_rate...................: 100.00% ✓ 53829      ✗ 0    
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

     checks.........................: 100.00% ✓ 102378     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   340 kB/s
     http_req_blocked...............: avg=5.84µs   min=1.13µs  med=3.16µs   max=3.54ms   p(90)=4.47µs   p(95)=5µs      p(99.9)=1.15ms  
     http_req_connecting............: avg=2.51µs   min=0s      med=0s       max=3.5ms    p(90)=0s       p(95)=0s       p(99.9)=1.13ms  
     http_req_duration..............: avg=175.11ms min=7.46ms  med=179.04ms max=393.85ms p(90)=185.96ms p(95)=189.78ms p(99.9)=258.56ms
       { expected_response:true }...: avg=175.11ms min=7.46ms  med=179.04ms max=393.85ms p(90)=185.96ms p(95)=189.78ms p(99.9)=258.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34226
     http_req_receiving.............: avg=92.54µs  min=30.49µs med=85.5µs   max=116.03ms p(90)=114.87µs p(95)=125.48µs p(99.9)=565.86µs
     http_req_sending...............: avg=37.34µs  min=5.54µs  med=16.69µs  max=157.24ms p(90)=21.01µs  p(95)=22.76µs  p(99.9)=504.45µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=174.98ms min=7.34ms  med=178.94ms max=393.44ms p(90)=185.83ms p(95)=189.66ms p(99.9)=258.19ms
     http_reqs......................: 34226   283.068931/s
     iteration_duration.............: avg=175.9ms  min=50.45ms med=179.3ms  max=408.77ms p(90)=186.23ms p(95)=190.06ms p(99.9)=262.49ms
     iterations.....................: 34126   282.241873/s
     success_rate...................: 100.00% ✓ 34126      ✗ 0    
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

     checks.........................: 100.00% ✓ 98754      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   328 kB/s
     http_req_blocked...............: avg=6.59µs   min=1.43µs  med=3.35µs   max=4.13ms   p(90)=4.71µs   p(95)=5.33µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=2.97µs   min=0s      med=0s       max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=181.54ms min=5.85ms  med=166.23ms max=638.06ms p(90)=212.62ms p(95)=257.43ms p(99.9)=547.34ms
       { expected_response:true }...: avg=181.54ms min=5.85ms  med=166.23ms max=638.06ms p(90)=212.62ms p(95)=257.43ms p(99.9)=547.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33018
     http_req_receiving.............: avg=95.24µs  min=35.82µs med=84.6µs   max=102.16ms p(90)=115.68µs p(95)=127.63µs p(99.9)=612.7µs 
     http_req_sending...............: avg=31.66µs  min=6.79µs  med=17.37µs  max=88.02ms  p(90)=22.33µs  p(95)=24.2µs   p(99.9)=541.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.41ms min=5.78ms  med=166.11ms max=637.97ms p(90)=212.51ms p(95)=257.1ms  p(99.9)=547.24ms
     http_reqs......................: 33018   273.27372/s
     iteration_duration.............: avg=182.36ms min=37.46ms med=166.57ms max=638.29ms p(90)=213.08ms p(95)=259.33ms p(99.9)=547.71ms
     iterations.....................: 32918   272.446069/s
     success_rate...................: 100.00% ✓ 32918      ✗ 0    
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
data_received..................: 1.2 MB 21 kB/s
     data_sent......................: 17 kB  280 B/s
     http_req_blocked...............: avg=16.68µs  min=2.85µs   med=3.62µs   max=162.91µs p(90)=11µs     p(95)=72.39µs  p(99.9)=161.1µs 
     http_req_connecting............: avg=6.41µs   min=0s       med=0s       max=83.33µs  p(90)=0s       p(95)=33.33µs  p(99.9)=82.33µs 
     http_req_duration..............: avg=2.34s    min=22.65ms  med=36.1ms   max=30.01s   p(90)=42.97ms  p(95)=12.03s   p(99.9)=29.65s  
       { expected_response:true }...: avg=2.34s    min=22.65ms  med=36.1ms   max=30.01s   p(90)=42.97ms  p(95)=12.03s   p(99.9)=29.65s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 13  
     http_req_receiving.............: avg=180.58µs min=113.22µs med=138.84µs max=464.19µs p(90)=284.12µs p(95)=365.55µs p(99.9)=462.22µs
     http_req_sending...............: avg=42.56µs  min=13.2µs   med=18.85µs  max=275.62µs p(90)=42.71µs  p(95)=136.64µs p(99.9)=272.84µs
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.34s    min=22.46ms  med=35.97ms  max=30.01s   p(90)=42.54ms  p(95)=12.03s   p(99.9)=29.65s  
     http_reqs......................: 13     0.216663/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
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

     checks.........................: 100.00% ✓ 885957      ✗ 0     
     data_received..................: 26 GB   215 MB/s
     data_sent......................: 355 MB  3.0 MB/s
     http_req_blocked...............: avg=3.4µs   min=992ns   med=2.64µs   max=17.48ms  p(90)=4.15µs  p(95)=4.84µs  p(99.9)=36.01µs
     http_req_connecting............: avg=299ns   min=0s      med=0s       max=3.59ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.08ms min=1.48ms  med=19.24ms  max=293.23ms p(90)=29.19ms p(95)=32.81ms p(99.9)=54.19ms
       { expected_response:true }...: avg=20.08ms min=1.48ms  med=19.24ms  max=293.23ms p(90)=29.19ms p(95)=32.81ms p(99.9)=54.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 295419
     http_req_receiving.............: avg=569.2µs min=52.38µs med=108.68µs max=144.38ms p(90)=1.4ms   p(95)=2.2ms   p(99.9)=18.96ms
     http_req_sending...............: avg=42.16µs min=4.85µs  med=9.9µs    max=46.94ms  p(90)=17.98µs p(95)=94.39µs p(99.9)=3.07ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.47ms min=1.4ms   med=18.63ms  max=292.57ms p(90)=28.47ms p(95)=32.03ms p(99.9)=52.66ms
     http_reqs......................: 295419  2457.785554/s
     iteration_duration.............: avg=20.3ms  min=2.74ms  med=19.45ms  max=307.5ms  p(90)=29.42ms p(95)=33.06ms p(99.9)=54.5ms 
     iterations.....................: 295319  2456.953588/s
     success_rate...................: 100.00% ✓ 295319      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 874380      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 350 MB  2.9 MB/s
     http_req_blocked...............: avg=3.4µs    min=982ns   med=2.55µs  max=16.8ms   p(90)=4µs     p(95)=4.68µs  p(99.9)=37.81µs 
     http_req_connecting............: avg=350ns    min=0s      med=0s      max=3.85ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.35ms  min=1.54ms  med=17ms    max=377.21ms p(90)=33.57ms p(95)=41.17ms p(99.9)=145.83ms
       { expected_response:true }...: avg=20.35ms  min=1.54ms  med=17ms    max=377.21ms p(90)=33.57ms p(95)=41.17ms p(99.9)=145.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 291560
     http_req_receiving.............: avg=605.88µs min=51.72µs med=98.79µs max=253.65ms p(90)=1.12ms  p(95)=1.95ms  p(99.9)=29.81ms 
     http_req_sending...............: avg=42.99µs  min=4.93µs  med=9.72µs  max=126.72ms p(90)=17.89µs p(95)=90.92µs p(99.9)=3.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.7ms   min=1.45ms  med=16.46ms max=377.12ms p(90)=32.49ms p(95)=39.99ms p(99.9)=143.79ms
     http_reqs......................: 291560  2425.542157/s
     iteration_duration.............: avg=20.57ms  min=2.62ms  med=17.2ms  max=377.39ms p(90)=33.8ms  p(95)=41.43ms p(99.9)=147.32ms
     iterations.....................: 291460  2424.710238/s
     success_rate...................: 100.00% ✓ 291460      ✗ 0     
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

     checks.........................: 100.00% ✓ 869772      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 349 MB  2.9 MB/s
     http_req_blocked...............: avg=3.67µs  min=1.05µs  med=2.77µs  max=14ms     p(90)=4.37µs  p(95)=5.15µs   p(99.9)=39.61µs
     http_req_connecting............: avg=323ns   min=0s      med=0s      max=4.08ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.46ms min=1.73ms  med=20.26ms max=288.74ms p(90)=28.39ms p(95)=30.84ms  p(99.9)=49.67ms
       { expected_response:true }...: avg=20.46ms min=1.73ms  med=20.26ms max=288.74ms p(90)=28.39ms p(95)=30.84ms  p(99.9)=49.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 290024
     http_req_receiving.............: avg=90.9µs  min=26.32µs med=53.79µs max=34.29ms  p(90)=94.88µs p(95)=131.91µs p(99.9)=6.63ms 
     http_req_sending...............: avg=41.94µs min=5.04µs  med=10.67µs max=116.76ms p(90)=18.42µs p(95)=72.03µs  p(99.9)=2.95ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.33ms min=1.68ms  med=20.14ms max=288.37ms p(90)=28.24ms p(95)=30.66ms  p(99.9)=48.55ms
     http_reqs......................: 290024  2412.33969/s
     iteration_duration.............: avg=20.68ms min=2.68ms  med=20.46ms max=304.2ms  p(90)=28.6ms  p(95)=31.06ms  p(99.9)=50.15ms
     iterations.....................: 289924  2411.507917/s
     success_rate...................: 100.00% ✓ 289924      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 859104      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=2.92µs   min=921ns  med=2.03µs  max=18.13ms  p(90)=3.44µs  p(95)=4.13µs  p(99.9)=29.72µs 
     http_req_connecting............: avg=350ns    min=0s     med=0s      max=4.04ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.73ms  min=1.58ms med=17.26ms max=317.42ms p(90)=34.06ms p(95)=42ms    p(99.9)=153.49ms
       { expected_response:true }...: avg=20.73ms  min=1.58ms med=17.26ms max=317.42ms p(90)=34.06ms p(95)=42ms    p(99.9)=153.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286468
     http_req_receiving.............: avg=614.05µs min=51.2µs med=96.24µs max=206.3ms  p(90)=1.12ms  p(95)=1.91ms  p(99.9)=28.83ms 
     http_req_sending...............: avg=38µs     min=4.54µs med=8.64µs  max=183.05ms p(90)=16.31µs p(95)=66.71µs p(99.9)=2.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.07ms  min=1.49ms med=16.72ms max=317.35ms p(90)=33.04ms p(95)=40.76ms p(99.9)=149.54ms
     http_reqs......................: 286468  2383.048669/s
     iteration_duration.............: avg=20.94ms  min=2.01ms med=17.46ms max=320.57ms p(90)=34.27ms p(95)=42.24ms p(99.9)=154.67ms
     iterations.....................: 286368  2382.216796/s
     success_rate...................: 100.00% ✓ 286368      ✗ 0     
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

     checks.........................: 100.00% ✓ 832596      ✗ 0     
     data_received..................: 24 GB   202 MB/s
     data_sent......................: 334 MB  2.8 MB/s
     http_req_blocked...............: avg=2.74µs   min=892ns   med=2.11µs  max=12.21ms  p(90)=3.67µs  p(95)=4.4µs   p(99.9)=31.79µs 
     http_req_connecting............: avg=190ns    min=0s      med=0s      max=2.75ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.39ms  min=1.87ms  med=18.07ms max=344.62ms p(90)=34.72ms p(95)=42.85ms p(99.9)=146.51ms
       { expected_response:true }...: avg=21.39ms  min=1.87ms  med=18.07ms max=344.62ms p(90)=34.72ms p(95)=42.85ms p(99.9)=146.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 277632
     http_req_receiving.............: avg=586.57µs min=50.31µs med=97.46µs max=147.56ms p(90)=1.11ms  p(95)=1.91ms  p(99.9)=27.55ms 
     http_req_sending...............: avg=41.13µs  min=4.78µs  med=9.09µs  max=182.99ms p(90)=17.85µs p(95)=56.57µs p(99.9)=3.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.76ms  min=1.76ms  med=17.54ms max=344.54ms p(90)=33.7ms  p(95)=41.6ms  p(99.9)=145.58ms
     http_reqs......................: 277632  2309.180212/s
     iteration_duration.............: avg=21.6ms   min=3.02ms  med=18.27ms max=344.76ms p(90)=34.95ms p(95)=43.07ms p(99.9)=147.33ms
     iterations.....................: 277532  2308.34847/s
     success_rate...................: 100.00% ✓ 277532      ✗ 0     
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

     checks.........................: 100.00% ✓ 594915      ✗ 0     
     data_received..................: 17 GB   145 MB/s
     data_sent......................: 238 MB  2.0 MB/s
     http_req_blocked...............: avg=5.17µs   min=1.11µs  med=3.1µs   max=8.79ms   p(90)=5.42µs   p(95)=6.49µs   p(99.9)=49µs   
     http_req_connecting............: avg=1.41µs   min=0s      med=0s      max=8.74ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.98ms  min=2.32ms  med=29.42ms max=290.55ms p(90)=39.76ms  p(95)=43.3ms   p(99.9)=66.7ms 
       { expected_response:true }...: avg=29.98ms  min=2.32ms  med=29.42ms max=290.55ms p(90)=39.76ms  p(95)=43.3ms   p(99.9)=66.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 198405
     http_req_receiving.............: avg=103.89µs min=27.38µs med=60.63µs max=170.65ms p(90)=132.65µs p(95)=225.15µs p(99.9)=4.5ms  
     http_req_sending...............: avg=47.98µs  min=5.08µs  med=11.73µs max=216.9ms  p(90)=26.53µs  p(95)=123.92µs p(99.9)=3.37ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.83ms  min=2.22ms  med=29.28ms max=289.91ms p(90)=39.6ms   p(95)=43.11ms  p(99.9)=65.54ms
     http_reqs......................: 198405  1649.407127/s
     iteration_duration.............: avg=30.24ms  min=6.29ms  med=29.66ms max=325.15ms p(90)=39.99ms  p(95)=43.53ms  p(99.9)=67.15ms
     iterations.....................: 198305  1648.575793/s
     success_rate...................: 100.00% ✓ 198305      ✗ 0     
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

     checks.........................: 100.00% ✓ 442158      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 177 MB  1.5 MB/s
     http_req_blocked...............: avg=3.59µs  min=972ns   med=2.66µs  max=4.03ms   p(90)=4.3µs    p(95)=4.98µs   p(99.9)=36.88µs 
     http_req_connecting............: avg=627ns   min=0s      med=0s      max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.45ms min=2.14ms  med=40.12ms max=333.63ms p(90)=56.01ms  p(95)=60.94ms  p(99.9)=83.28ms 
       { expected_response:true }...: avg=40.45ms min=2.14ms  med=40.12ms max=333.63ms p(90)=56.01ms  p(95)=60.94ms  p(99.9)=83.28ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 147486
     http_req_receiving.............: avg=78.06µs min=26.54µs med=65.87µs max=27.61ms  p(90)=105.99µs p(95)=122.75µs p(99.9)=881.61µs
     http_req_sending...............: avg=26.07µs min=5µs     med=12.3µs  max=153.4ms  p(90)=19.81µs  p(95)=23.44µs  p(99.9)=1.03ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.35ms min=2.04ms  med=40.02ms max=320.12ms p(90)=55.9ms   p(95)=60.83ms  p(99.9)=83.06ms 
     http_reqs......................: 147486  1226.138336/s
     iteration_duration.............: avg=40.7ms  min=3.67ms  med=40.35ms max=352.2ms  p(90)=56.23ms  p(95)=61.16ms  p(99.9)=83.77ms 
     iterations.....................: 147386  1225.306977/s
     success_rate...................: 100.00% ✓ 147386      ✗ 0     
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

     checks.........................: 100.00% ✓ 207279     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 83 MB   689 kB/s
     http_req_blocked...............: avg=4.26µs  min=1.06µs  med=2.55µs  max=3.5ms    p(90)=4.01µs   p(95)=4.62µs   p(99.9)=45.31µs 
     http_req_connecting............: avg=1.44µs  min=0s      med=0s      max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.5ms  min=4.02ms  med=84.49ms max=313.14ms p(90)=105.23ms p(95)=115.02ms p(99.9)=200.41ms
       { expected_response:true }...: avg=86.5ms  min=4.02ms  med=84.49ms max=313.14ms p(90)=105.23ms p(95)=115.02ms p(99.9)=200.41ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69193
     http_req_receiving.............: avg=82.89µs min=29.23µs med=71.34µs max=154.89ms p(90)=106.76µs p(95)=119.85µs p(99.9)=595.77µs
     http_req_sending...............: avg=25.38µs min=4.89µs  med=12.84µs max=153.27ms p(90)=19.55µs  p(95)=21.7µs   p(99.9)=573.65µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.39ms min=3.94ms  med=84.39ms max=305.98ms p(90)=105.11ms p(95)=114.88ms p(99.9)=200ms   
     http_reqs......................: 69193   574.054726/s
     iteration_duration.............: avg=86.85ms min=13.24ms med=84.72ms max=327.21ms p(90)=105.49ms p(95)=115.31ms p(99.9)=201.8ms 
     iterations.....................: 69093   573.225083/s
     success_rate...................: 100.00% ✓ 69093      ✗ 0    
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

     checks.........................: 100.00% ✓ 147207     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   489 kB/s
     http_req_blocked...............: avg=4.81µs   min=1.06µs  med=3.04µs   max=2.97ms   p(90)=4.47µs   p(95)=5.02µs   p(99.9)=190.14µs
     http_req_connecting............: avg=1.57µs   min=0s      med=0s       max=2.93ms   p(90)=0s       p(95)=0s       p(99.9)=96.47µs 
     http_req_duration..............: avg=121.8ms  min=5.28ms  med=119.42ms max=308.33ms p(90)=161.19ms p(95)=173.07ms p(99.9)=219.92ms
       { expected_response:true }...: avg=121.8ms  min=5.28ms  med=119.42ms max=308.33ms p(90)=161.19ms p(95)=173.07ms p(99.9)=219.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49169
     http_req_receiving.............: avg=86.43µs  min=30.77µs med=82.46µs  max=51.98ms  p(90)=113.23µs p(95)=125.5µs  p(99.9)=561.34µs
     http_req_sending...............: avg=25.06µs  min=4.85µs  med=16.22µs  max=126.21ms p(90)=21.35µs  p(95)=23.12µs  p(99.9)=762.37µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.69ms min=5.08ms  med=119.32ms max=307.29ms p(90)=161.09ms p(95)=172.95ms p(99.9)=219.48ms
     http_reqs......................: 49169   407.431459/s
     iteration_duration.............: avg=122.31ms min=29.49ms med=119.75ms max=323.14ms p(90)=161.5ms  p(95)=173.4ms  p(99.9)=221.92ms
     iterations.....................: 49069   406.602824/s
     success_rate...................: 100.00% ✓ 49069      ✗ 0    
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

     checks.........................: 100.00% ✓ 96963      ✗ 0    
     data_received..................: 2.8 GB  24 MB/s
     data_sent......................: 39 MB   322 kB/s
     http_req_blocked...............: avg=6.74µs   min=1.07µs  med=3.14µs   max=4.21ms   p(90)=4.46µs   p(95)=5.02µs   p(99.9)=1.76ms  
     http_req_connecting............: avg=3.28µs   min=0s      med=0s       max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=184.97ms min=5.8ms   med=169.05ms max=643.61ms p(90)=216.63ms p(95)=257.12ms p(99.9)=563.73ms
       { expected_response:true }...: avg=184.97ms min=5.8ms   med=169.05ms max=643.61ms p(90)=216.63ms p(95)=257.12ms p(99.9)=563.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32421
     http_req_receiving.............: avg=94.57µs  min=32.72µs med=90.48µs  max=19.85ms  p(90)=120.71µs p(95)=132.78µs p(99.9)=763.65µs
     http_req_sending...............: avg=20.91µs  min=5.28µs  med=17.32µs  max=26.22ms  p(90)=21.45µs  p(95)=23.15µs  p(99.9)=414.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.85ms min=5.65ms  med=168.93ms max=643.44ms p(90)=216.52ms p(95)=256.98ms p(99.9)=563.32ms
     http_reqs......................: 32421   268.092717/s
     iteration_duration.............: avg=185.79ms min=39.45ms med=169.39ms max=643.9ms  p(90)=216.92ms p(95)=258.48ms p(99.9)=564.47ms
     iterations.....................: 32321   267.265806/s
     success_rate...................: 100.00% ✓ 32321      ✗ 0    
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

     checks.........................: 100.00% ✓ 95871      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   318 kB/s
     http_req_blocked...............: avg=6.73µs   min=1.19µs  med=3.48µs   max=4.16ms   p(90)=4.86µs   p(95)=5.39µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=2.99µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=1.37ms  
     http_req_duration..............: avg=187ms    min=7.61ms  med=179.88ms max=392.33ms p(90)=209.85ms p(95)=214.79ms p(99.9)=289.2ms 
       { expected_response:true }...: avg=187ms    min=7.61ms  med=179.88ms max=392.33ms p(90)=209.85ms p(95)=214.79ms p(99.9)=289.2ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32057
     http_req_receiving.............: avg=93.98µs  min=30.34µs med=87.28µs  max=97.59ms  p(90)=117.43µs p(95)=128.86µs p(99.9)=513.67µs
     http_req_sending...............: avg=27.31µs  min=5.36µs  med=16.87µs  max=90.12ms  p(90)=21.56µs  p(95)=23.39µs  p(99.9)=495.58µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.88ms min=7.51ms  med=179.77ms max=392.2ms  p(90)=209.74ms p(95)=214.67ms p(99.9)=289.09ms
     http_reqs......................: 32057   265.017002/s
     iteration_duration.............: avg=187.85ms min=35.66ms med=180.15ms max=413.34ms p(90)=210.15ms p(95)=215.11ms p(99.9)=289.86ms
     iterations.....................: 31957   264.190296/s
     success_rate...................: 100.00% ✓ 31957      ✗ 0    
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

     checks.........................: 100.00% ✓ 7698      ✗ 0   
     data_received..................: 255 MB  2.0 MB/s
     data_sent......................: 3.2 MB  26 kB/s
     http_req_blocked...............: avg=92.64µs  min=1.52µs   med=3.85µs  max=8.47ms p(90)=5.54µs  p(95)=6.4µs    p(99.9)=7.61ms 
     http_req_connecting............: avg=84.83µs  min=0s       med=0s      max=8.41ms p(90)=0s      p(95)=0s       p(99.9)=7.4ms  
     http_req_duration..............: avg=2.26s    min=28.25ms  med=2.31s   max=4.51s  p(90)=3.11s   p(95)=3.35s    p(99.9)=4.11s  
       { expected_response:true }...: avg=2.26s    min=28.25ms  med=2.31s   max=4.51s  p(90)=3.11s   p(95)=3.35s    p(99.9)=4.11s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2666
     http_req_receiving.............: avg=104.87µs min=31.46µs  med=97.61µs max=8.71ms p(90)=137.6µs p(95)=153.01µs p(99.9)=425.5µs
     http_req_sending...............: avg=86.84µs  min=6.49µs   med=19.5µs  max=26ms   p(90)=24.65µs p(95)=28.6µs   p(99.9)=10.8ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s     p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.26s    min=28.15ms  med=2.31s   max=4.51s  p(90)=3.11s   p(95)=3.35s    p(99.9)=4.11s  
     http_reqs......................: 2666    21.216724/s
     iteration_duration.............: avg=2.35s    min=114.66ms med=2.34s   max=4.52s  p(90)=3.13s   p(95)=3.36s    p(99.9)=4.11s  
     iterations.....................: 2566    20.420898/s
     success_rate...................: 100.00% ✓ 2566      ✗ 0   
     vus............................: 25      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

