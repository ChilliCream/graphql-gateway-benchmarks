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
| hive-router | v0.0.43 | 2,686 | 2,794 | 2,650 | 1.7% |  |
| hotchocolate | 16.0.0-rc.1.25 | 2,029 | 2,065 | 2,005 | 1.1% |  |
| cosmo | 0.298.0 | 1,160 | 1,160 | 1,160 | 0.0% | non-compatible response (14 across 8/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 569 | 577 | 566 | 0.8% |  |
| hive-gateway | 2.5.14 | 250 | 252 | 247 | 0.7% |  |
| apollo-gateway | 2.13.3 | 200 | 205 | 196 | 1.5% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (38011 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (507349 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,373 | 2,483 | 2,292 | 2.4% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,899 | 1,944 | 1,890 | 1.1% |  |
| cosmo | 0.298.0 | 1,140 | 1,158 | 1,135 | 1.1% | non-compatible response (11 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 534 | 546 | 526 | 1.2% |  |
| hive-gateway | 2.5.14 | 243 | 248 | 240 | 0.9% |  |
| apollo-gateway | 2.13.3 | 209 | 213 | 208 | 0.8% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (30656 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (218039 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 496272      ✗ 0     
     data_received..................: 15 GB   236 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=38.75µs  min=1.01µs  med=2.66µs  max=81.21ms  p(90)=4.22µs   p(95)=5.33µs   p(99.9)=9.76ms  
     http_req_connecting............: avg=35.3µs   min=0s      med=0s      max=81.15ms  p(90)=0s       p(95)=0s       p(99.9)=9.64ms  
     http_req_duration..............: avg=85.28ms  min=1.65ms  med=77.97ms max=323.5ms  p(90)=165.37ms p(95)=186.6ms  p(99.9)=259.97ms
       { expected_response:true }...: avg=85.28ms  min=1.65ms  med=77.97ms max=323.5ms  p(90)=165.37ms p(95)=186.6ms  p(99.9)=259.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 166424
     http_req_receiving.............: avg=564.76µs min=28.55µs med=57.64µs max=96.81ms  p(90)=253.88µs p(95)=442.45µs p(99.9)=63.91ms 
     http_req_sending...............: avg=105.85µs min=5.3µs   med=10.48µs max=86.5ms   p(90)=19.7µs   p(95)=139.71µs p(99.9)=18.15ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.61ms  min=1.6ms   med=77.56ms max=307.43ms p(90)=164.22ms p(95)=184.02ms p(99.9)=253.08ms
     http_reqs......................: 166424  2686.303591/s
     iteration_duration.............: avg=86.18ms  min=2.44ms  med=78.94ms max=411.81ms p(90)=166ms    p(95)=187.39ms p(99.9)=261.62ms
     iterations.....................: 165424  2670.162268/s
     success_rate...................: 100.00% ✓ 165424      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 379782      ✗ 0     
     data_received..................: 11 GB   178 MB/s
     data_sent......................: 153 MB  2.4 MB/s
     http_req_blocked...............: avg=14.03µs  min=1.03µs  med=2.58µs   max=40.06ms  p(90)=4.04µs   p(95)=5.07µs   p(99.9)=1.44ms  
     http_req_connecting............: avg=10.8µs   min=0s      med=0s       max=40.01ms  p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=111.55ms min=2.43ms  med=107.41ms max=527.74ms p(90)=211.58ms p(95)=235.57ms p(99.9)=375.53ms
       { expected_response:true }...: avg=111.55ms min=2.43ms  med=107.41ms max=527.74ms p(90)=211.58ms p(95)=235.57ms p(99.9)=375.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 127594
     http_req_receiving.............: avg=1.37ms   min=51.51µs med=147.53µs max=211.77ms p(90)=1.29ms   p(95)=3.11ms   p(99.9)=130.21ms
     http_req_sending...............: avg=61.08µs  min=5.15µs  med=10.31µs  max=140.23ms p(90)=18.84µs  p(95)=124.31µs p(99.9)=8.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.12ms min=2.34ms  med=106.06ms max=527.67ms p(90)=209.49ms p(95)=232.53ms p(99.9)=368.38ms
     http_reqs......................: 127594  2029.143707/s
     iteration_duration.............: avg=112.7ms  min=3.57ms  med=108.73ms max=527.89ms p(90)=212.16ms p(95)=236.2ms  p(99.9)=376.43ms
     iterations.....................: 126594  2013.240579/s
     success_rate...................: 100.00% ✓ 126594      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 214821      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=7µs      min=1.11µs  med=2.62µs   max=37.88ms  p(90)=4.16µs   p(95)=5.02µs   p(99.9)=709.34µs
     http_req_connecting............: avg=3.71µs   min=0s      med=0s       max=37.82ms  p(90)=0s       p(95)=0s       p(99.9)=608.63µs
     http_req_duration..............: avg=196.52ms min=2.05ms  med=197.06ms max=601.73ms p(90)=362.61ms p(95)=389.34ms p(99.9)=517.75ms
       { expected_response:true }...: avg=196.52ms min=2.05ms  med=197.06ms max=601.73ms p(90)=362.61ms p(95)=389.34ms p(99.9)=517.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72607
     http_req_receiving.............: avg=81.22µs  min=29.43µs med=63.21µs  max=104.68ms p(90)=97.7µs   p(95)=111.83µs p(99.9)=1.89ms  
     http_req_sending...............: avg=29.45µs  min=5.17µs  med=11.04µs  max=77.26ms  p(90)=17.08µs  p(95)=20.52µs  p(99.9)=3.67ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.41ms min=1.96ms  med=196.96ms max=601.64ms p(90)=362.52ms p(95)=389.22ms p(99.9)=517.65ms
     http_reqs......................: 72607   1160.995597/s
     iteration_duration.............: avg=199.54ms min=4.59ms  med=200.27ms max=601.89ms p(90)=363.56ms p(95)=390ms    p(99.9)=518.18ms
     iterations.....................: 71607   1145.005463/s
     success_rate...................: 100.00% ✓ 71607       ✗ 0    
     vus............................: 82      min=0         max=494
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 107148     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   684 kB/s
     http_req_blocked...............: avg=9.09µs   min=1.2µs   med=3.03µs   max=39.16ms  p(90)=4.86µs   p(95)=5.93µs   p(99.9)=965.1µs 
     http_req_connecting............: avg=5µs      min=0s      med=0s       max=39.1ms   p(90)=0s       p(95)=0s       p(99.9)=911.18µs
     http_req_duration..............: avg=390.55ms min=3.7ms   med=361.91ms max=2.01s    p(90)=769.21ms p(95)=832.12ms p(99.9)=1.2s    
       { expected_response:true }...: avg=390.55ms min=3.7ms   med=361.91ms max=2.01s    p(90)=769.21ms p(95)=832.12ms p(99.9)=1.2s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 36716
     http_req_receiving.............: avg=195.2µs  min=32.43µs med=76.84µs  max=217.57ms p(90)=112.42µs p(95)=126.06µs p(99.9)=16.5ms  
     http_req_sending...............: avg=26.81µs  min=5.59µs  med=13.57µs  max=80.2ms   p(90)=21.05µs  p(95)=24.42µs  p(99.9)=2.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=390.33ms min=3.63ms  med=361.78ms max=2.01s    p(90)=769.03ms p(95)=832.04ms p(99.9)=1.2s    
     http_reqs......................: 36716   569.748903/s
     iteration_duration.............: avg=401.71ms min=9.13ms  med=376.03ms max=2.02s    p(90)=772.53ms p(95)=834.75ms p(99.9)=1.21s   
     iterations.....................: 35716   554.231175/s
     success_rate...................: 100.00% ✓ 35716      ✗ 0    
     vus............................: 77      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47751      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   302 kB/s
     http_req_blocked...............: avg=16.01µs  min=1.1µs   med=3.88µs   max=8.4ms   p(90)=5.85µs   p(95)=7.5µs    p(99.9)=2.66ms
     http_req_connecting............: avg=10.57µs  min=0s      med=0s       max=8.35ms  p(90)=0s       p(95)=0s       p(99.9)=2.63ms
     http_req_duration..............: avg=835.32ms min=5.65ms  med=733.75ms max=20.64s  p(90)=1.44s    p(95)=1.57s    p(99.9)=18.82s
       { expected_response:true }...: avg=835.32ms min=5.65ms  med=733.75ms max=20.64s  p(90)=1.44s    p(95)=1.57s    p(99.9)=18.82s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16917
     http_req_receiving.............: avg=120.45µs min=32.42µs med=101.08µs max=65.67ms p(90)=141.27µs p(95)=155.08µs p(99.9)=1.02ms
     http_req_sending...............: avg=29.67µs  min=5.69µs  med=18.75µs  max=36.3ms  p(90)=24.93µs  p(95)=29.8µs   p(99.9)=2.34ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=835.17ms min=5.51ms  med=733.65ms max=20.64s  p(90)=1.44s    p(95)=1.57s    p(99.9)=18.82s
     http_reqs......................: 16917   250.741465/s
     iteration_duration.............: avg=887.85ms min=22.79ms med=789.38ms max=20.64s  p(90)=1.46s    p(95)=1.58s    p(99.9)=18.83s
     iterations.....................: 15917   235.919601/s
     success_rate...................: 100.00% ✓ 15917      ✗ 0    
     vus............................: 78      min=0        max=499
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

     checks.........................: 100.00% ✓ 41916      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   246 kB/s
     http_req_blocked...............: avg=15µs     min=1.25µs  med=3.37µs   max=3.67ms  p(90)=5µs      p(95)=6.46µs   p(99.9)=2.54ms
     http_req_connecting............: avg=9.93µs   min=0s      med=0s       max=3.64ms  p(90)=0s       p(95)=0s       p(99.9)=2.52ms
     http_req_duration..............: avg=433.62ms min=8.4ms   med=436.17ms max=1.48s   p(90)=767.85ms p(95)=824.83ms p(99.9)=1.16s 
       { expected_response:true }...: avg=433.62ms min=8.4ms   med=436.17ms max=1.48s   p(90)=767.85ms p(95)=824.83ms p(99.9)=1.16s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14972
     http_req_receiving.............: avg=145.71µs min=34.55µs med=91.65µs  max=96.98ms p(90)=131.13µs p(95)=143.32µs p(99.9)=6.14ms
     http_req_sending...............: avg=34.85µs  min=6.02µs  med=16.36µs  max=52.7ms  p(90)=22.56µs  p(95)=27.74µs  p(99.9)=3.4ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=433.44ms min=8.28ms  med=436.06ms max=1.48s   p(90)=767.76ms p(95)=824.74ms p(99.9)=1.16s 
     http_reqs......................: 14972   200.766354/s
     iteration_duration.............: avg=464.48ms min=8.85ms  med=464.19ms max=1.5s    p(90)=774.31ms p(95)=829.41ms p(99.9)=1.17s 
     iterations.....................: 13972   187.356899/s
     success_rate...................: 100.00% ✓ 13972      ✗ 0    
     vus............................: 73      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 438189      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=43.65µs  min=1.05µs  med=3.02µs  max=168.18ms p(90)=4.91µs   p(95)=6.26µs   p(99.9)=10.64ms 
     http_req_connecting............: avg=39.49µs  min=0s      med=0s      max=168.02ms p(90)=0s       p(95)=0s       p(99.9)=9.57ms  
     http_req_duration..............: avg=96.61ms  min=1.61ms  med=89.74ms max=299.8ms  p(90)=187.48ms p(95)=206.56ms p(99.9)=264.47ms
       { expected_response:true }...: avg=96.61ms  min=1.61ms  med=89.74ms max=299.8ms  p(90)=187.48ms p(95)=206.56ms p(99.9)=264.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147063
     http_req_receiving.............: avg=377.12µs min=26.84µs med=62.1µs  max=134.77ms p(90)=227.98µs p(95)=466.03µs p(99.9)=39.06ms 
     http_req_sending...............: avg=99.17µs  min=5.39µs  med=11.8µs  max=140.41ms p(90)=23.5µs   p(95)=150.35µs p(99.9)=15.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.14ms  min=1.55ms  med=89.38ms max=299.44ms p(90)=186.72ms p(95)=205.3ms  p(99.9)=261.06ms
     http_reqs......................: 147063  2373.272733/s
     iteration_duration.............: avg=97.61ms  min=3.27ms  med=90.81ms max=391.49ms p(90)=188.22ms p(95)=207.22ms p(99.9)=266.27ms
     iterations.....................: 146063  2357.134936/s
     success_rate...................: 100.00% ✓ 146063      ✗ 0     
     vus............................: 55      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 352137      ✗ 0     
     data_received..................: 10 GB   167 MB/s
     data_sent......................: 142 MB  2.3 MB/s
     http_req_blocked...............: avg=12.53µs  min=1.02µs med=2.41µs   max=40.22ms  p(90)=4.17µs   p(95)=5.31µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=9.38µs   min=0s     med=0s       max=40.18ms  p(90)=0s       p(95)=0s       p(99.9)=1.5ms   
     http_req_duration..............: avg=120.24ms min=1.79ms med=114.14ms max=794.11ms p(90)=227.03ms p(95)=250.1ms  p(99.9)=618.01ms
       { expected_response:true }...: avg=120.24ms min=1.79ms med=114.14ms max=794.11ms p(90)=227.03ms p(95)=250.1ms  p(99.9)=618.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118379
     http_req_receiving.............: avg=1.23ms   min=53.1µs med=142.83µs max=224.34ms p(90)=1.52ms   p(95)=3.16ms   p(99.9)=106.54ms
     http_req_sending...............: avg=59.17µs  min=5.31µs med=10.45µs  max=142.4ms  p(90)=21.24µs  p(95)=126.59µs p(99.9)=7.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.94ms min=1.7ms  med=112.88ms max=792.42ms p(90)=225.45ms p(95)=247.43ms p(99.9)=615.09ms
     http_reqs......................: 118379  1899.046791/s
     iteration_duration.............: avg=121.54ms min=3.34ms med=115.57ms max=794.32ms p(90)=227.64ms p(95)=250.76ms p(99.9)=618.85ms
     iterations.....................: 117379  1883.004699/s
     success_rate...................: 100.00% ✓ 117379      ✗ 0     
     vus............................: 74      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 211344      ✗ 0    
     data_received..................: 6.2 GB  100 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=7.37µs   min=1.06µs  med=2.88µs   max=30.99ms  p(90)=4.7µs    p(95)=5.72µs   p(99.9)=716.57µs
     http_req_connecting............: avg=3.79µs   min=0s      med=0s       max=30.9ms   p(90)=0s       p(95)=0s       p(99.9)=652.63µs
     http_req_duration..............: avg=199.76ms min=2.09ms  med=202.44ms max=610.06ms p(90)=366.6ms  p(95)=395.33ms p(99.9)=527.36ms
       { expected_response:true }...: avg=199.76ms min=2.09ms  med=202.44ms max=610.06ms p(90)=366.6ms  p(95)=395.33ms p(99.9)=527.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71448
     http_req_receiving.............: avg=88.11µs  min=29.66µs med=68.35µs  max=188.07ms p(90)=107.5µs  p(95)=123.58µs p(99.9)=1.6ms   
     http_req_sending...............: avg=35.54µs  min=5.07µs  med=12.33µs  max=110.34ms p(90)=19.61µs  p(95)=23.68µs  p(99.9)=4.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.63ms min=2.03ms  med=202.32ms max=609.97ms p(90)=366.5ms  p(95)=395.23ms p(99.9)=527.28ms
     http_reqs......................: 71448   1140.886492/s
     iteration_duration.............: avg=202.85ms min=5.89ms  med=205.79ms max=610.26ms p(90)=367.66ms p(95)=396.21ms p(99.9)=528.04ms
     iterations.....................: 70448   1124.918424/s
     success_rate...................: 100.00% ✓ 70448       ✗ 0    
     vus............................: 87      min=0         max=497
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 100821     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 42 MB   641 kB/s
     http_req_blocked...............: avg=10.61µs  min=1.17µs  med=3.19µs   max=27.52ms  p(90)=4.93µs   p(95)=5.91µs   p(99.9)=1.47ms  
     http_req_connecting............: avg=6.31µs   min=0s      med=0s       max=27.46ms  p(90)=0s       p(95)=0s       p(99.9)=1.24ms  
     http_req_duration..............: avg=414.37ms min=3.79ms  med=382.01ms max=1.69s    p(90)=824.35ms p(95)=892.62ms p(99.9)=1.3s    
       { expected_response:true }...: avg=414.37ms min=3.79ms  med=382.01ms max=1.69s    p(90)=824.35ms p(95)=892.62ms p(99.9)=1.3s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 34607
     http_req_receiving.............: avg=95.36µs  min=32.61µs med=80.58µs  max=232.27ms p(90)=115.95µs p(95)=129.33µs p(99.9)=847.08µs
     http_req_sending...............: avg=34.58µs  min=5.72µs  med=14.15µs  max=189.55ms p(90)=21.3µs   p(95)=24.22µs  p(99.9)=2.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=414.24ms min=3.72ms  med=381.83ms max=1.69s    p(90)=824.19ms p(95)=892.54ms p(99.9)=1.3s    
     http_reqs......................: 34607   534.149079/s
     iteration_duration.............: avg=426.97ms min=6.39ms  med=397.83ms max=1.69s    p(90)=827.66ms p(95)=895.29ms p(99.9)=1.31s   
     iterations.....................: 33607   518.714366/s
     success_rate...................: 100.00% ✓ 33607      ✗ 0    
     vus............................: 93      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 46554     ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   293 kB/s
     http_req_blocked...............: avg=17.47µs  min=1.22µs  med=3.55µs   max=19.71ms p(90)=5.29µs   p(95)=6.74µs   p(99.9)=3.07ms  
     http_req_connecting............: avg=11.84µs  min=0s      med=0s       max=19.64ms p(90)=0s       p(95)=0s       p(99.9)=2.95ms  
     http_req_duration..............: avg=880.95ms min=6.22ms  med=796.58ms max=5.25s   p(90)=1.77s    p(95)=1.96s    p(99.9)=4.15s   
       { expected_response:true }...: avg=880.95ms min=6.22ms  med=796.58ms max=5.25s   p(90)=1.77s    p(95)=1.96s    p(99.9)=4.15s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 16518
     http_req_receiving.............: avg=104.11µs min=35.66µs med=95.55µs  max=19.65ms p(90)=133.17µs p(95)=145.15µs p(99.9)=982.67µs
     http_req_sending...............: avg=43.77µs  min=6.27µs  med=17.18µs  max=67.65ms p(90)=23.31µs  p(95)=28.19µs  p(99.9)=5.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=880.8ms  min=6.12ms  med=796.45ms max=5.25s   p(90)=1.77s    p(95)=1.96s    p(99.9)=4.15s   
     http_reqs......................: 16518   243.73433/s
     iteration_duration.............: avg=937.76ms min=63.17ms med=867.12ms max=5.25s   p(90)=1.78s    p(95)=1.98s    p(99.9)=4.18s   
     iterations.....................: 15518   228.97865/s
     success_rate...................: 100.00% ✓ 15518     ✗ 0    
     vus............................: 94      min=0       max=500
     vus_max........................: 500     min=500     max=500
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

     checks.........................: 100.00% ✓ 41025      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   252 kB/s
     http_req_blocked...............: avg=15.24µs  min=1.22µs  med=3.82µs   max=3.69ms  p(90)=5.68µs  p(95)=7.3µs    p(99.9)=2.34ms  
     http_req_connecting............: avg=9.54µs   min=0s      med=0s       max=3.66ms  p(90)=0s      p(95)=0s       p(99.9)=2.31ms  
     http_req_duration..............: avg=993.35ms min=8.66ms  med=916.84ms max=4.02s   p(90)=2.04s   p(95)=2.17s    p(99.9)=3.63s   
       { expected_response:true }...: avg=993.35ms min=8.66ms  med=916.84ms max=4.02s   p(90)=2.04s   p(95)=2.17s    p(99.9)=3.63s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14675
     http_req_receiving.............: avg=116.95µs min=34.54µs med=99.26µs  max=78.8ms  p(90)=140µs   p(95)=153.29µs p(99.9)=814.77µs
     http_req_sending...............: avg=43.72µs  min=5.84µs  med=18.42µs  max=92.43ms p(90)=24.53µs p(95)=29.77µs  p(99.9)=3.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=993.19ms min=8.57ms  med=916.74ms max=4.02s   p(90)=2.04s   p(95)=2.17s    p(99.9)=3.63s   
     http_reqs......................: 14675   209.84885/s
     iteration_duration.............: avg=1.06s    min=31.44ms med=980.56ms max=4.03s   p(90)=2.05s   p(95)=2.18s    p(99.9)=3.65s   
     iterations.....................: 13675   195.549098/s
     success_rate...................: 100.00% ✓ 13675      ✗ 0    
     vus............................: 30      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

