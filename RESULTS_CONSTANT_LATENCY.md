## Overview for: `constant-vus-with-latency`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s** with a simulated **4ms IO delay** on each subgraph request. Only .NET subgraphs are used.


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 1,580 | 1,605 | 1,577 | 0.6% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,443 | 1,456 | 1,432 | 0.5% |  |
| cosmo | 0.307.0 | 1,143 | 1,154 | 1,130 | 0.8% | non-compatible response (4 across 3/9 runs) |
| grafbase | 0.53.3 | 1,127 | 1,146 | 1,117 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.25 | 521 | 532 | 517 | 1.0% |  |
| apollo-router | v2.13.1 | 361 | 372 | 357 | 1.4% |  |
| hive-gateway | 2.5.25 | 242 | 247 | 234 | 1.6% |  |
| apollo-gateway | 2.13.3 | 235 | 237 | 235 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 578082      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.03µs   min=951ns   med=2.09µs  max=3.99ms   p(90)=3.96µs   p(95)=4.97µs   p(99.9)=32.7µs 
     http_req_connecting............: avg=438ns    min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.9ms   min=14.23ms med=30.62ms max=328.58ms p(90)=36.74ms  p(95)=38.63ms  p(99.9)=56.28ms
       { expected_response:true }...: avg=30.9ms   min=14.23ms med=30.62ms max=328.58ms p(90)=36.74ms  p(95)=38.63ms  p(99.9)=56.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192794
     http_req_receiving.............: avg=112.13µs min=27.39µs med=52.99µs max=250.12ms p(90)=103.91µs p(95)=148.88µs p(99.9)=2.9ms  
     http_req_sending...............: avg=33.94µs  min=5.15µs  med=9.31µs  max=254.2ms  p(90)=19.57µs  p(95)=40.47µs  p(99.9)=1.74ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.75ms  min=14.11ms med=30.52ms max=78.39ms  p(90)=36.62ms  p(95)=38.49ms  p(99.9)=54.36ms
     http_reqs......................: 192794  1580.154655/s
     iteration_duration.............: avg=31.13ms  min=14.44ms med=30.84ms max=360.97ms p(90)=36.95ms  p(95)=38.84ms  p(99.9)=56.73ms
     iterations.....................: 192694  1579.335047/s
     success_rate...................: 100.00% ✓ 192694      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 528036      ✗ 0     
     data_received..................: 15 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.13µs  min=942ns   med=2.03µs   max=5.9ms    p(90)=3.84µs  p(95)=4.73µs   p(99.9)=34.05µs
     http_req_connecting............: avg=550ns   min=0s      med=0s       max=3.74ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.83ms min=14.1ms  med=32.65ms  max=482.8ms  p(90)=41.66ms p(95)=45.42ms  p(99.9)=83.06ms
       { expected_response:true }...: avg=33.83ms min=14.1ms  med=32.65ms  max=482.8ms  p(90)=41.66ms p(95)=45.42ms  p(99.9)=83.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176112
     http_req_receiving.............: avg=749.5µs min=49.96µs med=112.05µs max=251.54ms p(90)=2.17ms  p(95)=3.3ms    p(99.9)=14.22ms
     http_req_sending...............: avg=37.69µs min=4.39µs  med=8.96µs   max=171.47ms p(90)=19.85µs p(95)=106.42µs p(99.9)=2.44ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.05ms min=14.02ms med=31.88ms  max=482.12ms p(90)=40.62ms p(95)=44.25ms  p(99.9)=81.66ms
     http_reqs......................: 176112  1443.381903/s
     iteration_duration.............: avg=34.08ms min=14.32ms med=32.87ms  max=483.09ms p(90)=41.88ms p(95)=45.65ms  p(99.9)=83.71ms
     iterations.....................: 176012  1442.562322/s
     success_rate...................: 100.00% ✓ 176012      ✗ 0     
     vus............................: 45      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 418230      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.51µs  min=1.03µs  med=2.4µs   max=4.12ms   p(90)=4µs      p(95)=4.74µs   p(99.9)=36.16µs
     http_req_connecting............: avg=717ns   min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.79ms min=19.52ms med=42.2ms  max=306.83ms p(90)=52.11ms  p(95)=55.26ms  p(99.9)=72.54ms
       { expected_response:true }...: avg=42.79ms min=19.52ms med=42.2ms  max=306.83ms p(90)=52.11ms  p(95)=55.26ms  p(99.9)=72.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139510
     http_req_receiving.............: avg=85.75µs min=27.75µs med=63.37µs max=161.19ms p(90)=106.65µs p(95)=131.96µs p(99.9)=1.53ms 
     http_req_sending...............: avg=25.59µs min=5.19µs  med=10.44µs max=78.67ms  p(90)=17.85µs  p(95)=22.48µs  p(99.9)=1.17ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.68ms min=19.39ms med=42.1ms  max=302.51ms p(90)=52ms     p(95)=55.15ms  p(99.9)=72.07ms
     http_reqs......................: 139510  1143.189583/s
     iteration_duration.............: avg=43.03ms min=21.08ms med=42.4ms  max=347.63ms p(90)=52.31ms  p(95)=55.46ms  p(99.9)=72.9ms 
     iterations.....................: 139410  1142.370151/s
     success_rate...................: 100.00% ✓ 139410      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 412392      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.41µs   min=952ns   med=2.2µs   max=3.61ms   p(90)=4.62µs   p(95)=5.83µs   p(99.9)=45.64µs
     http_req_connecting............: avg=591ns    min=0s      med=0s      max=3.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.37ms  min=17ms    med=42.92ms max=351.51ms p(90)=52.57ms  p(95)=55.7ms   p(99.9)=79.08ms
       { expected_response:true }...: avg=43.37ms  min=17ms    med=42.92ms max=351.51ms p(90)=52.57ms  p(95)=55.7ms   p(99.9)=79.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137564
     http_req_receiving.............: avg=128.04µs min=29.43µs med=59.89µs max=236.87ms p(90)=131.26µs p(95)=207.85µs p(99.9)=3.45ms 
     http_req_sending...............: avg=36.89µs  min=5.19µs  med=9.83µs  max=81.8ms   p(90)=23.71µs  p(95)=108.97µs p(99.9)=1.98ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.2ms   min=16.87ms med=42.8ms  max=115.14ms p(90)=52.43ms  p(95)=55.54ms  p(99.9)=78.24ms
     http_reqs......................: 137564  1127.474479/s
     iteration_duration.............: avg=43.64ms  min=17.25ms med=43.16ms max=382.59ms p(90)=52.8ms   p(95)=55.93ms  p(99.9)=79.49ms
     iterations.....................: 137464  1126.654879/s
     success_rate...................: 100.00% ✓ 137464      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 191253     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   626 kB/s
     http_req_blocked...............: avg=5.15µs  min=1.14µs  med=3.2µs   max=4.53ms   p(90)=4.88µs   p(95)=5.56µs   p(99.9)=50.77µs 
     http_req_connecting............: avg=1.69µs  min=0s      med=0s      max=4.48ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.76ms min=22.18ms med=91.85ms max=357.65ms p(90)=110.27ms p(95)=119.79ms p(99.9)=216.08ms
       { expected_response:true }...: avg=93.76ms min=22.18ms med=91.85ms max=357.65ms p(90)=110.27ms p(95)=119.79ms p(99.9)=216.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63851
     http_req_receiving.............: avg=93.11µs min=31.71µs med=79.42µs max=201.53ms p(90)=116.11µs p(95)=130.26µs p(99.9)=974.22µs
     http_req_sending...............: avg=28.12µs min=5.56µs  med=14.36µs max=145.12ms p(90)=21.39µs  p(95)=23.92µs  p(99.9)=761.52µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.64ms min=22.06ms med=91.75ms max=356.17ms p(90)=110.15ms p(95)=119.64ms p(99.9)=214.81ms
     http_reqs......................: 63851   521.496456/s
     iteration_duration.............: avg=94.13ms min=34.94ms med=92.1ms  max=378.4ms  p(90)=110.51ms p(95)=120.11ms p(99.9)=218.21ms
     iterations.....................: 63751   520.679716/s
     success_rate...................: 100.00% ✓ 63751      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 132492     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 53 MB   434 kB/s
     http_req_blocked...............: avg=5.83µs   min=1.12µs  med=3.25µs   max=4.11ms   p(90)=4.76µs   p(95)=5.35µs   p(99.9)=579.34µs
     http_req_connecting............: avg=2.39µs   min=0s      med=0s       max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=536.58µs
     http_req_duration..............: avg=135.41ms min=20.22ms med=133.29ms max=346.13ms p(90)=170.07ms p(95)=181.29ms p(99.9)=229.91ms
       { expected_response:true }...: avg=135.41ms min=20.22ms med=133.29ms max=346.13ms p(90)=170.07ms p(95)=181.29ms p(99.9)=229.91ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44264
     http_req_receiving.............: avg=88.41µs  min=31.39µs med=82.92µs  max=6.97ms   p(90)=116.86µs p(95)=128.86µs p(99.9)=778.95µs
     http_req_sending...............: avg=27.81µs  min=5.51µs  med=14.75µs  max=105.74ms p(90)=20.85µs  p(95)=22.91µs  p(99.9)=529.35µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=135.29ms min=20.07ms med=133.17ms max=345.66ms p(90)=169.92ms p(95)=181.16ms p(99.9)=229.52ms
     http_reqs......................: 44264   361.321381/s
     iteration_duration.............: avg=135.92ms min=40.89ms med=133.59ms max=368.35ms p(90)=170.35ms p(95)=181.59ms p(99.9)=234.33ms
     iterations.....................: 44164   360.505094/s
     success_rate...................: 100.00% ✓ 44164      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 88686      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   291 kB/s
     http_req_blocked...............: avg=7.52µs   min=1.28µs  med=3.66µs   max=4.74ms   p(90)=5.26µs   p(95)=5.87µs   p(99.9)=1.69ms  
     http_req_connecting............: avg=3.56µs   min=0s      med=0s       max=4.71ms   p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=202.26ms min=18.2ms  med=188.88ms max=550.9ms  p(90)=251.61ms p(95)=407.66ms p(99.9)=518.18ms
       { expected_response:true }...: avg=202.26ms min=18.2ms  med=188.88ms max=550.9ms  p(90)=251.61ms p(95)=407.66ms p(99.9)=518.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29662
     http_req_receiving.............: avg=106.08µs min=33.45µs med=98.22µs  max=102.79ms p(90)=131.63µs p(95)=145.38µs p(99.9)=753.5µs 
     http_req_sending...............: avg=28.76µs  min=6.15µs  med=18µs     max=98.09ms  p(90)=23.3µs   p(95)=25.21µs  p(99.9)=598.03µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.12ms min=18.03ms med=188.76ms max=550.73ms p(90)=251.47ms p(95)=407.55ms p(99.9)=518.03ms
     http_reqs......................: 29662   242.430383/s
     iteration_duration.............: avg=203.19ms min=47.68ms med=189.35ms max=551.18ms p(90)=252.01ms p(95)=408.32ms p(99.9)=518.52ms
     iterations.....................: 29562   241.613073/s
     success_rate...................: 100.00% ✓ 29562      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 86655      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   283 kB/s
     http_req_blocked...............: avg=7.96µs   min=1.26µs  med=3.52µs   max=4.09ms   p(90)=5µs      p(95)=5.62µs   p(99.9)=2.36ms  
     http_req_connecting............: avg=4.18µs   min=0s      med=0s       max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=2.34ms  
     http_req_duration..............: avg=206.89ms min=21.18ms med=203.01ms max=444.65ms p(90)=241.12ms p(95)=247.18ms p(99.9)=321.8ms 
       { expected_response:true }...: avg=206.89ms min=21.18ms med=203.01ms max=444.65ms p(90)=241.12ms p(95)=247.18ms p(99.9)=321.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 28985
     http_req_receiving.............: avg=222.03µs min=33.16µs med=92.89µs  max=257ms    p(90)=126.82µs p(95)=140.29µs p(99.9)=1.96ms  
     http_req_sending...............: avg=29.85µs  min=6.29µs  med=17.23µs  max=99.95ms  p(90)=22.79µs  p(95)=24.83µs  p(99.9)=622.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.64ms min=21.02ms med=202.61ms max=373.12ms p(90)=240.94ms p(95)=246.94ms p(99.9)=318.72ms
     http_reqs......................: 28985   235.885253/s
     iteration_duration.............: avg=207.82ms min=59.43ms med=203.93ms max=455.35ms p(90)=241.41ms p(95)=247.54ms p(99.9)=326.2ms 
     iterations.....................: 28885   235.071434/s
     success_rate...................: 100.00% ✓ 28885      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

