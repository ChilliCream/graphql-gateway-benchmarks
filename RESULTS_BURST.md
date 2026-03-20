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
| hive-router | v0.0.41 | 2,643 | 2,722 | 2,577 | 1.8% |  |
| hotchocolate | 16.0.0-p.11.52 | 1,663 | 1,693 | 1,658 | 1.1% | non-compatible response (2482231 across 6/9 runs) |
| cosmo | 0.291.0 | 1,183 | 1,212 | 1,174 | 1.7% | non-compatible response (14 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.6 | 473 | 481 | 470 | 0.7% |  |
| hive-gateway | 2.5.6 | 239 | 241 | 236 | 0.6% |  |
| apollo-gateway | 2.13.2 | 210 | 216 | 207 | 1.3% |  |
| apollo-router | v2.12.0 | — | — | — | — | non-compatible response (42974 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (475428 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 2,115 | 2,209 | 2,072 | 2.1% |  |
| hotchocolate | 16.0.0-p.11.52 | 1,580 | 1,588 | 1,538 | 1.1% | non-compatible response (1377881 across 3/9 runs) |
| cosmo | 0.291.0 | 1,111 | 1,112 | 1,098 | 0.7% | non-compatible response (13 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.6 | 453 | 464 | 449 | 1.1% |  |
| hive-gateway | 2.5.6 | 245 | 246 | 242 | 0.5% |  |
| apollo-gateway | 2.13.2 | 202 | 205 | 202 | 0.5% |  |
| apollo-router | v2.12.0 | — | — | — | — | non-compatible response (32257 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (247103 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 486673      ✗ 0     
     data_received..................: 14 GB   232 MB/s
     data_sent......................: 196 MB  3.2 MB/s
     http_req_blocked...............: avg=29.09µs  min=971ns   med=2.68µs  max=86.72ms  p(90)=4.25µs   p(95)=5.38µs   p(99.9)=4.01ms  
     http_req_connecting............: avg=25.72µs  min=0s      med=0s      max=86.55ms  p(90)=0s       p(95)=0s       p(99.9)=3.97ms  
     http_req_duration..............: avg=87.02ms  min=1.51ms  med=81.21ms max=307.29ms p(90)=168.67ms p(95)=188.21ms p(99.9)=256.62ms
       { expected_response:true }...: avg=87.02ms  min=1.51ms  med=81.21ms max=307.29ms p(90)=168.67ms p(95)=188.21ms p(99.9)=256.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 163225
     http_req_receiving.............: avg=401.88µs min=28.04µs med=57.99µs max=132.76ms p(90)=267.43µs p(95)=446.4µs  p(99.9)=39.33ms 
     http_req_sending...............: avg=95.09µs  min=5.23µs  med=10.62µs max=237.04ms p(90)=20.29µs  p(95)=140.1µs  p(99.9)=15.36ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.52ms  min=1.44ms  med=80.94ms max=307.23ms p(90)=167.86ms p(95)=186.47ms p(99.9)=252.35ms
     http_reqs......................: 163225  2643.316383/s
     iteration_duration.............: avg=87.85ms  min=2.04ms  med=82.11ms max=347.05ms p(90)=169.24ms p(95)=188.75ms p(99.9)=257.62ms
     iterations.....................: 162224  2627.105878/s
     success_rate...................: 100.00% ✓ 162224      ✗ 0     
     vus............................: 92      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.52)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 312536      ✗ 0     
     data_received..................: 9.2 GB  146 MB/s
     data_sent......................: 126 MB  2.0 MB/s
     http_req_blocked...............: avg=14.74µs  min=1.03µs  med=2.51µs   max=84.41ms  p(90)=3.98µs   p(95)=4.9µs    p(99.9)=1.75ms  
     http_req_connecting............: avg=11.35µs  min=0s      med=0s       max=84.33ms  p(90)=0s       p(95)=0s       p(99.9)=1.52ms  
     http_req_duration..............: avg=135.48ms min=2.75ms  med=70.71ms  max=2.2s     p(90)=349.75ms p(95)=487.13ms p(99.9)=1.22s   
       { expected_response:true }...: avg=135.48ms min=2.75ms  med=70.71ms  max=2.2s     p(90)=349.75ms p(95)=487.13ms p(99.9)=1.22s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 105180
     http_req_receiving.............: avg=6.26ms   min=51.55µs med=111.86µs max=809.91ms p(90)=3.05ms   p(95)=13.09ms  p(99.9)=380.05ms
     http_req_sending...............: avg=51.78µs  min=5.39µs  med=10.18µs  max=91.07ms  p(90)=17.14µs  p(95)=25.13µs  p(99.9)=7.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=129.16ms min=2.66ms  med=69.13ms  max=2.12s    p(90)=331.54ms p(95)=452.38ms p(99.9)=1.12s   
     http_reqs......................: 105180  1663.28366/s
     iteration_duration.............: avg=137.21ms min=3.61ms  med=72.32ms  max=2.2s     p(90)=352.82ms p(95)=490.59ms p(99.9)=1.22s   
     iterations.....................: 104178  1647.438345/s
     success_rate...................: 100.00% ✓ 104178      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 218937      ✗ 0    
     data_received..................: 6.5 GB  104 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=6.26µs   min=1.04µs  med=2.58µs   max=25.29ms  p(90)=4.2µs    p(95)=5.18µs   p(99.9)=487.16µs
     http_req_connecting............: avg=2.99µs   min=0s      med=0s       max=25.24ms  p(90)=0s       p(95)=0s       p(99.9)=421.08µs
     http_req_duration..............: avg=192.84ms min=2.08ms  med=192.58ms max=542.76ms p(90)=358.15ms p(95)=383.57ms p(99.9)=462.75ms
       { expected_response:true }...: avg=192.84ms min=2.08ms  med=192.58ms max=542.76ms p(90)=358.15ms p(95)=383.57ms p(99.9)=462.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73979
     http_req_receiving.............: avg=127.31µs min=29.89µs med=62.47µs  max=218.02ms p(90)=98.9µs   p(95)=114.34µs p(99.9)=3.44ms  
     http_req_sending...............: avg=33.49µs  min=5.2µs   med=10.99µs  max=279.17ms p(90)=17.31µs  p(95)=21.15µs  p(99.9)=4.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.68ms min=1.97ms  med=192.32ms max=542.66ms p(90)=358.03ms p(95)=383.47ms p(99.9)=462.63ms
     http_reqs......................: 73979   1183.493966/s
     iteration_duration.............: avg=195.73ms min=4.53ms  med=195.58ms max=542.96ms p(90)=359.12ms p(95)=384.2ms  p(99.9)=463.3ms 
     iterations.....................: 72979   1167.496264/s
     success_rate...................: 100.00% ✓ 72979       ✗ 0    
     vus............................: 83      min=0         max=495
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 89271      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 37 MB   569 kB/s
     http_req_blocked...............: avg=10µs     min=1.15µs  med=3µs      max=35.25ms  p(90)=4.73µs   p(95)=5.71µs   p(99.9)=1.01ms  
     http_req_connecting............: avg=5.84µs   min=0s      med=0s       max=35.19ms  p(90)=0s       p(95)=0s       p(99.9)=925.92µs
     http_req_duration..............: avg=466.72ms min=4.33ms  med=432ms    max=1.82s    p(90)=927.65ms p(95)=1s       p(99.9)=1.43s   
       { expected_response:true }...: avg=466.72ms min=4.33ms  med=432ms    max=1.82s    p(90)=927.65ms p(95)=1s       p(99.9)=1.43s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30757
     http_req_receiving.............: avg=94.65µs  min=31.92µs med=78.03µs  max=208.64ms p(90)=113.96µs p(95)=127.17µs p(99.9)=916.8µs 
     http_req_sending...............: avg=29.68µs  min=5.79µs  med=13.38µs  max=62.23ms  p(90)=20.46µs  p(95)=23.82µs  p(99.9)=3.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=466.59ms min=4.25ms  med=431.91ms max=1.82s    p(90)=927.52ms p(95)=1s       p(99.9)=1.43s   
     http_reqs......................: 30757   473.024976/s
     iteration_duration.............: avg=482.62ms min=32.3ms  med=449.47ms max=1.82s    p(90)=932.38ms p(95)=1s       p(99.9)=1.45s   
     iterations.....................: 29757   457.645551/s
     success_rate...................: 100.00% ✓ 29757      ✗ 0    
     vus............................: 64      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 45432      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   290 kB/s
     http_req_blocked...............: avg=23.82µs  min=1.27µs  med=3.49µs   max=9.84ms  p(90)=5.35µs   p(95)=7.01µs   p(99.9)=6.75ms  
     http_req_connecting............: avg=18.39µs  min=0s      med=0s       max=9.7ms   p(90)=0s       p(95)=0s       p(99.9)=6.44ms  
     http_req_duration..............: avg=843.88ms min=5.66ms  med=787.53ms max=19.16s  p(90)=1.49s    p(95)=1.66s    p(99.9)=16.19s  
       { expected_response:true }...: avg=843.88ms min=5.66ms  med=787.53ms max=19.16s  p(90)=1.49s    p(95)=1.66s    p(99.9)=16.19s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16144
     http_req_receiving.............: avg=99.72µs  min=35.42µs med=94.38µs  max=2.53ms  p(90)=133.93µs p(95)=148.17µs p(99.9)=548.65µs
     http_req_sending...............: avg=39.93µs  min=6.02µs  med=16.47µs  max=60.59ms p(90)=22.83µs  p(95)=27.18µs  p(99.9)=5.66ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=843.74ms min=5.58ms  med=787.44ms max=19.16s  p(90)=1.49s    p(95)=1.66s    p(99.9)=16.19s  
     http_reqs......................: 16144   239.381718/s
     iteration_duration.............: avg=899.6ms  min=29.53ms med=850.24ms max=19.16s  p(90)=1.51s    p(95)=1.66s    p(99.9)=16.27s  
     iterations.....................: 15144   224.553812/s
     success_rate...................: 100.00% ✓ 15144      ✗ 0    
     vus............................: 87      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 41061      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   259 kB/s
     http_req_blocked...............: avg=13.47µs  min=1.13µs  med=3.34µs   max=4.47ms  p(90)=4.99µs   p(95)=6.5µs    p(99.9)=1.85ms  
     http_req_connecting............: avg=8.22µs   min=0s      med=0s       max=3.15ms  p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=484.36ms min=8.68ms  med=520.59ms max=1.48s   p(90)=858.99ms p(95)=920.55ms p(99.9)=1.27s   
       { expected_response:true }...: avg=484.36ms min=8.68ms  med=520.59ms max=1.48s   p(90)=858.99ms p(95)=920.55ms p(99.9)=1.27s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14687
     http_req_receiving.............: avg=102.64µs min=31.92µs med=90.07µs  max=64.81ms p(90)=131.08µs p(95)=143.37µs p(99.9)=872.82µs
     http_req_sending...............: avg=25.84µs  min=6.08µs  med=16.19µs  max=8.95ms  p(90)=22.3µs   p(95)=27.1µs   p(99.9)=2.07ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=484.23ms min=8.56ms  med=520.46ms max=1.48s   p(90)=858.9ms  p(95)=920.44ms p(99.9)=1.27s   
     http_reqs......................: 14687   210.985366/s
     iteration_duration.............: avg=519.57ms min=14.16ms med=559.67ms max=1.49s   p(90)=866.18ms p(95)=927.39ms p(99.9)=1.29s   
     iterations.....................: 13687   196.619916/s
     success_rate...................: 100.00% ✓ 13687      ✗ 0    
     vus............................: 126     min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 390249      ✗ 0     
     data_received..................: 12 GB   185 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=22.8µs   min=1.07µs  med=2.93µs   max=48.57ms  p(90)=4.65µs   p(95)=5.91µs   p(99.9)=5.68ms  
     http_req_connecting............: avg=19.04µs  min=0s      med=0s       max=48.53ms  p(90)=0s       p(95)=0s       p(99.9)=5.55ms  
     http_req_duration..............: avg=108.51ms min=1.59ms  med=102.29ms max=318.7ms  p(90)=209.24ms p(95)=226.19ms p(99.9)=276.7ms 
       { expected_response:true }...: avg=108.51ms min=1.59ms  med=102.29ms max=318.7ms  p(90)=209.24ms p(95)=226.19ms p(99.9)=276.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 131083
     http_req_receiving.............: avg=201.58µs min=31.34µs med=63.98µs  max=74.46ms  p(90)=167.87µs p(95)=417.52µs p(99.9)=25.46ms 
     http_req_sending...............: avg=73.96µs  min=5.51µs  med=11.48µs  max=142.08ms p(90)=21.46µs  p(95)=140.55µs p(99.9)=9.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.23ms min=1.53ms  med=102.11ms max=301.39ms p(90)=208.78ms p(95)=225.63ms p(99.9)=274.74ms
     http_reqs......................: 131083  2115.113306/s
     iteration_duration.............: avg=109.63ms min=4.55ms  med=103.59ms max=320.82ms p(90)=209.79ms p(95)=226.68ms p(99.9)=277.85ms
     iterations.....................: 130083  2098.977627/s
     success_rate...................: 100.00% ✓ 130083      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.52)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 294021      ✗ 0    
     data_received..................: 8.7 GB  139 MB/s
     data_sent......................: 119 MB  1.9 MB/s
     http_req_blocked...............: avg=20.56µs  min=1.01µs  med=2.81µs   max=86.85ms  p(90)=4.58µs   p(95)=5.65µs   p(99.9)=2.43ms  
     http_req_connecting............: avg=16.77µs  min=0s      med=0s       max=86.76ms  p(90)=0s       p(95)=0s       p(99.9)=2.3ms   
     http_req_duration..............: avg=144.11ms min=2.13ms  med=78.85ms  max=2.13s    p(90)=368.76ms p(95)=502.12ms p(99.9)=1.24s   
       { expected_response:true }...: avg=144.11ms min=2.13ms  med=78.85ms  max=2.13s    p(90)=368.76ms p(95)=502.12ms p(99.9)=1.24s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 99007
     http_req_receiving.............: avg=6.43ms   min=52.54µs med=114.28µs max=791.19ms p(90)=2.97ms   p(95)=12.39ms  p(99.9)=424.14ms
     http_req_sending...............: avg=67.72µs  min=5.53µs  med=11.15µs  max=237.98ms p(90)=19.82µs  p(95)=33.26µs  p(99.9)=9.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=137.61ms min=2.05ms  med=77.19ms  max=2.13s    p(90)=349.74ms p(95)=467ms    p(99.9)=1.16s   
     http_reqs......................: 99007   1580.276867/s
     iteration_duration.............: avg=145.88ms min=3.51ms  med=80.56ms  max=2.13s    p(90)=371.44ms p(95)=504.53ms p(99.9)=1.25s   
     iterations.....................: 98007   1564.315603/s
     success_rate...................: 100.00% ✓ 98007       ✗ 0    
     vus............................: 88      min=0         max=498
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 205755      ✗ 0    
     data_received..................: 6.1 GB  97 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=7.24µs   min=1.05µs  med=2.79µs   max=36.82ms  p(90)=4.51µs   p(95)=5.53µs   p(99.9)=613.39µs
     http_req_connecting............: avg=3.67µs   min=0s      med=0s       max=36.76ms  p(90)=0s       p(95)=0s       p(99.9)=511.8µs 
     http_req_duration..............: avg=205.03ms min=2.09ms  med=204.29ms max=633.23ms p(90)=376.75ms p(95)=405.04ms p(99.9)=531.93ms
       { expected_response:true }...: avg=205.03ms min=2.09ms  med=204.29ms max=633.23ms p(90)=376.75ms p(95)=405.04ms p(99.9)=531.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69585
     http_req_receiving.............: avg=118.39µs min=29.37µs med=68.06µs  max=154.56ms p(90)=105.72µs p(95)=122.17µs p(99.9)=3.01ms  
     http_req_sending...............: avg=30.31µs  min=5.45µs  med=11.82µs  max=23.53ms  p(90)=18.92µs  p(95)=22.94µs  p(99.9)=3.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.89ms min=2.03ms  med=204.04ms max=633.14ms p(90)=376.64ms p(95)=404.89ms p(99.9)=531.83ms
     http_reqs......................: 69585   1111.881252/s
     iteration_duration.............: avg=208.29ms min=5.79ms  med=208.16ms max=633.42ms p(90)=377.72ms p(95)=405.85ms p(99.9)=532.6ms 
     iterations.....................: 68585   1095.902503/s
     success_rate...................: 100.00% ✓ 68585       ✗ 0    
     vus............................: 86      min=0         max=498
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86061      ✗ 0    
     data_received..................: 2.6 GB  40 MB/s
     data_sent......................: 36 MB   546 kB/s
     http_req_blocked...............: avg=10.49µs  min=1.16µs  med=3.13µs   max=9.04ms  p(90)=4.96µs   p(95)=6.03µs   p(99.9)=2.12ms
     http_req_connecting............: avg=6.04µs   min=0s      med=0s       max=7.71ms  p(90)=0s       p(95)=0s       p(99.9)=1.98ms
     http_req_duration..............: avg=483.56ms min=4.43ms  med=448.97ms max=2.22s   p(90)=957.03ms p(95)=1.04s    p(99.9)=1.52s 
       { expected_response:true }...: avg=483.56ms min=4.43ms  med=448.97ms max=2.22s   p(90)=957.03ms p(95)=1.04s    p(99.9)=1.52s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29687
     http_req_receiving.............: avg=95.09µs  min=32.18µs med=83.19µs  max=42.66ms p(90)=120.26µs p(95)=134.88µs p(99.9)=1.21ms
     http_req_sending...............: avg=32.4µs   min=5.8µs   med=14.03µs  max=93.56ms p(90)=21.39µs  p(95)=24.74µs  p(99.9)=2.46ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=483.43ms min=4.34ms  med=448.8ms  max=2.22s   p(90)=956.93ms p(95)=1.04s    p(99.9)=1.52s 
     http_reqs......................: 29687   453.708509/s
     iteration_duration.............: avg=500.66ms min=28.86ms med=469.51ms max=2.22s   p(90)=962.91ms p(95)=1.05s    p(99.9)=1.53s 
     iterations.....................: 28687   438.425439/s
     success_rate...................: 100.00% ✓ 28687      ✗ 0    
     vus............................: 81      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 46605      ✗ 0    
     data_received..................: 1.4 GB  22 MB/s
     data_sent......................: 20 MB   297 kB/s
     http_req_blocked...............: avg=18.61µs  min=1.17µs  med=3.95µs   max=36.55ms p(90)=5.92µs   p(95)=7.54µs   p(99.9)=2.65ms  
     http_req_connecting............: avg=12.88µs  min=0s      med=0s       max=36.49ms p(90)=0s       p(95)=0s       p(99.9)=2.5ms   
     http_req_duration..............: avg=864.77ms min=5.86ms  med=780.88ms max=4.11s   p(90)=1.72s    p(95)=1.92s    p(99.9)=3.37s   
       { expected_response:true }...: avg=864.77ms min=5.86ms  med=780.88ms max=4.11s   p(90)=1.72s    p(95)=1.92s    p(99.9)=3.37s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16535
     http_req_receiving.............: avg=113.11µs min=33.92µs med=103.32µs max=85.5ms  p(90)=142.74µs p(95)=156.26µs p(99.9)=856.07µs
     http_req_sending...............: avg=32.09µs  min=5.53µs  med=18.65µs  max=47.74ms p(90)=24.74µs  p(95)=29.38µs  p(99.9)=3.25ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=864.63ms min=5.77ms  med=780.76ms max=4.11s   p(90)=1.72s    p(95)=1.92s    p(99.9)=3.37s   
     http_reqs......................: 16535   245.226898/s
     iteration_duration.............: avg=920.52ms min=18.18ms med=865.36ms max=4.12s   p(90)=1.74s    p(95)=1.94s    p(99.9)=3.38s   
     iterations.....................: 15535   230.396121/s
     success_rate...................: 100.00% ✓ 15535      ✗ 0    
     vus............................: 84      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 39336      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   246 kB/s
     http_req_blocked...............: avg=18.05µs  min=1.12µs  med=3.65µs   max=23.66ms p(90)=5.46µs   p(95)=7.11µs   p(99.9)=2.97ms
     http_req_connecting............: avg=12.44µs  min=0s      med=0s       max=23.61ms p(90)=0s       p(95)=0s       p(99.9)=2.95ms
     http_req_duration..............: avg=1.01s    min=8.64ms  med=926.89ms max=3.78s   p(90)=2.06s    p(95)=2.21s    p(99.9)=3.33s 
       { expected_response:true }...: avg=1.01s    min=8.64ms  med=926.89ms max=3.78s   p(90)=2.06s    p(95)=2.21s    p(99.9)=3.33s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14112
     http_req_receiving.............: avg=112.96µs min=33.35µs med=97.96µs  max=50.46ms p(90)=139.12µs p(95)=151.63µs p(99.9)=1.32ms
     http_req_sending...............: avg=33.46µs  min=5.98µs  med=17.79µs  max=19.91ms p(90)=23.92µs  p(95)=29.19µs  p(99.9)=3.98ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.01s    min=8.53ms  med=926.76ms max=3.78s   p(90)=2.06s    p(95)=2.21s    p(99.9)=3.33s 
     http_reqs......................: 14112   202.242063/s
     iteration_duration.............: avg=1.08s    min=35.28ms med=1.02s    max=3.79s   p(90)=2.07s    p(95)=2.22s    p(99.9)=3.34s 
     iterations.....................: 13112   187.910851/s
     success_rate...................: 100.00% ✓ 13112      ✗ 0    
     vus............................: 100     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

