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
| hive-router | v0.0.78 | 2,818 | 2,961 | 2,762 | 2.7% |  |
| fusion-nightly | 16.5.0-p.8 | 2,322 | 2,400 | 2,302 | 1.4% |  |
| fusion-nightly-net11 | 16.5.0-p.8 | 2,311 | 2,406 | 2,298 | 1.6% |  |
| fusion | 16.4.0 | 2,278 | 2,351 | 2,262 | 1.3% |  |
| cosmo | 0.329.0 | 1,191 | 1,230 | 1,180 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.2 | 573 | 584 | 570 | 0.8% |  |
| hive-gateway | 2.10.2 | 250 | 255 | 249 | 0.8% |  |
| apollo-gateway | 2.14.2 | 231 | 238 | 229 | 1.2% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (9604 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (517257 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly | 16.5.0-p.8 | 2,256 | 2,332 | 2,240 | 1.4% |  |
| fusion-nightly-net11 | 16.5.0-p.8 | 2,252 | 2,343 | 2,245 | 1.5% |  |
| hive-router | v0.0.78 | 2,177 | 2,339 | 2,150 | 3.0% |  |
| fusion | 16.4.0 | 2,101 | 2,197 | 2,090 | 1.7% |  |
| fusion-nightly-fed | 16.5.0-p.8 | 2,076 | 2,152 | 2,059 | 1.6% |  |
| cosmo | 0.329.0 | 1,127 | 1,166 | 1,097 | 1.9% |  |
| hive-gateway-router-runtime | 2.10.2 | 545 | 558 | 542 | 0.9% |  |
| hive-gateway | 2.10.2 | 240 | 247 | 238 | 1.1% |  |
| apollo-gateway | 2.14.2 | 235 | 239 | 234 | 0.7% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (29135 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (406590 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 518127      ✗ 0     
     data_received..................: 15 GB   247 MB/s
     data_sent......................: 209 MB  3.4 MB/s
     http_req_blocked...............: avg=23.33µs  min=832ns   med=2.51µs  max=61.37ms  p(90)=4.17µs   p(95)=5.32µs   p(99.9)=2.1ms   
     http_req_connecting............: avg=19.89µs  min=0s      med=0s      max=61.18ms  p(90)=0s       p(95)=0s       p(99.9)=2.08ms  
     http_req_duration..............: avg=81.72ms  min=1.37ms  med=78.49ms max=322.58ms p(90)=153.45ms p(95)=169.27ms p(99.9)=232.46ms
       { expected_response:true }...: avg=81.72ms  min=1.37ms  med=78.49ms max=322.58ms p(90)=153.45ms p(95)=169.27ms p(99.9)=232.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 173709
     http_req_receiving.............: avg=153.95µs min=25.84µs med=51.27µs max=108.49ms p(90)=155.61µs p(95)=353.29µs p(99.9)=19.5ms  
     http_req_sending...............: avg=76.87µs  min=4.48µs  med=9.54µs  max=56.98ms  p(90)=19.05µs  p(95)=125.99µs p(99.9)=12.08ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.49ms  min=1.32ms  med=78.24ms max=303.74ms p(90)=153.11ms p(95)=168.92ms p(99.9)=231.36ms
     http_reqs......................: 173709  2818.169674/s
     iteration_duration.............: avg=82.53ms  min=2.05ms  med=79.23ms max=339.87ms p(90)=154.08ms p(95)=170.11ms p(99.9)=238.18ms
     iterations.....................: 172709  2801.946164/s
     success_rate...................: 100.00% ✓ 172709      ✗ 0     
     vus............................: 85      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 431469      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=15.58µs min=862ns  med=2.06µs   max=84.65ms  p(90)=3.53µs   p(95)=4.55µs   p(99.9)=961.83µs
     http_req_connecting............: avg=12.95µs min=0s     med=0s       max=84.55ms  p(90)=0s       p(95)=0s       p(99.9)=903.93µs
     http_req_duration..............: avg=98.24ms min=2.02ms med=85.61ms  max=1.47s    p(90)=184.33ms p(95)=213.19ms p(99.9)=745.64ms
       { expected_response:true }...: avg=98.24ms min=2.02ms med=85.61ms  max=1.47s    p(90)=184.33ms p(95)=213.19ms p(99.9)=745.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144823
     http_req_receiving.............: avg=1.51ms  min=52.1µs med=102.84µs max=739.54ms p(90)=1.76ms   p(95)=4.51ms   p(99.9)=91.58ms 
     http_req_sending...............: avg=61.27µs min=4.61µs med=8.93µs   max=191.79ms p(90)=17.37µs  p(95)=99.05µs  p(99.9)=7.65ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.65ms min=1.93ms med=84.2ms   max=1.47s    p(90)=182.38ms p(95)=210.27ms p(99.9)=729.41ms
     http_reqs......................: 144823  2322.564309/s
     iteration_duration.............: avg=99.17ms min=3.35ms med=86.82ms  max=1.47s    p(90)=184.9ms  p(95)=213.98ms p(99.9)=750.87ms
     iterations.....................: 143823  2306.527047/s
     success_rate...................: 100.00% ✓ 143823      ✗ 0     
     vus............................: 74      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 429762      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=10.28µs min=892ns   med=2.18µs   max=42.32ms  p(90)=3.78µs   p(95)=4.88µs   p(99.9)=984.6µs 
     http_req_connecting............: avg=7.39µs  min=0s      med=0s       max=42.28ms  p(90)=0s       p(95)=0s       p(99.9)=907.73µs
     http_req_duration..............: avg=98.63ms min=1.99ms  med=94.23ms  max=336.05ms p(90)=187.74ms p(95)=203.1ms  p(99.9)=264.57ms
       { expected_response:true }...: avg=98.63ms min=1.99ms  med=94.23ms  max=336.05ms p(90)=187.74ms p(95)=203.1ms  p(99.9)=264.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144254
     http_req_receiving.............: avg=817.1µs min=51.58µs med=130.58µs max=220.71ms p(90)=1.62ms   p(95)=2.63ms   p(99.9)=28.61ms 
     http_req_sending...............: avg=53.26µs min=4.69µs  med=9.04µs   max=69.23ms  p(90)=18.3µs   p(95)=98.9µs   p(99.9)=7.16ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.76ms min=1.88ms  med=93.41ms  max=329.29ms p(90)=186.81ms p(95)=202.19ms p(99.9)=263.02ms
     http_reqs......................: 144254  2311.431179/s
     iteration_duration.............: avg=99.55ms min=3.87ms  med=95.25ms  max=336.23ms p(90)=188.2ms  p(95)=203.51ms p(99.9)=265.2ms 
     iterations.....................: 143254  2295.407837/s
     success_rate...................: 100.00% ✓ 143254      ✗ 0     
     vus............................: 75      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.4.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 423960      ✗ 0     
     data_received..................: 13 GB   200 MB/s
     data_sent......................: 171 MB  2.7 MB/s
     http_req_blocked...............: avg=11.43µs  min=871ns   med=2.07µs   max=77.42ms  p(90)=3.59µs   p(95)=4.65µs   p(99.9)=1.06ms  
     http_req_connecting............: avg=8.69µs   min=0s      med=0s       max=77.27ms  p(90)=0s       p(95)=0s       p(99.9)=935.62µs
     http_req_duration..............: avg=100ms    min=2.01ms  med=84.64ms  max=1.98s    p(90)=192.06ms p(95)=220.08ms p(99.9)=863.79ms
       { expected_response:true }...: avg=100ms    min=2.01ms  med=84.64ms  max=1.98s    p(90)=192.06ms p(95)=220.08ms p(99.9)=863.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142320
     http_req_receiving.............: avg=1.43ms   min=51.04µs med=100.54µs max=1.08s    p(90)=1.81ms   p(95)=4.76ms   p(99.9)=72.28ms 
     http_req_sending...............: avg=54.71µs  min=4.63µs  med=8.83µs   max=139.96ms p(90)=16.91µs  p(95)=92.68µs  p(99.9)=7.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.51ms  min=1.94ms  med=83.35ms  max=1.98s    p(90)=190.05ms p(95)=216.99ms p(99.9)=844.38ms
     http_reqs......................: 142320  2278.297948/s
     iteration_duration.............: avg=100.94ms min=3.75ms  med=85.65ms  max=1.98s    p(90)=192.58ms p(95)=220.72ms p(99.9)=866.65ms
     iterations.....................: 141320  2262.289671/s
     success_rate...................: 100.00% ✓ 141320      ✗ 0     
     vus............................: 77      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 220371      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=4.61µs   min=962ns  med=2.02µs   max=12.61ms  p(90)=3.52µs   p(95)=4.42µs   p(99.9)=360.67µs
     http_req_connecting............: avg=1.92µs   min=0s     med=0s       max=12.45ms  p(90)=0s       p(95)=0s       p(99.9)=327.7µs 
     http_req_duration..............: avg=191.7ms  min=1.94ms med=192.62ms max=513.58ms p(90)=355.54ms p(95)=379.85ms p(99.9)=452.52ms
       { expected_response:true }...: avg=191.7ms  min=1.94ms med=192.62ms max=513.58ms p(90)=355.54ms p(95)=379.85ms p(99.9)=452.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74457
     http_req_receiving.............: avg=72.21µs  min=27.3µs med=55.55µs  max=69.75ms  p(90)=90.75µs  p(95)=105.1µs  p(99.9)=1.23ms  
     http_req_sending...............: avg=24.64µs  min=5.02µs med=9.59µs   max=105.93ms p(90)=15.62µs  p(95)=19.45µs  p(99.9)=2.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.6ms  min=1.86ms med=192.53ms max=513.53ms p(90)=355.46ms p(95)=379.75ms p(99.9)=452.46ms
     http_reqs......................: 74457   1191.456136/s
     iteration_duration.............: avg=194.53ms min=4.42ms med=195.66ms max=513.79ms p(90)=356.38ms p(95)=380.43ms p(99.9)=453.45ms
     iterations.....................: 73457   1175.4542/s
     success_rate...................: 100.00% ✓ 73457       ✗ 0    
     vus............................: 80      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 107550     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   688 kB/s
     http_req_blocked...............: avg=8.28µs   min=1.11µs  med=2.9µs    max=14.89ms  p(90)=4.71µs   p(95)=5.73µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=4.46µs   min=0s      med=0s       max=14.83ms  p(90)=0s       p(95)=0s       p(99.9)=1.36ms  
     http_req_duration..............: avg=389.2ms  min=3.47ms  med=365.38ms max=1.66s    p(90)=762.69ms p(95)=828.68ms p(99.9)=1.23s   
       { expected_response:true }...: avg=389.2ms  min=3.47ms  med=365.38ms max=1.66s    p(90)=762.69ms p(95)=828.68ms p(99.9)=1.23s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36850
     http_req_receiving.............: avg=79.15µs  min=28.33µs med=68.94µs  max=7.16ms   p(90)=108.25µs p(95)=123.52µs p(99.9)=971.11µs
     http_req_sending...............: avg=32.09µs  min=5.1µs   med=13.49µs  max=100.74ms p(90)=21.32µs  p(95)=24.45µs  p(99.9)=2.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=389.09ms min=3.42ms  med=365.3ms  max=1.66s    p(90)=762.51ms p(95)=828.55ms p(99.9)=1.23s   
     http_reqs......................: 36850   573.441001/s
     iteration_duration.............: avg=400.27ms min=16.94ms med=379.66ms max=1.66s    p(90)=766.71ms p(95)=831.44ms p(99.9)=1.24s   
     iterations.....................: 35850   557.879508/s
     success_rate...................: 100.00% ✓ 35850      ✗ 0    
     vus............................: 68      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47574      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   301 kB/s
     http_req_blocked...............: avg=14.46µs  min=1.23µs  med=3.61µs   max=4.1ms   p(90)=5.42µs   p(95)=6.96µs   p(99.9)=2.24ms  
     http_req_connecting............: avg=9.08µs   min=0s      med=0s       max=4.05ms  p(90)=0s       p(95)=0s       p(99.9)=2.21ms  
     http_req_duration..............: avg=848.71ms min=5.84ms  med=746.22ms max=16.57s  p(90)=1.56s    p(95)=1.76s    p(99.9)=14.38s  
       { expected_response:true }...: avg=848.71ms min=5.84ms  med=746.22ms max=16.57s  p(90)=1.56s    p(95)=1.76s    p(99.9)=14.38s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16858
     http_req_receiving.............: avg=95.73µs  min=35.52µs med=88.59µs  max=7.95ms  p(90)=125.56µs p(95)=141.18µs p(99.9)=997.14µs
     http_req_sending...............: avg=29.06µs  min=6.47µs  med=17.76µs  max=15.85ms p(90)=23.8µs   p(95)=27.93µs  p(99.9)=3.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=848.58ms min=5.73ms  med=746.07ms max=16.57s  p(90)=1.56s    p(95)=1.76s    p(99.9)=14.38s  
     http_reqs......................: 16858   250.014756/s
     iteration_duration.............: avg=902.23ms min=45.21ms med=799.75ms max=16.57s  p(90)=1.58s    p(95)=1.78s    p(99.9)=14.39s  
     iterations.....................: 15858   235.184126/s
     success_rate...................: 100.00% ✓ 15858      ✗ 0    
     vus............................: 77      min=0        max=500
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

     checks.........................: 100.00% ✓ 47853      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   283 kB/s
     http_req_blocked...............: avg=13.99µs  min=1.45µs  med=3.62µs   max=4.03ms  p(90)=5.33µs   p(95)=6.72µs   p(99.9)=2.31ms  
     http_req_connecting............: avg=8.74µs   min=0s      med=0s       max=3.96ms  p(90)=0s       p(95)=0s       p(99.9)=2.29ms  
     http_req_duration..............: avg=376.09ms min=7.59ms  med=428.09ms max=1.16s   p(90)=628.32ms p(95)=695.84ms p(99.9)=997.56ms
       { expected_response:true }...: avg=376.09ms min=7.59ms  med=428.09ms max=1.16s   p(90)=628.32ms p(95)=695.84ms p(99.9)=997.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 16951
     http_req_receiving.............: avg=98.54µs  min=35.14µs med=84.8µs   max=60.71ms p(90)=123.32µs p(95)=137.82µs p(99.9)=966.54µs
     http_req_sending...............: avg=32.51µs  min=5.71µs  med=16.88µs  max=86.03ms p(90)=22.45µs  p(95)=27.51µs  p(99.9)=2.47ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=375.96ms min=7.46ms  med=427.99ms max=1.16s   p(90)=628.19ms p(95)=695.67ms p(99.9)=997.42ms
     http_reqs......................: 16951   231.238238/s
     iteration_duration.............: avg=399.64ms min=8.49ms  med=448.47ms max=1.17s   p(90)=632.96ms p(95)=700.96ms p(99.9)=1s      
     iterations.....................: 15951   217.596669/s
     success_rate...................: 100.00% ✓ 15951      ✗ 0    
     vus............................: 64      min=0        max=494
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 416271      ✗ 0     
     data_received..................: 12 GB   198 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=13.01µs  min=892ns   med=2.33µs   max=58.06ms  p(90)=4.05µs   p(95)=5.19µs   p(99.9)=1.37ms  
     http_req_connecting............: avg=9.94µs   min=0s      med=0s       max=58.01ms  p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=101.86ms min=1.56ms  med=89.69ms  max=1.64s    p(90)=188.54ms p(95)=218.38ms p(99.9)=989.9ms 
       { expected_response:true }...: avg=101.86ms min=1.56ms  med=89.69ms  max=1.64s    p(90)=188.54ms p(95)=218.38ms p(99.9)=989.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 139757
     http_req_receiving.............: avg=1.71ms   min=51.94µs med=108.74µs max=1.05s    p(90)=2.01ms   p(95)=5.29ms   p(99.9)=84.16ms 
     http_req_sending...............: avg=58.92µs  min=4.72µs  med=9.37µs   max=210.52ms p(90)=18.28µs  p(95)=97.92µs  p(99.9)=7.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.09ms min=1.48ms  med=88.37ms  max=1.64s    p(90)=186.07ms p(95)=213.39ms p(99.9)=981.75ms
     http_reqs......................: 139757  2256.805942/s
     iteration_duration.............: avg=102.83ms min=2.85ms  med=90.82ms  max=1.64s    p(90)=189.16ms p(95)=219.13ms p(99.9)=995ms   
     iterations.....................: 138757  2240.657871/s
     success_rate...................: 100.00% ✓ 138757      ✗ 0     
     vus............................: 55      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 415218      ✗ 0     
     data_received..................: 12 GB   197 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=12.95µs  min=872ns   med=2.26µs   max=71.16ms  p(90)=3.99µs   p(95)=5.15µs   p(99.9)=896.31µs
     http_req_connecting............: avg=9.75µs   min=0s      med=0s       max=46.17ms  p(90)=0s       p(95)=0s       p(99.9)=833.64µs
     http_req_duration..............: avg=102.05ms min=1.54ms  med=97.83ms  max=347.13ms p(90)=194.77ms p(95)=210.87ms p(99.9)=272.4ms 
       { expected_response:true }...: avg=102.05ms min=1.54ms  med=97.83ms  max=347.13ms p(90)=194.77ms p(95)=210.87ms p(99.9)=272.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 139406
     http_req_receiving.............: avg=868.59µs min=53.96µs med=125.55µs max=263.07ms p(90)=1.74ms   p(95)=2.87ms   p(99.9)=32.08ms 
     http_req_sending...............: avg=58.1µs   min=4.71µs  med=9.67µs   max=163.52ms p(90)=21.41µs  p(95)=104.22µs p(99.9)=7.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.13ms min=1.46ms  med=96.91ms  max=346.84ms p(90)=193.85ms p(95)=209.65ms p(99.9)=270.43ms
     http_reqs......................: 139406  2252.455044/s
     iteration_duration.............: avg=103.04ms min=3.8ms   med=98.88ms  max=352.32ms p(90)=195.26ms p(95)=211.3ms  p(99.9)=274.37ms
     iterations.....................: 138406  2236.297525/s
     success_rate...................: 100.00% ✓ 138406      ✗ 0     
     vus............................: 52      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 402465      ✗ 0     
     data_received..................: 12 GB   190 MB/s
     data_sent......................: 162 MB  2.6 MB/s
     http_req_blocked...............: avg=15.92µs  min=1.05µs  med=2.94µs   max=66.11ms  p(90)=4.75µs   p(95)=6µs      p(99.9)=769.59µs
     http_req_connecting............: avg=12.26µs  min=0s      med=0s       max=66.06ms  p(90)=0s       p(95)=0s       p(99.9)=714.97µs
     http_req_duration..............: avg=105.27ms min=1.68ms  med=100.96ms max=307.81ms p(90)=202.49ms p(95)=218.37ms p(99.9)=266.62ms
       { expected_response:true }...: avg=105.27ms min=1.68ms  med=100.96ms max=307.81ms p(90)=202.49ms p(95)=218.37ms p(99.9)=266.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135155
     http_req_receiving.............: avg=126.19µs min=27.32µs med=58.67µs  max=149.66ms p(90)=134.31µs p(95)=371.66µs p(99.9)=9.37ms  
     http_req_sending...............: avg=67.9µs   min=5.21µs  med=11.77µs  max=157.08ms p(90)=22.19µs  p(95)=135.01µs p(99.9)=8.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.08ms min=1.6ms   med=100.76ms max=307.63ms p(90)=202.25ms p(95)=218.11ms p(99.9)=265.99ms
     http_reqs......................: 135155  2177.137505/s
     iteration_duration.............: avg=106.31ms min=4.85ms  med=102.18ms max=319.49ms p(90)=202.98ms p(95)=218.84ms p(99.9)=267.66ms
     iterations.....................: 134155  2161.029056/s
     success_rate...................: 100.00% ✓ 134155      ✗ 0     
     vus............................: 60      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.4.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 387852      ✗ 0     
     data_received..................: 11 GB   184 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=16.81µs  min=1.05µs  med=2.9µs    max=117.45ms p(90)=4.59µs   p(95)=5.71µs   p(99.9)=1.44ms  
     http_req_connecting............: avg=13.3µs   min=0s      med=0s       max=117.39ms p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=109.26ms min=1.65ms  med=91.91ms  max=2.02s    p(90)=201.76ms p(95)=236.43ms p(99.9)=930.23ms
       { expected_response:true }...: avg=109.26ms min=1.65ms  med=91.91ms  max=2.02s    p(90)=201.76ms p(95)=236.43ms p(99.9)=930.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130284
     http_req_receiving.............: avg=2.86ms   min=51.32µs med=119.76µs max=1.29s    p(90)=2.32ms   p(95)=6.45ms   p(99.9)=363.41ms
     http_req_sending...............: avg=62.11µs  min=5.07µs  med=11.21µs  max=156.85ms p(90)=20.01µs  p(95)=108.29µs p(99.9)=7.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.33ms min=1.57ms  med=90.55ms  max=2.02s    p(90)=198.98ms p(95)=230.04ms p(99.9)=876.76ms
     http_reqs......................: 130284  2101.352217/s
     iteration_duration.............: avg=110.38ms min=2.65ms  med=93.01ms  max=2.02s    p(90)=202.47ms p(95)=237.5ms  p(99.9)=931.29ms
     iterations.....................: 129284  2085.223204/s
     success_rate...................: 100.00% ✓ 129284      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 385803      ✗ 0     
     data_received..................: 11 GB   182 MB/s
     data_sent......................: 156 MB  2.5 MB/s
     http_req_blocked...............: avg=19.46µs  min=882ns   med=2.95µs   max=96.07ms p(90)=5.01µs   p(95)=6.15µs   p(99.9)=1.43ms  
     http_req_connecting............: avg=15.71µs  min=0s      med=0s       max=95.92ms p(90)=0s       p(95)=0s       p(99.9)=1.36ms  
     http_req_duration..............: avg=109.81ms min=1.93ms  med=94.09ms  max=1.6s    p(90)=207.45ms p(95)=240.33ms p(99.9)=855.51ms
       { expected_response:true }...: avg=109.81ms min=1.93ms  med=94.09ms  max=1.6s    p(90)=207.45ms p(95)=240.33ms p(99.9)=855.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 129601
     http_req_receiving.............: avg=1.74ms   min=52.85µs med=114.67µs max=1.47s   p(90)=1.68ms   p(95)=4.19ms   p(99.9)=157.61ms
     http_req_sending...............: avg=71.04µs  min=5µs     med=11.77µs  max=74.78ms p(90)=23.53µs  p(95)=124.94µs p(99.9)=9.82ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.99ms min=1.82ms  med=92.95ms  max=1.6s    p(90)=205.53ms p(95)=236.26ms p(99.9)=774.64ms
     http_reqs......................: 129601  2076.950705/s
     iteration_duration.............: avg=110.95ms min=3.84ms  med=95.26ms  max=1.6s    p(90)=208.07ms p(95)=241.26ms p(99.9)=858.66ms
     iterations.....................: 128601  2060.924974/s
     success_rate...................: 100.00% ✓ 128601      ✗ 0     
     vus............................: 75      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 209220      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=6.67µs   min=1.11µs  med=3.03µs   max=8.75ms   p(90)=4.87µs   p(95)=5.94µs   p(99.9)=808.46µs
     http_req_connecting............: avg=2.86µs   min=0s      med=0s       max=8.68ms   p(90)=0s       p(95)=0s       p(99.9)=736.49µs
     http_req_duration..............: avg=201.74ms min=2.03ms  med=202.97ms max=539.98ms p(90)=370.95ms p(95)=397.76ms p(99.9)=476.99ms
       { expected_response:true }...: avg=201.74ms min=2.03ms  med=202.97ms max=539.98ms p(90)=370.95ms p(95)=397.76ms p(99.9)=476.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70740
     http_req_receiving.............: avg=85.68µs  min=26.18µs med=67.22µs  max=129.21ms p(90)=110.45µs p(95)=127.36µs p(99.9)=1.56ms  
     http_req_sending...............: avg=33.91µs  min=5.27µs  med=12.96µs  max=114.43ms p(90)=20.94µs  p(95)=25.03µs  p(99.9)=3.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.62ms min=1.98ms  med=202.85ms max=539.91ms p(90)=370.82ms p(95)=397.65ms p(99.9)=476.88ms
     http_reqs......................: 70740   1127.586217/s
     iteration_duration.............: avg=204.87ms min=5.42ms  med=206.59ms max=540.12ms p(90)=371.94ms p(95)=398.47ms p(99.9)=477.48ms
     iterations.....................: 69740   1111.646349/s
     success_rate...................: 100.00% ✓ 69740       ✗ 0    
     vus............................: 90      min=0         max=500
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 102975     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 42 MB   655 kB/s
     http_req_blocked...............: avg=9.49µs   min=1.15µs  med=3.4µs    max=19.39ms p(90)=5.25µs   p(95)=6.37µs   p(99.9)=1.49ms
     http_req_connecting............: avg=4.97µs   min=0s      med=0s       max=19.34ms p(90)=0s       p(95)=0s       p(99.9)=1.35ms
     http_req_duration..............: avg=406.03ms min=3.61ms  med=378.04ms max=1.79s   p(90)=799.72ms p(95)=864.3ms  p(99.9)=1.29s 
       { expected_response:true }...: avg=406.03ms min=3.61ms  med=378.04ms max=1.79s   p(90)=799.72ms p(95)=864.3ms  p(99.9)=1.29s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 35325
     http_req_receiving.............: avg=91.31µs  min=31.84µs med=77.93µs  max=71.82ms p(90)=117.23µs p(95)=133.35µs p(99.9)=1.12ms
     http_req_sending...............: avg=36.72µs  min=5.79µs  med=15.71µs  max=225.3ms p(90)=23.56µs  p(95)=26.84µs  p(99.9)=2.71ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=405.9ms  min=3.55ms  med=377.95ms max=1.79s   p(90)=799.61ms p(95)=864.01ms p(99.9)=1.29s 
     http_reqs......................: 35325   545.887458/s
     iteration_duration.............: avg=418.1ms  min=26.04ms med=393.58ms max=1.8s    p(90)=803.13ms p(95)=867.4ms  p(99.9)=1.3s  
     iterations.....................: 34325   530.434168/s
     success_rate...................: 100.00% ✓ 34325      ✗ 0    
     vus............................: 92      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 46257      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   289 kB/s
     http_req_blocked...............: avg=15.81µs  min=1.29µs  med=3.78µs   max=16.95ms  p(90)=5.68µs  p(95)=7.64µs   p(99.9)=2.26ms
     http_req_connecting............: avg=10.14µs  min=0s      med=0s       max=16.88ms  p(90)=0s      p(95)=0s       p(99.9)=2.24ms
     http_req_duration..............: avg=886.88ms min=6.02ms  med=780.96ms max=5.12s    p(90)=1.76s   p(95)=1.99s    p(99.9)=4.19s 
       { expected_response:true }...: avg=886.88ms min=6.02ms  med=780.96ms max=5.12s    p(90)=1.76s   p(95)=1.99s    p(99.9)=4.19s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16419
     http_req_receiving.............: avg=101.57µs min=35.94µs med=93.71µs  max=6.07ms   p(90)=134.3µs p(95)=152.15µs p(99.9)=1.28ms
     http_req_sending...............: avg=42.54µs  min=6.38µs  med=18.38µs  max=119.75ms p(90)=24.17µs p(95)=29.53µs  p(99.9)=3.2ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=886.74ms min=5.94ms  med=780.81ms max=5.12s    p(90)=1.76s   p(95)=1.99s    p(99.9)=4.19s 
     http_reqs......................: 16419   240.863063/s
     iteration_duration.............: avg=944.39ms min=40.69ms med=860.23ms max=5.12s    p(90)=1.77s   p(95)=2.01s    p(99.9)=4.22s 
     iterations.....................: 15419   226.193286/s
     success_rate...................: 100.00% ✓ 15419      ✗ 0    
     vus............................: 64      min=0        max=499
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

     checks.........................: 100.00% ✓ 45666      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   283 kB/s
     http_req_blocked...............: avg=14.55µs  min=1.12µs  med=3.39µs   max=5.62ms  p(90)=5.24µs   p(95)=6.85µs   p(99.9)=2.41ms  
     http_req_connecting............: avg=9.38µs   min=0s      med=0s       max=5.54ms  p(90)=0s       p(95)=0s       p(99.9)=2.39ms  
     http_req_duration..............: avg=895.74ms min=7.8ms   med=816.42ms max=3.22s   p(90)=1.8s     p(95)=1.94s    p(99.9)=2.86s   
       { expected_response:true }...: avg=895.74ms min=7.8ms   med=816.42ms max=3.22s   p(90)=1.8s     p(95)=1.94s    p(99.9)=2.86s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16222
     http_req_receiving.............: avg=102.04µs min=36.17µs med=94.03µs  max=15.02ms p(90)=135.22µs p(95)=152.35µs p(99.9)=976.27µs
     http_req_sending...............: avg=33.97µs  min=5.71µs  med=17.72µs  max=56.3ms  p(90)=23.66µs  p(95)=29.18µs  p(99.9)=3.87ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=895.6ms  min=7.71ms  med=816.33ms max=3.22s   p(90)=1.8s     p(95)=1.94s    p(99.9)=2.86s   
     http_reqs......................: 16222   235.849321/s
     iteration_duration.............: avg=954.56ms min=23.42ms med=905.87ms max=3.22s   p(90)=1.81s    p(95)=1.95s    p(99.9)=2.88s   
     iterations.....................: 15222   221.310465/s
     success_rate...................: 100.00% ✓ 15222      ✗ 0    
     vus............................: 93      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

