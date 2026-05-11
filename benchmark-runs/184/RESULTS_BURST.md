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
| hive-router | v0.0.49 | 2,866 | 2,951 | 2,827 | 1.4% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,040 | 2,080 | 2,034 | 0.8% |  |
| cosmo | 0.307.0 | 1,204 | 1,204 | 1,108 | 5.6% | non-compatible response (22 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 499 | 504 | 496 | 0.6% |  |
| hive-gateway | 2.5.25 | 234 | 235 | 233 | 0.3% |  |
| apollo-gateway | 2.13.3 | 201 | 204 | 199 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (25043 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (433666 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,345 | 2,444 | 2,315 | 1.9% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,944 | 1,962 | 1,781 | 2.8% |  |
| cosmo | 0.307.0 | 1,162 | 1,163 | 1,141 | 0.9% | non-compatible response (11 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 463 | 469 | 457 | 0.9% |  |
| hive-gateway | 2.5.25 | 232 | 234 | 231 | 0.5% |  |
| apollo-gateway | 2.13.3 | 208 | 210 | 206 | 0.6% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (20342 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (261623 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 528840      ✗ 0     
     data_received..................: 16 GB   251 MB/s
     data_sent......................: 213 MB  3.4 MB/s
     http_req_blocked...............: avg=35.56µs  min=962ns   med=2.31µs  max=106.94ms p(90)=3.87µs   p(95)=5.09µs   p(99.9)=9.19ms  
     http_req_connecting............: avg=31.97µs  min=0s      med=0s      max=106.75ms p(90)=0s       p(95)=0s       p(99.9)=9.02ms  
     http_req_duration..............: avg=79.9ms   min=1.55ms  med=72.46ms max=354.49ms p(90)=157.04ms p(95)=178.64ms p(99.9)=244.01ms
       { expected_response:true }...: avg=79.9ms   min=1.55ms  med=72.46ms max=354.49ms p(90)=157.04ms p(95)=178.64ms p(99.9)=244.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177280
     http_req_receiving.............: avg=585.29µs min=29.35µs med=56.04µs max=242.74ms p(90)=281.33µs p(95)=439.53µs p(99.9)=59.61ms 
     http_req_sending...............: avg=102.56µs min=5.34µs  med=9.9µs   max=86.83ms  p(90)=18.97µs  p(95)=135.1µs  p(99.9)=18ms    
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.21ms  min=1.49ms  med=72.02ms max=345.15ms p(90)=155.7ms  p(95)=176.18ms p(99.9)=237.06ms
     http_reqs......................: 177280  2866.570163/s
     iteration_duration.............: avg=80.86ms  min=2.63ms  med=73.37ms max=402.11ms p(90)=157.96ms p(95)=180.14ms p(99.9)=247.37ms
     iterations.....................: 176280  2850.400431/s
     success_rate...................: 100.00% ✓ 176280      ✗ 0     
     vus............................: 96      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 380619      ✗ 0     
     data_received..................: 11 GB   179 MB/s
     data_sent......................: 154 MB  2.5 MB/s
     http_req_blocked...............: avg=15.42µs  min=1.04µs  med=2.23µs   max=76.02ms  p(90)=3.56µs   p(95)=4.52µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=12.54µs  min=0s      med=0s       max=75.96ms  p(90)=0s       p(95)=0s       p(99.9)=1.57ms  
     http_req_duration..............: avg=111.32ms min=2.4ms   med=101.63ms max=694.25ms p(90)=218.51ms p(95)=259.63ms p(99.9)=472.47ms
       { expected_response:true }...: avg=111.32ms min=2.4ms   med=101.63ms max=694.25ms p(90)=218.51ms p(95)=259.63ms p(99.9)=472.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 127873
     http_req_receiving.............: avg=2.49ms   min=51.64µs med=115.57µs max=370.64ms p(90)=1.49ms   p(95)=5.6ms    p(99.9)=182.04ms
     http_req_sending...............: avg=60.24µs  min=5.44µs  med=9.66µs   max=142.47ms p(90)=17.3µs   p(95)=118.11µs p(99.9)=7.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.76ms min=2.28ms  med=100.57ms max=639.23ms p(90)=214.45ms p(95)=249.87ms p(99.9)=421.31ms
     http_reqs......................: 127873  2040.238629/s
     iteration_duration.............: avg=112.46ms min=3.51ms  med=102.88ms max=694.45ms p(90)=219.33ms p(95)=260.48ms p(99.9)=474.12ms
     iterations.....................: 126873  2024.283434/s
     success_rate...................: 100.00% ✓ 126873      ✗ 0     
     vus............................: 88      min=0         max=498 
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

     checks.........................: 100.00% ✓ 222747      ✗ 0    
     data_received..................: 6.6 GB  106 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=13.02µs  min=1.14µs med=2.47µs   max=29.12ms  p(90)=3.96µs   p(95)=4.84µs   p(99.9)=809.3µs 
     http_req_connecting............: avg=9.79µs   min=0s     med=0s       max=29.08ms  p(90)=0s       p(95)=0s       p(99.9)=751.7µs 
     http_req_duration..............: avg=189.6ms  min=2.06ms med=193.14ms max=506.37ms p(90)=351.05ms p(95)=376.74ms p(99.9)=448.85ms
       { expected_response:true }...: avg=189.6ms  min=2.06ms med=193.14ms max=506.37ms p(90)=351.05ms p(95)=376.74ms p(99.9)=448.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75249
     http_req_receiving.............: avg=100.04µs min=29.3µs med=61.09µs  max=101.46ms p(90)=94.12µs  p(95)=108.33µs p(99.9)=3.28ms  
     http_req_sending...............: avg=29.83µs  min=5.43µs med=10.68µs  max=86.93ms  p(90)=16.32µs  p(95)=19.88µs  p(99.9)=3.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.47ms min=1.98ms med=193.02ms max=506.27ms p(90)=350.96ms p(95)=376.6ms  p(99.9)=448.78ms
     http_reqs......................: 75249   1204.297029/s
     iteration_duration.............: avg=192.39ms min=3.68ms med=196.24ms max=506.52ms p(90)=351.87ms p(95)=377.4ms  p(99.9)=449.17ms
     iterations.....................: 74249   1188.292869/s
     success_rate...................: 100.00% ✓ 74249       ✗ 0    
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

     checks.........................: 100.00% ✓ 94224      ✗ 0    
     data_received..................: 2.8 GB  44 MB/s
     data_sent......................: 39 MB   600 kB/s
     http_req_blocked...............: avg=15.67µs  min=1.15µs  med=3.18µs   max=33.52ms  p(90)=5.04µs   p(95)=6.13µs   p(99.9)=4.57ms 
     http_req_connecting............: avg=11.14µs  min=0s      med=0s       max=33.47ms  p(90)=0s       p(95)=0s       p(99.9)=4.1ms  
     http_req_duration..............: avg=443.18ms min=4.11ms  med=411.5ms  max=2.02s    p(90)=874.86ms p(95)=950.31ms p(99.9)=1.43s  
       { expected_response:true }...: avg=443.18ms min=4.11ms  med=411.5ms  max=2.02s    p(90)=874.86ms p(95)=950.31ms p(99.9)=1.43s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 32408
     http_req_receiving.............: avg=146.93µs min=31.09µs med=78.8µs   max=130.53ms p(90)=115.37µs p(95)=130.11µs p(99.9)=15.75ms
     http_req_sending...............: avg=34.81µs  min=5.35µs  med=13.65µs  max=158.8ms  p(90)=21.4µs   p(95)=24.82µs  p(99.9)=4.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=443ms    min=4.03ms  med=411.4ms  max=2.02s    p(90)=874.74ms p(95)=950.19ms p(99.9)=1.43s  
     http_reqs......................: 32408   499.759729/s
     iteration_duration.............: avg=457.53ms min=9.5ms   med=427.78ms max=2.03s    p(90)=878.99ms p(95)=954.1ms  p(99.9)=1.43s  
     iterations.....................: 31408   484.338854/s
     success_rate...................: 100.00% ✓ 31408      ✗ 0    
     vus............................: 98      min=0        max=500
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

     checks.........................: 100.00% ✓ 44994      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   283 kB/s
     http_req_blocked...............: avg=15.65µs  min=1.37µs  med=3.6µs    max=22.98ms p(90)=5.49µs   p(95)=7.13µs   p(99.9)=2.27ms
     http_req_connecting............: avg=10.33µs  min=0s      med=0s       max=22.91ms p(90)=0s       p(95)=0s       p(99.9)=2.23ms
     http_req_duration..............: avg=891.81ms min=6.27ms  med=779.18ms max=18.56s  p(90)=1.57s    p(95)=1.73s    p(99.9)=16.09s
       { expected_response:true }...: avg=891.81ms min=6.27ms  med=779.18ms max=18.56s  p(90)=1.57s    p(95)=1.73s    p(99.9)=16.09s
     http_req_failed................: 0.00%   ✓ 0          ✗ 15998
     http_req_receiving.............: avg=105.28µs min=37.72µs med=93.52µs  max=28.15ms p(90)=134.72µs p(95)=148.28µs p(99.9)=1.06ms
     http_req_sending...............: avg=30.56µs  min=6.56µs  med=17.04µs  max=46.77ms p(90)=24.08µs  p(95)=29.08µs  p(99.9)=2.7ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=891.67ms min=6.13ms  med=779.03ms max=18.56s  p(90)=1.57s    p(95)=1.73s    p(99.9)=16.09s
     http_reqs......................: 15998   234.941197/s
     iteration_duration.............: avg=951.24ms min=40.15ms med=854.62ms max=18.56s  p(90)=1.59s    p(95)=1.75s    p(99.9)=16.09s
     iterations.....................: 14998   220.255536/s
     success_rate...................: 100.00% ✓ 14998      ✗ 0    
     vus............................: 60      min=0        max=499
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

     checks.........................: 100.00% ✓ 41994      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   247 kB/s
     http_req_blocked...............: avg=15.99µs  min=1.23µs  med=3.44µs   max=3.96ms  p(90)=5.12µs   p(95)=6.63µs   p(99.9)=2.52ms  
     http_req_connecting............: avg=10.37µs  min=0s      med=0s       max=3.92ms  p(90)=0s       p(95)=0s       p(99.9)=2.42ms  
     http_req_duration..............: avg=454.53ms min=8.64ms  med=526.69ms max=1.32s   p(90)=776.5ms  p(95)=848.23ms p(99.9)=1.15s   
       { expected_response:true }...: avg=454.53ms min=8.64ms  med=526.69ms max=1.32s   p(90)=776.5ms  p(95)=848.23ms p(99.9)=1.15s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14998
     http_req_receiving.............: avg=97.53µs  min=37.25µs med=90.4µs   max=9.9ms   p(90)=130.67µs p(95)=143.21µs p(99.9)=932.25µs
     http_req_sending...............: avg=44.37µs  min=6.08µs  med=16.02µs  max=126.8ms p(90)=22.52µs  p(95)=27.22µs  p(99.9)=2.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=454.39ms min=8.5ms   med=526.58ms max=1.32s   p(90)=776.39ms p(95)=848.14ms p(99.9)=1.15s   
     http_reqs......................: 14998   201.511339/s
     iteration_duration.............: avg=486.89ms min=8.99ms  med=552.64ms max=1.33s   p(90)=783.44ms p(95)=854.43ms p(99.9)=1.16s   
     iterations.....................: 13998   188.075459/s
     success_rate...................: 100.00% ✓ 13998      ✗ 0    
     vus............................: 70      min=0        max=497
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

     checks.........................: 100.00% ✓ 434055      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=26.07µs  min=1.04µs  med=2.76µs  max=73.68ms  p(90)=4.69µs   p(95)=6.05µs   p(99.9)=2.62ms  
     http_req_connecting............: avg=22.54µs  min=0s      med=0s      max=73.61ms  p(90)=0s       p(95)=0s       p(99.9)=2.57ms  
     http_req_duration..............: avg=97.58ms  min=1.73ms  med=91.43ms max=376.12ms p(90)=189.29ms p(95)=207.68ms p(99.9)=259.82ms
       { expected_response:true }...: avg=97.58ms  min=1.73ms  med=91.43ms max=376.12ms p(90)=189.29ms p(95)=207.68ms p(99.9)=259.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145685
     http_req_receiving.............: avg=281.02µs min=28.94µs med=61.31µs max=86.84ms  p(90)=215.43µs p(95)=448.69µs p(99.9)=33.67ms 
     http_req_sending...............: avg=88.86µs  min=5.48µs  med=11.38µs max=146.33ms p(90)=22.57µs  p(95)=145.35µs p(99.9)=13.74ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.21ms  min=1.64ms  med=91.14ms max=352.2ms  p(90)=188.71ms p(95)=206.86ms p(99.9)=256.74ms
     http_reqs......................: 145685  2345.005521/s
     iteration_duration.............: avg=98.57ms  min=3.67ms  med=92.56ms max=389.24ms p(90)=189.93ms p(95)=208.22ms p(99.9)=261.54ms
     iterations.....................: 144685  2328.90911/s
     success_rate...................: 100.00% ✓ 144685      ✗ 0     
     vus............................: 62      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 359787      ✗ 0     
     data_received..................: 11 GB   170 MB/s
     data_sent......................: 145 MB  2.3 MB/s
     http_req_blocked...............: avg=31.76µs  min=981ns   med=2.29µs   max=69.64ms  p(90)=3.86µs   p(95)=4.95µs   p(99.9)=2.7ms   
     http_req_connecting............: avg=28.42µs  min=0s      med=0s       max=69.61ms  p(90)=0s       p(95)=0s       p(99.9)=2.59ms  
     http_req_duration..............: avg=117.72ms min=1.81ms  med=108.62ms max=854.44ms p(90)=229.04ms p(95)=257.67ms p(99.9)=507.14ms
       { expected_response:true }...: avg=117.72ms min=1.81ms  med=108.62ms max=854.44ms p(90)=229.04ms p(95)=257.67ms p(99.9)=507.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 120929
     http_req_receiving.............: avg=1.81ms   min=49.87µs med=111.12µs max=247.35ms p(90)=1.69ms   p(95)=4.49ms   p(99.9)=145.38ms
     http_req_sending...............: avg=69.95µs  min=5.22µs  med=9.82µs   max=172.28ms p(90)=19.02µs  p(95)=120.08µs p(99.9)=9.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.84ms min=1.73ms  med=107.34ms max=854.36ms p(90)=225.84ms p(95)=252.55ms p(99.9)=505.57ms
     http_reqs......................: 120929  1944.398509/s
     iteration_duration.............: avg=119.02ms min=2.88ms  med=110.22ms max=854.63ms p(90)=229.85ms p(95)=258.72ms p(99.9)=507.99ms
     iterations.....................: 119929  1928.319665/s
     success_rate...................: 100.00% ✓ 119929      ✗ 0     
     vus............................: 66      min=0         max=496 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 215202      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=6.31µs   min=1.07µs  med=2.71µs   max=8.57ms   p(90)=4.44µs   p(95)=5.42µs   p(99.9)=521.02µs
     http_req_connecting............: avg=2.9µs    min=0s      med=0s       max=8.47ms   p(90)=0s       p(95)=0s       p(99.9)=466.04µs
     http_req_duration..............: avg=196.19ms min=2.09ms  med=196.47ms max=561.5ms  p(90)=362.42ms p(95)=390.39ms p(99.9)=477.75ms
       { expected_response:true }...: avg=196.19ms min=2.09ms  med=196.47ms max=561.5ms  p(90)=362.42ms p(95)=390.39ms p(99.9)=477.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72734
     http_req_receiving.............: avg=87.49µs  min=29.88µs med=65.45µs  max=205.06ms p(90)=102.61µs p(95)=118.25µs p(99.9)=1.37ms  
     http_req_sending...............: avg=32.97µs  min=5.65µs  med=11.68µs  max=77.9ms   p(90)=18.29µs  p(95)=22.18µs  p(99.9)=4.11ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.07ms min=2.03ms  med=196.34ms max=561.42ms p(90)=362.32ms p(95)=390.3ms  p(99.9)=477.66ms
     http_reqs......................: 72734   1162.522025/s
     iteration_duration.............: avg=199.17ms min=5.61ms  med=199.6ms  max=561.68ms p(90)=363.24ms p(95)=390.98ms p(99.9)=478.5ms 
     iterations.....................: 71734   1146.538826/s
     success_rate...................: 100.00% ✓ 71734       ✗ 0    
     vus............................: 83      min=0         max=498
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

     checks.........................: 100.00% ✓ 87771      ✗ 0    
     data_received..................: 2.6 GB  41 MB/s
     data_sent......................: 36 MB   557 kB/s
     http_req_blocked...............: avg=10.58µs  min=1.21µs med=3.09µs   max=27.15ms  p(90)=4.85µs   p(95)=5.81µs   p(99.9)=1.88ms 
     http_req_connecting............: avg=6.43µs   min=0s     med=0s       max=27.08ms  p(90)=0s       p(95)=0s       p(99.9)=1.85ms 
     http_req_duration..............: avg=474.87ms min=4.21ms med=443.7ms  max=1.97s    p(90)=933.63ms p(95)=1.02s    p(99.9)=1.51s  
       { expected_response:true }...: avg=474.87ms min=4.21ms med=443.7ms  max=1.97s    p(90)=933.63ms p(95)=1.02s    p(99.9)=1.51s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 30257
     http_req_receiving.............: avg=190.98µs min=33µs   med=80µs     max=210.89ms p(90)=115.9µs  p(95)=129.79µs p(99.9)=31.65ms
     http_req_sending...............: avg=32.76µs  min=5.82µs med=13.67µs  max=253.88ms p(90)=20.59µs  p(95)=23.77µs  p(99.9)=2.55ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=474.64ms min=4.15ms med=443.59ms max=1.97s    p(90)=933.54ms p(95)=1.02s    p(99.9)=1.51s  
     http_reqs......................: 30257   463.552063/s
     iteration_duration.............: avg=491.33ms min=6.69ms med=463.37ms max=1.98s    p(90)=939.45ms p(95)=1.03s    p(99.9)=1.52s  
     iterations.....................: 29257   448.231573/s
     success_rate...................: 100.00% ✓ 29257      ✗ 0    
     vus............................: 68      min=0        max=496
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

     checks.........................: 100.00% ✓ 44571      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   279 kB/s
     http_req_blocked...............: avg=15.82µs  min=1.28µs  med=4.08µs   max=32.32ms  p(90)=6.15µs   p(95)=7.94µs   p(99.9)=1.66ms
     http_req_connecting............: avg=9.89µs   min=0s      med=0s       max=32.24ms  p(90)=0s       p(95)=0s       p(99.9)=1.62ms
     http_req_duration..............: avg=918.73ms min=6.34ms  med=819.97ms max=4.79s    p(90)=1.85s    p(95)=2.04s    p(99.9)=4.4s  
       { expected_response:true }...: avg=918.73ms min=6.34ms  med=819.97ms max=4.79s    p(90)=1.85s    p(95)=2.04s    p(99.9)=4.4s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15857
     http_req_receiving.............: avg=123.54µs min=37.51µs med=104.68µs max=108.27ms p(90)=146.08µs p(95)=159.88µs p(99.9)=1.4ms 
     http_req_sending...............: avg=49.87µs  min=5.71µs  med=19.24µs  max=142.66ms p(90)=25.78µs  p(95)=31.69µs  p(99.9)=4.28ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=918.55ms min=6.23ms  med=819.88ms max=4.79s    p(90)=1.85s    p(95)=2.04s    p(99.9)=4.4s  
     http_reqs......................: 15857   232.739158/s
     iteration_duration.............: avg=980.65ms min=59.02ms med=916.22ms max=4.8s     p(90)=1.88s    p(95)=2.05s    p(99.9)=4.44s 
     iterations.....................: 14857   218.061782/s
     success_rate...................: 100.00% ✓ 14857      ✗ 0    
     vus............................: 63      min=0        max=500
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

     checks.........................: 100.00% ✓ 40602      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   250 kB/s
     http_req_blocked...............: avg=16.09µs  min=1.29µs  med=3.64µs   max=8.51ms   p(90)=5.46µs   p(95)=7.06µs   p(99.9)=2.32ms
     http_req_connecting............: avg=10.65µs  min=0s      med=0s       max=8.44ms   p(90)=0s       p(95)=0s       p(99.9)=2.29ms
     http_req_duration..............: avg=1s       min=8.63ms  med=907.76ms max=4.24s    p(90)=2.05s    p(95)=2.21s    p(99.9)=3.81s 
       { expected_response:true }...: avg=1s       min=8.63ms  med=907.76ms max=4.24s    p(90)=2.05s    p(95)=2.21s    p(99.9)=3.81s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14534
     http_req_receiving.............: avg=133.78µs min=35.78µs med=97.45µs  max=179.38ms p(90)=138.13µs p(95)=150.71µs p(99.9)=1.17ms
     http_req_sending...............: avg=38.4µs   min=5.88µs  med=17.83µs  max=89.43ms  p(90)=23.98µs  p(95)=29.15µs  p(99.9)=2.5ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1s       min=8.54ms  med=907.61ms max=4.24s    p(90)=2.05s    p(95)=2.21s    p(99.9)=3.81s 
     http_reqs......................: 14534   208.16777/s
     iteration_duration.............: avg=1.07s    min=39.11ms med=1s       max=4.24s    p(90)=2.07s    p(95)=2.22s    p(99.9)=3.82s 
     iterations.....................: 13534   193.844957/s
     success_rate...................: 100.00% ✓ 13534      ✗ 0    
     vus............................: 97      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

