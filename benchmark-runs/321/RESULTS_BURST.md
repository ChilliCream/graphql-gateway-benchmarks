## Overview for: `burst-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario is a burst stress test with peaks up to **500 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,744 | 2,877 | 2,681 | 2.4% |  |
| fusion-nightly-net11 | 16.6.2-p.1 | 2,631 | 2,738 | 2,622 | 1.7% |  |
| fusion | 16.6.1 | 2,516 | 2,597 | 2,509 | 1.2% |  |
| fusion-nightly | 16.6.2-p.1 | 2,446 | 2,598 | 2,428 | 2.6% |  |
| fusion-nightly-fed | 16.6.2-p.1 | 2,389 | 2,468 | 2,382 | 1.2% |  |
| cosmo | 0.334.0 | 1,235 | 1,277 | 1,227 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 567 | 583 | 565 | 1.0% |  |
| hive-gateway | 2.10.8 | 249 | 258 | 247 | 1.2% |  |
| apollo-gateway | 2.14.3 | 234 | 241 | 233 | 1.0% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (6094 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (550479 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.2-p.1 | 2,393 | 2,482 | 2,369 | 1.5% |  |
| fusion-nightly | 16.6.2-p.1 | 2,344 | 2,434 | 2,329 | 1.5% |  |
| fusion | 16.6.1 | 2,316 | 2,418 | 2,300 | 1.9% |  |
| hive-router | v0.0.84 | 2,200 | 2,346 | 2,174 | 2.7% |  |
| fusion-nightly-fed | 16.6.2-p.1 | 2,184 | 2,271 | 2,174 | 1.6% |  |
| cosmo | 0.334.0 | 1,162 | 1,199 | 1,154 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 526 | 541 | 523 | 1.2% |  |
| hive-gateway | 2.10.8 | 237 | 243 | 235 | 1.0% |  |
| apollo-gateway | 2.14.3 | 228 | 234 | 228 | 0.9% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (40190 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (351393 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 504825      ✗ 0     
     data_received..................: 15 GB   241 MB/s
     data_sent......................: 203 MB  3.3 MB/s
     http_req_blocked...............: avg=15.7µs   min=882ns   med=2.09µs  max=56.35ms  p(90)=3.49µs   p(95)=4.56µs   p(99.9)=1.17ms  
     http_req_connecting............: avg=12.88µs  min=0s      med=0s      max=56.26ms  p(90)=0s       p(95)=0s       p(99.9)=1.09ms  
     http_req_duration..............: avg=83.98ms  min=1.39ms  med=79.37ms max=341.64ms p(90)=163.33ms p(95)=176.66ms p(99.9)=231.47ms
       { expected_response:true }...: avg=83.98ms  min=1.39ms  med=79.37ms max=341.64ms p(90)=163.33ms p(95)=176.66ms p(99.9)=231.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 169275
     http_req_receiving.............: avg=122.62µs min=24.95µs med=49.53µs max=49.24ms  p(90)=118.71µs p(95)=310µs    p(99.9)=13.2ms  
     http_req_sending...............: avg=63.91µs  min=4.63µs  med=9.02µs  max=201.78ms p(90)=16.52µs  p(95)=106.35µs p(99.9)=8.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.79ms  min=1.31ms  med=79.22ms max=341.48ms p(90)=163.15ms p(95)=176.43ms p(99.9)=229.37ms
     http_reqs......................: 169275  2744.683745/s
     iteration_duration.............: avg=84.72ms  min=2.3ms   med=80.2ms  max=352.8ms  p(90)=163.75ms p(95)=177.05ms p(99.9)=232.53ms
     iterations.....................: 168275  2728.469397/s
     success_rate...................: 100.00% ✓ 168275      ✗ 0     
     vus............................: 87      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 488544      ✗ 0     
     data_received..................: 14 GB   231 MB/s
     data_sent......................: 197 MB  3.2 MB/s
     http_req_blocked...............: avg=16.83µs min=902ns   med=2.09µs  max=45.27ms  p(90)=3.54µs   p(95)=4.66µs   p(99.9)=1.82ms  
     http_req_connecting............: avg=13.83µs min=0s      med=0s      max=45.23ms  p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=86.77ms min=1.9ms   med=81.37ms max=384.87ms p(90)=165.79ms p(95)=181.25ms p(99.9)=241.81ms
       { expected_response:true }...: avg=86.77ms min=1.9ms   med=81.37ms max=384.87ms p(90)=165.79ms p(95)=181.25ms p(99.9)=241.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 163848
     http_req_receiving.............: avg=586.1µs min=50.92µs med=99.16µs max=115.36ms p(90)=1.1ms    p(95)=1.96ms   p(99.9)=24.76ms 
     http_req_sending...............: avg=64.1µs  min=4.5µs   med=9.06µs  max=196.61ms p(90)=18.18µs  p(95)=109.02µs p(99.9)=8.55ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.12ms min=1.81ms  med=80.79ms max=384.46ms p(90)=164.96ms p(95)=180.39ms p(99.9)=240.74ms
     http_reqs......................: 163848  2631.803523/s
     iteration_duration.............: avg=87.55ms min=3.54ms  med=82.2ms  max=385.09ms p(90)=166.21ms p(95)=181.69ms p(99.9)=242.43ms
     iterations.....................: 162848  2615.741053/s
     success_rate...................: 100.00% ✓ 162848      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 467010      ✗ 0     
     data_received..................: 14 GB   221 MB/s
     data_sent......................: 188 MB  3.0 MB/s
     http_req_blocked...............: avg=20.43µs min=902ns  med=2.51µs  max=111.51ms p(90)=4.06µs   p(95)=5.16µs   p(99.9)=2.16ms  
     http_req_connecting............: avg=17.18µs min=0s     med=0s      max=104.09ms p(90)=0s       p(95)=0s       p(99.9)=2.05ms  
     http_req_duration..............: avg=90.69ms min=1.98ms med=78.55ms max=1.51s    p(90)=172.71ms p(95)=202.13ms p(99.9)=611.87ms
       { expected_response:true }...: avg=90.69ms min=1.98ms med=78.55ms max=1.51s    p(90)=172.71ms p(95)=202.13ms p(99.9)=611.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156670
     http_req_receiving.............: avg=1.54ms  min=53µs   med=98.34µs max=642.75ms p(90)=1.57ms   p(95)=4.59ms   p(99.9)=95.58ms 
     http_req_sending...............: avg=73.05µs min=4.57µs med=9.43µs  max=188.04ms p(90)=17.59µs  p(95)=114.87µs p(99.9)=10.49ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.07ms min=1.89ms med=77.33ms max=1.5s     p(90)=170.67ms p(95)=198.94ms p(99.9)=600.11ms
     http_reqs......................: 156670  2516.097727/s
     iteration_duration.............: avg=91.62ms min=3.34ms med=79.49ms max=1.51s    p(90)=173.56ms p(95)=203.43ms p(99.9)=614.06ms
     iterations.....................: 155670  2500.037871/s
     success_rate...................: 100.00% ✓ 155670      ✗ 0     
     vus............................: 68      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 454929      ✗ 0     
     data_received..................: 13 GB   214 MB/s
     data_sent......................: 183 MB  2.9 MB/s
     http_req_blocked...............: avg=18.45µs min=932ns  med=2.54µs   max=55.24ms  p(90)=4.08µs   p(95)=5.11µs   p(99.9)=1.24ms  
     http_req_connecting............: avg=15.19µs min=0s     med=0s       max=55.15ms  p(90)=0s       p(95)=0s       p(99.9)=1.13ms  
     http_req_duration..............: avg=93.2ms  min=1.96ms med=83.01ms  max=2.03s    p(90)=174.18ms p(95)=203.75ms p(99.9)=661.85ms
       { expected_response:true }...: avg=93.2ms  min=1.96ms med=83.01ms  max=2.03s    p(90)=174.18ms p(95)=203.75ms p(99.9)=661.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152643
     http_req_receiving.............: avg=1.28ms  min=53.1µs med=102.43µs max=848.25ms p(90)=1.52ms   p(95)=3.91ms   p(99.9)=78.36ms 
     http_req_sending...............: avg=69.07µs min=4.79µs med=9.54µs   max=110.41ms p(90)=18.05µs  p(95)=116.14µs p(99.9)=9.9ms   
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.84ms min=1.88ms med=81.94ms  max=2.02s    p(90)=172.44ms p(95)=200.49ms p(99.9)=642.65ms
     http_reqs......................: 152643  2446.083418/s
     iteration_duration.............: avg=94.08ms min=3.33ms med=84.01ms  max=2.03s    p(90)=174.73ms p(95)=204.54ms p(99.9)=663.69ms
     iterations.....................: 151643  2430.058553/s
     success_rate...................: 100.00% ✓ 151643      ✗ 0     
     vus............................: 76      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 441891      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=13.63µs min=821ns   med=2.1µs   max=53.62ms  p(90)=3.63µs   p(95)=4.72µs   p(99.9)=1.29ms  
     http_req_connecting............: avg=10.81µs min=0s      med=0s      max=53.57ms  p(90)=0s       p(95)=0s       p(99.9)=1.21ms  
     http_req_duration..............: avg=95.98ms min=1.66ms  med=84.01ms max=1.47s    p(90)=181.64ms p(95)=210.83ms p(99.9)=729.54ms
       { expected_response:true }...: avg=95.98ms min=1.66ms  med=84.01ms max=1.47s    p(90)=181.64ms p(95)=210.83ms p(99.9)=729.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148297
     http_req_receiving.............: avg=1.39ms  min=51.37µs med=96.73µs max=887.19ms p(90)=1.42ms   p(95)=3.75ms   p(99.9)=97.71ms 
     http_req_sending...............: avg=57.61µs min=4.6µs   med=8.79µs  max=42.27ms  p(90)=17.22µs  p(95)=99.37µs  p(99.9)=8.13ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.52ms min=1.57ms  med=82.91ms max=1.46s    p(90)=180.04ms p(95)=208.22ms p(99.9)=681.66ms
     http_reqs......................: 148297  2389.465353/s
     iteration_duration.............: avg=96.89ms min=2.89ms  med=85.01ms max=1.47s    p(90)=182.23ms p(95)=211.52ms p(99.9)=729.92ms
     iterations.....................: 147297  2373.352651/s
     success_rate...................: 100.00% ✓ 147297      ✗ 0     
     vus............................: 58      min=0         max=498 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 228690      ✗ 0    
     data_received..................: 6.8 GB  108 MB/s
     data_sent......................: 93 MB   1.5 MB/s
     http_req_blocked...............: avg=5.89µs   min=1.03µs  med=2.65µs   max=6.84ms   p(90)=4.33µs   p(95)=5.24µs   p(99.9)=513.63µs
     http_req_connecting............: avg=2.51µs   min=0s      med=0s       max=6.78ms   p(90)=0s       p(95)=0s       p(99.9)=440.77µs
     http_req_duration..............: avg=184.7ms  min=1.92ms  med=187.42ms max=521.11ms p(90)=340.61ms p(95)=366.02ms p(99.9)=450.85ms
       { expected_response:true }...: avg=184.7ms  min=1.92ms  med=187.42ms max=521.11ms p(90)=340.61ms p(95)=366.02ms p(99.9)=450.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 77230
     http_req_receiving.............: avg=74.58µs  min=26.52µs med=60.78µs  max=28.02ms  p(90)=98.75µs  p(95)=113.24µs p(99.9)=1.37ms  
     http_req_sending...............: avg=29.09µs  min=5.11µs  med=11.44µs  max=96.37ms  p(90)=18.66µs  p(95)=22.36µs  p(99.9)=3.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.6ms  min=1.86ms  med=187.3ms  max=521.03ms p(90)=340.49ms p(95)=365.92ms p(99.9)=450.78ms
     http_reqs......................: 77230   1235.276834/s
     iteration_duration.............: avg=187.36ms min=3.89ms  med=190.25ms max=521.28ms p(90)=341.38ms p(95)=366.62ms p(99.9)=451.32ms
     iterations.....................: 76230   1219.282054/s
     success_rate...................: 100.00% ✓ 76230       ✗ 0    
     vus............................: 80      min=0         max=492
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 106458     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   682 kB/s
     http_req_blocked...............: avg=7.38µs   min=1.02µs  med=2.68µs   max=12.79ms  p(90)=4.41µs   p(95)=5.36µs   p(99.9)=881.5µs 
     http_req_connecting............: avg=3.76µs   min=0s      med=0s       max=12.74ms  p(90)=0s       p(95)=0s       p(99.9)=857.58µs
     http_req_duration..............: avg=393.18ms min=3.54ms  med=367.8ms  max=1.78s    p(90)=772.78ms p(95)=847.02ms p(99.9)=1.23s   
       { expected_response:true }...: avg=393.18ms min=3.54ms  med=367.8ms  max=1.78s    p(90)=772.78ms p(95)=847.02ms p(99.9)=1.23s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36486
     http_req_receiving.............: avg=85µs     min=28.72µs med=66.37µs  max=230.11ms p(90)=106.66µs p(95)=122.06µs p(99.9)=969.82µs
     http_req_sending...............: avg=30.67µs  min=5.28µs  med=12.79µs  max=139.02ms p(90)=20.32µs  p(95)=23.18µs  p(99.9)=2.44ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=393.07ms min=3.45ms  med=367.67ms max=1.78s    p(90)=772.69ms p(95)=846.94ms p(99.9)=1.23s   
     http_reqs......................: 36486   567.822005/s
     iteration_duration.............: avg=404.49ms min=18.56ms med=381.01ms max=1.8s     p(90)=776.74ms p(95)=850.28ms p(99.9)=1.24s   
     iterations.....................: 35486   552.259269/s
     success_rate...................: 100.00% ✓ 35486      ✗ 0    
     vus............................: 69      min=0        max=496
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 47388      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   301 kB/s
     http_req_blocked...............: avg=11.7µs   min=1.08µs  med=3µs      max=6.82ms  p(90)=4.65µs   p(95)=5.98µs   p(99.9)=1.66ms
     http_req_connecting............: avg=7.23µs   min=0s      med=0s       max=6.76ms  p(90)=0s       p(95)=0s       p(99.9)=1.63ms
     http_req_duration..............: avg=845.52ms min=5.32ms  med=762.13ms max=17.02s  p(90)=1.56s    p(95)=1.72s    p(99.9)=14.74s
       { expected_response:true }...: avg=845.52ms min=5.32ms  med=762.13ms max=17.02s  p(90)=1.56s    p(95)=1.72s    p(99.9)=14.74s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16796
     http_req_receiving.............: avg=95.63µs  min=34.56µs med=84.77µs  max=47.57ms p(90)=121.26µs p(95)=135.62µs p(99.9)=1.3ms 
     http_req_sending...............: avg=38.81µs  min=5.22µs  med=16.16µs  max=88.71ms p(90)=21.37µs  p(95)=24.91µs  p(99.9)=4.32ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=845.38ms min=5.26ms  med=762.02ms max=17.02s  p(90)=1.55s    p(95)=1.72s    p(99.9)=14.74s
     http_reqs......................: 16796   249.841301/s
     iteration_duration.............: avg=899.04ms min=17.62ms med=825.11ms max=17.02s  p(90)=1.57s    p(95)=1.73s    p(99.9)=14.75s
     iterations.....................: 15796   234.966254/s
     success_rate...................: 100.00% ✓ 15796      ✗ 0    
     vus............................: 67      min=0        max=499
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 48360      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   287 kB/s
     http_req_blocked...............: avg=15.12µs  min=1.4µs   med=3.59µs   max=14.58ms p(90)=5.26µs   p(95)=6.66µs   p(99.9)=2.26ms  
     http_req_connecting............: avg=9.88µs   min=0s      med=0s       max=14.53ms p(90)=0s       p(95)=0s       p(99.9)=2.24ms  
     http_req_duration..............: avg=417.03ms min=7.53ms  med=481.47ms max=1.28s   p(90)=723.73ms p(95)=774.4ms  p(99.9)=1.08s   
       { expected_response:true }...: avg=417.03ms min=7.53ms  med=481.47ms max=1.28s   p(90)=723.73ms p(95)=774.4ms  p(99.9)=1.08s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 17120
     http_req_receiving.............: avg=98.05µs  min=36.98µs med=86.25µs  max=87.11ms p(90)=125.05µs p(95)=140.99µs p(99.9)=780.39µs
     http_req_sending...............: avg=32.81µs  min=5.8µs   med=16.68µs  max=75.63ms p(90)=22.46µs  p(95)=26.6µs   p(99.9)=3.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=416.9ms  min=7.46ms  med=481.35ms max=1.28s   p(90)=723.66ms p(95)=774.32ms p(99.9)=1.08s   
     http_reqs......................: 17120   234.062185/s
     iteration_duration.............: avg=442.9ms  min=7.98ms  med=506.2ms  max=1.29s   p(90)=728.63ms p(95)=779.78ms p(99.9)=1.09s   
     iterations.....................: 16120   220.390328/s
     success_rate...................: 100.00% ✓ 16120      ✗ 0    
     vus............................: 56      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 440973      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=15.65µs  min=911ns   med=2.44µs   max=52.69ms  p(90)=4.27µs   p(95)=5.43µs   p(99.9)=1.05ms  
     http_req_connecting............: avg=12.36µs  min=0s      med=0s       max=52.57ms  p(90)=0s       p(95)=0s       p(99.9)=914.48µs
     http_req_duration..............: avg=96.1ms   min=1.47ms  med=92.56ms  max=311.39ms p(90)=182.93ms p(95)=198.62ms p(99.9)=256.03ms
       { expected_response:true }...: avg=96.1ms   min=1.47ms  med=92.56ms  max=311.39ms p(90)=182.93ms p(95)=198.62ms p(99.9)=256.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147991
     http_req_receiving.............: avg=670.95µs min=51.64µs med=110.75µs max=203.07ms p(90)=1.28ms   p(95)=2.26ms   p(99.9)=28.5ms  
     http_req_sending...............: avg=64.56µs  min=4.42µs  med=9.77µs   max=100.68ms p(90)=20.35µs  p(95)=115.49µs p(99.9)=8.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.36ms  min=1.39ms  med=91.74ms  max=309.28ms p(90)=182.04ms p(95)=197.7ms  p(99.9)=255.32ms
     http_reqs......................: 147991  2393.524535/s
     iteration_duration.............: avg=97ms     min=2.65ms  med=93.55ms  max=326.81ms p(90)=183.36ms p(95)=199.05ms p(99.9)=256.55ms
     iterations.....................: 146991  2377.351089/s
     success_rate...................: 100.00% ✓ 146991      ✗ 0     
     vus............................: 94      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 432144      ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=22.32µs min=1.07µs  med=2.94µs   max=81.92ms  p(90)=4.7µs    p(95)=5.92µs   p(99.9)=1.43ms  
     http_req_connecting............: avg=18.33µs min=0s      med=0s       max=81.75ms  p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=98.05ms min=1.5ms   med=81.36ms  max=2.27s    p(90)=188.11ms p(95)=218.66ms p(99.9)=834.92ms
       { expected_response:true }...: avg=98.05ms min=1.5ms   med=81.36ms  max=2.27s    p(90)=188.11ms p(95)=218.66ms p(99.9)=834.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145048
     http_req_receiving.............: avg=1.56ms  min=55.63µs med=110.41µs max=755.48ms p(90)=1.75ms   p(95)=4.76ms   p(99.9)=137.66ms
     http_req_sending...............: avg=80.23µs min=4.98µs  med=10.96µs  max=104.45ms p(90)=20.88µs  p(95)=126.02µs p(99.9)=11.04ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.41ms min=1.4ms   med=79.96ms  max=2.26s    p(90)=186.01ms p(95)=215.24ms p(99.9)=830.04ms
     http_reqs......................: 145048  2344.458144/s
     iteration_duration.............: avg=99.02ms min=2.82ms  med=82.33ms  max=2.27s    p(90)=188.8ms  p(95)=219.46ms p(99.9)=840.13ms
     iterations.....................: 144048  2328.294818/s
     success_rate...................: 100.00% ✓ 144048      ✗ 0     
     vus............................: 49      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 427629      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 172 MB  2.8 MB/s
     http_req_blocked...............: avg=14.15µs  min=881ns  med=2.25µs   max=68.3ms   p(90)=3.97µs   p(95)=5.11µs   p(99.9)=1.12ms  
     http_req_connecting............: avg=11.02µs  min=0s     med=0s       max=68.19ms  p(90)=0s       p(95)=0s       p(99.9)=1.05ms  
     http_req_duration..............: avg=99.09ms  min=1.6ms  med=87.5ms   max=1.2s     p(90)=191.07ms p(95)=220.71ms p(99.9)=601.85ms
       { expected_response:true }...: avg=99.09ms  min=1.6ms  med=87.5ms   max=1.2s     p(90)=191.07ms p(95)=220.71ms p(99.9)=601.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143543
     http_req_receiving.............: avg=1.57ms   min=52.7µs med=108.15µs max=930.43ms p(90)=1.81ms   p(95)=4.68ms   p(99.9)=107.67ms
     http_req_sending...............: avg=64.13µs  min=4.83µs med=9.36µs   max=148.82ms p(90)=19.15µs  p(95)=103.05µs p(99.9)=8.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.46ms  min=1.51ms med=86.25ms  max=1.2s     p(90)=189.14ms p(95)=217.02ms p(99.9)=598.06ms
     http_reqs......................: 143543  2316.795382/s
     iteration_duration.............: avg=100.11ms min=2.93ms med=88.69ms  max=1.2s     p(90)=191.63ms p(95)=221.62ms p(99.9)=604.43ms
     iterations.....................: 142543  2300.655303/s
     success_rate...................: 100.00% ✓ 142543      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 406356      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 164 MB  2.6 MB/s
     http_req_blocked...............: avg=14.7µs   min=1.06µs  med=2.96µs   max=50.63ms  p(90)=4.7µs    p(95)=5.91µs   p(99.9)=887µs   
     http_req_connecting............: avg=10.95µs  min=0s      med=0s       max=50.56ms  p(90)=0s       p(95)=0s       p(99.9)=791.12µs
     http_req_duration..............: avg=104.26ms min=1.49ms  med=99.58ms  max=296.68ms p(90)=202.05ms p(95)=218.14ms p(99.9)=264.51ms
       { expected_response:true }...: avg=104.26ms min=1.49ms  med=99.58ms  max=296.68ms p(90)=202.05ms p(95)=218.14ms p(99.9)=264.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136452
     http_req_receiving.............: avg=118.29µs min=26.72µs med=58.06µs  max=121.56ms p(90)=124.86µs p(95)=351.73µs p(99.9)=7.63ms  
     http_req_sending...............: avg=66.89µs  min=5.06µs  med=11.47µs  max=144.37ms p(90)=20.43µs  p(95)=127.33µs p(99.9)=8.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.08ms min=1.44ms  med=99.4ms   max=296.61ms p(90)=201.82ms p(95)=217.88ms p(99.9)=263.95ms
     http_reqs......................: 136452  2200.728594/s
     iteration_duration.............: avg=105.28ms min=4.06ms  med=100.78ms max=312.01ms p(90)=202.55ms p(95)=218.59ms p(99.9)=265.72ms
     iterations.....................: 135452  2184.600369/s
     success_rate...................: 100.00% ✓ 135452      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 404385      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=13.61µs  min=921ns   med=2.41µs  max=59.42ms  p(90)=4.2µs    p(95)=5.3µs    p(99.9)=1.39ms  
     http_req_connecting............: avg=10.52µs  min=0s      med=0s      max=59.35ms  p(90)=0s       p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=104.72ms min=1.79ms  med=92.38ms max=1.7s     p(90)=193.47ms p(95)=221.18ms p(99.9)=913.09ms
       { expected_response:true }...: avg=104.72ms min=1.79ms  med=92.38ms max=1.7s     p(90)=193.47ms p(95)=221.18ms p(99.9)=913.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135795
     http_req_receiving.............: avg=1.83ms   min=53.18µs med=112µs   max=1.43s    p(90)=1.93ms   p(95)=4.93ms   p(99.9)=215.31ms
     http_req_sending...............: avg=61.27µs  min=4.91µs  med=9.7µs   max=196.77ms p(90)=19.02µs  p(95)=100.88µs p(99.9)=7.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.83ms min=1.72ms  med=91ms    max=1.7s     p(90)=191.43ms p(95)=218.02ms p(99.9)=873.6ms 
     http_reqs......................: 135795  2184.403236/s
     iteration_duration.............: avg=105.85ms min=3.34ms  med=93.85ms max=1.7s     p(90)=194.14ms p(95)=222.07ms p(99.9)=914.26ms
     iterations.....................: 134795  2168.3172/s
     success_rate...................: 100.00% ✓ 134795      ✗ 0     
     vus............................: 64      min=0         max=496 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 215160      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=12.29µs  min=952ns   med=2.37µs   max=41.78ms  p(90)=4.16µs   p(95)=5.15µs   p(99.9)=460.1µs 
     http_req_connecting............: avg=9.03µs   min=0s      med=0s       max=41.63ms  p(90)=0s       p(95)=0s       p(99.9)=423.57µs
     http_req_duration..............: avg=196.2ms  min=2.05ms  med=196.86ms max=521.47ms p(90)=362.99ms p(95)=389.15ms p(99.9)=463.18ms
       { expected_response:true }...: avg=196.2ms  min=2.05ms  med=196.86ms max=521.47ms p(90)=362.99ms p(95)=389.15ms p(99.9)=463.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72720
     http_req_receiving.............: avg=79.67µs  min=28.97µs med=64.34µs  max=206.67ms p(90)=104.64µs p(95)=118.95µs p(99.9)=926.11µs
     http_req_sending...............: avg=34.65µs  min=4.84µs  med=11.04µs  max=156.53ms p(90)=18.81µs  p(95)=22.37µs  p(99.9)=3.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.09ms min=1.95ms  med=196.76ms max=521.4ms  p(90)=362.89ms p(95)=389.04ms p(99.9)=463.04ms
     http_reqs......................: 72720   1162.377554/s
     iteration_duration.............: avg=199.2ms  min=5.64ms  med=200.28ms max=521.72ms p(90)=363.8ms  p(95)=389.88ms p(99.9)=463.84ms
     iterations.....................: 71720   1146.393264/s
     success_rate...................: 100.00% ✓ 71720       ✗ 0    
     vus............................: 82      min=0         max=495
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 99249      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   633 kB/s
     http_req_blocked...............: avg=6.81µs   min=1.01µs  med=2.71µs   max=2.4ms    p(90)=4.42µs   p(95)=5.38µs   p(99.9)=700.55µs
     http_req_connecting............: avg=3.13µs   min=0s      med=0s       max=2.37ms   p(90)=0s       p(95)=0s       p(99.9)=649.47µs
     http_req_duration..............: avg=420.98ms min=3.79ms  med=390.49ms max=1.68s    p(90)=827.39ms p(95)=905.7ms  p(99.9)=1.29s   
       { expected_response:true }...: avg=420.98ms min=3.79ms  med=390.49ms max=1.68s    p(90)=827.39ms p(95)=905.7ms  p(99.9)=1.29s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34083
     http_req_receiving.............: avg=86.02µs  min=29.19µs med=71.37µs  max=109.06ms p(90)=110.39µs p(95)=124.84µs p(99.9)=805.76µs
     http_req_sending...............: avg=36.5µs   min=5.25µs  med=13.33µs  max=134.34ms p(90)=20.75µs  p(95)=23.62µs  p(99.9)=2.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=420.86ms min=3.66ms  med=390.33ms max=1.68s    p(90)=827.3ms  p(95)=905.6ms  p(99.9)=1.29s   
     http_reqs......................: 34083   526.855495/s
     iteration_duration.............: avg=433.97ms min=25.12ms med=404.47ms max=1.68s    p(90)=832.28ms p(95)=908.64ms p(99.9)=1.3s    
     iterations.....................: 33083   511.397481/s
     success_rate...................: 100.00% ✓ 33083      ✗ 0    
     vus............................: 89      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 45585      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   285 kB/s
     http_req_blocked...............: avg=11.85µs  min=1.19µs  med=3.29µs   max=16.34ms p(90)=5.1µs    p(95)=6.5µs    p(99.9)=1.17ms  
     http_req_connecting............: avg=6.88µs   min=0s      med=0s       max=16.28ms p(90)=0s       p(95)=0s       p(99.9)=1.13ms  
     http_req_duration..............: avg=899.13ms min=6.45ms  med=821.88ms max=5.11s   p(90)=1.79s    p(95)=2.02s    p(99.9)=4.32s   
       { expected_response:true }...: avg=899.13ms min=6.45ms  med=821.88ms max=5.11s   p(90)=1.79s    p(95)=2.02s    p(99.9)=4.32s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16195
     http_req_receiving.............: avg=96.09µs  min=31.51µs med=88.43µs  max=8.93ms  p(90)=128.01µs p(95)=144.52µs p(99.9)=868.39µs
     http_req_sending...............: avg=25.31µs  min=5.66µs  med=17.05µs  max=10.16ms p(90)=22.91µs  p(95)=27.58µs  p(99.9)=1.91ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=899.01ms min=6.32ms  med=821.8ms  max=5.11s   p(90)=1.79s    p(95)=2.02s    p(99.9)=4.32s   
     http_reqs......................: 16195   237.126689/s
     iteration_duration.............: avg=958.25ms min=35.86ms med=900.8ms  max=5.12s   p(90)=1.83s    p(95)=2.03s    p(99.9)=4.37s   
     iterations.....................: 15195   222.48472/s
     success_rate...................: 100.00% ✓ 15195      ✗ 0    
     vus............................: 68      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 44301      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   274 kB/s
     http_req_blocked...............: avg=15.05µs  min=1.44µs  med=3.78µs   max=4.02ms  p(90)=5.62µs   p(95)=7.42µs   p(99.9)=2.14ms
     http_req_connecting............: avg=9.33µs   min=0s      med=0s       max=3.97ms  p(90)=0s       p(95)=0s       p(99.9)=2.11ms
     http_req_duration..............: avg=922.33ms min=8.01ms  med=853.89ms max=3.25s   p(90)=1.87s    p(95)=2.01s    p(99.9)=2.89s 
       { expected_response:true }...: avg=922.33ms min=8.01ms  med=853.89ms max=3.25s   p(90)=1.87s    p(95)=2.01s    p(99.9)=2.89s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15767
     http_req_receiving.............: avg=106.03µs min=38.46µs med=94.58µs  max=69.45ms p(90)=133.85µs p(95)=149.28µs p(99.9)=1.26ms
     http_req_sending...............: avg=42.22µs  min=6.68µs  med=18.86µs  max=69.61ms p(90)=24.89µs  p(95)=30.46µs  p(99.9)=3.76ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=922.18ms min=7.92ms  med=853.71ms max=3.25s   p(90)=1.87s    p(95)=2.01s    p(99.9)=2.89s 
     http_reqs......................: 15767   228.360377/s
     iteration_duration.............: avg=984.73ms min=12.92ms med=926.75ms max=3.25s   p(90)=1.89s    p(95)=2.02s    p(99.9)=2.92s 
     iterations.....................: 14767   213.876938/s
     success_rate...................: 100.00% ✓ 14767      ✗ 0    
     vus............................: 58      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

