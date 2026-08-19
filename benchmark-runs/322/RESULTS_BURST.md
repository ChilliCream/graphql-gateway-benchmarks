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
| hive-router | v0.0.84 | 2,727 | 2,882 | 2,711 | 2.4% |  |
| fusion-nightly | 16.6.2-p.1 | 2,456 | 2,567 | 2,439 | 1.8% |  |
| fusion | 16.6.1 | 2,420 | 2,527 | 2,399 | 1.7% |  |
| fusion-nightly-fed | 16.6.2-p.1 | 2,361 | 2,447 | 2,346 | 1.4% |  |
| cosmo | 0.334.0 | 1,223 | 1,261 | 1,212 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 567 | 584 | 565 | 1.1% |  |
| hive-gateway | 2.10.8 | 258 | 264 | 254 | 1.1% |  |
| apollo-gateway | 2.14.3 | 237 | 243 | 236 | 0.9% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (6382 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-net11 | — | — | — | — | — | benchmark run failed |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (544239 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.2-p.1 | 2,505 | 2,606 | 2,498 | 1.5% |  |
| hive-router | v0.0.84 | 2,404 | 2,538 | 2,383 | 2.3% |  |
| fusion | 16.6.1 | 2,397 | 2,497 | 2,389 | 1.6% |  |
| fusion-nightly | 16.6.2-p.1 | 2,285 | 2,384 | 2,271 | 1.7% |  |
| fusion-nightly-fed | 16.6.2-p.1 | 2,142 | 2,241 | 2,126 | 1.8% |  |
| cosmo | 0.334.0 | 1,164 | 1,204 | 1,159 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 537 | 547 | 532 | 0.9% |  |
| hive-gateway | 2.10.8 | 240 | 245 | 237 | 1.1% |  |
| apollo-gateway | 2.14.3 | 236 | 239 | 235 | 0.5% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (17942 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (300571 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 501540      ✗ 0     
     data_received..................: 15 GB   239 MB/s
     data_sent......................: 202 MB  3.3 MB/s
     http_req_blocked...............: avg=14.65µs  min=871ns   med=2.1µs   max=63.96ms  p(90)=3.6µs    p(95)=4.76µs   p(99.9)=964.07µs
     http_req_connecting............: avg=11.78µs  min=0s      med=0s      max=63.89ms  p(90)=0s       p(95)=0s       p(99.9)=884.23µs
     http_req_duration..............: avg=84.52ms  min=1.4ms   med=80.15ms max=279.07ms p(90)=161.33ms p(95)=174.57ms p(99.9)=229.54ms
       { expected_response:true }...: avg=84.52ms  min=1.4ms   med=80.15ms max=279.07ms p(90)=161.33ms p(95)=174.57ms p(99.9)=229.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 168180
     http_req_receiving.............: avg=133.39µs min=25.28µs med=50.25µs max=98.43ms  p(90)=120.23µs p(95)=311.73µs p(99.9)=15.18ms 
     http_req_sending...............: avg=63.68µs  min=4.48µs  med=8.84µs  max=158.25ms p(90)=16.98µs  p(95)=109.31µs p(99.9)=8.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.32ms  min=1.35ms  med=79.97ms max=279.01ms p(90)=161.11ms p(95)=174.27ms p(99.9)=227.69ms
     http_reqs......................: 168180  2727.709006/s
     iteration_duration.............: avg=85.27ms  min=2.35ms  med=80.92ms max=303.42ms p(90)=161.75ms p(95)=174.95ms p(99.9)=231.32ms
     iterations.....................: 167180  2711.490021/s
     success_rate...................: 100.00% ✓ 167180      ✗ 0     
     vus............................: 86      min=0         max=495 
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

     checks.........................: 100.00% ✓ 456237      ✗ 0     
     data_received..................: 13 GB   215 MB/s
     data_sent......................: 184 MB  3.0 MB/s
     http_req_blocked...............: avg=19.19µs min=982ns   med=2.55µs   max=66.63ms  p(90)=4.03µs   p(95)=5.04µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=15.53µs min=0s      med=0s       max=66.56ms  p(90)=0s       p(95)=0s       p(99.9)=1.56ms  
     http_req_duration..............: avg=92.94ms min=1.93ms  med=82.23ms  max=1.76s    p(90)=176.27ms p(95)=204.87ms p(99.9)=681.04ms
       { expected_response:true }...: avg=92.94ms min=1.93ms  med=82.23ms  max=1.76s    p(90)=176.27ms p(95)=204.87ms p(99.9)=681.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153079
     http_req_receiving.............: avg=1.25ms  min=51.95µs med=102.79µs max=770.69ms p(90)=1.52ms   p(95)=4.15ms   p(99.9)=84.82ms 
     http_req_sending...............: avg=68.89µs min=4.56µs  med=9.64µs   max=93.33ms  p(90)=17.52µs  p(95)=116.7µs  p(99.9)=9.56ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.61ms min=1.85ms  med=81.16ms  max=1.76s    p(90)=174.34ms p(95)=201.93ms p(99.9)=677.02ms
     http_reqs......................: 153079  2456.992408/s
     iteration_duration.............: avg=93.8ms  min=3.45ms  med=83.15ms  max=1.76s    p(90)=176.82ms p(95)=205.59ms p(99.9)=681.63ms
     iterations.....................: 152079  2440.941922/s
     success_rate...................: 100.00% ✓ 152079      ✗ 0     
     vus............................: 71      min=0         max=495 
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

     checks.........................: 100.00% ✓ 449379      ✗ 0     
     data_received..................: 13 GB   212 MB/s
     data_sent......................: 181 MB  2.9 MB/s
     http_req_blocked...............: avg=19.83µs min=1.07µs  med=2.62µs   max=98.51ms  p(90)=4.15µs   p(95)=5.22µs   p(99.9)=1.97ms  
     http_req_connecting............: avg=16.3µs  min=0s      med=0s       max=98.31ms  p(90)=0s       p(95)=0s       p(99.9)=1.91ms  
     http_req_duration..............: avg=94.31ms min=1.95ms  med=82.16ms  max=1.47s    p(90)=177.7ms  p(95)=207.64ms p(99.9)=791.14ms
       { expected_response:true }...: avg=94.31ms min=1.95ms  med=82.16ms  max=1.47s    p(90)=177.7ms  p(95)=207.64ms p(99.9)=791.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150793
     http_req_receiving.............: avg=1.72ms  min=52.05µs med=104.15µs max=1.21s    p(90)=1.87ms   p(95)=5.07ms   p(99.9)=168.96ms
     http_req_sending...............: avg=67.63µs min=4.64µs  med=9.55µs   max=150.62ms p(90)=17.49µs  p(95)=112.46µs p(99.9)=9.33ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.51ms min=1.88ms  med=80.88ms  max=1.47s    p(90)=175.45ms p(95)=203.66ms p(99.9)=751.89ms
     http_reqs......................: 150793  2420.248723/s
     iteration_duration.............: avg=95.22ms min=3.45ms  med=83.16ms  max=1.47s    p(90)=178.37ms p(95)=208.42ms p(99.9)=798.98ms
     iterations.....................: 149793  2404.198583/s
     success_rate...................: 100.00% ✓ 149793      ✗ 0     
     vus............................: 70      min=0         max=494 
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

     checks.........................: 100.00% ✓ 436398      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=21.3µs  min=932ns  med=2.69µs   max=70.05ms  p(90)=4.32µs   p(95)=5.48µs   p(99.9)=2.15ms  
     http_req_connecting............: avg=17.47µs min=0s     med=0s       max=69.86ms  p(90)=0s       p(95)=0s       p(99.9)=2.06ms  
     http_req_duration..............: avg=97.18ms min=1.65ms med=82.74ms  max=1.49s    p(90)=184.05ms p(95)=219.47ms p(99.9)=899.76ms
       { expected_response:true }...: avg=97.18ms min=1.65ms med=82.74ms  max=1.49s    p(90)=184.05ms p(95)=219.47ms p(99.9)=899.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146466
     http_req_receiving.............: avg=1.46ms  min=52.5µs med=101.37µs max=965.37ms p(90)=1.51ms   p(95)=4.13ms   p(99.9)=113.59ms
     http_req_sending...............: avg=68.97µs min=4.9µs  med=10.15µs  max=56.79ms  p(90)=19.08µs  p(95)=112.68µs p(99.9)=10.58ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.65ms min=1.57ms med=81.56ms  max=1.49s    p(90)=181.92ms p(95)=216.21ms p(99.9)=849.02ms
     http_reqs......................: 146466  2361.338132/s
     iteration_duration.............: avg=98.13ms min=2.62ms med=83.8ms   max=1.49s    p(90)=184.76ms p(95)=220.38ms p(99.9)=900.03ms
     iterations.....................: 145466  2345.216041/s
     success_rate...................: 100.00% ✓ 145466      ✗ 0     
     vus............................: 57      min=0         max=498 
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

     checks.........................: 100.00% ✓ 226566      ✗ 0    
     data_received..................: 6.7 GB  107 MB/s
     data_sent......................: 92 MB   1.5 MB/s
     http_req_blocked...............: avg=5.78µs   min=982ns   med=2.69µs   max=12.45ms  p(90)=4.41µs   p(95)=5.37µs   p(99.9)=414.6µs 
     http_req_connecting............: avg=2.44µs   min=0s      med=0s       max=12.37ms  p(90)=0s       p(95)=0s       p(99.9)=362.29µs
     http_req_duration..............: avg=186.45ms min=1.94ms  med=187.82ms max=579.63ms p(90)=346.04ms p(95)=370.37ms p(99.9)=477.98ms
       { expected_response:true }...: avg=186.45ms min=1.94ms  med=187.82ms max=579.63ms p(90)=346.04ms p(95)=370.37ms p(99.9)=477.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 76522
     http_req_receiving.............: avg=76.29µs  min=28.56µs med=62.31µs  max=77.23ms  p(90)=100.34µs p(95)=115.31µs p(99.9)=919.08µs
     http_req_sending...............: avg=35.77µs  min=4.73µs  med=11.13µs  max=179.1ms  p(90)=17.92µs  p(95)=22.02µs  p(99.9)=3.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.34ms min=1.85ms  med=187.71ms max=579.57ms p(90)=345.93ms p(95)=370.27ms p(99.9)=477.9ms 
     http_reqs......................: 76522   1223.885905/s
     iteration_duration.............: avg=189.16ms min=3.44ms  med=190.65ms max=579.84ms p(90)=346.87ms p(95)=371.11ms p(99.9)=478.52ms
     iterations.....................: 75522   1207.891996/s
     success_rate...................: 100.00% ✓ 75522       ✗ 0    
     vus............................: 82      min=0         max=494
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

     checks.........................: 100.00% ✓ 106329     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   681 kB/s
     http_req_blocked...............: avg=7.38µs   min=1.04µs  med=2.4µs    max=3.24ms   p(90)=4.11µs   p(95)=5.02µs   p(99.9)=1.27ms  
     http_req_connecting............: avg=4µs      min=0s      med=0s       max=3.19ms   p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=393.52ms min=3.54ms  med=362.96ms max=1.5s     p(90)=776.16ms p(95)=848.88ms p(99.9)=1.21s   
       { expected_response:true }...: avg=393.52ms min=3.54ms  med=362.96ms max=1.5s     p(90)=776.16ms p(95)=848.88ms p(99.9)=1.21s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36443
     http_req_receiving.............: avg=81.86µs  min=26.23µs med=66.31µs  max=203.47ms p(90)=105.24µs p(95)=119.58µs p(99.9)=801.54µs
     http_req_sending...............: avg=34.35µs  min=5.22µs  med=12.19µs  max=115.06ms p(90)=19.89µs  p(95)=22.61µs  p(99.9)=2.99ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=393.4ms  min=3.45ms  med=362.83ms max=1.5s     p(90)=776.07ms p(95)=848.72ms p(99.9)=1.21s   
     http_reqs......................: 36443   567.301211/s
     iteration_duration.............: avg=404.83ms min=14.94ms med=375.14ms max=1.51s    p(90)=779.87ms p(95)=851.18ms p(99.9)=1.21s   
     iterations.....................: 35443   551.734403/s
     success_rate...................: 100.00% ✓ 35443      ✗ 0    
     vus............................: 67      min=0        max=496
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

     checks.........................: 100.00% ✓ 49011      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   311 kB/s
     http_req_blocked...............: avg=13.6µs   min=1.52µs  med=3.79µs   max=3.58ms  p(90)=5.66µs   p(95)=7.08µs   p(99.9)=1.97ms
     http_req_connecting............: avg=7.96µs   min=0s      med=0s       max=3.54ms  p(90)=0s       p(95)=0s       p(99.9)=1.91ms
     http_req_duration..............: avg=820.16ms min=5.49ms  med=722.68ms max=19.53s  p(90)=1.4s     p(95)=1.55s    p(99.9)=17.37s
       { expected_response:true }...: avg=820.16ms min=5.49ms  med=722.68ms max=19.53s  p(90)=1.4s     p(95)=1.55s    p(99.9)=17.37s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17337
     http_req_receiving.............: avg=105.54µs min=37.11µs med=93.72µs  max=50.16ms p(90)=132.06µs p(95)=147.98µs p(99.9)=1.85ms
     http_req_sending...............: avg=31.38µs  min=6.93µs  med=18.31µs  max=55.99ms p(90)=23.92µs  p(95)=28.15µs  p(99.9)=2.53ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=820.03ms min=5.37ms  med=722.51ms max=19.53s  p(90)=1.4s     p(95)=1.55s    p(99.9)=17.37s
     http_reqs......................: 17337   258.499142/s
     iteration_duration.............: avg=870.47ms min=44.2ms  med=788.24ms max=19.53s  p(90)=1.43s    p(95)=1.56s    p(99.9)=17.48s
     iterations.....................: 16337   243.588884/s
     success_rate...................: 100.00% ✓ 16337      ✗ 0    
     vus............................: 59      min=0        max=499
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

     checks.........................: 100.00% ✓ 48945      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   290 kB/s
     http_req_blocked...............: avg=13.32µs  min=1.19µs  med=3.22µs   max=3.78ms  p(90)=4.91µs   p(95)=6.29µs   p(99.9)=2.08ms  
     http_req_connecting............: avg=8.5µs    min=0s      med=0s       max=3.64ms  p(90)=0s       p(95)=0s       p(99.9)=2.04ms  
     http_req_duration..............: avg=435.74ms min=7.36ms  med=503.53ms max=1.22s   p(90)=745.55ms p(95)=797.04ms p(99.9)=1.09s   
       { expected_response:true }...: avg=435.74ms min=7.36ms  med=503.53ms max=1.22s   p(90)=745.55ms p(95)=797.04ms p(99.9)=1.09s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 17315
     http_req_receiving.............: avg=94.45µs  min=30.7µs  med=84.96µs  max=43.09ms p(90)=122.93µs p(95)=135.47µs p(99.9)=789.36µs
     http_req_sending...............: avg=41.66µs  min=5.75µs  med=17.12µs  max=94.64ms p(90)=22.44µs  p(95)=27.07µs  p(99.9)=2.81ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=435.6ms  min=7.28ms  med=503.12ms max=1.22s   p(90)=745.43ms p(95)=796.95ms p(99.9)=1.09s   
     http_reqs......................: 17315   237.222309/s
     iteration_duration.............: avg=462.45ms min=13.33ms med=527.52ms max=1.22s   p(90)=753.28ms p(95)=801.86ms p(99.9)=1.1s    
     iterations.....................: 16315   223.521915/s
     success_rate...................: 100.00% ✓ 16315      ✗ 0    
     vus............................: 48      min=0        max=498
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

     checks.........................: 100.00% ✓ 461382      ✗ 0     
     data_received..................: 14 GB   220 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=22.06µs  min=1.05µs  med=2.73µs   max=81.21ms  p(90)=4.43µs   p(95)=5.64µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=18.41µs  min=0s      med=0s       max=81.16ms  p(90)=0s       p(95)=0s       p(99.9)=1.37ms  
     http_req_duration..............: avg=91.85ms  min=1.47ms  med=87.12ms  max=354.14ms p(90)=175.54ms p(95)=193.38ms p(99.9)=259.8ms 
       { expected_response:true }...: avg=91.85ms  min=1.47ms  med=87.12ms  max=354.14ms p(90)=175.54ms p(95)=193.38ms p(99.9)=259.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 154794
     http_req_receiving.............: avg=645.46µs min=53.73µs med=106.67µs max=130.69ms p(90)=1.2ms    p(95)=2.22ms   p(99.9)=29.1ms  
     http_req_sending...............: avg=74.12µs  min=4.56µs  med=10.27µs  max=130.62ms p(90)=20.64µs  p(95)=125.49µs p(99.9)=10.04ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.13ms  min=1.37ms  med=86.37ms  max=352.15ms p(90)=174.67ms p(95)=192.53ms p(99.9)=258.2ms 
     http_reqs......................: 154794  2505.658798/s
     iteration_duration.............: avg=92.71ms  min=3.39ms  med=88.14ms  max=354.36ms p(90)=176.06ms p(95)=193.9ms  p(99.9)=260.99ms
     iterations.....................: 153794  2489.471745/s
     success_rate...................: 100.00% ✓ 153794      ✗ 0     
     vus............................: 91      min=0         max=500 
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

     checks.........................: 100.00% ✓ 443121      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=17.83µs  min=881ns   med=2.65µs  max=67.83ms  p(90)=4.71µs   p(95)=5.95µs   p(99.9)=2.19ms  
     http_req_connecting............: avg=14.22µs  min=0s      med=0s      max=67.57ms  p(90)=0s       p(95)=0s       p(99.9)=2.09ms  
     http_req_duration..............: avg=95.63ms  min=1.45ms  med=91.23ms max=348.85ms p(90)=186.06ms p(95)=200.79ms p(99.9)=249.83ms
       { expected_response:true }...: avg=95.63ms  min=1.45ms  med=91.23ms max=348.85ms p(90)=186.06ms p(95)=200.79ms p(99.9)=249.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148707
     http_req_receiving.............: avg=121.97µs min=25.72µs med=55.58µs max=47.18ms  p(90)=137.44µs p(95)=343.69µs p(99.9)=9.4ms   
     http_req_sending...............: avg=70.68µs  min=4.68µs  med=11.1µs  max=229.96ms p(90)=22.41µs  p(95)=122.45µs p(99.9)=8.57ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.44ms  min=1.39ms  med=91.02ms max=348.44ms p(90)=185.82ms p(95)=200.56ms p(99.9)=249.24ms
     http_reqs......................: 148707  2404.791386/s
     iteration_duration.............: avg=96.53ms  min=3.41ms  med=92.24ms max=357.02ms p(90)=186.44ms p(95)=201.2ms  p(99.9)=250.93ms
     iterations.....................: 147707  2388.620046/s
     success_rate...................: 100.00% ✓ 147707      ✗ 0     
     vus............................: 96      min=0         max=500 
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

     checks.........................: 100.00% ✓ 442221      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=18.93µs min=862ns   med=2.25µs   max=88.6ms   p(90)=3.97µs   p(95)=5.17µs   p(99.9)=1.48ms  
     http_req_connecting............: avg=15.97µs min=0s      med=0s       max=88.5ms   p(90)=0s       p(95)=0s       p(99.9)=1.42ms  
     http_req_duration..............: avg=95.86ms min=1.54ms  med=81.92ms  max=1.42s    p(90)=181.73ms p(95)=215.17ms p(99.9)=864.89ms
       { expected_response:true }...: avg=95.86ms min=1.54ms  med=81.92ms  max=1.42s    p(90)=181.73ms p(95)=215.17ms p(99.9)=864.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148407
     http_req_receiving.............: avg=1.69ms  min=52.48µs med=103.83µs max=817.65ms p(90)=1.79ms   p(95)=5.25ms   p(99.9)=105.06ms
     http_req_sending...............: avg=64.93µs min=4.58µs  med=9.24µs   max=136.24ms p(90)=19.02µs  p(95)=101.95µs p(99.9)=8.67ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.1ms  min=1.45ms  med=80.66ms  max=1.42s    p(90)=179.23ms p(95)=210.58ms p(99.9)=854.18ms
     http_reqs......................: 148407  2397.134081/s
     iteration_duration.............: avg=96.78ms min=2.82ms  med=82.92ms  max=1.42s    p(90)=182.3ms  p(95)=215.99ms p(99.9)=868.07ms
     iterations.....................: 147407  2380.981648/s
     success_rate...................: 100.00% ✓ 147407      ✗ 0     
     vus............................: 53      min=0         max=499 
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

     checks.........................: 100.00% ✓ 421407      ✗ 0     
     data_received..................: 12 GB   200 MB/s
     data_sent......................: 170 MB  2.7 MB/s
     http_req_blocked...............: avg=14.69µs  min=922ns   med=2.29µs   max=69.95ms  p(90)=3.88µs   p(95)=5.01µs   p(99.9)=1.18ms  
     http_req_connecting............: avg=11.44µs  min=0s      med=0s       max=69.91ms  p(90)=0s       p(95)=0s       p(99.9)=1.11ms  
     http_req_duration..............: avg=100.56ms min=1.47ms  med=82.85ms  max=1.11s    p(90)=194.18ms p(95)=223.07ms p(99.9)=757.02ms
       { expected_response:true }...: avg=100.56ms min=1.47ms  med=82.85ms  max=1.11s    p(90)=194.18ms p(95)=223.07ms p(99.9)=757.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141469
     http_req_receiving.............: avg=1.66ms   min=53.47µs med=110.12µs max=881.93ms p(90)=1.8ms    p(95)=4.45ms   p(99.9)=153.87ms
     http_req_sending...............: avg=58.11µs  min=4.9µs   med=9.52µs   max=95.25ms  p(90)=18.71µs  p(95)=99.69µs  p(99.9)=7.55ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.83ms  min=1.4ms   med=81.63ms  max=1.11s    p(90)=192.13ms p(95)=220.07ms p(99.9)=687.12ms
     http_reqs......................: 141469  2285.137335/s
     iteration_duration.............: avg=101.58ms min=2.73ms  med=84.01ms  max=1.13s    p(90)=194.82ms p(95)=223.74ms p(99.9)=757.85ms
     iterations.....................: 140469  2268.984415/s
     success_rate...................: 100.00% ✓ 140469      ✗ 0     
     vus............................: 52      min=0         max=499 
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

     checks.........................: 100.00% ✓ 397164      ✗ 0     
     data_received..................: 12 GB   188 MB/s
     data_sent......................: 160 MB  2.6 MB/s
     http_req_blocked...............: avg=19.59µs  min=1.1µs   med=3.09µs   max=67.35ms  p(90)=4.98µs   p(95)=6.23µs   p(99.9)=2.16ms  
     http_req_connecting............: avg=15.7µs   min=0s      med=0s       max=67.14ms  p(90)=0s       p(95)=0s       p(99.9)=2.12ms  
     http_req_duration..............: avg=106.74ms min=1.7ms   med=92.49ms  max=1.25s    p(90)=201.4ms  p(95)=235.44ms p(99.9)=735.2ms 
       { expected_response:true }...: avg=106.74ms min=1.7ms   med=92.49ms  max=1.25s    p(90)=201.4ms  p(95)=235.44ms p(99.9)=735.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 133388
     http_req_receiving.............: avg=1.68ms   min=54.63µs med=115.92µs max=603.37ms p(90)=1.77ms   p(95)=4.77ms   p(99.9)=105.22ms
     http_req_sending...............: avg=71.39µs  min=4.8µs   med=11.18µs  max=117.45ms p(90)=21.87µs  p(95)=124.88µs p(99.9)=9.82ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.98ms min=1.63ms  med=91.37ms  max=1.25s    p(90)=198.74ms p(95)=230.56ms p(99.9)=675.99ms
     http_reqs......................: 133388  2142.655102/s
     iteration_duration.............: avg=107.81ms min=3.44ms  med=93.72ms  max=1.25s    p(90)=202.09ms p(95)=236.3ms  p(99.9)=737.6ms 
     iterations.....................: 132388  2126.591774/s
     success_rate...................: 100.00% ✓ 132388      ✗ 0     
     vus............................: 71      min=0         max=495 
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

     checks.........................: 100.00% ✓ 215445      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=6.18µs   min=1.02µs  med=2.92µs   max=8.84ms   p(90)=4.75µs   p(95)=5.81µs   p(99.9)=516.38µs
     http_req_connecting............: avg=2.52µs   min=0s      med=0s       max=8.63ms   p(90)=0s       p(95)=0s       p(99.9)=451.76µs
     http_req_duration..............: avg=195.95ms min=2ms     med=196.51ms max=511.26ms p(90)=363.82ms p(95)=389.02ms p(99.9)=461.75ms
       { expected_response:true }...: avg=195.95ms min=2ms     med=196.51ms max=511.26ms p(90)=363.82ms p(95)=389.02ms p(99.9)=461.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72815
     http_req_receiving.............: avg=85.79µs  min=27.25µs med=65.73µs  max=237.26ms p(90)=107.32µs p(95)=123.33µs p(99.9)=1.22ms  
     http_req_sending...............: avg=36.85µs  min=5.25µs  med=12.75µs  max=178.99ms p(90)=20.73µs  p(95)=24.78µs  p(99.9)=3.71ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.82ms min=1.91ms  med=196.39ms max=511.12ms p(90)=363.73ms p(95)=388.87ms p(99.9)=461.57ms
     http_reqs......................: 72815   1164.118488/s
     iteration_duration.............: avg=198.92ms min=4.99ms  med=199.74ms max=511.51ms p(90)=364.8ms  p(95)=389.67ms p(99.9)=462ms   
     iterations.....................: 71815   1148.131144/s
     success_rate...................: 100.00% ✓ 71815       ✗ 0    
     vus............................: 82      min=0         max=496
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

     checks.........................: 100.00% ✓ 101313     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 42 MB   645 kB/s
     http_req_blocked...............: avg=9.61µs   min=1.09µs  med=3.28µs   max=12.5ms   p(90)=5.09µs   p(95)=6.2µs    p(99.9)=1.53ms
     http_req_connecting............: avg=5.22µs   min=0s      med=0s       max=12.44ms  p(90)=0s       p(95)=0s       p(99.9)=1.48ms
     http_req_duration..............: avg=412.58ms min=3.87ms  med=385.14ms max=1.71s    p(90)=811.12ms p(95)=886.09ms p(99.9)=1.29s 
       { expected_response:true }...: avg=412.58ms min=3.87ms  med=385.14ms max=1.71s    p(90)=811.12ms p(95)=886.09ms p(99.9)=1.29s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34771
     http_req_receiving.............: avg=92.64µs  min=30.89µs med=76.59µs  max=102.95ms p(90)=116.72µs p(95)=131.64µs p(99.9)=1.37ms
     http_req_sending...............: avg=31.24µs  min=5.32µs  med=15.17µs  max=100.29ms p(90)=22.52µs  p(95)=25.84µs  p(99.9)=3.07ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=412.46ms min=3.79ms  med=385.05ms max=1.71s    p(90)=811.02ms p(95)=885.92ms p(99.9)=1.29s 
     http_reqs......................: 34771   537.287784/s
     iteration_duration.............: avg=425.02ms min=11.47ms med=401.22ms max=1.71s    p(90)=815.39ms p(95)=890.5ms  p(99.9)=1.29s 
     iterations.....................: 33771   521.835603/s
     success_rate...................: 100.00% ✓ 33771      ✗ 0    
     vus............................: 91      min=0        max=500
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

     checks.........................: 100.00% ✓ 45999      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   289 kB/s
     http_req_blocked...............: avg=12.99µs  min=1.3µs   med=3.75µs   max=7.95ms  p(90)=5.58µs   p(95)=7.19µs   p(99.9)=1.63ms 
     http_req_connecting............: avg=7.38µs   min=0s      med=0s       max=7.89ms  p(90)=0s       p(95)=0s       p(99.9)=1.6ms  
     http_req_duration..............: avg=891.18ms min=5.81ms  med=793.57ms max=4.55s   p(90)=1.76s    p(95)=1.98s    p(99.9)=4.08s  
       { expected_response:true }...: avg=891.18ms min=5.81ms  med=793.57ms max=4.55s   p(90)=1.76s    p(95)=1.98s    p(99.9)=4.08s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16333
     http_req_receiving.............: avg=100.69µs min=34.94µs med=92.59µs  max=29.2ms  p(90)=129.24µs p(95)=144.24µs p(99.9)=962.7µs
     http_req_sending...............: avg=29.14µs  min=6.7µs   med=18.64µs  max=10.99ms p(90)=24.52µs  p(95)=29.28µs  p(99.9)=3.01ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=891.05ms min=5.72ms  med=793.47ms max=4.55s   p(90)=1.76s    p(95)=1.98s    p(99.9)=4.08s  
     http_reqs......................: 16333   240.76299/s
     iteration_duration.............: avg=949.29ms min=42.04ms med=880.69ms max=4.56s   p(90)=1.78s    p(95)=2.01s    p(99.9)=4.14s  
     iterations.....................: 15333   226.022098/s
     success_rate...................: 100.00% ✓ 15333      ✗ 0    
     vus............................: 100     min=0        max=500
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

     checks.........................: 100.00% ✓ 45771      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   284 kB/s
     http_req_blocked...............: avg=16.4µs   min=1.16µs  med=3.83µs   max=12.71ms p(90)=5.61µs   p(95)=7.17µs  p(99.9)=2.23ms
     http_req_connecting............: avg=10.75µs  min=0s      med=0s       max=12.66ms p(90)=0s       p(95)=0s      p(99.9)=2.21ms
     http_req_duration..............: avg=893.25ms min=7.76ms  med=810ms    max=3.11s   p(90)=1.83s    p(95)=1.94s   p(99.9)=2.67s 
       { expected_response:true }...: avg=893.25ms min=7.76ms  med=810ms    max=3.11s   p(90)=1.83s    p(95)=1.94s   p(99.9)=2.67s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16257
     http_req_receiving.............: avg=102.92µs min=37.36µs med=90.93µs  max=69.01ms p(90)=131.83µs p(95)=149.9µs p(99.9)=1.11ms
     http_req_sending...............: avg=26.72µs  min=6.04µs  med=18.67µs  max=24.52ms p(90)=24.94µs  p(95)=29.5µs  p(99.9)=1.28ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=893.12ms min=7.64ms  med=809.89ms max=3.11s   p(90)=1.83s    p(95)=1.94s   p(99.9)=2.67s 
     http_reqs......................: 16257   236.373079/s
     iteration_duration.............: avg=951.78ms min=49.59ms med=889.99ms max=3.12s   p(90)=1.84s    p(95)=1.96s   p(99.9)=2.7s  
     iterations.....................: 15257   221.833307/s
     success_rate...................: 100.00% ✓ 15257      ✗ 0    
     vus............................: 95      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

