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
| hive-router | v0.0.49 | 2,665 | 2,808 | 2,633 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,095 | 2,140 | 2,071 | 1.0% |  |
| cosmo | 0.307.0 | 1,198 | 1,211 | 1,188 | 0.8% | non-compatible response (15 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 498 | 501 | 493 | 0.6% |  |
| hive-gateway | 2.5.25 | 225 | 226 | 224 | 0.4% |  |
| apollo-gateway | 2.13.3 | 203 | 206 | 201 | 0.8% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (21690 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (518385 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,184 | 2,283 | 2,137 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,957 | 1,994 | 1,857 | 2.0% |  |
| cosmo | 0.307.0 | 1,136 | 1,146 | 1,130 | 0.7% | non-compatible response (8 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 475 | 483 | 472 | 0.8% |  |
| hive-gateway | 2.5.25 | 217 | 221 | 216 | 0.9% |  |
| apollo-gateway | 2.13.3 | 210 | 212 | 209 | 0.4% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (10953 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (298443 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 491967      ✗ 0     
     data_received..................: 15 GB   234 MB/s
     data_sent......................: 198 MB  3.2 MB/s
     http_req_blocked...............: avg=26.71µs  min=971ns   med=2.54µs  max=88.21ms  p(90)=4.04µs   p(95)=5.11µs   p(99.9)=3.28ms  
     http_req_connecting............: avg=23.08µs  min=0s      med=0s      max=79.01ms  p(90)=0s       p(95)=0s       p(99.9)=3.09ms  
     http_req_duration..............: avg=86.1ms   min=1.6ms   med=80.32ms max=294.57ms p(90)=167.11ms p(95)=182.62ms p(99.9)=239.82ms
       { expected_response:true }...: avg=86.1ms   min=1.6ms   med=80.32ms max=294.57ms p(90)=167.11ms p(95)=182.62ms p(99.9)=239.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 164989
     http_req_receiving.............: avg=362.79µs min=29.74µs med=56.49µs max=245.79ms p(90)=233.96µs p(95)=420.8µs  p(99.9)=41.59ms 
     http_req_sending...............: avg=86.88µs  min=5.31µs  med=10.08µs max=187.87ms p(90)=18.69µs  p(95)=133.83µs p(99.9)=12.83ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.65ms  min=1.51ms  med=79.99ms max=267.12ms p(90)=166.42ms p(95)=181.45ms p(99.9)=235.51ms
     http_reqs......................: 164989  2665.449338/s
     iteration_duration.............: avg=86.93ms  min=2.49ms  med=81.22ms max=337.03ms p(90)=167.69ms p(95)=183.21ms p(99.9)=242.46ms
     iterations.....................: 163989  2649.294023/s
     success_rate...................: 100.00% ✓ 163989      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 391740      ✗ 0     
     data_received..................: 12 GB   184 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=19.87µs  min=1.09µs  med=2.6µs    max=52.98ms  p(90)=4.07µs   p(95)=5.11µs   p(99.9)=1.49ms  
     http_req_connecting............: avg=16.38µs  min=0s      med=0s       max=52.79ms  p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=108.16ms min=2.35ms  med=98.23ms  max=713.26ms p(90)=211.88ms p(95)=247.28ms p(99.9)=519.26ms
       { expected_response:true }...: avg=108.16ms min=2.35ms  med=98.23ms  max=713.26ms p(90)=211.88ms p(95)=247.28ms p(99.9)=519.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131580
     http_req_receiving.............: avg=2.02ms   min=52.35µs med=112.94µs max=417.18ms p(90)=1.18ms   p(95)=3.57ms   p(99.9)=173.66ms
     http_req_sending...............: avg=75.96µs  min=5.24µs  med=10.33µs  max=261.57ms p(90)=18.93µs  p(95)=127.1µs  p(99.9)=10ms    
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.06ms min=2.26ms  med=97.33ms  max=663.48ms p(90)=208.37ms p(95)=241.14ms p(99.9)=456.88ms
     http_reqs......................: 131580  2095.772621/s
     iteration_duration.............: avg=109.26ms min=3.62ms  med=99.36ms  max=713.47ms p(90)=212.64ms p(95)=247.93ms p(99.9)=519.92ms
     iterations.....................: 130580  2079.844877/s
     success_rate...................: 100.00% ✓ 130580      ✗ 0     
     vus............................: 94      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 221580      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=7.63µs   min=1.05µs  med=2.53µs   max=48.45ms  p(90)=4.08µs   p(95)=4.99µs   p(99.9)=586.52µs
     http_req_connecting............: avg=4.35µs   min=0s      med=0s       max=48.39ms  p(90)=0s       p(95)=0s       p(99.9)=483.81µs
     http_req_duration..............: avg=190.6ms  min=2.08ms  med=192.75ms max=592.2ms  p(90)=354.8ms  p(95)=380.7ms  p(99.9)=476.2ms 
       { expected_response:true }...: avg=190.6ms  min=2.08ms  med=192.75ms max=592.2ms  p(90)=354.8ms  p(95)=380.7ms  p(99.9)=476.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 74860
     http_req_receiving.............: avg=119.24µs min=29.94µs med=60.23µs  max=190.38ms p(90)=94.63µs  p(95)=109.12µs p(99.9)=3.62ms  
     http_req_sending...............: avg=30.21µs  min=5.4µs   med=10.83µs  max=23.99ms  p(90)=16.97µs  p(95)=20.72µs  p(99.9)=3.8ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.45ms min=1.98ms  med=192.48ms max=592.14ms p(90)=354.68ms p(95)=380.54ms p(99.9)=476.1ms 
     http_reqs......................: 74860   1198.688045/s
     iteration_duration.............: avg=193.43ms min=4.28ms  med=196.02ms max=592.36ms p(90)=355.65ms p(95)=381.42ms p(99.9)=476.49ms
     iterations.....................: 73860   1182.675648/s
     success_rate...................: 100.00% ✓ 73860       ✗ 0    
     vus............................: 80      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 93960      ✗ 0    
     data_received..................: 2.8 GB  44 MB/s
     data_sent......................: 39 MB   599 kB/s
     http_req_blocked...............: avg=9.4µs    min=1.16µs  med=3.11µs   max=4.49ms   p(90)=4.97µs   p(95)=6.04µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=5.1µs    min=0s      med=0s       max=4.41ms   p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=444.12ms min=3.96ms  med=413.4ms  max=1.81s    p(90)=870.31ms p(95)=942.99ms p(99.9)=1.37s   
       { expected_response:true }...: avg=444.12ms min=3.96ms  med=413.4ms  max=1.81s    p(90)=870.31ms p(95)=942.99ms p(99.9)=1.37s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32320
     http_req_receiving.............: avg=91.06µs  min=30.5µs  med=77.4µs   max=120.82ms p(90)=114.57µs p(95)=128.83µs p(99.9)=871.04µs
     http_req_sending...............: avg=38.3µs   min=5.45µs  med=13.52µs  max=212.63ms p(90)=21.41µs  p(95)=24.96µs  p(99.9)=3.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=444ms    min=3.9ms   med=413.3ms  max=1.81s    p(90)=870.22ms p(95)=942.85ms p(99.9)=1.37s   
     http_reqs......................: 32320   498.621846/s
     iteration_duration.............: avg=458.53ms min=21.45ms med=430.45ms max=1.81s    p(90)=874.5ms  p(95)=946.92ms p(99.9)=1.39s   
     iterations.....................: 31320   483.19419/s
     success_rate...................: 100.00% ✓ 31320      ✗ 0    
     vus............................: 94      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 43140      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   271 kB/s
     http_req_blocked...............: avg=14.93µs  min=1.27µs  med=3.75µs   max=18.54ms p(90)=5.77µs   p(95)=7.43µs   p(99.9)=1.48ms
     http_req_connecting............: avg=9.39µs   min=0s      med=0s       max=18.27ms p(90)=0s       p(95)=0s       p(99.9)=1.46ms
     http_req_duration..............: avg=939.76ms min=6.37ms  med=829.36ms max=15.44s  p(90)=1.77s    p(95)=1.94s    p(99.9)=11.13s
       { expected_response:true }...: avg=939.76ms min=6.37ms  med=829.36ms max=15.44s  p(90)=1.77s    p(95)=1.94s    p(99.9)=11.13s
     http_req_failed................: 0.00%   ✓ 0          ✗ 15380
     http_req_receiving.............: avg=118.44µs min=32.85µs med=100.9µs  max=93.58ms p(90)=140.24µs p(95)=154.53µs p(99.9)=1.34ms
     http_req_sending...............: avg=33.31µs  min=6.12µs  med=18.71µs  max=48.02ms p(90)=25.37µs  p(95)=30.54µs  p(99.9)=3.12ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=939.61ms min=6.27ms  med=829.22ms max=15.44s  p(90)=1.77s    p(95)=1.94s    p(99.9)=11.13s
     http_reqs......................: 15380   225.359286/s
     iteration_duration.............: avg=1s       min=30.27ms med=909.52ms max=15.44s  p(90)=1.79s    p(95)=1.95s    p(99.9)=11.22s
     iterations.....................: 14380   210.706536/s
     success_rate...................: 100.00% ✓ 14380      ✗ 0    
     vus............................: 69      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42342      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   250 kB/s
     http_req_blocked...............: avg=16.47µs  min=1.24µs  med=3.52µs   max=7.77ms   p(90)=5.24µs   p(95)=6.88µs   p(99.9)=2.58ms
     http_req_connecting............: avg=11.09µs  min=0s      med=0s       max=7.72ms   p(90)=0s       p(95)=0s       p(99.9)=2.47ms
     http_req_duration..............: avg=461.6ms  min=8.45ms  med=521.09ms max=1.41s    p(90)=829.31ms p(95)=898.7ms  p(99.9)=1.25s 
       { expected_response:true }...: avg=461.6ms  min=8.45ms  med=521.09ms max=1.41s    p(90)=829.31ms p(95)=898.7ms  p(99.9)=1.25s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15114
     http_req_receiving.............: avg=116.05µs min=33.75µs med=91.89µs  max=151.77ms p(90)=131.36µs p(95)=145.28µs p(99.9)=1.04ms
     http_req_sending...............: avg=27.96µs  min=6.13µs  med=16.83µs  max=27.89ms  p(90)=23.04µs  p(95)=27.97µs  p(99.9)=2.71ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=461.46ms min=8.32ms  med=520.99ms max=1.41s    p(90)=829.19ms p(95)=898.59ms p(99.9)=1.25s 
     http_reqs......................: 15114   203.242835/s
     iteration_duration.............: avg=494.26ms min=8.9ms   med=553.13ms max=1.41s    p(90)=837.24ms p(95)=908.53ms p(99.9)=1.27s 
     iterations.....................: 14114   189.795512/s
     success_rate...................: 100.00% ✓ 14114      ✗ 0    
     vus............................: 70      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 404115      ✗ 0     
     data_received..................: 12 GB   191 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=24.46µs  min=1.12µs med=2.99µs   max=66.43ms  p(90)=4.77µs   p(95)=6.01µs   p(99.9)=2.7ms   
     http_req_connecting............: avg=20.74µs  min=0s     med=0s       max=66.22ms  p(90)=0s       p(95)=0s       p(99.9)=2.66ms  
     http_req_duration..............: avg=104.79ms min=1.68ms med=99.07ms  max=419.68ms p(90)=203.03ms p(95)=219.2ms  p(99.9)=272.85ms
       { expected_response:true }...: avg=104.79ms min=1.68ms med=99.07ms  max=419.68ms p(90)=203.03ms p(95)=219.2ms  p(99.9)=272.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135705
     http_req_receiving.............: avg=235.98µs min=30µs   med=63.17µs  max=264.22ms p(90)=169.23µs p(95)=429.65µs p(99.9)=28.62ms 
     http_req_sending...............: avg=80.18µs  min=5.4µs  med=11.62µs  max=238.36ms p(90)=21.63µs  p(95)=143.83µs p(99.9)=11.05ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.47ms min=1.6ms  med=98.85ms  max=312.45ms p(90)=202.47ms p(95)=218.58ms p(99.9)=271.07ms
     http_reqs......................: 135705  2184.901272/s
     iteration_duration.............: avg=105.88ms min=3.87ms med=100.33ms max=430.71ms p(90)=203.62ms p(95)=219.85ms p(99.9)=275.82ms
     iterations.....................: 134705  2168.800897/s
     success_rate...................: 100.00% ✓ 134705      ✗ 0     
     vus............................: 63      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 362421     ✗ 0     
     data_received..................: 11 GB   172 MB/s
     data_sent......................: 146 MB  2.4 MB/s
     http_req_blocked...............: avg=17.64µs  min=990ns   med=2.84µs   max=74.95ms  p(90)=4.57µs   p(95)=5.7µs    p(99.9)=1.59ms  
     http_req_connecting............: avg=13.92µs  min=0s      med=0s       max=74.73ms  p(90)=0s       p(95)=0s       p(99.9)=1.5ms   
     http_req_duration..............: avg=116.88ms min=1.81ms  med=108.49ms max=820.56ms p(90)=223.05ms p(95)=254.4ms  p(99.9)=525.1ms 
       { expected_response:true }...: avg=116.88ms min=1.81ms  med=108.49ms max=820.56ms p(90)=223.05ms p(95)=254.4ms  p(99.9)=525.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 121807
     http_req_receiving.............: avg=1.61ms   min=52.87µs med=114.06µs max=376.09ms p(90)=1.57ms   p(95)=4.25ms   p(99.9)=128.71ms
     http_req_sending...............: avg=69.99µs  min=5.44µs  med=10.88µs  max=201.03ms p(90)=20.77µs  p(95)=128.34µs p(99.9)=8.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.2ms  min=1.73ms  med=107.05ms max=802.36ms p(90)=220.51ms p(95)=250.9ms  p(99.9)=519.09ms
     http_reqs......................: 121807  1957.26066/s
     iteration_duration.............: avg=118.14ms min=3.28ms  med=110.1ms  max=820.8ms  p(90)=223.85ms p(95)=255.16ms p(99.9)=526.63ms
     iterations.....................: 120807  1941.19212/s
     success_rate...................: 100.00% ✓ 120807     ✗ 0     
     vus............................: 68      min=0        max=495 
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 210207      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=6.77µs   min=1.2µs   med=2.8µs    max=10.39ms  p(90)=4.56µs   p(95)=5.54µs   p(99.9)=630.66µs
     http_req_connecting............: avg=3.3µs    min=0s      med=0s       max=10.33ms  p(90)=0s       p(95)=0s       p(99.9)=571.15µs
     http_req_duration..............: avg=200.85ms min=2.1ms   med=203.6ms  max=611.23ms p(90)=369.95ms p(95)=398.89ms p(99.9)=527.78ms
       { expected_response:true }...: avg=200.85ms min=2.1ms   med=203.6ms  max=611.23ms p(90)=369.95ms p(95)=398.89ms p(99.9)=527.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71069
     http_req_receiving.............: avg=133.75µs min=30.12µs med=65.68µs  max=207.68ms p(90)=102.18µs p(95)=117.78µs p(99.9)=3.31ms  
     http_req_sending...............: avg=30.16µs  min=5.58µs  med=11.84µs  max=35.24ms  p(90)=18.54µs  p(95)=22.23µs  p(99.9)=3.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.69ms min=2.03ms  med=203.28ms max=611.14ms p(90)=369.87ms p(95)=398.81ms p(99.9)=527.7ms 
     http_reqs......................: 71069   1136.406493/s
     iteration_duration.............: avg=203.97ms min=4.19ms  med=206.7ms  max=611.4ms  p(90)=370.92ms p(95)=399.62ms p(99.9)=529.44ms
     iterations.....................: 70069   1120.416307/s
     success_rate...................: 100.00% ✓ 70069       ✗ 0    
     vus............................: 81      min=0         max=496
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 90003      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 37 MB   571 kB/s
     http_req_blocked...............: avg=7.91µs   min=1.24µs  med=3.17µs   max=5.62ms  p(90)=5.05µs   p(95)=6.04µs   p(99.9)=688.19µs
     http_req_connecting............: avg=3.44µs   min=0s      med=0s       max=2.95ms  p(90)=0s       p(95)=0s       p(99.9)=618.16µs
     http_req_duration..............: avg=463.29ms min=4.22ms  med=432.12ms max=1.97s   p(90)=907.93ms p(95)=997.05ms p(99.9)=1.48s   
       { expected_response:true }...: avg=463.29ms min=4.22ms  med=432.12ms max=1.97s   p(90)=907.93ms p(95)=997.05ms p(99.9)=1.48s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31001
     http_req_receiving.............: avg=166.98µs min=31.49µs med=79.62µs  max=171.4ms p(90)=116.47µs p(95)=130.05µs p(99.9)=20.68ms 
     http_req_sending...............: avg=24.22µs  min=5.58µs  med=14.39µs  max=19.8ms  p(90)=21.64µs  p(95)=24.99µs  p(99.9)=2.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=463.1ms  min=4.11ms  med=431.98ms max=1.96s   p(90)=907.83ms p(95)=996.98ms p(99.9)=1.48s   
     http_reqs......................: 31001   475.490588/s
     iteration_duration.............: avg=478.94ms min=13.63ms med=447.77ms max=1.97s   p(90)=913.73ms p(95)=1s       p(99.9)=1.49s   
     iterations.....................: 30001   460.152676/s
     success_rate...................: 100.00% ✓ 30001      ✗ 0    
     vus............................: 65      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 41417      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   261 kB/s
     http_req_blocked...............: avg=13.75µs  min=1.3µs   med=3.98µs   max=3.24ms  p(90)=6.03µs   p(95)=8.1µs    p(99.9)=1.58ms
     http_req_connecting............: avg=7.72µs   min=0s      med=0s       max=3.17ms  p(90)=0s       p(95)=0s       p(99.9)=1.41ms
     http_req_duration..............: avg=985.79ms min=6.43ms  med=885.23ms max=6.27s   p(90)=1.96s    p(95)=2.15s    p(99.9)=5.4s  
       { expected_response:true }...: avg=985.79ms min=6.43ms  med=885.23ms max=6.27s   p(90)=1.96s    p(95)=2.15s    p(99.9)=5.4s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14806
     http_req_receiving.............: avg=112.98µs min=39.9µs  med=102.35µs max=40.25ms p(90)=141.14µs p(95)=153.78µs p(99.9)=1.52ms
     http_req_sending...............: avg=31.72µs  min=6.54µs  med=18.87µs  max=22.12ms p(90)=25.21µs  p(95)=30.62µs  p(99.9)=3.21ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=985.65ms min=6.33ms  med=885.13ms max=6.27s   p(90)=1.96s    p(95)=2.15s    p(99.9)=5.4s  
     http_reqs......................: 14806   217.009894/s
     iteration_duration.............: avg=1.05s    min=42.94ms med=977.55ms max=6.28s   p(90)=2s       p(95)=2.17s    p(99.9)=5.41s 
     iterations.....................: 13805   202.338349/s
     success_rate...................: 100.00% ✓ 13805      ✗ 0    
     vus............................: 69      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 41280      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   253 kB/s
     http_req_blocked...............: avg=18.22µs  min=1.36µs  med=3.75µs   max=35.12ms p(90)=5.64µs   p(95)=7.42µs   p(99.9)=2.73ms  
     http_req_connecting............: avg=12.32µs  min=0s      med=0s       max=35.06ms p(90)=0s       p(95)=0s       p(99.9)=2.66ms  
     http_req_duration..............: avg=987.27ms min=8.66ms  med=915.74ms max=3.9s    p(90)=2.02s    p(95)=2.13s    p(99.9)=3.58s   
       { expected_response:true }...: avg=987.27ms min=8.66ms  med=915.74ms max=3.9s    p(90)=2.02s    p(95)=2.13s    p(99.9)=3.58s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14760
     http_req_receiving.............: avg=110.7µs  min=37.65µs med=98.76µs  max=35.25ms p(90)=138.72µs p(95)=151.76µs p(99.9)=967.27µs
     http_req_sending...............: avg=32.57µs  min=6.45µs  med=18.39µs  max=10.12ms p(90)=24.85µs  p(95)=30.6µs   p(99.9)=4ms     
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=987.13ms min=8.54ms  med=915.57ms max=3.9s    p(90)=2.02s    p(95)=2.13s    p(99.9)=3.58s   
     http_reqs......................: 14760   210.727534/s
     iteration_duration.............: avg=1.05s    min=27.58ms med=997.58ms max=3.91s   p(90)=2.04s    p(95)=2.13s    p(99.9)=3.59s   
     iterations.....................: 13760   196.4506/s
     success_rate...................: 100.00% ✓ 13760      ✗ 0    
     vus............................: 59      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

