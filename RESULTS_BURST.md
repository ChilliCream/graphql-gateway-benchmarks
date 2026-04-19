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
| hive-router | v0.0.43 | 2,789 | 2,895 | 2,755 | 1.6% |  |
| hotchocolate | 16.1.0-p.1.5 | 2,064 | 2,106 | 2,030 | 1.2% |  |
| cosmo | 0.298.0 | 1,185 | 1,188 | 1,176 | 0.4% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 554 | 562 | 549 | 0.8% |  |
| hive-gateway | 2.5.14 | 247 | 253 | 245 | 1.0% |  |
| apollo-gateway | 2.13.3 | 204 | 208 | 201 | 1.0% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (39196 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (443281 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,241 | 2,347 | 2,207 | 2.1% |  |
| hotchocolate | 16.1.0-p.1.5 | 1,929 | 1,974 | 1,899 | 1.2% |  |
| cosmo | 0.298.0 | 1,107 | 1,132 | 1,103 | 1.0% | non-compatible response (8 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 536 | 545 | 527 | 1.2% |  |
| hive-gateway | 2.5.14 | 244 | 246 | 240 | 0.9% |  |
| apollo-gateway | 2.13.3 | 211 | 214 | 210 | 0.6% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (36847 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (217823 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 515361      ✗ 0     
     data_received..................: 15 GB   245 MB/s
     data_sent......................: 208 MB  3.4 MB/s
     http_req_blocked...............: avg=29.32µs  min=1.02µs  med=2.25µs  max=64.36ms  p(90)=3.66µs   p(95)=4.73µs   p(99.9)=10.41ms 
     http_req_connecting............: avg=26.05µs  min=0s      med=0s      max=64.28ms  p(90)=0s       p(95)=0s       p(99.9)=10.14ms 
     http_req_duration..............: avg=82.17ms  min=1.63ms  med=76.26ms max=297.64ms p(90)=159.4ms  p(95)=176.55ms p(99.9)=238.67ms
       { expected_response:true }...: avg=82.17ms  min=1.63ms  med=76.26ms max=297.64ms p(90)=159.4ms  p(95)=176.55ms p(99.9)=238.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 172787
     http_req_receiving.............: avg=351.13µs min=27.96µs med=54.79µs max=134.55ms p(90)=246.2µs  p(95)=411.72µs p(99.9)=46.72ms 
     http_req_sending...............: avg=86.02µs  min=5.19µs  med=9.92µs  max=72.87ms  p(90)=18.63µs  p(95)=131.52µs p(99.9)=12.34ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.73ms  min=1.56ms  med=75.94ms max=275.62ms p(90)=158.73ms p(95)=175.46ms p(99.9)=236.15ms
     http_reqs......................: 172787  2789.185537/s
     iteration_duration.............: avg=82.98ms  min=2.29ms  med=77.14ms max=338.81ms p(90)=160ms    p(95)=177.29ms p(99.9)=244.75ms
     iterations.....................: 171787  2773.043203/s
     success_rate...................: 100.00% ✓ 171787      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 385014      ✗ 0     
     data_received..................: 11 GB   181 MB/s
     data_sent......................: 155 MB  2.5 MB/s
     http_req_blocked...............: avg=14.99µs  min=1.02µs  med=2.48µs   max=46.92ms  p(90)=3.91µs   p(95)=4.84µs   p(99.9)=1.82ms  
     http_req_connecting............: avg=11.63µs  min=0s      med=0s       max=46.87ms  p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=110.03ms min=2.35ms  med=105.98ms max=505.98ms p(90)=209.56ms p(95)=231.37ms p(99.9)=354.93ms
       { expected_response:true }...: avg=110.03ms min=2.35ms  med=105.98ms max=505.98ms p(90)=209.56ms p(95)=231.37ms p(99.9)=354.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 129338
     http_req_receiving.............: avg=1.31ms   min=51.94µs med=154.9µs  max=237.7ms  p(90)=1.35ms   p(95)=3.47ms   p(99.9)=100.37ms
     http_req_sending...............: avg=63.92µs  min=5.45µs  med=10.09µs  max=122.99ms p(90)=18.28µs  p(95)=126.89µs p(99.9)=8.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.66ms min=2.24ms  med=104.59ms max=505.86ms p(90)=207.92ms p(95)=228.78ms p(99.9)=350.9ms 
     http_reqs......................: 129338  2064.795617/s
     iteration_duration.............: avg=111.15ms min=3.18ms  med=107.12ms max=506.2ms  p(90)=210.07ms p(95)=231.98ms p(99.9)=355.69ms
     iterations.....................: 128338  2048.831278/s
     success_rate...................: 100.00% ✓ 128338      ✗ 0     
     vus............................: 85      min=0         max=499 
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

     checks.........................: 100.00% ✓ 219210      ✗ 0    
     data_received..................: 6.5 GB  104 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=5.43µs   min=1.11µs  med=2.15µs   max=32.68ms  p(90)=3.51µs   p(95)=4.33µs   p(99.9)=389.4µs 
     http_req_connecting............: avg=2.63µs   min=0s      med=0s       max=32.63ms  p(90)=0s       p(95)=0s       p(99.9)=302.62µs
     http_req_duration..............: avg=192.63ms min=2.07ms  med=193.89ms max=606.38ms p(90)=357.21ms p(95)=384.54ms p(99.9)=500.18ms
       { expected_response:true }...: avg=192.63ms min=2.07ms  med=193.89ms max=606.38ms p(90)=357.21ms p(95)=384.54ms p(99.9)=500.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74070
     http_req_receiving.............: avg=74.17µs  min=30.23µs med=58.77µs  max=186.5ms  p(90)=89.51µs  p(95)=102.05µs p(99.9)=1.19ms  
     http_req_sending...............: avg=25.37µs  min=5.29µs  med=10.11µs  max=23.58ms  p(90)=14.96µs  p(95)=18.37µs  p(99.9)=3.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.53ms min=2ms     med=193.8ms  max=606.32ms p(90)=357.12ms p(95)=384.47ms p(99.9)=500.07ms
     http_reqs......................: 74070   1185.084933/s
     iteration_duration.............: avg=195.49ms min=5.1ms   med=196.92ms max=606.79ms p(90)=358.07ms p(95)=385.12ms p(99.9)=500.5ms 
     iterations.....................: 73070   1169.085407/s
     success_rate...................: 100.00% ✓ 73070       ✗ 0    
     vus............................: 81      min=0         max=494
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

     checks.........................: 100.00% ✓ 104250     ✗ 0    
     data_received..................: 3.1 GB  49 MB/s
     data_sent......................: 43 MB   666 kB/s
     http_req_blocked...............: avg=6.92µs   min=1.11µs  med=2.76µs   max=4.53ms   p(90)=4.5µs    p(95)=5.48µs   p(99.9)=665.85µs
     http_req_connecting............: avg=3.1µs    min=0s      med=0s       max=4.47ms   p(90)=0s       p(95)=0s       p(99.9)=564.63µs
     http_req_duration..............: avg=401.39ms min=3.67ms  med=373.84ms max=1.58s    p(90)=794.11ms p(95)=862.76ms p(99.9)=1.29s   
       { expected_response:true }...: avg=401.39ms min=3.67ms  med=373.84ms max=1.58s    p(90)=794.11ms p(95)=862.76ms p(99.9)=1.29s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35750
     http_req_receiving.............: avg=84.47µs  min=33.45µs med=72.56µs  max=109.29ms p(90)=107.05µs p(95)=119.76µs p(99.9)=788.71µs
     http_req_sending...............: avg=28.52µs  min=5.33µs  med=12.7µs   max=57.48ms  p(90)=19.9µs   p(95)=23.13µs  p(99.9)=2.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=401.28ms min=3.61ms  med=373.76ms max=1.58s    p(90)=794.01ms p(95)=862.65ms p(99.9)=1.29s   
     http_reqs......................: 35750   554.875494/s
     iteration_duration.............: avg=413.16ms min=20.93ms med=389.06ms max=1.58s    p(90)=798.4ms  p(95)=865.04ms p(99.9)=1.29s   
     iterations.....................: 34750   539.354502/s
     success_rate...................: 100.00% ✓ 34750      ✗ 0    
     vus............................: 77      min=0        max=498
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

     checks.........................: 100.00% ✓ 47273      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   298 kB/s
     http_req_blocked...............: avg=15.48µs  min=1.19µs  med=3.7µs    max=31.59ms p(90)=5.56µs   p(95)=6.99µs   p(99.9)=2.52ms  
     http_req_connecting............: avg=10.24µs  min=0s      med=0s       max=31.51ms p(90)=0s       p(95)=0s       p(99.9)=2.5ms   
     http_req_duration..............: avg=850.67ms min=5.83ms  med=773.16ms max=16.43s  p(90)=1.54s    p(95)=1.69s    p(99.9)=14.08s  
       { expected_response:true }...: avg=850.67ms min=5.83ms  med=773.16ms max=16.43s  p(90)=1.54s    p(95)=1.69s    p(99.9)=14.08s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16758
     http_req_receiving.............: avg=103.51µs min=36.06µs med=98.05µs  max=6.34ms  p(90)=137.29µs p(95)=150.42µs p(99.9)=975.86µs
     http_req_sending...............: avg=29.6µs   min=5.99µs  med=18.53µs  max=11.01ms p(90)=24.78µs  p(95)=29.24µs  p(99.9)=3.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=850.53ms min=5.71ms  med=773.07ms max=16.43s  p(90)=1.54s    p(95)=1.69s    p(99.9)=14.08s  
     http_reqs......................: 16758   247.866492/s
     iteration_duration.............: avg=903.67ms min=50.35ms med=849.57ms max=16.44s  p(90)=1.57s    p(95)=1.7s     p(99.9)=14.08s  
     iterations.....................: 15757   233.060766/s
     success_rate...................: 100.00% ✓ 15757      ✗ 0    
     vus............................: 87      min=0        max=500
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

     checks.........................: 100.00% ✓ 42618      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   251 kB/s
     http_req_blocked...............: avg=14.73µs  min=1.27µs  med=3.35µs   max=7.2ms   p(90)=5.02µs   p(95)=6.42µs   p(99.9)=2.5ms   
     http_req_connecting............: avg=9.78µs   min=0s      med=0s       max=7.16ms  p(90)=0s       p(95)=0s       p(99.9)=2.47ms  
     http_req_duration..............: avg=462.23ms min=8.53ms  med=543.8ms  max=1.37s   p(90)=798.86ms p(95)=844.49ms p(99.9)=1.21s   
       { expected_response:true }...: avg=462.23ms min=8.53ms  med=543.8ms  max=1.37s   p(90)=798.86ms p(95)=844.49ms p(99.9)=1.21s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15206
     http_req_receiving.............: avg=96.46µs  min=32.52µs med=90.62µs  max=7.77ms  p(90)=129.15µs p(95)=141.72µs p(99.9)=772.42µs
     http_req_sending...............: avg=28.24µs  min=5.89µs  med=16.82µs  max=24.78ms p(90)=22.71µs  p(95)=27.32µs  p(99.9)=2.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=462.1ms  min=8.43ms  med=543.67ms max=1.37s   p(90)=798.74ms p(95)=844.36ms p(99.9)=1.21s   
     http_reqs......................: 15206   204.338601/s
     iteration_duration.............: avg=494.58ms min=8.78ms  med=565.67ms max=1.38s   p(90)=804.98ms p(95)=848.65ms p(99.9)=1.22s   
     iterations.....................: 14206   190.900577/s
     success_rate...................: 100.00% ✓ 14206      ✗ 0    
     vus............................: 68      min=0        max=495
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

     checks.........................: 100.00% ✓ 414834      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=21µs     min=1.1µs   med=2.38µs  max=59.99ms  p(90)=3.97µs   p(95)=5.19µs   p(99.9)=4.02ms  
     http_req_connecting............: avg=17.74µs  min=0s      med=0s      max=59.93ms  p(90)=0s       p(95)=0s       p(99.9)=3.7ms   
     http_req_duration..............: avg=102.11ms min=1.68ms  med=96.65ms max=315.44ms p(90)=197.21ms p(95)=212.6ms  p(99.9)=266.08ms
       { expected_response:true }...: avg=102.11ms min=1.68ms  med=96.65ms max=315.44ms p(90)=197.21ms p(95)=212.6ms  p(99.9)=266.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139278
     http_req_receiving.............: avg=207.13µs min=28.88µs med=59.9µs  max=153.29ms p(90)=170.44µs p(95)=409.38µs p(99.9)=24.16ms 
     http_req_sending...............: avg=78.14µs  min=5.33µs  med=10.74µs max=89.29ms  p(90)=20.59µs  p(95)=135.81µs p(99.9)=11.71ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.82ms min=1.59ms  med=96.43ms max=310.66ms p(90)=196.87ms p(95)=212.13ms p(99.9)=261.76ms
     http_reqs......................: 139278  2241.606842/s
     iteration_duration.............: avg=103.12ms min=2.38ms  med=97.77ms max=349.07ms p(90)=197.72ms p(95)=213.07ms p(99.9)=266.85ms
     iterations.....................: 138278  2225.512363/s
     success_rate...................: 100.00% ✓ 138278      ✗ 0     
     vus............................: 64      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 356997      ✗ 0     
     data_received..................: 11 GB   169 MB/s
     data_sent......................: 144 MB  2.3 MB/s
     http_req_blocked...............: avg=12.18µs  min=1.03µs  med=2.32µs   max=31.71ms  p(90)=3.87µs   p(95)=4.98µs   p(99.9)=1.63ms  
     http_req_connecting............: avg=9.2µs    min=0s      med=0s       max=31.57ms  p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=118.62ms min=1.75ms  med=112.76ms max=1s       p(90)=224.11ms p(95)=249.03ms p(99.9)=609.35ms
       { expected_response:true }...: avg=118.62ms min=1.75ms  med=112.76ms max=1s       p(90)=224.11ms p(95)=249.03ms p(99.9)=609.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 119999
     http_req_receiving.............: avg=1.38ms   min=51.64µs med=140.33µs max=180.01ms p(90)=1.56ms   p(95)=3.54ms   p(99.9)=118.49ms
     http_req_sending...............: avg=56.23µs  min=5.38µs  med=10.07µs  max=70.45ms  p(90)=19.36µs  p(95)=119.49µs p(99.9)=7.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.18ms min=1.67ms  med=111.21ms max=1s       p(90)=222.15ms p(95)=245.79ms p(99.9)=608.21ms
     http_reqs......................: 119999  1929.747151/s
     iteration_duration.............: avg=119.87ms min=3.16ms  med=114.07ms max=1s       p(90)=224.69ms p(95)=249.63ms p(99.9)=610.41ms
     iterations.....................: 118999  1913.66579/s
     success_rate...................: 100.00% ✓ 118999      ✗ 0     
     vus............................: 66      min=0         max=496 
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

     checks.........................: 100.00% ✓ 204993      ✗ 0    
     data_received..................: 6.1 GB  97 MB/s
     data_sent......................: 83 MB   1.3 MB/s
     http_req_blocked...............: avg=6.85µs   min=1.13µs  med=2.5µs    max=36.24ms  p(90)=4.25µs   p(95)=5.24µs   p(99.9)=513.19µs
     http_req_connecting............: avg=3.54µs   min=0s      med=0s       max=36.18ms  p(90)=0s       p(95)=0s       p(99.9)=456.18µs
     http_req_duration..............: avg=205.84ms min=2.13ms  med=205.31ms max=589.15ms p(90)=383.91ms p(95)=411.66ms p(99.9)=506.35ms
       { expected_response:true }...: avg=205.84ms min=2.13ms  med=205.31ms max=589.15ms p(90)=383.91ms p(95)=411.66ms p(99.9)=506.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69331
     http_req_receiving.............: avg=85.85µs  min=29.71µs med=66.19µs  max=250.52ms p(90)=102.46µs p(95)=117.23µs p(99.9)=1.37ms  
     http_req_sending...............: avg=30.78µs  min=5.27µs  med=11.38µs  max=95.43ms  p(90)=18.37µs  p(95)=22.15µs  p(99.9)=3.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.72ms min=2.06ms  med=205.2ms  max=589.04ms p(90)=383.79ms p(95)=411.57ms p(99.9)=506.29ms
     http_reqs......................: 69331   1107.157461/s
     iteration_duration.............: avg=209.12ms min=4.56ms  med=208.83ms max=589.35ms p(90)=384.83ms p(95)=412.31ms p(99.9)=507.76ms
     iterations.....................: 68331   1091.188306/s
     success_rate...................: 100.00% ✓ 68331       ✗ 0    
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

     checks.........................: 100.00% ✓ 101181     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 42 MB   644 kB/s
     http_req_blocked...............: avg=9.06µs   min=1.18µs  med=2.91µs   max=4.87ms   p(90)=4.71µs   p(95)=5.72µs   p(99.9)=1.58ms 
     http_req_connecting............: avg=5.15µs   min=0s      med=0s       max=4.83ms   p(90)=0s       p(95)=0s       p(99.9)=1.46ms 
     http_req_duration..............: avg=413.22ms min=3.82ms  med=381.98ms max=1.63s    p(90)=810.69ms p(95)=882.58ms p(99.9)=1.31s  
       { expected_response:true }...: avg=413.22ms min=3.82ms  med=381.98ms max=1.63s    p(90)=810.69ms p(95)=882.58ms p(99.9)=1.31s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 34727
     http_req_receiving.............: avg=91.9µs   min=31.33µs med=77.26µs  max=198.36ms p(90)=113.95µs p(95)=126.46µs p(99.9)=886.4µs
     http_req_sending...............: avg=27.75µs  min=5.51µs  med=13.71µs  max=48.65ms  p(90)=21.12µs  p(95)=24.4µs   p(99.9)=2.77ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=413.1ms  min=3.71ms  med=381.87ms max=1.63s    p(90)=810.43ms p(95)=882.48ms p(99.9)=1.31s  
     http_reqs......................: 34727   536.423802/s
     iteration_duration.............: avg=425.69ms min=21.51ms med=398.96ms max=1.63s    p(90)=814.58ms p(95)=885.43ms p(99.9)=1.31s  
     iterations.....................: 33727   520.976922/s
     success_rate...................: 100.00% ✓ 33727      ✗ 0    
     vus............................: 92      min=0        max=500
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

     checks.........................: 100.00% ✓ 46836      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 20 MB   294 kB/s
     http_req_blocked...............: avg=15.09µs  min=1.36µs  med=3.81µs   max=5.94ms  p(90)=5.7µs    p(95)=7.17µs   p(99.9)=2.49ms  
     http_req_connecting............: avg=9.54µs   min=0s      med=0s       max=5.76ms  p(90)=0s       p(95)=0s       p(99.9)=2.47ms  
     http_req_duration..............: avg=875.21ms min=6.26ms  med=799.88ms max=5.47s   p(90)=1.74s    p(95)=1.93s    p(99.9)=3.94s   
       { expected_response:true }...: avg=875.21ms min=6.26ms  med=799.88ms max=5.47s   p(90)=1.74s    p(95)=1.93s    p(99.9)=3.94s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16612
     http_req_receiving.............: avg=109.06µs min=38.37µs med=98.25µs  max=74.66ms p(90)=138.04µs p(95)=151.42µs p(99.9)=997.12µs
     http_req_sending...............: avg=32.08µs  min=6.59µs  med=18.4µs   max=64.36ms p(90)=24.6µs   p(95)=29.23µs  p(99.9)=2.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=875.07ms min=6.14ms  med=799.77ms max=5.47s   p(90)=1.74s    p(95)=1.93s    p(99.9)=3.94s   
     http_reqs......................: 16612   244.57207/s
     iteration_duration.............: avg=931.32ms min=55.67ms med=873.95ms max=5.47s   p(90)=1.75s    p(95)=1.94s    p(99.9)=3.98s   
     iterations.....................: 15612   229.849455/s
     success_rate...................: 100.00% ✓ 15612      ✗ 0    
     vus............................: 24      min=0        max=500
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

     checks.........................: 100.00% ✓ 41370      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   254 kB/s
     http_req_blocked...............: avg=18.48µs  min=1.3µs   med=3.64µs   max=15.72ms p(90)=5.43µs   p(95)=7.12µs   p(99.9)=3.06ms  
     http_req_connecting............: avg=12.97µs  min=0s      med=0s       max=15.65ms p(90)=0s       p(95)=0s       p(99.9)=2.89ms  
     http_req_duration..............: avg=985.05ms min=8.64ms  med=888.62ms max=4.02s   p(90)=2.02s    p(95)=2.14s    p(99.9)=3.65s   
       { expected_response:true }...: avg=985.05ms min=8.64ms  med=888.62ms max=4.02s   p(90)=2.02s    p(95)=2.14s    p(99.9)=3.65s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14790
     http_req_receiving.............: avg=107.68µs min=35.13µs med=97µs     max=51.54ms p(90)=137.05µs p(95)=149.95µs p(99.9)=810.12µs
     http_req_sending...............: avg=34.94µs  min=6.17µs  med=18.18µs  max=84.44ms p(90)=24.22µs  p(95)=29.09µs  p(99.9)=2.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=984.91ms min=8.53ms  med=888.52ms max=4.02s   p(90)=2.02s    p(95)=2.14s    p(99.9)=3.65s   
     http_reqs......................: 14790   211.974431/s
     iteration_duration.............: avg=1.05s    min=38.19ms med=982.04ms max=4.02s   p(90)=2.03s    p(95)=2.14s    p(99.9)=3.66s   
     iterations.....................: 13790   197.642151/s
     success_rate...................: 100.00% ✓ 13790      ✗ 0    
     vus............................: 91      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

