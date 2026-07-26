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
| hive-router | v0.0.83 | 2,899 | 3,052 | 2,870 | 2.3% |  |
| fusion-nightly-net11 | 16.6.0-p.3 | 2,630 | 2,723 | 2,617 | 1.3% |  |
| fusion-nightly | 16.6.0-p.3 | 2,482 | 2,609 | 2,455 | 2.3% |  |
| fusion | 16.5.1 | 2,372 | 2,459 | 2,354 | 1.5% |  |
| cosmo | 0.331.1 | 1,190 | 1,238 | 1,186 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.4 | 575 | 587 | 571 | 0.9% |  |
| hive-gateway | 2.10.4 | 252 | 255 | 248 | 1.0% |  |
| apollo-gateway | 2.14.2 | 229 | 235 | 226 | 1.1% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (17641 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (482863 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.0-p.3 | 2,460 | 2,548 | 2,445 | 1.5% |  |
| fusion-nightly | 16.6.0-p.3 | 2,320 | 2,416 | 2,317 | 1.6% |  |
| hive-router | v0.0.83 | 2,288 | 2,432 | 2,279 | 2.3% |  |
| fusion | 16.5.1 | 2,261 | 2,354 | 2,251 | 1.6% |  |
| fusion-nightly-fed | 16.6.0-p.3 | 2,215 | 2,291 | 2,186 | 1.4% |  |
| cosmo | 0.331.1 | 1,165 | 1,203 | 1,162 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.4 | 523 | 535 | 522 | 0.9% |  |
| hive-gateway | 2.10.4 | 239 | 247 | 236 | 1.4% |  |
| apollo-gateway | 2.14.2 | 237 | 242 | 237 | 0.7% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (18296 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (322512 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 532890      ✗ 0     
     data_received..................: 16 GB   254 MB/s
     data_sent......................: 215 MB  3.5 MB/s
     http_req_blocked...............: avg=23.34µs  min=811ns   med=2.46µs  max=71.36ms  p(90)=4.23µs   p(95)=5.44µs   p(99.9)=2.28ms  
     http_req_connecting............: avg=19.86µs  min=0s      med=0s      max=71.2ms   p(90)=0s       p(95)=0s       p(99.9)=2.14ms  
     http_req_duration..............: avg=79.53ms  min=1.35ms  med=72.15ms max=318.26ms p(90)=155.67ms p(95)=171.81ms p(99.9)=230.17ms
       { expected_response:true }...: avg=79.53ms  min=1.35ms  med=72.15ms max=318.26ms p(90)=155.67ms p(95)=171.81ms p(99.9)=230.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178630
     http_req_receiving.............: avg=186.83µs min=24.98µs med=51.33µs max=185.49ms p(90)=163.56µs p(95)=351.44µs p(99.9)=25.83ms 
     http_req_sending...............: avg=80.67µs  min=4.38µs  med=9.69µs  max=151.89ms p(90)=18.99µs  p(95)=121.7µs  p(99.9)=11.85ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.26ms  min=1.31ms  med=71.95ms max=306.74ms p(90)=155.27ms p(95)=171.17ms p(99.9)=228.69ms
     http_reqs......................: 178630  2899.387554/s
     iteration_duration.............: avg=80.25ms  min=2.1ms   med=72.93ms max=328.16ms p(90)=156.14ms p(95)=172.28ms p(99.9)=233.23ms
     iterations.....................: 177630  2883.156307/s
     success_rate...................: 100.00% ✓ 177630      ✗ 0     
     vus............................: 84      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 487980      ✗ 0     
     data_received..................: 14 GB   231 MB/s
     data_sent......................: 197 MB  3.2 MB/s
     http_req_blocked...............: avg=23.32µs  min=952ns   med=2.61µs   max=67.89ms  p(90)=4.21µs   p(95)=5.32µs   p(99.9)=2.53ms  
     http_req_connecting............: avg=20.04µs  min=0s      med=0s       max=67.82ms  p(90)=0s       p(95)=0s       p(99.9)=2.5ms   
     http_req_duration..............: avg=86.83ms  min=1.85ms  med=81.7ms   max=311.82ms p(90)=167.35ms p(95)=185.95ms p(99.9)=250.71ms
       { expected_response:true }...: avg=86.83ms  min=1.85ms  med=81.7ms   max=311.82ms p(90)=167.35ms p(95)=185.95ms p(99.9)=250.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 163660
     http_req_receiving.............: avg=710.65µs min=52.31µs med=110.83µs max=197.82ms p(90)=1.49ms   p(95)=2.4ms    p(99.9)=29.08ms 
     http_req_sending...............: avg=75.94µs  min=4.35µs  med=9.74µs   max=182.16ms p(90)=19.72µs  p(95)=121.94µs p(99.9)=10.29ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.04ms  min=1.75ms  med=80.87ms  max=311.21ms p(90)=166.47ms p(95)=185.09ms p(99.9)=249.28ms
     http_reqs......................: 163660  2630.481205/s
     iteration_duration.............: avg=87.64ms  min=4.13ms  med=82.57ms  max=332.95ms p(90)=167.86ms p(95)=186.5ms  p(99.9)=253.36ms
     iterations.....................: 162660  2614.408364/s
     success_rate...................: 100.00% ✓ 162660      ✗ 0     
     vus............................: 66      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 461595      ✗ 0     
     data_received..................: 14 GB   218 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=16.79µs min=861ns   med=1.99µs  max=78.11ms  p(90)=3.23µs   p(95)=4.17µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=14.11µs min=0s      med=0s      max=78.05ms  p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=91.87ms min=2.01ms  med=75.86ms max=1.54s    p(90)=176.49ms p(95)=207.33ms p(99.9)=644.9ms 
       { expected_response:true }...: avg=91.87ms min=2.01ms  med=75.86ms max=1.54s    p(90)=176.49ms p(95)=207.33ms p(99.9)=644.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 154865
     http_req_receiving.............: avg=1.7ms   min=51.48µs med=97.45µs max=626.08ms p(90)=1.84ms   p(95)=4.98ms   p(99.9)=104.54ms
     http_req_sending...............: avg=61.06µs min=4.44µs  med=8.53µs  max=194.64ms p(90)=14.96µs  p(95)=97.71µs  p(99.9)=8.2ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.11ms min=1.89ms  med=74.69ms max=1.54s    p(90)=174.31ms p(95)=203.13ms p(99.9)=628.69ms
     http_reqs......................: 154865  2482.089026/s
     iteration_duration.............: avg=92.71ms min=3.19ms  med=76.73ms max=1.54s    p(90)=177.06ms p(95)=208.03ms p(99.9)=645.15ms
     iterations.....................: 153865  2466.061589/s
     success_rate...................: 100.00% ✓ 153865      ✗ 0     
     vus............................: 76      min=0         max=494 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 440484      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 178 MB  2.8 MB/s
     http_req_blocked...............: avg=13.29µs min=882ns  med=2.03µs   max=53.61ms  p(90)=3.3µs    p(95)=4.29µs   p(99.9)=1.28ms  
     http_req_connecting............: avg=10.67µs min=0s     med=0s       max=53.54ms  p(90)=0s       p(95)=0s       p(99.9)=1.17ms  
     http_req_duration..............: avg=96.27ms min=1.97ms med=84.98ms  max=1.42s    p(90)=181.24ms p(95)=211.92ms p(99.9)=679.79ms
       { expected_response:true }...: avg=96.27ms min=1.97ms med=84.98ms  max=1.42s    p(90)=181.24ms p(95)=211.92ms p(99.9)=679.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147828
     http_req_receiving.............: avg=1.58ms  min=52.5µs med=101.28µs max=591.18ms p(90)=1.82ms   p(95)=4.6ms    p(99.9)=124.41ms
     http_req_sending...............: avg=55.54µs min=4.54µs med=8.74µs   max=130.42ms p(90)=15.36µs  p(95)=93.13µs  p(99.9)=8.22ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.62ms min=1.89ms med=83.92ms  max=1.42s    p(90)=179.27ms p(95)=208.01ms p(99.9)=608.46ms
     http_reqs......................: 147828  2372.316462/s
     iteration_duration.............: avg=97.16ms min=3.42ms med=85.92ms  max=1.42s    p(90)=181.87ms p(95)=212.73ms p(99.9)=682.08ms
     iterations.....................: 146828  2356.268646/s
     success_rate...................: 100.00% ✓ 146828      ✗ 0     
     vus............................: 72      min=0         max=495 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 220137      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=7.39µs   min=1.05µs  med=2.62µs   max=7.95ms   p(90)=4.23µs   p(95)=5.15µs   p(99.9)=559.93µs
     http_req_connecting............: avg=3.97µs   min=0s      med=0s       max=7.9ms    p(90)=0s       p(95)=0s       p(99.9)=424.35µs
     http_req_duration..............: avg=191.85ms min=1.9ms   med=192.96ms max=504.73ms p(90)=355.79ms p(95)=381.3ms  p(99.9)=454.58ms
       { expected_response:true }...: avg=191.85ms min=1.9ms   med=192.96ms max=504.73ms p(90)=355.79ms p(95)=381.3ms  p(99.9)=454.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74379
     http_req_receiving.............: avg=94.63µs  min=28.21µs med=64.28µs  max=212.92ms p(90)=102.07µs p(95)=118.31µs p(99.9)=1.39ms  
     http_req_sending...............: avg=30.61µs  min=5.12µs  med=11.04µs  max=154.15ms p(90)=17.31µs  p(95)=21.21µs  p(99.9)=3.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.73ms min=1.84ms  med=192.82ms max=504.63ms p(90)=355.71ms p(95)=381.21ms p(99.9)=454.49ms
     http_reqs......................: 74379   1190.542099/s
     iteration_duration.............: avg=194.7ms  min=4.11ms  med=195.99ms max=504.93ms p(90)=356.75ms p(95)=381.98ms p(99.9)=454.97ms
     iterations.....................: 73379   1174.535671/s
     success_rate...................: 100.00% ✓ 73379       ✗ 0    
     vus............................: 79      min=0         max=493
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 107985     ✗ 0    
     data_received..................: 3.2 GB  51 MB/s
     data_sent......................: 44 MB   691 kB/s
     http_req_blocked...............: avg=6.37µs   min=1.24µs  med=3.04µs   max=2.1ms    p(90)=4.73µs   p(95)=5.77µs   p(99.9)=456.62µs
     http_req_connecting............: avg=2.36µs   min=0s      med=0s       max=2.04ms   p(90)=0s       p(95)=0s       p(99.9)=402.55µs
     http_req_duration..............: avg=387.72ms min=3.49ms  med=360.02ms max=1.61s    p(90)=762.63ms p(95)=827.08ms p(99.9)=1.27s   
       { expected_response:true }...: avg=387.72ms min=3.49ms  med=360.02ms max=1.61s    p(90)=762.63ms p(95)=827.08ms p(99.9)=1.27s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36995
     http_req_receiving.............: avg=80.03µs  min=29.85µs med=69.52µs  max=21.84ms  p(90)=109.08µs p(95)=123.15µs p(99.9)=855.82µs
     http_req_sending...............: avg=29.84µs  min=5.2µs   med=13.41µs  max=133.18ms p(90)=20.79µs  p(95)=23.88µs  p(99.9)=2.56ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=387.61ms min=3.43ms  med=359.92ms max=1.61s    p(90)=762.39ms p(95)=826.98ms p(99.9)=1.27s   
     http_reqs......................: 36995   575.816127/s
     iteration_duration.............: avg=398.73ms min=18.21ms med=374.05ms max=1.61s    p(90)=766.56ms p(95)=830.8ms  p(99.9)=1.28s   
     iterations.....................: 35995   560.251426/s
     success_rate...................: 100.00% ✓ 35995      ✗ 0    
     vus............................: 66      min=0        max=496
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 47820      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   305 kB/s
     http_req_blocked...............: avg=15.19µs  min=1.42µs  med=3.82µs   max=16.47ms p(90)=5.54µs   p(95)=6.89µs   p(99.9)=2.28ms
     http_req_connecting............: avg=9.5µs    min=0s      med=0s       max=16.4ms  p(90)=0s       p(95)=0s       p(99.9)=2.12ms
     http_req_duration..............: avg=834.98ms min=5.36ms  med=737.91ms max=21.06s  p(90)=1.42s    p(95)=1.56s    p(99.9)=19.33s
       { expected_response:true }...: avg=834.98ms min=5.36ms  med=737.91ms max=21.06s  p(90)=1.42s    p(95)=1.56s    p(99.9)=19.33s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16940
     http_req_receiving.............: avg=97.74µs  min=39.9µs  med=88.57µs  max=8.8ms   p(90)=126.04µs p(95)=140.52µs p(99.9)=1.39ms
     http_req_sending...............: avg=28.15µs  min=6.35µs  med=17.44µs  max=27.09ms p(90)=23.39µs  p(95)=27.68µs  p(99.9)=2.33ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=834.85ms min=5.28ms  med=737.82ms max=21.06s  p(90)=1.42s    p(95)=1.56s    p(99.9)=19.33s
     http_reqs......................: 16940   252.990217/s
     iteration_duration.............: avg=887.41ms min=74.71ms med=800.7ms  max=21.06s  p(90)=1.44s    p(95)=1.57s    p(99.9)=19.33s
     iterations.....................: 15940   238.055729/s
     success_rate...................: 100.00% ✓ 15940      ✗ 0    
     vus............................: 42      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 47406      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   281 kB/s
     http_req_blocked...............: avg=13.45µs  min=1.25µs  med=3.41µs   max=3.37ms  p(90)=5.04µs   p(95)=6.62µs   p(99.9)=2.07ms
     http_req_connecting............: avg=8.36µs   min=0s      med=0s       max=3.33ms  p(90)=0s       p(95)=0s       p(99.9)=2.04ms
     http_req_duration..............: avg=384.1ms  min=7.54ms  med=431.08ms max=1.25s   p(90)=684.23ms p(95)=735.28ms p(99.9)=1.04s 
       { expected_response:true }...: avg=384.1ms  min=7.54ms  med=431.08ms max=1.25s   p(90)=684.23ms p(95)=735.28ms p(99.9)=1.04s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16802
     http_req_receiving.............: avg=93.48µs  min=34.63µs med=83.43µs  max=9.48ms  p(90)=124.04µs p(95)=138.57µs p(99.9)=1.13ms
     http_req_sending...............: avg=30.82µs  min=5.96µs  med=17.04µs  max=24.95ms p(90)=22.72µs  p(95)=27.48µs  p(99.9)=2.75ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=383.98ms min=7.45ms  med=430.99ms max=1.25s   p(90)=684.05ms p(95)=735.2ms  p(99.9)=1.04s 
     http_reqs......................: 16802   229.307515/s
     iteration_duration.............: avg=408.41ms min=11.79ms med=453.88ms max=1.26s   p(90)=690.84ms p(95)=740.63ms p(99.9)=1.05s 
     iterations.....................: 15802   215.659883/s
     success_rate...................: 100.00% ✓ 15802      ✗ 0    
     vus............................: 63      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 453396      ✗ 0     
     data_received..................: 13 GB   216 MB/s
     data_sent......................: 183 MB  3.0 MB/s
     http_req_blocked...............: avg=23.49µs  min=942ns   med=2.98µs   max=65.15ms  p(90)=4.88µs   p(95)=6.1µs    p(99.9)=1.47ms  
     http_req_connecting............: avg=19.09µs  min=0s      med=0s       max=63.02ms  p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=93.45ms  min=1.5ms   med=88.62ms  max=326.35ms p(90)=179.11ms p(95)=197.63ms p(99.9)=265.11ms
       { expected_response:true }...: avg=93.45ms  min=1.5ms   med=88.62ms  max=326.35ms p(90)=179.11ms p(95)=197.63ms p(99.9)=265.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152132
     http_req_receiving.............: avg=750.76µs min=54.65µs med=117.54µs max=83.56ms  p(90)=1.59ms   p(95)=2.59ms   p(99.9)=27.29ms 
     http_req_sending...............: avg=79.38µs  min=5.01µs  med=10.93µs  max=259.27ms p(90)=22.87µs  p(95)=131.23µs p(99.9)=10.32ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.62ms  min=1.41ms  med=87.8ms   max=326.25ms p(90)=178.28ms p(95)=196.67ms p(99.9)=264.16ms
     http_reqs......................: 152132  2460.601086/s
     iteration_duration.............: avg=94.35ms  min=2.99ms  med=89.68ms  max=362.76ms p(90)=179.58ms p(95)=198.16ms p(99.9)=266.55ms
     iterations.....................: 151132  2444.426967/s
     success_rate...................: 100.00% ✓ 151132      ✗ 0     
     vus............................: 94      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 427845      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=20.8µs   min=1.07µs  med=2.85µs  max=70.47ms p(90)=4.52µs   p(95)=5.65µs   p(99.9)=2.14ms  
     http_req_connecting............: avg=16.93µs  min=0s      med=0s      max=70.4ms  p(90)=0s       p(95)=0s       p(99.9)=2.01ms  
     http_req_duration..............: avg=99.07ms  min=1.53ms  med=85.01ms max=1.91s   p(90)=186.96ms p(95)=218.5ms  p(99.9)=785.52ms
       { expected_response:true }...: avg=99.07ms  min=1.53ms  med=85.01ms max=1.91s   p(90)=186.96ms p(95)=218.5ms  p(99.9)=785.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143615
     http_req_receiving.............: avg=2.13ms   min=54.29µs med=111µs   max=1.47s   p(90)=1.82ms   p(95)=4.96ms   p(99.9)=120.38ms
     http_req_sending...............: avg=74.39µs  min=4.97µs  med=10.61µs max=104.4ms p(90)=19.58µs  p(95)=120.66µs p(99.9)=10.53ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.86ms  min=1.41ms  med=83.68ms max=1.85s   p(90)=184.48ms p(95)=214.95ms p(99.9)=711.22ms
     http_reqs......................: 143615  2320.694553/s
     iteration_duration.............: avg=100.03ms min=2.8ms   med=86.02ms max=1.91s   p(90)=187.58ms p(95)=219.31ms p(99.9)=796.66ms
     iterations.....................: 142615  2304.535415/s
     success_rate...................: 100.00% ✓ 142615      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 422658      ✗ 0     
     data_received..................: 12 GB   200 MB/s
     data_sent......................: 170 MB  2.7 MB/s
     http_req_blocked...............: avg=12.1µs   min=912ns   med=2.46µs  max=62.62ms  p(90)=4.35µs   p(95)=5.6µs    p(99.9)=921.19µs
     http_req_connecting............: avg=8.86µs   min=0s      med=0s      max=62.54ms  p(90)=0s       p(95)=0s       p(99.9)=847.25µs
     http_req_duration..............: avg=100.27ms min=1.59ms  med=94.54ms max=333.05ms p(90)=196.16ms p(95)=215.56ms p(99.9)=279.86ms
       { expected_response:true }...: avg=100.27ms min=1.59ms  med=94.54ms max=333.05ms p(90)=196.16ms p(95)=215.56ms p(99.9)=279.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141886
     http_req_receiving.............: avg=113.11µs min=25.88µs med=55.51µs max=53.28ms  p(90)=113.23µs p(95)=311.88µs p(99.9)=8.59ms  
     http_req_sending...............: avg=59µs     min=4.86µs  med=10.66µs max=226.13ms p(90)=20.17µs  p(95)=110.93µs p(99.9)=6.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.1ms  min=1.52ms  med=94.38ms max=332.75ms p(90)=195.98ms p(95)=215.33ms p(99.9)=279.39ms
     http_reqs......................: 141886  2288.992487/s
     iteration_duration.............: avg=101.22ms min=4.42ms  med=95.63ms max=342.34ms p(90)=196.67ms p(95)=216.07ms p(99.9)=280.38ms
     iterations.....................: 140886  2272.85987/s
     success_rate...................: 100.00% ✓ 140886      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 416823      ✗ 0     
     data_received..................: 12 GB   198 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=20.25µs  min=932ns   med=2.86µs   max=67.36ms  p(90)=4.57µs   p(95)=5.72µs   p(99.9)=1.49ms  
     http_req_connecting............: avg=16.57µs  min=0s      med=0s       max=67.26ms  p(90)=0s       p(95)=0s       p(99.9)=1.37ms  
     http_req_duration..............: avg=101.71ms min=1.54ms  med=88.12ms  max=1.59s    p(90)=187.06ms p(95)=223.33ms p(99.9)=862.84ms
       { expected_response:true }...: avg=101.71ms min=1.54ms  med=88.12ms  max=1.59s    p(90)=187.06ms p(95)=223.33ms p(99.9)=862.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139941
     http_req_receiving.............: avg=2.06ms   min=52.39µs med=111.38µs max=896.45ms p(90)=2.01ms   p(95)=5.67ms   p(99.9)=122.08ms
     http_req_sending...............: avg=69.4µs   min=4.71µs  med=10.35µs  max=113.67ms p(90)=19.16µs  p(95)=114.34µs p(99.9)=9.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.57ms  min=1.43ms  med=87.06ms  max=1.59s    p(90)=184.71ms p(95)=219.41ms p(99.9)=755.1ms 
     http_reqs......................: 139941  2261.095307/s
     iteration_duration.............: avg=102.71ms min=2.86ms  med=89.15ms  max=1.59s    p(90)=187.78ms p(95)=224.2ms  p(99.9)=866.51ms
     iterations.....................: 138941  2244.937817/s
     success_rate...................: 100.00% ✓ 138941      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 410967      ✗ 0     
     data_received..................: 12 GB   194 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=19.38µs  min=962ns   med=2.78µs   max=86.71ms  p(90)=4.68µs   p(95)=5.91µs   p(99.9)=1.5ms   
     http_req_connecting............: avg=15.6µs   min=0s      med=0s       max=85.18ms  p(90)=0s       p(95)=0s       p(99.9)=1.42ms  
     http_req_duration..............: avg=103.15ms min=1.86ms  med=89.24ms  max=1.33s    p(90)=199.18ms p(95)=230.74ms p(99.9)=647.54ms
       { expected_response:true }...: avg=103.15ms min=1.86ms  med=89.24ms  max=1.33s    p(90)=199.18ms p(95)=230.74ms p(99.9)=647.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137989
     http_req_receiving.............: avg=1.42ms   min=54.81µs med=110.74µs max=681.98ms p(90)=1.7ms    p(95)=4.42ms   p(99.9)=78.84ms 
     http_req_sending...............: avg=71.04µs  min=5.15µs  med=11.11µs  max=229.47ms p(90)=22.51µs  p(95)=122.73µs p(99.9)=9.25ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.65ms min=1.78ms  med=88.16ms  max=1.33s    p(90)=197.03ms p(95)=226.95ms p(99.9)=635.14ms
     http_reqs......................: 137989  2215.673669/s
     iteration_duration.............: avg=104.17ms min=3.42ms  med=90.42ms  max=1.33s    p(90)=199.81ms p(95)=231.53ms p(99.9)=647.94ms
     iterations.....................: 136989  2199.616782/s
     success_rate...................: 100.00% ✓ 136989      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 215691      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=5.24µs   min=992ns   med=2.3µs    max=7.38ms   p(90)=4.06µs   p(95)=5.02µs   p(99.9)=461.95µs
     http_req_connecting............: avg=2.23µs   min=0s      med=0s       max=7.33ms   p(90)=0s       p(95)=0s       p(99.9)=376.4µs 
     http_req_duration..............: avg=195.74ms min=1.83ms  med=196.21ms max=556.78ms p(90)=360.82ms p(95)=386.29ms p(99.9)=482.49ms
       { expected_response:true }...: avg=195.74ms min=1.83ms  med=196.21ms max=556.78ms p(90)=360.82ms p(95)=386.29ms p(99.9)=482.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72897
     http_req_receiving.............: avg=78.76µs  min=26.45µs med=62.34µs  max=153.63ms p(90)=103.45µs p(95)=119.75µs p(99.9)=1.33ms  
     http_req_sending...............: avg=29.26µs  min=4.8µs   med=10.75µs  max=203.11ms p(90)=18.46µs  p(95)=22.4µs   p(99.9)=3.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.63ms min=1.77ms  med=196.12ms max=556.71ms p(90)=360.71ms p(95)=386.16ms p(99.9)=482.42ms
     http_reqs......................: 72897   1165.567282/s
     iteration_duration.............: avg=198.7ms  min=4.99ms  med=199.4ms  max=557.01ms p(90)=361.73ms p(95)=386.94ms p(99.9)=483.09ms
     iterations.....................: 71897   1149.578047/s
     success_rate...................: 100.00% ✓ 71897       ✗ 0    
     vus............................: 82      min=0         max=495
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 98622      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   628 kB/s
     http_req_blocked...............: avg=7.18µs   min=1.02µs  med=2.74µs   max=12.53ms  p(90)=4.45µs   p(95)=5.43µs   p(99.9)=651.72µs
     http_req_connecting............: avg=3.46µs   min=0s      med=0s       max=12.45ms  p(90)=0s       p(95)=0s       p(99.9)=597.6µs 
     http_req_duration..............: avg=423.7ms  min=3.92ms  med=390.87ms max=1.67s    p(90)=831.62ms p(95)=905.26ms p(99.9)=1.36s   
       { expected_response:true }...: avg=423.7ms  min=3.92ms  med=390.87ms max=1.67s    p(90)=831.62ms p(95)=905.26ms p(99.9)=1.36s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33874
     http_req_receiving.............: avg=87.86µs  min=29.29µs med=72.22µs  max=163.67ms p(90)=112.55µs p(95)=126.42µs p(99.9)=1.03ms  
     http_req_sending...............: avg=33.85µs  min=5.03µs  med=13.93µs  max=168.86ms p(90)=21.22µs  p(95)=24.04µs  p(99.9)=2.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=423.58ms min=3.85ms  med=390.74ms max=1.67s    p(90)=831.54ms p(95)=905.08ms p(99.9)=1.36s   
     http_reqs......................: 33874   523.17691/s
     iteration_duration.............: avg=436.81ms min=17.06ms med=405ms    max=1.68s    p(90)=835.81ms p(95)=908.73ms p(99.9)=1.37s   
     iterations.....................: 32874   507.732117/s
     success_rate...................: 100.00% ✓ 32874      ✗ 0    
     vus............................: 89      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 45720      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   287 kB/s
     http_req_blocked...............: avg=14.89µs  min=1.5µs   med=3.65µs   max=6.17ms  p(90)=5.51µs   p(95)=7.22µs   p(99.9)=2.19ms
     http_req_connecting............: avg=9.2µs    min=0s      med=0s       max=6.1ms   p(90)=0s       p(95)=0s       p(99.9)=2.15ms
     http_req_duration..............: avg=897.04ms min=5.96ms  med=814.41ms max=5.36s   p(90)=1.78s    p(95)=2s       p(99.9)=4.35s 
       { expected_response:true }...: avg=897.04ms min=5.96ms  med=814.41ms max=5.36s   p(90)=1.78s    p(95)=2s       p(99.9)=4.35s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16240
     http_req_receiving.............: avg=100.11µs min=36.95µs med=90.73µs  max=19.01ms p(90)=128.45µs p(95)=143.91µs p(99.9)=1.16ms
     http_req_sending...............: avg=35.41µs  min=6.2µs   med=18.35µs  max=70.41ms p(90)=24.37µs  p(95)=28.59µs  p(99.9)=2.28ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=896.9ms  min=5.87ms  med=814.32ms max=5.36s   p(90)=1.78s    p(95)=2s       p(99.9)=4.35s 
     http_reqs......................: 16240   239.205559/s
     iteration_duration.............: avg=955.92ms min=45.01ms med=881.13ms max=5.36s   p(90)=1.8s     p(95)=2.02s    p(99.9)=4.38s 
     iterations.....................: 15240   224.476153/s
     success_rate...................: 100.00% ✓ 15240      ✗ 0    
     vus............................: 17      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 45975      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   285 kB/s
     http_req_blocked...............: avg=22.95µs  min=1.18µs  med=3.75µs   max=10.06ms p(90)=5.55µs   p(95)=7.12µs   p(99.9)=5.91ms
     http_req_connecting............: avg=17.01µs  min=0s      med=0s       max=9.98ms  p(90)=0s       p(95)=0s       p(99.9)=5.73ms
     http_req_duration..............: avg=889.99ms min=7.79ms  med=806.63ms max=3.11s   p(90)=1.84s    p(95)=1.93s    p(99.9)=2.85s 
       { expected_response:true }...: avg=889.99ms min=7.79ms  med=806.63ms max=3.11s   p(90)=1.84s    p(95)=1.93s    p(99.9)=2.85s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16325
     http_req_receiving.............: avg=101.66µs min=34.64µs med=93.74µs  max=6.08ms  p(90)=136.82µs p(95)=153.65µs p(99.9)=1ms   
     http_req_sending...............: avg=34.75µs  min=5.86µs  med=18.59µs  max=26.23ms p(90)=24.69µs  p(95)=29.71µs  p(99.9)=3.46ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=889.85ms min=7.7ms   med=806.47ms max=3.11s   p(90)=1.84s    p(95)=1.93s    p(99.9)=2.85s 
     http_reqs......................: 16325   237.263189/s
     iteration_duration.............: avg=948.02ms min=34.01ms med=888.55ms max=3.12s   p(90)=1.85s    p(95)=1.93s    p(99.9)=2.86s 
     iterations.....................: 15325   222.729456/s
     success_rate...................: 100.00% ✓ 15325      ✗ 0    
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

