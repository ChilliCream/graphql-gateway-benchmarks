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
| fusion-nightly | 16.4.0-p.6 | 1,562 | 1,580 | 1,555 | 0.5% |  |
| hive-router | v0.0.74 | 1,562 | 1,584 | 1,548 | 0.7% |  |
| fusion | 16.3.0 | 1,552 | 1,571 | 1,545 | 0.5% |  |
| grafbase | 0.53.5 | 1,116 | 1,135 | 1,105 | 0.9% |  |
| cosmo | 0.326.1 | 1,091 | 1,112 | 1,083 | 0.8% |  |
| hive-gateway-router-runtime | 2.10.0 | 517 | 532 | 514 | 1.2% |  |
| apollo-router | v2.15.1 | 392 | 403 | 388 | 1.3% |  |
| hive-gateway | 2.10.0 | 232 | 236 | 230 | 1.0% |  |
| apollo-gateway | 2.14.2 | 231 | 235 | 230 | 0.8% |  |
| feddi | 77271dc84a06 | 12 | 12 | 11 | 3.1% | non-compatible response (6 across 2/9 runs) |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 571575      ✗ 0     
     data_received..................: 17 GB   137 MB/s
     data_sent......................: 229 MB  1.9 MB/s
     http_req_blocked...............: avg=3.36µs   min=962ns   med=2.33µs   max=4.31ms   p(90)=4.13µs  p(95)=5.01µs  p(99.9)=38.03µs
     http_req_connecting............: avg=548ns    min=0s      med=0s       max=4.24ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=31.24ms  min=13.62ms med=30.67ms  max=343.62ms p(90)=38.36ms p(95)=40.98ms p(99.9)=61.75ms
       { expected_response:true }...: avg=31.24ms  min=13.62ms med=30.67ms  max=343.62ms p(90)=38.36ms p(95)=40.98ms p(99.9)=61.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 190625
     http_req_receiving.............: avg=598.58µs min=50.82µs med=108.71µs max=188.59ms p(90)=1.7ms   p(95)=2.67ms  p(99.9)=14.13ms
     http_req_sending...............: avg=37.14µs  min=5.17µs  med=9.7µs    max=236.33ms p(90)=20.58µs p(95)=98.99µs p(99.9)=2.12ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.6ms   min=13.47ms med=30.07ms  max=343.01ms p(90)=37.55ms p(95)=40.1ms  p(99.9)=59.76ms
     http_reqs......................: 190625  1562.420026/s
     iteration_duration.............: avg=31.48ms  min=13.94ms med=30.9ms   max=360.49ms p(90)=38.58ms p(95)=41.21ms p(99.9)=62.34ms
     iterations.....................: 190525  1561.600396/s
     success_rate...................: 100.00% ✓ 190525      ✗ 0     
     vus............................: 45      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 571665      ✗ 0     
     data_received..................: 17 GB   137 MB/s
     data_sent......................: 229 MB  1.9 MB/s
     http_req_blocked...............: avg=3.33µs  min=972ns   med=2.43µs  max=3.67ms   p(90)=4.18µs   p(95)=5.1µs    p(99.9)=34.79µs
     http_req_connecting............: avg=447ns   min=0s      med=0s      max=3.65ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.24ms min=13.43ms med=30.92ms max=310.86ms p(90)=37.25ms  p(95)=39.22ms  p(99.9)=58.54ms
       { expected_response:true }...: avg=31.24ms min=13.43ms med=30.92ms max=310.86ms p(90)=37.25ms  p(95)=39.22ms  p(99.9)=58.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 190655
     http_req_receiving.............: avg=83.7µs  min=26.26µs med=53.74µs max=91.29ms  p(90)=103.49µs p(95)=146.81µs p(99.9)=2.44ms 
     http_req_sending...............: avg=33.33µs min=5.12µs  med=9.89µs  max=93.69ms  p(90)=19.33µs  p(95)=35.01µs  p(99.9)=1.78ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.12ms min=13.34ms med=30.82ms max=310.26ms p(90)=37.12ms  p(95)=39.08ms  p(99.9)=57.54ms
     http_reqs......................: 190655  1562.152301/s
     iteration_duration.............: avg=31.48ms min=13.66ms med=31.14ms max=353.71ms p(90)=37.47ms  p(95)=39.43ms  p(99.9)=59.27ms
     iterations.....................: 190555  1561.33294/s
     success_rate...................: 100.00% ✓ 190555      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 568053      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 228 MB  1.9 MB/s
     http_req_blocked...............: avg=3.26µs   min=962ns   med=2.47µs   max=9ms      p(90)=4.23µs  p(95)=5.12µs   p(99.9)=35.34µs
     http_req_connecting............: avg=289ns    min=0s      med=0s       max=2.89ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.43ms  min=13.91ms med=30.86ms  max=319.5ms  p(90)=38.55ms p(95)=41.14ms  p(99.9)=61.46ms
       { expected_response:true }...: avg=31.43ms  min=13.91ms med=30.86ms  max=319.5ms  p(90)=38.55ms p(95)=41.14ms  p(99.9)=61.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 189451
     http_req_receiving.............: avg=576.41µs min=50.62µs med=111.07µs max=244.99ms p(90)=1.58ms  p(95)=2.55ms   p(99.9)=14.23ms
     http_req_sending...............: avg=39.22µs  min=5.05µs  med=9.98µs   max=143.54ms p(90)=20.8µs  p(95)=111.26µs p(99.9)=2.05ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.81ms  min=13.74ms med=30.28ms  max=319.24ms p(90)=37.77ms p(95)=40.29ms  p(99.9)=59.15ms
     http_reqs......................: 189451  1552.782063/s
     iteration_duration.............: avg=31.67ms  min=14.17ms med=31.09ms  max=358.56ms p(90)=38.77ms p(95)=41.37ms  p(99.9)=61.85ms
     iterations.....................: 189351  1551.962441/s
     success_rate...................: 100.00% ✓ 189351      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 408516      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 164 MB  1.3 MB/s
     http_req_blocked...............: avg=3.78µs  min=932ns   med=2.32µs  max=4.65ms   p(90)=4.76µs  p(95)=5.94µs   p(99.9)=40.61µs
     http_req_connecting............: avg=783ns   min=0s      med=0s      max=4.6ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.78ms min=17.04ms med=43.38ms max=347.19ms p(90)=53.08ms p(95)=56.27ms  p(99.9)=81.71ms
       { expected_response:true }...: avg=43.78ms min=17.04ms med=43.38ms max=347.19ms p(90)=53.08ms p(95)=56.27ms  p(99.9)=81.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136272
     http_req_receiving.............: avg=96.87µs min=29.49µs med=61.13µs max=64.8ms   p(90)=131.5µs p(95)=197.29µs p(99.9)=2.86ms 
     http_req_sending...............: avg=37.07µs min=5.2µs   med=10.16µs max=151.27ms p(90)=23.66µs p(95)=109.18µs p(99.9)=2.51ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.64ms min=16.86ms med=43.25ms max=298.37ms p(90)=52.93ms p(95)=56.11ms  p(99.9)=81.35ms
     http_reqs......................: 136272  1116.635452/s
     iteration_duration.............: avg=44.05ms min=17.59ms med=43.63ms max=363.75ms p(90)=53.32ms p(95)=56.52ms  p(99.9)=82.13ms
     iterations.....................: 136172  1115.816035/s
     success_rate...................: 100.00% ✓ 136172      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 399330      ✗ 0     
     data_received..................: 12 GB   96 MB/s
     data_sent......................: 160 MB  1.3 MB/s
     http_req_blocked...............: avg=3.92µs  min=1.09µs  med=2.7µs   max=4.29ms   p(90)=4.39µs   p(95)=5.16µs   p(99.9)=41.77µs
     http_req_connecting............: avg=837ns   min=0s      med=0s      max=4.25ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.82ms min=18.95ms med=44.21ms max=328.6ms  p(90)=54.53ms  p(95)=57.78ms  p(99.9)=74.6ms 
       { expected_response:true }...: avg=44.82ms min=18.95ms med=44.21ms max=328.6ms  p(90)=54.53ms  p(95)=57.78ms  p(99.9)=74.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 133210
     http_req_receiving.............: avg=90.42µs min=28.86µs med=68.71µs max=68.28ms  p(90)=114.71µs p(95)=141.01µs p(99.9)=1.85ms 
     http_req_sending...............: avg=26.93µs min=5.48µs  med=11.54µs max=92.37ms  p(90)=18.99µs  p(95)=23.75µs  p(99.9)=1.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=44.7ms  min=18.84ms med=44.1ms  max=328.07ms p(90)=54.41ms  p(95)=57.66ms  p(99.9)=74.23ms
     http_reqs......................: 133210  1091.480927/s
     iteration_duration.............: avg=45.07ms min=20.68ms med=44.42ms max=359.79ms p(90)=54.73ms  p(95)=58ms     p(99.9)=75.11ms
     iterations.....................: 133110  1090.661559/s
     success_rate...................: 100.00% ✓ 133110      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 189654     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 76 MB   621 kB/s
     http_req_blocked...............: avg=5.05µs  min=1.19µs  med=3.06µs  max=27.73ms  p(90)=4.6µs    p(95)=5.27µs   p(99.9)=52.17µs 
     http_req_connecting............: avg=1.69µs  min=0s      med=0s      max=27.64ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.55ms min=18.24ms med=92.1ms  max=360.5ms  p(90)=120.95ms p(95)=132.12ms p(99.9)=242ms   
       { expected_response:true }...: avg=94.55ms min=18.24ms med=92.1ms  max=360.5ms  p(90)=120.95ms p(95)=132.12ms p(99.9)=242ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 63318
     http_req_receiving.............: avg=87.61µs min=31.54µs med=78.03µs max=53.01ms  p(90)=114.73µs p(95)=128.86µs p(99.9)=953.01µs
     http_req_sending...............: avg=28.49µs min=5.49µs  med=13.75µs max=123.03ms p(90)=20.49µs  p(95)=22.96µs  p(99.9)=879.32µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.43ms min=18.07ms med=92ms    max=359.35ms p(90)=120.83ms p(95)=132.01ms p(99.9)=241.68ms
     http_reqs......................: 63318   517.29168/s
     iteration_duration.............: avg=94.91ms min=28.49ms med=92.37ms max=369.93ms p(90)=121.2ms  p(95)=132.4ms  p(99.9)=244.31ms
     iterations.....................: 63218   516.474706/s
     success_rate...................: 100.00% ✓ 63218      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 143943     ✗ 0    
     data_received..................: 4.2 GB  34 MB/s
     data_sent......................: 58 MB   471 kB/s
     http_req_blocked...............: avg=6.32µs   min=1.21µs  med=3.51µs   max=4.48ms   p(90)=5.08µs   p(95)=5.7µs    p(99.9)=565.54µs
     http_req_connecting............: avg=2.57µs   min=0s      med=0s       max=4.43ms   p(90)=0s       p(95)=0s       p(99.9)=536.9µs 
     http_req_duration..............: avg=124.59ms min=20.94ms med=122.69ms max=367.74ms p(90)=155.41ms p(95)=165.48ms p(99.9)=213.04ms
       { expected_response:true }...: avg=124.59ms min=20.94ms med=122.69ms max=367.74ms p(90)=155.41ms p(95)=165.48ms p(99.9)=213.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48081
     http_req_receiving.............: avg=96.29µs  min=33.24µs med=86.91µs  max=90.25ms  p(90)=119.95µs p(95)=133.63µs p(99.9)=789.26µs
     http_req_sending...............: avg=25.23µs  min=6.12µs  med=16.61µs  max=102.86ms p(90)=22.47µs  p(95)=24.52µs  p(99.9)=619.42µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.47ms min=20.84ms med=122.57ms max=367.28ms p(90)=155.3ms  p(95)=165.36ms p(99.9)=211.83ms
     http_reqs......................: 48081   392.632738/s
     iteration_duration.............: avg=125.08ms min=38.4ms  med=123ms    max=380.33ms p(90)=155.71ms p(95)=165.76ms p(99.9)=214.21ms
     iterations.....................: 47981   391.816131/s
     success_rate...................: 100.00% ✓ 47981      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 85068      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   279 kB/s
     http_req_blocked...............: avg=6.55µs   min=1.24µs  med=3.56µs   max=3.84ms   p(90)=5.06µs   p(95)=5.66µs   p(99.9)=1.11ms  
     http_req_connecting............: avg=2.75µs   min=0s      med=0s       max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=1.08ms  
     http_req_duration..............: avg=210.77ms min=19.11ms med=193.26ms max=711.27ms p(90)=261.91ms p(95)=313.11ms p(99.9)=653.12ms
       { expected_response:true }...: avg=210.77ms min=19.11ms med=193.26ms max=711.27ms p(90)=261.91ms p(95)=313.11ms p(99.9)=653.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28456
     http_req_receiving.............: avg=106.18µs min=33.47µs med=96.17µs  max=85.72ms  p(90)=129.52µs p(95)=143.47µs p(99.9)=712.09µs
     http_req_sending...............: avg=30.85µs  min=6.37µs  med=17.67µs  max=81.48ms  p(90)=23.15µs  p(95)=25.02µs  p(99.9)=563.32µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.63ms min=19ms    med=193.11ms max=711.15ms p(90)=261.78ms p(95)=312.98ms p(99.9)=653.03ms
     http_reqs......................: 28456   232.749303/s
     iteration_duration.............: avg=211.75ms min=66.08ms med=193.68ms max=711.51ms p(90)=262.49ms p(95)=315.54ms p(99.9)=653.35ms
     iterations.....................: 28356   231.931376/s
     success_rate...................: 100.00% ✓ 28356      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 84843      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   277 kB/s
     http_req_blocked...............: avg=7.01µs   min=1.23µs  med=3.4µs    max=4.29ms   p(90)=4.84µs   p(95)=5.43µs   p(99.9)=1.52ms  
     http_req_connecting............: avg=3.36µs   min=0s      med=0s       max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=1.49ms  
     http_req_duration..............: avg=211.32ms min=23.37ms med=186.24ms max=459.48ms p(90)=346.83ms p(95)=353.01ms p(99.9)=436.17ms
       { expected_response:true }...: avg=211.32ms min=23.37ms med=186.24ms max=459.48ms p(90)=346.83ms p(95)=353.01ms p(99.9)=436.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28381
     http_req_receiving.............: avg=97.63µs  min=36.14µs med=91.98µs  max=9.94ms   p(90)=125.84µs p(95)=138.98µs p(99.9)=595.5µs 
     http_req_sending...............: avg=31.44µs  min=6.14µs  med=16.98µs  max=155.76ms p(90)=22.52µs  p(95)=24.46µs  p(99.9)=690.25µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.19ms min=23.21ms med=186.05ms max=459.39ms p(90)=346.7ms  p(95)=352.88ms p(99.9)=436.05ms
     http_reqs......................: 28381   231.015379/s
     iteration_duration.............: avg=212.27ms min=62.82ms med=188.25ms max=459.71ms p(90)=347.16ms p(95)=353.33ms p(99.9)=436.47ms
     iterations.....................: 28281   230.2014/s
     success_rate...................: 100.00% ✓ 28281      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 4524      ✗ 0   
     data_received..................: 154 MB  1.2 MB/s
     data_sent......................: 1.9 MB  15 kB/s
     http_req_blocked...............: avg=66.5µs   min=1.42µs  med=3.52µs   max=3.97ms  p(90)=4.94µs   p(95)=6.32µs   p(99.9)=3.8ms   
     http_req_connecting............: avg=61.38µs  min=0s      med=0s       max=3.92ms  p(90)=0s       p(95)=0s       p(99.9)=3.77ms  
     http_req_duration..............: avg=3.78s    min=57.48ms med=3.96s    max=6.57s   p(90)=4.8s     p(95)=5.18s    p(99.9)=6.55s   
       { expected_response:true }...: avg=3.78s    min=57.48ms med=3.96s    max=6.57s   p(90)=4.8s     p(95)=5.18s    p(99.9)=6.55s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 1608
     http_req_receiving.............: avg=111.05µs min=40.65µs med=102.54µs max=9.13ms  p(90)=143.63µs p(95)=159.89µs p(99.9)=418.36µs
     http_req_sending...............: avg=77.41µs  min=6.54µs  med=18.92µs  max=16.11ms p(90)=24.54µs  p(95)=38.02µs  p(99.9)=12.47ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=3.78s    min=57.27ms med=3.96s    max=6.57s   p(90)=4.8s     p(95)=5.18s    p(99.9)=6.55s   
     http_reqs......................: 1608    12.473307/s
     iteration_duration.............: avg=4.03s    min=2.38s   med=4s       max=6.57s   p(90)=4.83s    p(95)=5.22s    p(99.9)=6.55s   
     iterations.....................: 1508    11.697604/s
     success_rate...................: 100.00% ✓ 1508      ✗ 0   
     vus............................: 36      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-185-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

