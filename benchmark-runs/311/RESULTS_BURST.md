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
| hive-router | v0.0.84 | 2,797 | 2,999 | 2,742 | 3.1% |  |
| fusion | 16.6.0 | 2,534 | 2,651 | 2,514 | 1.9% |  |
| cosmo | 0.334.0 | 1,239 | 1,277 | 1,228 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 564 | 579 | 562 | 1.0% |  |
| hive-gateway | 2.10.8 | 251 | 257 | 250 | 0.9% |  |
| apollo-gateway | 2.14.3 | 231 | 240 | 230 | 1.5% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (17730 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (537091 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.6.0 | 2,405 | 2,499 | 2,395 | 1.4% |  |
| hive-router | v0.0.84 | 2,230 | 2,377 | 2,210 | 2.5% |  |
| cosmo | 0.334.0 | 1,118 | 1,162 | 1,112 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 522 | 546 | 518 | 1.7% |  |
| hive-gateway | 2.10.8 | 243 | 248 | 242 | 0.8% |  |
| apollo-gateway | 2.14.3 | 239 | 242 | 238 | 0.5% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (32063 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (456666 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 514245      ✗ 0     
     data_received..................: 15 GB   245 MB/s
     data_sent......................: 207 MB  3.4 MB/s
     http_req_blocked...............: avg=19.37µs  min=832ns   med=2.15µs  max=96.35ms  p(90)=3.71µs   p(95)=4.89µs   p(99.9)=1.25ms  
     http_req_connecting............: avg=16.35µs  min=0s      med=0s      max=96.28ms  p(90)=0s       p(95)=0s       p(99.9)=1.12ms  
     http_req_duration..............: avg=82.39ms  min=1.45ms  med=76.93ms max=309.13ms p(90)=156.38ms p(95)=169.62ms p(99.9)=228.07ms
       { expected_response:true }...: avg=82.39ms  min=1.45ms  med=76.93ms max=309.13ms p(90)=156.38ms p(95)=169.62ms p(99.9)=228.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 172415
     http_req_receiving.............: avg=134.87µs min=25.31µs med=49.64µs max=201.54ms p(90)=127.2µs  p(95)=321.65µs p(99.9)=15.29ms 
     http_req_sending...............: avg=67.81µs  min=4.57µs  med=9.17µs  max=223.58ms p(90)=17.84µs  p(95)=111.55µs p(99.9)=9.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.18ms  min=1.4ms   med=76.72ms max=308.54ms p(90)=156.15ms p(95)=169.28ms p(99.9)=226.91ms
     http_reqs......................: 172415  2797.272163/s
     iteration_duration.............: avg=83.16ms  min=2.31ms  med=77.78ms max=318.31ms p(90)=156.83ms p(95)=170.24ms p(99.9)=230.26ms
     iterations.....................: 171415  2781.048098/s
     success_rate...................: 100.00% ✓ 171415      ✗ 0     
     vus............................: 85      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 471879      ✗ 0     
     data_received..................: 14 GB   222 MB/s
     data_sent......................: 190 MB  3.0 MB/s
     http_req_blocked...............: avg=18.94µs min=931ns   med=2.15µs  max=58.58ms  p(90)=3.63µs   p(95)=4.71µs   p(99.9)=1.91ms  
     http_req_connecting............: avg=15.68µs min=0s      med=0s      max=58.41ms  p(90)=0s       p(95)=0s       p(99.9)=1.84ms  
     http_req_duration..............: avg=89.83ms min=1.96ms  med=80.33ms max=1.17s    p(90)=169.21ms p(95)=196.54ms p(99.9)=651.71ms
       { expected_response:true }...: avg=89.83ms min=1.96ms  med=80.33ms max=1.17s    p(90)=169.21ms p(95)=196.54ms p(99.9)=651.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 158293
     http_req_receiving.............: avg=1.36ms  min=52.48µs med=95.19µs max=837.56ms p(90)=1.5ms    p(95)=4.17ms   p(99.9)=99.84ms 
     http_req_sending...............: avg=65.22µs min=4.7µs   med=8.94µs  max=133.27ms p(90)=17.38µs  p(95)=106.81µs p(99.9)=8.89ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.4ms  min=1.88ms  med=79.29ms max=1.16s    p(90)=167.08ms p(95)=193.57ms p(99.9)=647.59ms
     http_reqs......................: 158293  2534.773996/s
     iteration_duration.............: avg=90.66ms min=3.5ms   med=81.21ms max=1.17s    p(90)=169.82ms p(95)=197.19ms p(99.9)=652.08ms
     iterations.....................: 157293  2518.760818/s
     success_rate...................: 100.00% ✓ 157293      ✗ 0     
     vus............................: 77      min=0         max=493 
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

     checks.........................: 100.00% ✓ 229431      ✗ 0    
     data_received..................: 6.8 GB  109 MB/s
     data_sent......................: 93 MB   1.5 MB/s
     http_req_blocked...............: avg=5.49µs   min=971ns  med=2.38µs   max=14.73ms  p(90)=4.19µs   p(95)=5.14µs   p(99.9)=403.84µs
     http_req_connecting............: avg=2.45µs   min=0s     med=0s       max=14.55ms  p(90)=0s       p(95)=0s       p(99.9)=365.98µs
     http_req_duration..............: avg=184.16ms min=1.89ms med=187.32ms max=480.28ms p(90)=340.71ms p(95)=364.1ms  p(99.9)=435.3ms 
       { expected_response:true }...: avg=184.16ms min=1.89ms med=187.32ms max=480.28ms p(90)=340.71ms p(95)=364.1ms  p(99.9)=435.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 77477
     http_req_receiving.............: avg=75.79µs  min=26.9µs med=59.72µs  max=184.72ms p(90)=97.43µs  p(95)=111.26µs p(99.9)=1.09ms  
     http_req_sending...............: avg=29.37µs  min=4.53µs med=10.57µs  max=142.74ms p(90)=17.63µs  p(95)=21.4µs   p(99.9)=3.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.06ms min=1.84ms med=187.2ms  max=480.22ms p(90)=340.56ms p(95)=364.02ms p(99.9)=435.22ms
     http_reqs......................: 77477   1239.447319/s
     iteration_duration.............: avg=186.8ms  min=3.45ms med=190.27ms max=480.47ms p(90)=341.48ms p(95)=364.76ms p(99.9)=435.67ms
     iterations.....................: 76477   1223.449703/s
     success_rate...................: 100.00% ✓ 76477       ✗ 0    
     vus............................: 80      min=0         max=496
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

     checks.........................: 100.00% ✓ 105927     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   678 kB/s
     http_req_blocked...............: avg=9.68µs   min=1.03µs  med=2.55µs  max=8.78ms  p(90)=4.38µs   p(95)=5.31µs   p(99.9)=2.11ms  
     http_req_connecting............: avg=6µs      min=0s      med=0s      max=8.71ms  p(90)=0s       p(95)=0s       p(99.9)=2.01ms  
     http_req_duration..............: avg=395.12ms min=3.56ms  med=364.9ms max=1.64s   p(90)=774.64ms p(95)=846.87ms p(99.9)=1.23s   
       { expected_response:true }...: avg=395.12ms min=3.56ms  med=364.9ms max=1.64s   p(90)=774.64ms p(95)=846.87ms p(99.9)=1.23s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36309
     http_req_receiving.............: avg=79.67µs  min=28.55µs med=66.59µs max=45.41ms p(90)=107.09µs p(95)=121.62µs p(99.9)=785.48µs
     http_req_sending...............: avg=29.52µs  min=5.1µs   med=12.11µs max=57.71ms p(90)=19.89µs  p(95)=22.83µs  p(99.9)=3.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=395.02ms min=3.49ms  med=364.8ms max=1.64s   p(90)=774.57ms p(95)=846.81ms p(99.9)=1.23s   
     http_reqs......................: 36309   564.866764/s
     iteration_duration.............: avg=406.52ms min=25.09ms med=379.4ms max=1.64s   p(90)=778.43ms p(95)=849.49ms p(99.9)=1.23s   
     iterations.....................: 35309   549.309553/s
     success_rate...................: 100.00% ✓ 35309      ✗ 0    
     vus............................: 70      min=0        max=496
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

     checks.........................: 100.00% ✓ 47943      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   303 kB/s
     http_req_blocked...............: avg=14.96µs  min=1.18µs  med=3.44µs   max=9.4ms  p(90)=5.24µs   p(95)=6.67µs   p(99.9)=2.4ms   
     http_req_connecting............: avg=9.87µs   min=0s      med=0s       max=9.33ms p(90)=0s       p(95)=0s       p(99.9)=2.28ms  
     http_req_duration..............: avg=839.21ms min=5.56ms  med=733.98ms max=19.03s p(90)=1.41s    p(95)=1.62s    p(99.9)=17.26s  
       { expected_response:true }...: avg=839.21ms min=5.56ms  med=733.98ms max=19.03s p(90)=1.41s    p(95)=1.62s    p(99.9)=17.26s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16981
     http_req_receiving.............: avg=95.02µs  min=34.79µs med=88.88µs  max=6.03ms p(90)=126.03µs p(95)=140.88µs p(99.9)=978.86µs
     http_req_sending...............: avg=28.2µs   min=5.89µs  med=17.1µs   max=15.3ms p(90)=22.65µs  p(95)=26.84µs  p(99.9)=2.91ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=839.08ms min=5.49ms  med=733.87ms max=19.03s p(90)=1.41s    p(95)=1.62s    p(99.9)=17.26s  
     http_reqs......................: 16981   251.326431/s
     iteration_duration.............: avg=891.69ms min=47.08ms med=776.92ms max=19.03s p(90)=1.44s    p(95)=1.64s    p(99.9)=17.26s  
     iterations.....................: 15981   236.525981/s
     success_rate...................: 100.00% ✓ 15981      ✗ 0    
     vus............................: 81      min=0        max=499
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

     checks.........................: 100.00% ✓ 47820      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   283 kB/s
     http_req_blocked...............: avg=14.66µs  min=1.36µs  med=3.54µs   max=15.69ms  p(90)=5.24µs   p(95)=6.7µs    p(99.9)=2.11ms  
     http_req_connecting............: avg=9.49µs   min=0s      med=0s       max=15.61ms  p(90)=0s       p(95)=0s       p(99.9)=2.09ms  
     http_req_duration..............: avg=386.34ms min=7.64ms  med=430.74ms max=1.14s    p(90)=670.64ms p(95)=719.53ms p(99.9)=1.01s   
       { expected_response:true }...: avg=386.34ms min=7.64ms  med=430.74ms max=1.14s    p(90)=670.64ms p(95)=719.53ms p(99.9)=1.01s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16940
     http_req_receiving.............: avg=104.9µs  min=34.74µs med=87.78µs  max=194.69ms p(90)=126.16µs p(95)=142.06µs p(99.9)=616.41µs
     http_req_sending...............: avg=26.03µs  min=6.36µs  med=17.12µs  max=18.39ms  p(90)=22.81µs  p(95)=27.2µs   p(99.9)=2.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=386.21ms min=7.57ms  med=430.6ms  max=1.14s    p(90)=670.48ms p(95)=719.41ms p(99.9)=1.01s   
     http_reqs......................: 16940   231.055553/s
     iteration_duration.............: avg=410.63ms min=8.2ms   med=449.59ms max=1.16s    p(90)=676.18ms p(95)=722.81ms p(99.9)=1.03s   
     iterations.....................: 15940   217.41591/s
     success_rate...................: 100.00% ✓ 15940      ✗ 0    
     vus............................: 64      min=0        max=494
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 443601      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=19.16µs min=902ns   med=2.29µs   max=121.62ms p(90)=4.06µs   p(95)=5.27µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=15.96µs min=0s      med=0s       max=121.37ms p(90)=0s       p(95)=0s       p(99.9)=1.87ms  
     http_req_duration..............: avg=95.51ms min=1.47ms  med=79.3ms   max=2.14s    p(90)=178.74ms p(95)=211.11ms p(99.9)=998.84ms
       { expected_response:true }...: avg=95.51ms min=1.47ms  med=79.3ms   max=2.14s    p(90)=178.74ms p(95)=211.11ms p(99.9)=998.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148867
     http_req_receiving.............: avg=2.08ms  min=52.27µs med=104.32µs max=1.22s    p(90)=1.82ms   p(95)=5.12ms   p(99.9)=203.5ms 
     http_req_sending...............: avg=67.88µs min=4.53µs  med=9.41µs   max=158.57ms p(90)=19.85µs  p(95)=107.53µs p(99.9)=8.7ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.35ms min=1.36ms  med=78.01ms  max=1.91s    p(90)=176.11ms p(95)=206.91ms p(99.9)=981.12ms
     http_reqs......................: 148867  2405.9622/s
     iteration_duration.............: avg=96.54ms min=2.66ms  med=80.3ms   max=2.14s    p(90)=179.4ms  p(95)=212.3ms  p(99.9)=1s      
     iterations.....................: 147867  2389.800377/s
     success_rate...................: 100.00% ✓ 147867      ✗ 0     
     vus............................: 49      min=0         max=499 
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

     checks.........................: 100.00% ✓ 411273      ✗ 0     
     data_received..................: 12 GB   195 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=14.88µs  min=1.08µs  med=2.89µs  max=41.58ms  p(90)=4.7µs    p(95)=5.96µs   p(99.9)=1.03ms  
     http_req_connecting............: avg=11.18µs  min=0s      med=0s      max=37.36ms  p(90)=0s       p(95)=0s       p(99.9)=1ms     
     http_req_duration..............: avg=103.01ms min=1.5ms   med=97.9ms  max=322.01ms p(90)=199.26ms p(95)=215.7ms  p(99.9)=262.53ms
       { expected_response:true }...: avg=103.01ms min=1.5ms   med=97.9ms  max=322.01ms p(90)=199.26ms p(95)=215.7ms  p(99.9)=262.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138091
     http_req_receiving.............: avg=123.44µs min=27.75µs med=58.69µs max=63.64ms  p(90)=132.58µs p(95)=354.67µs p(99.9)=9.09ms  
     http_req_sending...............: avg=65.94µs  min=4.91µs  med=11.33µs max=204.87ms p(90)=20.28µs  p(95)=126.57µs p(99.9)=8.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.82ms min=1.42ms  med=97.71ms max=321.89ms p(90)=199.04ms p(95)=215.45ms p(99.9)=261.58ms
     http_reqs......................: 138091  2230.978774/s
     iteration_duration.............: avg=104.02ms min=2.88ms  med=99.04ms max=332.35ms p(90)=199.71ms p(95)=216.14ms p(99.9)=263.43ms
     iterations.....................: 137091  2214.822914/s
     success_rate...................: 100.00% ✓ 137091      ✗ 0     
     vus............................: 52      min=0         max=499 
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

     checks.........................: 100.00% ✓ 207186      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=5.63µs   min=962ns  med=2.38µs   max=8.09ms   p(90)=4.1µs    p(95)=5.01µs   p(99.9)=554.13µs
     http_req_connecting............: avg=2.51µs   min=0s     med=0s       max=8.04ms   p(90)=0s       p(95)=0s       p(99.9)=494.79µs
     http_req_duration..............: avg=203.71ms min=2.01ms med=204.61ms max=628.06ms p(90)=377.36ms p(95)=403.45ms p(99.9)=499.13ms
       { expected_response:true }...: avg=203.71ms min=2.01ms med=204.61ms max=628.06ms p(90)=377.36ms p(95)=403.45ms p(99.9)=499.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70062
     http_req_receiving.............: avg=77.12µs  min=27.7µs med=62.44µs  max=205.33ms p(90)=104.6µs  p(95)=121.17µs p(99.9)=816.47µs
     http_req_sending...............: avg=31.05µs  min=4.89µs med=10.9µs   max=151.06ms p(90)=18.4µs   p(95)=21.98µs  p(99.9)=2.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.6ms  min=1.91ms med=204.47ms max=628.02ms p(90)=377.26ms p(95)=403.37ms p(99.9)=499.07ms
     http_reqs......................: 70062   1118.544786/s
     iteration_duration.............: avg=206.9ms  min=4.56ms med=208.14ms max=628.19ms p(90)=378.27ms p(95)=404.22ms p(99.9)=499.49ms
     iterations.....................: 69062   1102.579715/s
     success_rate...................: 100.00% ✓ 69062       ✗ 0    
     vus............................: 87      min=0         max=498
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

     checks.........................: 100.00% ✓ 98400      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   628 kB/s
     http_req_blocked...............: avg=7.29µs   min=1.02µs  med=2.63µs   max=8.64ms   p(90)=4.33µs   p(95)=5.32µs   p(99.9)=629.8µs 
     http_req_connecting............: avg=3.7µs    min=0s      med=0s       max=8.57ms   p(90)=0s       p(95)=0s       p(99.9)=576.28µs
     http_req_duration..............: avg=424.41ms min=3.58ms  med=394.92ms max=1.76s    p(90)=835.28ms p(95)=905.47ms p(99.9)=1.4s    
       { expected_response:true }...: avg=424.41ms min=3.58ms  med=394.92ms max=1.76s    p(90)=835.28ms p(95)=905.47ms p(99.9)=1.4s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 33800
     http_req_receiving.............: avg=92.41µs  min=28.58µs med=71.46µs  max=157.33ms p(90)=110.41µs p(95)=124.36µs p(99.9)=1.05ms  
     http_req_sending...............: avg=25.48µs  min=5.22µs  med=13.38µs  max=61.43ms  p(90)=20.55µs  p(95)=23.23µs  p(99.9)=1.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=424.29ms min=3.47ms  med=394.8ms  max=1.76s    p(90)=835.19ms p(95)=905.39ms p(99.9)=1.4s    
     http_reqs......................: 33800   522.736932/s
     iteration_duration.............: avg=437.57ms min=20.4ms  med=410.34ms max=1.77s    p(90)=839.4ms  p(95)=909.04ms p(99.9)=1.4s    
     iterations.....................: 32800   507.271342/s
     success_rate...................: 100.00% ✓ 32800      ✗ 0    
     vus............................: 87      min=0        max=500
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

     checks.........................: 100.00% ✓ 46527      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   293 kB/s
     http_req_blocked...............: avg=15.17µs  min=1.35µs  med=3.77µs   max=13.37ms  p(90)=5.74µs   p(95)=7.68µs   p(99.9)=2.33ms
     http_req_connecting............: avg=9.42µs   min=0s      med=0s       max=13.31ms  p(90)=0s       p(95)=0s       p(99.9)=2.29ms
     http_req_duration..............: avg=880.87ms min=6.13ms  med=800.98ms max=4.58s    p(90)=1.75s    p(95)=2s       p(99.9)=3.97s 
       { expected_response:true }...: avg=880.87ms min=6.13ms  med=800.98ms max=4.58s    p(90)=1.75s    p(95)=2s       p(99.9)=3.97s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16509
     http_req_receiving.............: avg=107.08µs min=38.6µs  med=96.18µs  max=49.59ms  p(90)=133.91µs p(95)=149.57µs p(99.9)=1.34ms
     http_req_sending...............: avg=40.86µs  min=6.27µs  med=18.93µs  max=104.52ms p(90)=25.09µs  p(95)=30.37µs  p(99.9)=3.31ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=880.73ms min=5.99ms  med=800.89ms max=4.58s    p(90)=1.75s    p(95)=2s       p(99.9)=3.97s 
     http_reqs......................: 16509   243.750052/s
     iteration_duration.............: avg=937.72ms min=27.19ms med=859.97ms max=4.58s    p(90)=1.77s    p(95)=2.02s    p(99.9)=4s    
     iterations.....................: 15509   228.985375/s
     success_rate...................: 100.00% ✓ 15509      ✗ 0    
     vus............................: 91      min=0        max=500
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

     checks.........................: 100.00% ✓ 46209      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   287 kB/s
     http_req_blocked...............: avg=13.12µs  min=1.13µs  med=3.39µs   max=3.53ms  p(90)=5.22µs   p(95)=6.77µs   p(99.9)=2.07ms
     http_req_connecting............: avg=8.04µs   min=0s      med=0s       max=3.5ms   p(90)=0s       p(95)=0s       p(99.9)=2.04ms
     http_req_duration..............: avg=885.18ms min=7.63ms  med=802.31ms max=3.48s   p(90)=1.8s     p(95)=1.89s    p(99.9)=2.65s 
       { expected_response:true }...: avg=885.18ms min=7.63ms  med=802.31ms max=3.48s   p(90)=1.8s     p(95)=1.89s    p(99.9)=2.65s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16403
     http_req_receiving.............: avg=99.53µs  min=30.62µs med=89.86µs  max=42.12ms p(90)=129.81µs p(95)=147.32µs p(99.9)=1.18ms
     http_req_sending...............: avg=28.31µs  min=5.64µs  med=17.71µs  max=15.5ms  p(90)=23.46µs  p(95)=28.24µs  p(99.9)=2.95ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=885.06ms min=7.5ms   med=802.22ms max=3.48s   p(90)=1.8s     p(95)=1.89s    p(99.9)=2.65s 
     http_reqs......................: 16403   239.18228/s
     iteration_duration.............: avg=942.61ms min=28.71ms med=884.17ms max=3.49s   p(90)=1.81s    p(95)=1.91s    p(99.9)=2.66s 
     iterations.....................: 15403   224.600662/s
     success_rate...................: 100.00% ✓ 15403      ✗ 0    
     vus............................: 85      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

