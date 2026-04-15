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
| hive-router | v0.0.43 | 2,695 | 2,807 | 2,648 | 2.0% |  |
| hotchocolate | 16.1.0-p.1.2 | 2,053 | 2,091 | 2,029 | 1.0% |  |
| hive-gateway-router-runtime | 2.5.14 | 567 | 578 | 565 | 0.7% |  |
| hive-gateway | 2.5.14 | 249 | 254 | 248 | 0.8% |  |
| apollo-gateway | 2.13.3 | 198 | 203 | 195 | 1.4% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (44045 across 9/9 runs) |
| cosmo | 0.298.0 | — | — | — | — | non-compatible response (17 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (520498 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,347 | 2,455 | 2,299 | 2.0% |  |
| hotchocolate | 16.1.0-p.1.2 | 1,918 | 1,948 | 1,900 | 0.9% |  |
| cosmo | 0.298.0 | 1,132 | 1,147 | 1,125 | 0.7% | non-compatible response (6 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 545 | 555 | 539 | 1.1% |  |
| hive-gateway | 2.5.14 | 241 | 245 | 239 | 0.7% |  |
| apollo-gateway | 2.13.3 | 206 | 209 | 205 | 0.7% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (35786 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (340185 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 497418      ✗ 0     
     data_received..................: 15 GB   236 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=28.61µs  min=1.02µs  med=2.64µs  max=71.34ms  p(90)=4.23µs   p(95)=5.34µs   p(99.9)=5.52ms  
     http_req_connecting............: avg=25.03µs  min=0s      med=0s      max=70.19ms  p(90)=0s       p(95)=0s       p(99.9)=5.19ms  
     http_req_duration..............: avg=85.16ms  min=1.52ms  med=79.17ms max=356.54ms p(90)=165.95ms p(95)=181.7ms  p(99.9)=240.29ms
       { expected_response:true }...: avg=85.16ms  min=1.52ms  med=79.17ms max=356.54ms p(90)=165.95ms p(95)=181.7ms  p(99.9)=240.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 166806
     http_req_receiving.............: avg=454.28µs min=28.84µs med=57.86µs max=79.22ms  p(90)=254.94µs p(95)=428.03µs p(99.9)=55.37ms 
     http_req_sending...............: avg=93.16µs  min=5.37µs  med=10.34µs max=174.12ms p(90)=19.55µs  p(95)=135µs    p(99.9)=14.48ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.61ms  min=1.47ms  med=78.7ms  max=355.93ms p(90)=165.23ms p(95)=180.53ms p(99.9)=234.38ms
     http_reqs......................: 166806  2695.327131/s
     iteration_duration.............: avg=85.98ms  min=2.63ms  med=80.04ms max=437.2ms  p(90)=166.47ms p(95)=182.24ms p(99.9)=243.27ms
     iterations.....................: 165806  2679.168677/s
     success_rate...................: 100.00% ✓ 165806      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 383148      ✗ 0     
     data_received..................: 11 GB   180 MB/s
     data_sent......................: 155 MB  2.5 MB/s
     http_req_blocked...............: avg=17.75µs  min=1.07µs  med=2.61µs   max=44.46ms  p(90)=4.07µs   p(95)=5.07µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=14.37µs  min=0s      med=0s       max=44.41ms  p(90)=0s       p(95)=0s       p(99.9)=1.59ms  
     http_req_duration..............: avg=110.55ms min=2.37ms  med=106.2ms  max=508.22ms p(90)=210.27ms p(95)=234.39ms p(99.9)=359.38ms
       { expected_response:true }...: avg=110.55ms min=2.37ms  med=106.2ms  max=508.22ms p(90)=210.27ms p(95)=234.39ms p(99.9)=359.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128716
     http_req_receiving.............: avg=1.18ms   min=51.32µs med=145.24µs max=305.89ms p(90)=1.34ms   p(95)=3.35ms   p(99.9)=96.87ms 
     http_req_sending...............: avg=65.98µs  min=5.44µs  med=10.27µs  max=185.93ms p(90)=18.97µs  p(95)=125.66µs p(99.9)=8.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.31ms min=2.27ms  med=104.87ms max=506.92ms p(90)=208.75ms p(95)=231.85ms p(99.9)=355.58ms
     http_reqs......................: 128716  2053.877767/s
     iteration_duration.............: avg=111.69ms min=3.95ms  med=107.41ms max=508.46ms p(90)=210.81ms p(95)=235.01ms p(99.9)=361.35ms
     iterations.....................: 127716  2037.921104/s
     success_rate...................: 100.00% ✓ 127716      ✗ 0     
     vus............................: 90      min=0         max=497 
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

     checks.........................: 100.00% ✓ 106770     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   682 kB/s
     http_req_blocked...............: avg=8.27µs   min=1.12µs  med=3.17µs   max=6.36ms  p(90)=5.02µs   p(95)=6.07µs   p(99.9)=956.06µs
     http_req_connecting............: avg=4.08µs   min=0s      med=0s       max=6.29ms  p(90)=0s       p(95)=0s       p(99.9)=838.81µs
     http_req_duration..............: avg=391.97ms min=3.57ms  med=360.06ms max=1.45s   p(90)=781.36ms p(95)=843.84ms p(99.9)=1.23s   
       { expected_response:true }...: avg=391.97ms min=3.57ms  med=360.06ms max=1.45s   p(90)=781.36ms p(95)=843.84ms p(99.9)=1.23s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36590
     http_req_receiving.............: avg=94.99µs  min=32.22µs med=77.49µs  max=95.79ms p(90)=114.99µs p(95)=128.87µs p(99.9)=974.76µs
     http_req_sending...............: avg=29.78µs  min=5.57µs  med=13.88µs  max=62.32ms p(90)=21.7µs   p(95)=25.22µs  p(99.9)=3.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=391.85ms min=3.51ms  med=359.93ms max=1.45s   p(90)=781.26ms p(95)=843.74ms p(99.9)=1.23s   
     http_reqs......................: 36590   567.896069/s
     iteration_duration.............: avg=403.24ms min=19.68ms med=374.93ms max=1.46s   p(90)=784.81ms p(95)=846.56ms p(99.9)=1.23s   
     iterations.....................: 35590   552.375542/s
     success_rate...................: 100.00% ✓ 35590      ✗ 0    
     vus............................: 77      min=0        max=499
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

     checks.........................: 100.00% ✓ 47586      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   300 kB/s
     http_req_blocked...............: avg=14.02µs  min=1.25µs  med=3.57µs  max=20.59ms p(90)=5.47µs   p(95)=7.02µs   p(99.9)=1.83ms  
     http_req_connecting............: avg=8.49µs   min=0s      med=0s      max=20.52ms p(90)=0s       p(95)=0s       p(99.9)=1.63ms  
     http_req_duration..............: avg=842.49ms min=5.67ms  med=728.9ms max=18.07s  p(90)=1.48s    p(95)=1.63s    p(99.9)=16.87s  
       { expected_response:true }...: avg=842.49ms min=5.67ms  med=728.9ms max=18.07s  p(90)=1.48s    p(95)=1.63s    p(99.9)=16.87s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16862
     http_req_receiving.............: avg=106.49µs min=33.93µs med=99.31µs max=9.6ms   p(90)=139.59µs p(95)=152.42µs p(99.9)=985.47µs
     http_req_sending...............: avg=42.65µs  min=5.66µs  med=17.88µs max=81.34ms p(90)=24.16µs  p(95)=28.63µs  p(99.9)=2.94ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=842.35ms min=5.57ms  med=728.6ms max=18.07s  p(90)=1.48s    p(95)=1.63s    p(99.9)=16.87s  
     http_reqs......................: 16862   249.300618/s
     iteration_duration.............: avg=895.7ms  min=35.82ms med=801.3ms max=18.08s  p(90)=1.5s     p(95)=1.65s    p(99.9)=16.89s  
     iterations.....................: 15862   234.515859/s
     success_rate...................: 100.00% ✓ 15862      ✗ 0    
     vus............................: 82      min=0        max=499
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

     checks.........................: 100.00% ✓ 41550      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   244 kB/s
     http_req_blocked...............: avg=13.07µs  min=1.32µs  med=3.37µs   max=3.03ms   p(90)=5.1µs    p(95)=6.57µs   p(99.9)=1.69ms  
     http_req_connecting............: avg=8.06µs   min=0s      med=0s       max=2.99ms   p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=509.82ms min=8.55ms  med=581.75ms max=1.51s    p(90)=876.82ms p(95)=938.15ms p(99.9)=1.29s   
       { expected_response:true }...: avg=509.82ms min=8.55ms  med=581.75ms max=1.51s    p(90)=876.82ms p(95)=938.15ms p(99.9)=1.29s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14850
     http_req_receiving.............: avg=99.5µs   min=33.9µs  med=93.03µs  max=8.82ms   p(90)=132.77µs p(95)=144.88µs p(99.9)=913.21µs
     http_req_sending...............: avg=52.24µs  min=5.66µs  med=17.15µs  max=145.27ms p(90)=23.22µs  p(95)=28.35µs  p(99.9)=3.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=509.66ms min=8.41ms  med=581.63ms max=1.51s    p(90)=876.66ms p(95)=938.03ms p(99.9)=1.29s   
     http_reqs......................: 14850   198.877982/s
     iteration_duration.............: avg=546.52ms min=15.85ms med=610.86ms max=1.52s    p(90)=883.62ms p(95)=945.08ms p(99.9)=1.3s    
     iterations.....................: 13850   185.485526/s
     success_rate...................: 100.00% ✓ 13850      ✗ 0    
     vus............................: 73      min=0        max=500
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

     checks.........................: 100.00% ✓ 434502      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=28.75µs  min=992ns   med=3.04µs  max=70.26ms  p(90)=5.06µs   p(95)=6.43µs   p(99.9)=3.91ms  
     http_req_connecting............: avg=24.69µs  min=0s      med=0s      max=69.98ms  p(90)=0s       p(95)=0s       p(99.9)=3.65ms  
     http_req_duration..............: avg=97.47ms  min=1.67ms  med=91.17ms max=348.18ms p(90)=189.86ms p(95)=208.96ms p(99.9)=262.08ms
       { expected_response:true }...: avg=97.47ms  min=1.67ms  med=91.17ms max=348.18ms p(90)=189.86ms p(95)=208.96ms p(99.9)=262.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145834
     http_req_receiving.............: avg=274.57µs min=28.78µs med=62.53µs max=53.13ms  p(90)=215.04µs p(95)=456.93µs p(99.9)=27.73ms 
     http_req_sending...............: avg=93.16µs  min=5.55µs  med=11.7µs  max=132.99ms p(90)=23.64µs  p(95)=149.97µs p(99.9)=14.93ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.1ms   min=1.58ms  med=90.87ms max=348.12ms p(90)=189.29ms p(95)=208.22ms p(99.9)=260.21ms
     http_reqs......................: 145834  2347.393077/s
     iteration_duration.............: avg=98.45ms  min=4.69ms  med=92.29ms max=381.12ms p(90)=190.5ms  p(95)=209.47ms p(99.9)=263.29ms
     iterations.....................: 144834  2331.29674/s
     success_rate...................: 100.00% ✓ 144834      ✗ 0     
     vus............................: 64      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 355683      ✗ 0     
     data_received..................: 11 GB   168 MB/s
     data_sent......................: 144 MB  2.3 MB/s
     http_req_blocked...............: avg=16.17µs  min=1.03µs med=2.88µs   max=86.9ms   p(90)=4.61µs   p(95)=5.78µs   p(99.9)=2.14ms  
     http_req_connecting............: avg=12.31µs  min=0s     med=0s       max=86.82ms  p(90)=0s       p(95)=0s       p(99.9)=1.93ms  
     http_req_duration..............: avg=119.05ms min=1.83ms med=112.58ms max=778.8ms  p(90)=224.45ms p(95)=249.15ms p(99.9)=656.65ms
       { expected_response:true }...: avg=119.05ms min=1.83ms med=112.58ms max=778.8ms  p(90)=224.45ms p(95)=249.15ms p(99.9)=656.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 119561
     http_req_receiving.............: avg=1.27ms   min=52.5µs med=138.99µs max=218.67ms p(90)=1.54ms   p(95)=3.27ms   p(99.9)=103.02ms
     http_req_sending...............: avg=66.63µs  min=5.61µs med=11.2µs   max=241.82ms p(90)=21.65µs  p(95)=130.12µs p(99.9)=8.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.71ms min=1.75ms med=111.12ms max=778.69ms p(90)=222.75ms p(95)=246.43ms p(99.9)=655.86ms
     http_reqs......................: 119561  1918.809053/s
     iteration_duration.............: avg=120.34ms min=3.16ms med=114.1ms  max=778.94ms p(90)=225.1ms  p(95)=249.83ms p(99.9)=656.99ms
     iterations.....................: 118561  1902.760266/s
     success_rate...................: 100.00% ✓ 118561      ✗ 0     
     vus............................: 71      min=0         max=495 
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

     checks.........................: 100.00% ✓ 209802      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=7.95µs   min=1.08µs  med=2.93µs   max=28.54ms  p(90)=4.77µs   p(95)=5.78µs   p(99.9)=791.72µs
     http_req_connecting............: avg=4.16µs   min=0s      med=0s       max=28.48ms  p(90)=0s       p(95)=0s       p(99.9)=650.19µs
     http_req_duration..............: avg=201.2ms  min=2.11ms  med=201.98ms max=793.82ms p(90)=365.31ms p(95)=394.67ms p(99.9)=595.1ms 
       { expected_response:true }...: avg=201.2ms  min=2.11ms  med=201.98ms max=793.82ms p(90)=365.31ms p(95)=394.67ms p(99.9)=595.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 70934
     http_req_receiving.............: avg=86.91µs  min=29.64µs med=67.13µs  max=129.04ms p(90)=107.63µs p(95)=125.3µs  p(99.9)=1.87ms  
     http_req_sending...............: avg=34.88µs  min=5.38µs  med=12.26µs  max=77.88ms  p(90)=19.85µs  p(95)=23.94µs  p(99.9)=4.02ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.08ms min=2.04ms  med=201.82ms max=793.71ms p(90)=365.2ms  p(95)=394.59ms p(99.9)=595.03ms
     http_reqs......................: 70934   1132.728148/s
     iteration_duration.............: avg=204.34ms min=4.83ms  med=205.29ms max=794.08ms p(90)=366.25ms p(95)=395.43ms p(99.9)=595.6ms 
     iterations.....................: 69934   1116.759386/s
     success_rate...................: 100.00% ✓ 69934       ✗ 0    
     vus............................: 87      min=0         max=495
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

     checks.........................: 100.00% ✓ 102909     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 42 MB   655 kB/s
     http_req_blocked...............: avg=10.05µs  min=1.19µs  med=3.23µs   max=43.58ms p(90)=5.08µs   p(95)=6.08µs   p(99.9)=1.26ms  
     http_req_connecting............: avg=5.84µs   min=0s      med=0s       max=43.48ms p(90)=0s       p(95)=0s       p(99.9)=1.19ms  
     http_req_duration..............: avg=406.46ms min=3.74ms  med=374.73ms max=1.81s   p(90)=802.24ms p(95)=867.81ms p(99.9)=1.31s   
       { expected_response:true }...: avg=406.46ms min=3.74ms  med=374.73ms max=1.81s   p(90)=802.24ms p(95)=867.81ms p(99.9)=1.31s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35303
     http_req_receiving.............: avg=89.95µs  min=31.88µs med=80.94µs  max=20.3ms  p(90)=118.01µs p(95)=132.04µs p(99.9)=949.79µs
     http_req_sending...............: avg=27.36µs  min=5.83µs  med=14.61µs  max=57.32ms p(90)=21.99µs  p(95)=25.53µs  p(99.9)=2.86ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=406.35ms min=3.66ms  med=374.59ms max=1.81s   p(90)=802.14ms p(95)=867.71ms p(99.9)=1.31s   
     http_reqs......................: 35303   545.375066/s
     iteration_duration.............: avg=418.55ms min=16.61ms med=392.14ms max=1.81s   p(90)=805.69ms p(95)=870.57ms p(99.9)=1.32s   
     iterations.....................: 34303   529.926661/s
     success_rate...................: 100.00% ✓ 34303      ✗ 0    
     vus............................: 91      min=0        max=500
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

     checks.........................: 100.00% ✓ 46155      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   290 kB/s
     http_req_blocked...............: avg=16.15µs  min=1.21µs  med=3.66µs   max=21.16ms p(90)=5.57µs   p(95)=7.15µs   p(99.9)=1.83ms
     http_req_connecting............: avg=10.8µs   min=0s      med=0s       max=21.09ms p(90)=0s       p(95)=0s       p(99.9)=1.8ms 
     http_req_duration..............: avg=887.97ms min=5.98ms  med=807.36ms max=5.72s   p(90)=1.76s    p(95)=1.96s    p(99.9)=4.29s 
       { expected_response:true }...: avg=887.97ms min=5.98ms  med=807.36ms max=5.72s   p(90)=1.76s    p(95)=1.96s    p(99.9)=4.29s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16385
     http_req_receiving.............: avg=116.41µs min=38.01µs med=100.97µs max=34.31ms p(90)=140.78µs p(95)=154.29µs p(99.9)=1.47ms
     http_req_sending...............: avg=32.12µs  min=6.32µs  med=18.24µs  max=27.81ms p(90)=24.29µs  p(95)=29.16µs  p(99.9)=2.92ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=887.82ms min=5.85ms  med=807.24ms max=5.72s   p(90)=1.76s    p(95)=1.96s    p(99.9)=4.29s 
     http_reqs......................: 16385   241.404077/s
     iteration_duration.............: avg=945.71ms min=75.14ms med=869.88ms max=5.73s   p(90)=1.79s    p(95)=1.98s    p(99.9)=4.34s 
     iterations.....................: 15385   226.67084/s
     success_rate...................: 100.00% ✓ 15385      ✗ 0    
     vus............................: 8       min=0        max=500
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

     checks.........................: 100.00% ✓ 40287      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   248 kB/s
     http_req_blocked...............: avg=28.23µs  min=1.37µs  med=3.6µs    max=27.71ms p(90)=5.41µs   p(95)=6.95µs   p(99.9)=6ms   
     http_req_connecting............: avg=22.23µs  min=0s      med=0s       max=27.65ms p(90)=0s       p(95)=0s       p(99.9)=5.84ms
     http_req_duration..............: avg=1.01s    min=8.62ms  med=922.19ms max=4.22s   p(90)=2.06s    p(95)=2.2s     p(99.9)=3.82s 
       { expected_response:true }...: avg=1.01s    min=8.62ms  med=922.19ms max=4.22s   p(90)=2.06s    p(95)=2.2s     p(99.9)=3.82s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14429
     http_req_receiving.............: avg=110.53µs min=36.91µs med=98.87µs  max=79.41ms p(90)=139.15µs p(95)=151.94µs p(99.9)=1.13ms
     http_req_sending...............: avg=34.21µs  min=6.27µs  med=18.15µs  max=33.1ms  p(90)=24.19µs  p(95)=29.3µs   p(99.9)=2.6ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.01s    min=8.52ms  med=922.11ms max=4.22s   p(90)=2.06s    p(95)=2.2s     p(99.9)=3.82s 
     http_reqs......................: 14429   206.59001/s
     iteration_duration.............: avg=1.08s    min=61.19ms med=998.92ms max=4.22s   p(90)=2.08s    p(95)=2.2s     p(99.9)=3.88s 
     iterations.....................: 13429   192.272316/s
     success_rate...................: 100.00% ✓ 13429      ✗ 0    
     vus............................: 97      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

