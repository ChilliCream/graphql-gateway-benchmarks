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
| hive-router | v0.0.74 | 2,819 | 2,900 | 2,734 | 2.0% |  |
| fusion-nightly | 16.4.0-p.14 | 2,169 | 2,208 | 2,165 | 0.7% |  |
| fusion | 16.3.0 | 1,983 | 2,068 | 1,970 | 1.6% |  |
| grafbase | 0.53.5 | 1,908 | 1,959 | 1,897 | 1.0% |  |
| cosmo | 0.326.1 | 1,169 | 1,184 | 1,165 | 0.5% |  |
| hive-gateway-router-runtime | 2.10.0 | 502 | 506 | 500 | 0.4% |  |
| hive-gateway | 2.10.0 | 223 | 228 | 220 | 1.0% |  |
| apollo-gateway | 2.14.2 | 217 | 221 | 216 | 0.8% |  |
| feddi | 77271dc84a06 | 0 | 0 | 0 | 0.0% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (136 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.74 | 2,465 | 2,559 | 2,443 | 1.7% |  |
| fusion-nightly | 16.4.0-p.14 | 2,061 | 2,097 | 2,054 | 0.7% |  |
| fusion | 16.3.0 | 1,988 | 2,038 | 1,981 | 1.0% |  |
| grafbase | 0.53.5 | 1,406 | 1,459 | 1,397 | 1.6% |  |
| cosmo | 0.326.1 | 1,088 | 1,101 | 1,082 | 0.5% |  |
| hive-gateway-router-runtime | 2.10.0 | 461 | 470 | 459 | 0.7% |  |
| apollo-router | v2.15.1 | 346 | 358 | 343 | 1.5% |  |
| hive-gateway | 2.10.0 | 211 | 214 | 208 | 0.9% |  |
| apollo-gateway | 2.14.2 | 210 | 212 | 209 | 0.4% |  |
| feddi | 77271dc84a06 | — | — | — | — | non-compatible response (5414260 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 520101      ✗ 0     
     data_received..................: 15 GB   247 MB/s
     data_sent......................: 209 MB  3.4 MB/s
     http_req_blocked...............: avg=28.87µs  min=962ns   med=2.34µs  max=96.7ms   p(90)=3.93µs   p(95)=5.16µs   p(99.9)=4.32ms  
     http_req_connecting............: avg=25.16µs  min=0s      med=0s      max=72.61ms  p(90)=0s       p(95)=0s       p(99.9)=3.86ms  
     http_req_duration..............: avg=81.44ms  min=1.62ms  med=76.33ms max=360.41ms p(90)=157.03ms p(95)=174.77ms p(99.9)=236.25ms
       { expected_response:true }...: avg=81.44ms  min=1.62ms  med=76.33ms max=360.41ms p(90)=157.03ms p(95)=174.77ms p(99.9)=236.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 174367
     http_req_receiving.............: avg=202.78µs min=27.79µs med=52.49µs max=219.13ms p(90)=164.6µs  p(95)=363.38µs p(99.9)=28.28ms 
     http_req_sending...............: avg=85.96µs  min=4.91µs  med=9.8µs   max=164.95ms p(90)=21.06µs  p(95)=127.51µs p(99.9)=13.38ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.15ms  min=1.57ms  med=76.08ms max=359.78ms p(90)=156.61ms p(95)=174.13ms p(99.9)=233.86ms
     http_reqs......................: 174367  2819.350641/s
     iteration_duration.............: avg=82.22ms  min=2.48ms  med=77.16ms max=385.11ms p(90)=157.6ms  p(95)=175.49ms p(99.9)=237.85ms
     iterations.....................: 173367  2803.18158/s
     success_rate...................: 100.00% ✓ 173367      ✗ 0     
     vus............................: 42      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 403728      ✗ 0     
     data_received..................: 12 GB   190 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=11.17µs  min=1µs     med=2.27µs   max=32.73ms  p(90)=3.67µs   p(95)=4.65µs   p(99.9)=1.02ms  
     http_req_connecting............: avg=8.2µs    min=0s      med=0s       max=32.66ms  p(90)=0s       p(95)=0s       p(99.9)=953.94µs
     http_req_duration..............: avg=104.94ms min=2.25ms  med=100.37ms max=449.38ms p(90)=198.86ms p(95)=215.48ms p(99.9)=310.75ms
       { expected_response:true }...: avg=104.94ms min=2.25ms  med=100.37ms max=449.38ms p(90)=198.86ms p(95)=215.48ms p(99.9)=310.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135576
     http_req_receiving.............: avg=937.3µs  min=53.71µs med=114.69µs max=383.47ms p(90)=1.68ms   p(95)=3.13ms   p(99.9)=34.98ms 
     http_req_sending...............: avg=55.75µs  min=5.15µs  med=9.42µs   max=52.69ms  p(90)=18.01µs  p(95)=102.42µs p(99.9)=7.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.95ms min=2.14ms  med=99.37ms  max=449.01ms p(90)=197.78ms p(95)=214.27ms p(99.9)=303.83ms
     http_reqs......................: 135576  2169.848784/s
     iteration_duration.............: avg=105.97ms min=4.42ms  med=101.46ms max=449.62ms p(90)=199.4ms  p(95)=215.99ms p(99.9)=311.72ms
     iterations.....................: 134576  2153.844117/s
     success_rate...................: 100.00% ✓ 134576      ✗ 0     
     vus............................: 80      min=0         max=492 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 369804      ✗ 0     
     data_received..................: 11 GB   174 MB/s
     data_sent......................: 149 MB  2.4 MB/s
     http_req_blocked...............: avg=15.2µs   min=982ns   med=2.18µs   max=104.57ms p(90)=3.54µs   p(95)=4.57µs   p(99.9)=1.52ms  
     http_req_connecting............: avg=12.32µs  min=0s      med=0s       max=104.48ms p(90)=0s       p(95)=0s       p(99.9)=1.44ms  
     http_req_duration..............: avg=114.57ms min=2.35ms  med=97.7ms   max=1.47s    p(90)=216.21ms p(95)=251.25ms p(99.9)=1.08s   
       { expected_response:true }...: avg=114.57ms min=2.35ms  med=97.7ms   max=1.47s    p(90)=216.21ms p(95)=251.25ms p(99.9)=1.08s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 124268
     http_req_receiving.............: avg=2.76ms   min=56.02µs med=119.47µs max=1.13s    p(90)=3.99ms   p(95)=12.9ms   p(99.9)=138.06ms
     http_req_sending...............: avg=62.19µs  min=4.87µs  med=9.35µs   max=346.37ms p(90)=16.48µs  p(95)=91.96µs  p(99.9)=8.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.74ms min=2.25ms  med=95.68ms  max=1.47s    p(90)=212.54ms p(95)=245.46ms p(99.9)=1.07s   
     http_reqs......................: 124268  1983.404409/s
     iteration_duration.............: avg=115.77ms min=3.96ms  med=98.89ms  max=1.47s    p(90)=216.96ms p(95)=252.1ms  p(99.9)=1.09s   
     iterations.....................: 123268  1967.443708/s
     success_rate...................: 100.00% ✓ 123268      ✗ 0     
     vus............................: 88      min=0         max=497 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 353244      ✗ 0     
     data_received..................: 10 GB   168 MB/s
     data_sent......................: 143 MB  2.3 MB/s
     http_req_blocked...............: avg=11.64µs  min=1.24µs  med=3.05µs   max=39.85ms  p(90)=4.71µs   p(95)=5.98µs   p(99.9)=897.29µs
     http_req_connecting............: avg=7.87µs   min=0s      med=0s       max=39.76ms  p(90)=0s       p(95)=0s       p(99.9)=813.58µs
     http_req_duration..............: avg=119.88ms min=1.83ms  med=111.47ms max=467.47ms p(90)=236.11ms p(95)=261.04ms p(99.9)=353.85ms
       { expected_response:true }...: avg=119.88ms min=1.83ms  med=111.47ms max=467.47ms p(90)=236.11ms p(95)=261.04ms p(99.9)=353.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118748
     http_req_receiving.............: avg=104.05µs min=30.78µs med=61.78µs  max=92.9ms   p(90)=105.81µs p(95)=272.02µs p(99.9)=5.61ms  
     http_req_sending...............: avg=61.77µs  min=5.55µs  med=12.23µs  max=223.28ms p(90)=20.31µs  p(95)=109.53µs p(99.9)=7.57ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.71ms min=1.76ms  med=111.29ms max=467.26ms p(90)=235.93ms p(95)=260.9ms  p(99.9)=353.65ms
     http_reqs......................: 118748  1908.91873/s
     iteration_duration.............: avg=121.17ms min=3.59ms  med=112.98ms max=467.9ms  p(90)=236.78ms p(95)=261.66ms p(99.9)=354.36ms
     iterations.....................: 117748  1892.843354/s
     success_rate...................: 100.00% ✓ 117748      ✗ 0     
     vus............................: 67      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 215898      ✗ 0    
     data_received..................: 6.4 GB  103 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=6.87µs   min=1.17µs  med=2.7µs    max=19.13ms  p(90)=4.15µs   p(95)=4.97µs   p(99.9)=547.14µs
     http_req_connecting............: avg=3.44µs   min=0s      med=0s       max=19.06ms  p(90)=0s       p(95)=0s       p(99.9)=494.34µs
     http_req_duration..............: avg=195.51ms min=2.05ms  med=196.35ms max=518.58ms p(90)=361.22ms p(95)=386.72ms p(99.9)=460.47ms
       { expected_response:true }...: avg=195.51ms min=2.05ms  med=196.35ms max=518.58ms p(90)=361.22ms p(95)=386.72ms p(99.9)=460.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72966
     http_req_receiving.............: avg=121.5µs  min=28.85µs med=61.55µs  max=222.95ms p(90)=94.22µs  p(95)=106.32µs p(99.9)=2.91ms  
     http_req_sending...............: avg=28.58µs  min=5.48µs  med=11.53µs  max=27.44ms  p(90)=17.53µs  p(95)=21.1µs   p(99.9)=3.74ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.36ms min=1.98ms  med=196.11ms max=518.49ms p(90)=361.11ms p(95)=386.6ms  p(99.9)=460.41ms
     http_reqs......................: 72966   1169.177761/s
     iteration_duration.............: avg=198.47ms min=3.59ms  med=199.52ms max=518.77ms p(90)=362.09ms p(95)=387.39ms p(99.9)=460.84ms
     iterations.....................: 71966   1153.154165/s
     success_rate...................: 100.00% ✓ 71966       ✗ 0    
     vus............................: 77      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94443      ✗ 0    
     data_received..................: 2.9 GB  44 MB/s
     data_sent......................: 39 MB   603 kB/s
     http_req_blocked...............: avg=8.33µs   min=1.3µs   med=2.89µs   max=4.9ms    p(90)=4.55µs   p(95)=5.66µs   p(99.9)=1ms     
     http_req_connecting............: avg=4.33µs   min=0s      med=0s       max=4.7ms    p(90)=0s       p(95)=0s       p(99.9)=974.88µs
     http_req_duration..............: avg=442.05ms min=4.04ms  med=416.45ms max=2.04s    p(90)=870.27ms p(95)=948.82ms p(99.9)=1.45s   
       { expected_response:true }...: avg=442.05ms min=4.04ms  med=416.45ms max=2.04s    p(90)=870.27ms p(95)=948.82ms p(99.9)=1.45s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32481
     http_req_receiving.............: avg=82.68µs  min=33.76µs med=70.48µs  max=57.46ms  p(90)=106.68µs p(95)=119.7µs  p(99.9)=1.04ms  
     http_req_sending...............: avg=35.79µs  min=5.94µs  med=13.87µs  max=117.33ms p(90)=20.06µs  p(95)=23.7µs   p(99.9)=2.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=441.93ms min=3.99ms  med=416.28ms max=2.04s    p(90)=870.12ms p(95)=948.7ms  p(99.9)=1.45s   
     http_reqs......................: 32481   502.129815/s
     iteration_duration.............: avg=456.31ms min=19.8ms  med=433.26ms max=2.04s    p(90)=874.6ms  p(95)=951.65ms p(99.9)=1.45s   
     iterations.....................: 31481   486.67063/s
     success_rate...................: 100.00% ✓ 31481      ✗ 0    
     vus............................: 87      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42870      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   268 kB/s
     http_req_blocked...............: avg=17.1µs   min=1.6µs   med=3.71µs   max=15.76ms  p(90)=5.68µs   p(95)=7.5µs    p(99.9)=2.81ms
     http_req_connecting............: avg=11.39µs  min=0s      med=0s       max=15.69ms  p(90)=0s       p(95)=0s       p(99.9)=2.78ms
     http_req_duration..............: avg=955.63ms min=6.78ms  med=876.71ms max=5.54s    p(90)=1.93s    p(95)=2.12s    p(99.9)=4.94s 
       { expected_response:true }...: avg=955.63ms min=6.78ms  med=876.71ms max=5.54s    p(90)=1.93s    p(95)=2.12s    p(99.9)=4.94s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15290
     http_req_receiving.............: avg=120.64µs min=40.64µs med=96.48µs  max=131.75ms p(90)=134.31µs p(95)=150.17µs p(99.9)=1.51ms
     http_req_sending...............: avg=60.79µs  min=7.24µs  med=19.12µs  max=148.62ms p(90)=25.11µs  p(95)=31.39µs  p(99.9)=2.91ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=955.45ms min=6.69ms  med=876.59ms max=5.54s    p(90)=1.93s    p(95)=2.12s    p(99.9)=4.94s 
     http_reqs......................: 15290   223.143218/s
     iteration_duration.............: avg=1.02s    min=42.79ms med=956.62ms max=5.56s    p(90)=1.96s    p(95)=2.14s    p(99.9)=4.98s 
     iterations.....................: 14290   208.549156/s
     success_rate...................: 100.00% ✓ 14290      ✗ 0    
     vus............................: 85      min=0        max=500
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

     checks.........................: 100.00% ✓ 42456      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   261 kB/s
     http_req_blocked...............: avg=13.26µs  min=1.43µs  med=3.33µs   max=4.83ms p(90)=4.92µs   p(95)=6.75µs  p(99.9)=2.14ms
     http_req_connecting............: avg=8.14µs   min=0s      med=0s       max=4.73ms p(90)=0s       p(95)=0s      p(99.9)=2.12ms
     http_req_duration..............: avg=960.52ms min=8.85ms  med=887.52ms max=3.71s  p(90)=1.93s    p(95)=2.09s   p(99.9)=3.25s 
       { expected_response:true }...: avg=960.52ms min=8.85ms  med=887.52ms max=3.71s  p(90)=1.93s    p(95)=2.09s   p(99.9)=3.25s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15152
     http_req_receiving.............: avg=94.33µs  min=36.83µs med=83.01µs  max=44.4ms p(90)=117.44µs p(95)=130.3µs p(99.9)=1.17ms
     http_req_sending...............: avg=32.57µs  min=6.09µs  med=16.61µs  max=38.5ms p(90)=21.54µs  p(95)=26.93µs p(99.9)=3.24ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=960.39ms min=8.73ms  med=887.42ms max=3.71s  p(90)=1.93s    p(95)=2.09s   p(99.9)=3.25s 
     http_reqs......................: 15152   217.442925/s
     iteration_duration.............: avg=1.02s    min=39.89ms med=955.82ms max=3.71s  p(90)=1.95s    p(95)=2.1s    p(99.9)=3.28s 
     iterations.....................: 14152   203.092151/s
     success_rate...................: 100.00% ✓ 14152      ✗ 0    
     vus............................: 92      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (rust subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
data_received...: 0 B    0 B/s
     data_sent.......: 1.2 kB 20 B/s
     vus.............: 0      min=0   max=0  
     vus_max.........: 500    min=500 max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 457425      ✗ 0     
     data_received..................: 13 GB   216 MB/s
     data_sent......................: 184 MB  3.0 MB/s
     http_req_blocked...............: avg=19.44µs  min=1.04µs  med=2.43µs  max=60.53ms  p(90)=4.07µs   p(95)=5.26µs   p(99.9)=1.16ms  
     http_req_connecting............: avg=16.17µs  min=0s      med=0s      max=51.88ms  p(90)=0s       p(95)=0s       p(99.9)=1.12ms  
     http_req_duration..............: avg=92.63ms  min=1.79ms  med=87.46ms max=373.74ms p(90)=177.89ms p(95)=194.21ms p(99.9)=244.18ms
       { expected_response:true }...: avg=92.63ms  min=1.79ms  med=87.46ms max=373.74ms p(90)=177.89ms p(95)=194.21ms p(99.9)=244.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153475
     http_req_receiving.............: avg=137.66µs min=25.79µs med=51.43µs max=237.83ms p(90)=132.48µs p(95)=341.81µs p(99.9)=15.35ms 
     http_req_sending...............: avg=72.16µs  min=5.04µs  med=10.16µs max=190.35ms p(90)=21.19µs  p(95)=123.32µs p(99.9)=9.59ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.42ms  min=1.69ms  med=87.27ms max=373.26ms p(90)=177.65ms p(95)=193.91ms p(99.9)=243.53ms
     http_reqs......................: 153475  2465.204721/s
     iteration_duration.............: avg=93.52ms  min=4.66ms  med=88.42ms max=391.68ms p(90)=178.41ms p(95)=194.72ms p(99.9)=245.71ms
     iterations.....................: 152475  2449.142139/s
     success_rate...................: 100.00% ✓ 152475      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 380985      ✗ 0     
     data_received..................: 11 GB   181 MB/s
     data_sent......................: 154 MB  2.5 MB/s
     http_req_blocked...............: avg=15.23µs  min=1.1µs   med=2.76µs   max=52.67ms  p(90)=4.22µs   p(95)=5.22µs   p(99.9)=1.5ms   
     http_req_connecting............: avg=11.8µs   min=0s      med=0s       max=52.59ms  p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=111.17ms min=1.73ms  med=106.13ms max=484.19ms p(90)=211.35ms p(95)=229.01ms p(99.9)=304.98ms
       { expected_response:true }...: avg=111.17ms min=1.73ms  med=106.13ms max=484.19ms p(90)=211.35ms p(95)=229.01ms p(99.9)=304.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 127995
     http_req_receiving.............: avg=1.04ms   min=56.68µs med=127.37µs max=177.12ms p(90)=1.88ms   p(95)=3.41ms   p(99.9)=39.79ms 
     http_req_sending...............: avg=66.31µs  min=5.52µs  med=10.85µs  max=200.49ms p(90)=20.12µs  p(95)=118.58µs p(99.9)=9.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.05ms min=1.63ms  med=104.89ms max=483.96ms p(90)=210.16ms p(95)=227.62ms p(99.9)=301.69ms
     http_reqs......................: 127995  2061.251522/s
     iteration_duration.............: avg=112.32ms min=4.07ms  med=107.38ms max=484.41ms p(90)=211.87ms p(95)=229.48ms p(99.9)=306.44ms
     iterations.....................: 126995  2045.147366/s
     success_rate...................: 100.00% ✓ 126995      ✗ 0     
     vus............................: 62      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 368322      ✗ 0     
     data_received..................: 11 GB   174 MB/s
     data_sent......................: 149 MB  2.4 MB/s
     http_req_blocked...............: avg=31.88µs  min=1.18µs  med=3.04µs   max=80.34ms  p(90)=4.86µs   p(95)=6.19µs   p(99.9)=4.26ms  
     http_req_connecting............: avg=28.1µs   min=0s      med=0s       max=80.25ms  p(90)=0s       p(95)=0s       p(99.9)=4.12ms  
     http_req_duration..............: avg=115ms    min=1.81ms  med=94.82ms  max=2.07s    p(90)=217.55ms p(95)=257.47ms p(99.9)=1.19s   
       { expected_response:true }...: avg=115ms    min=1.81ms  med=94.82ms  max=2.07s    p(90)=217.55ms p(95)=257.47ms p(99.9)=1.19s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 123774
     http_req_receiving.............: avg=2.37ms   min=56.14µs med=123.64µs max=1.7s     p(90)=3.42ms   p(95)=9.65ms   p(99.9)=126.13ms
     http_req_sending...............: avg=79.2µs   min=5.51µs  med=11.6µs   max=210.38ms p(90)=22.12µs  p(95)=117.8µs  p(99.9)=9.81ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.55ms min=1.74ms  med=92.84ms  max=2.07s    p(90)=214.22ms p(95)=250.84ms p(99.9)=1.19s   
     http_reqs......................: 123774  1988.937238/s
     iteration_duration.............: avg=116.27ms min=3.05ms  med=96.29ms  max=2.07s    p(90)=218.37ms p(95)=258.79ms p(99.9)=1.2s    
     iterations.....................: 122774  1972.868134/s
     success_rate...................: 100.00% ✓ 122774      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 262701      ✗ 0    
     data_received..................: 7.8 GB  123 MB/s
     data_sent......................: 106 MB  1.7 MB/s
     http_req_blocked...............: avg=13.62µs  min=1.07µs  med=2.87µs   max=48.34ms  p(90)=5.29µs   p(95)=6.79µs   p(99.9)=1.35ms 
     http_req_connecting............: avg=9.62µs   min=0s      med=0s       max=48.26ms  p(90)=0s       p(95)=0s       p(99.9)=1.19ms 
     http_req_duration..............: avg=160.91ms min=2.4ms   med=148.75ms max=664.95ms p(90)=317.89ms p(95)=361.63ms p(99.9)=528.6ms
       { expected_response:true }...: avg=160.91ms min=2.4ms   med=148.75ms max=664.95ms p(90)=317.89ms p(95)=361.63ms p(99.9)=528.6ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 88567
     http_req_receiving.............: avg=112.42µs min=30.73µs med=67.74µs  max=184.78ms p(90)=128.41µs p(95)=210.06µs p(99.9)=4.84ms 
     http_req_sending...............: avg=55.6µs   min=5.64µs  med=12.24µs  max=80.22ms  p(90)=24.12µs  p(95)=54.01µs  p(99.9)=6.87ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=160.75ms min=2.28ms  med=148.57ms max=664.86ms p(90)=317.69ms p(95)=361.46ms p(99.9)=528.3ms
     http_reqs......................: 88567   1406.296074/s
     iteration_duration.............: avg=163.04ms min=10.46ms med=151.28ms max=665.13ms p(90)=319.09ms p(95)=362.61ms p(99.9)=529.1ms
     iterations.....................: 87567   1390.417743/s
     success_rate...................: 100.00% ✓ 87567       ✗ 0    
     vus............................: 56      min=0         max=498
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 201789      ✗ 0    
     data_received..................: 6.0 GB  95 MB/s
     data_sent......................: 82 MB   1.3 MB/s
     http_req_blocked...............: avg=6.1µs    min=1.21µs  med=3.05µs   max=13.66ms  p(90)=4.68µs   p(95)=5.59µs   p(99.9)=511.15µs
     http_req_connecting............: avg=2.33µs   min=0s      med=0s       max=13.6ms   p(90)=0s       p(95)=0s       p(99.9)=453.47µs
     http_req_duration..............: avg=209.05ms min=2.26ms  med=214.18ms max=560.48ms p(90)=381.42ms p(95)=409.73ms p(99.9)=491.57ms
       { expected_response:true }...: avg=209.05ms min=2.26ms  med=214.18ms max=560.48ms p(90)=381.42ms p(95)=409.73ms p(99.9)=491.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 68263
     http_req_receiving.............: avg=110.16µs min=29.58µs med=68.33µs  max=236.25ms p(90)=104.08µs p(95)=118.13µs p(99.9)=1.91ms  
     http_req_sending...............: avg=29.53µs  min=5.92µs  med=13.25µs  max=21.96ms  p(90)=19.67µs  p(95)=23.45µs  p(99.9)=3.2ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.91ms min=2.15ms  med=213.99ms max=560.41ms p(90)=381.32ms p(95)=409.62ms p(99.9)=491.3ms 
     http_reqs......................: 68263   1088.517728/s
     iteration_duration.............: avg=212.41ms min=5.04ms  med=217.85ms max=560.67ms p(90)=382.43ms p(95)=410.47ms p(99.9)=491.98ms
     iterations.....................: 67263   1072.571787/s
     success_rate...................: 100.00% ✓ 67263       ✗ 0    
     vus............................: 90      min=0         max=500
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 87447      ✗ 0    
     data_received..................: 2.6 GB  40 MB/s
     data_sent......................: 36 MB   554 kB/s
     http_req_blocked...............: avg=10.29µs  min=1.43µs  med=3.39µs   max=11.5ms   p(90)=5.14µs   p(95)=6.29µs   p(99.9)=1.5ms  
     http_req_connecting............: avg=5.67µs   min=0s      med=0s       max=11.43ms  p(90)=0s       p(95)=0s       p(99.9)=1.46ms 
     http_req_duration..............: avg=476.7ms  min=4.4ms   med=447.8ms  max=2.13s    p(90)=933.04ms p(95)=1.02s    p(99.9)=1.55s  
       { expected_response:true }...: avg=476.7ms  min=4.4ms   med=447.8ms  max=2.13s    p(90)=933.04ms p(95)=1.02s    p(99.9)=1.55s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 30149
     http_req_receiving.............: avg=88.39µs  min=33.51µs med=79.2µs   max=9.52ms   p(90)=115.95µs p(95)=130.03µs p(99.9)=991.4µs
     http_req_sending...............: avg=41.6µs   min=6.72µs  med=16.2µs   max=171.89ms p(90)=22.86µs  p(95)=26.93µs  p(99.9)=3.17ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=476.57ms min=4.31ms  med=447.7ms  max=2.13s    p(90)=932.94ms p(95)=1.02s    p(99.9)=1.55s  
     http_reqs......................: 30149   461.435462/s
     iteration_duration.............: avg=493.3ms  min=21.94ms med=465.58ms max=2.14s    p(90)=938.22ms p(95)=1.02s    p(99.9)=1.56s  
     iterations.....................: 29149   446.130296/s
     success_rate...................: 100.00% ✓ 29149      ✗ 0    
     vus............................: 71      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 66210      ✗ 0    
     data_received..................: 2.0 GB  30 MB/s
     data_sent......................: 28 MB   416 kB/s
     http_req_blocked...............: avg=13.61µs  min=1.26µs  med=3.31µs   max=20.54ms p(90)=4.88µs  p(95)=6.01µs  p(99.9)=2.32ms  
     http_req_connecting............: avg=8.98µs   min=0s      med=0s       max=20.5ms  p(90)=0s      p(95)=0s      p(99.9)=2.3ms   
     http_req_duration..............: avg=625.41ms min=5.59ms  med=590.71ms max=3.02s   p(90)=1.26s   p(95)=1.43s   p(99.9)=2.37s   
       { expected_response:true }...: avg=625.41ms min=5.59ms  med=590.71ms max=3.02s   p(90)=1.26s   p(95)=1.43s   p(99.9)=2.37s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 23070
     http_req_receiving.............: avg=89.11µs  min=33.62µs med=79.12µs  max=44.81ms p(90)=114µs   p(95)=125.6µs p(99.9)=865.51µs
     http_req_sending...............: avg=36.16µs  min=6.35µs  med=16.75µs  max=66.5ms  p(90)=21.86µs p(95)=26.25µs p(99.9)=4.01ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=625.28ms min=5.53ms  med=590.6ms  max=3.02s   p(90)=1.26s   p(95)=1.43s   p(99.9)=2.37s   
     http_reqs......................: 23070   346.470778/s
     iteration_duration.............: avg=653.95ms min=22.01ms med=624.78ms max=3.02s   p(90)=1.27s   p(95)=1.44s   p(99.9)=2.4s    
     iterations.....................: 22070   331.452539/s
     success_rate...................: 100.00% ✓ 22070      ✗ 0    
     vus............................: 87      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 41016      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   254 kB/s
     http_req_blocked...............: avg=17.51µs  min=1.14µs  med=3.74µs   max=8.24ms  p(90)=5.74µs  p(95)=8.02µs   p(99.9)=3.22ms
     http_req_connecting............: avg=11.75µs  min=0s      med=0s       max=8ms     p(90)=0s      p(95)=0s       p(99.9)=3.19ms
     http_req_duration..............: avg=994.87ms min=7.5ms   med=887.1ms  max=6.47s   p(90)=1.98s   p(95)=2.21s    p(99.9)=5.75s 
       { expected_response:true }...: avg=994.87ms min=7.5ms   med=887.1ms  max=6.47s   p(90)=1.98s   p(95)=2.21s    p(99.9)=5.75s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14672
     http_req_receiving.............: avg=110.79µs min=36.6µs  med=96.43µs  max=66.73ms p(90)=134µs   p(95)=150.83µs p(99.9)=1.53ms
     http_req_sending...............: avg=31.58µs  min=6.75µs  med=18.85µs  max=30.1ms  p(90)=25.17µs p(95)=31.5µs   p(99.9)=2.5ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=994.73ms min=7.41ms  med=886.99ms max=6.47s   p(90)=1.98s   p(95)=2.21s    p(99.9)=5.75s 
     http_reqs......................: 14672   211.729505/s
     iteration_duration.............: avg=1.06s    min=35.95ms med=983.43ms max=6.48s   p(90)=2.01s   p(95)=2.23s    p(99.9)=5.77s 
     iterations.....................: 13672   197.29865/s
     success_rate...................: 100.00% ✓ 13672      ✗ 0    
     vus............................: 71      min=0        max=500
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

     checks.........................: 100.00% ✓ 41127      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   253 kB/s
     http_req_blocked...............: avg=16.1µs   min=1.41µs  med=3.37µs   max=15.46ms p(90)=5µs     p(95)=7.6µs    p(99.9)=2.59ms
     http_req_connecting............: avg=10.08µs  min=0s      med=0s       max=15.4ms  p(90)=0s      p(95)=0s       p(99.9)=2.45ms
     http_req_duration..............: avg=991.8ms  min=8.87ms  med=915.06ms max=3.97s   p(90)=2.05s   p(95)=2.13s    p(99.9)=3.63s 
       { expected_response:true }...: avg=991.8ms  min=8.87ms  med=915.06ms max=3.97s   p(90)=2.05s   p(95)=2.13s    p(99.9)=3.63s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14709
     http_req_receiving.............: avg=92.51µs  min=33.22µs med=85.85µs  max=3.06ms  p(90)=120.7µs p(95)=132.89µs p(99.9)=1.02ms
     http_req_sending...............: avg=29.03µs  min=6.46µs  med=16.76µs  max=30.33ms p(90)=21.74µs p(95)=27.65µs  p(99.9)=2.25ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=991.67ms min=8.79ms  med=914.95ms max=3.97s   p(90)=2.05s   p(95)=2.13s    p(99.9)=3.63s 
     http_reqs......................: 14709   210.440365/s
     iteration_duration.............: avg=1.06s    min=36.72ms med=1s       max=3.98s   p(90)=2.06s   p(95)=2.14s    p(99.9)=3.65s 
     iterations.....................: 13709   196.133454/s
     success_rate...................: 100.00% ✓ 13709      ✗ 0    
     vus............................: 14      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 7.0.0-27-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=120 GB (observed in 90 run metadata entries)
- Benchmark hardware #2: host=bench-002, os=Linux 7.0.0-27-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=124 GB (observed in 82 run metadata entries)

