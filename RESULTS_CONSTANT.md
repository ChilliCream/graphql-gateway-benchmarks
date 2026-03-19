## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 2,887 | 3,065 | 2,858 | 2.4% |  |
| grafbase | 0.53.2 | 1,984 | 2,076 | 1,957 | 2.0% |  |
| hotchocolate | 16.0.0-p.11.49 | 1,855 | 1,885 | 1,841 | 0.8% |  |
| cosmo | 0.291.0 | 1,296 | 1,313 | 1,282 | 0.8% | non-compatible response (2 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.6 | 544 | 554 | 538 | 1.0% |  |
| apollo-router | v2.12.0 | 430 | 440 | 425 | 1.1% |  |
| hive-gateway | 2.5.6 | 275 | 281 | 274 | 1.0% |  |
| apollo-gateway | 2.13.2 | 246 | 248 | 244 | 0.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 2,278 | 2,414 | 2,249 | 2.5% |  |
| hotchocolate | 16.0.0-p.11.49 | 1,666 | 1,710 | 1,650 | 1.1% |  |
| grafbase | 0.53.2 | 1,555 | 1,588 | 1,546 | 0.9% |  |
| cosmo | 0.291.0 | 1,188 | 1,208 | 1,172 | 1.1% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.6 | 499 | 514 | 493 | 1.5% |  |
| apollo-router | v2.12.0 | 372 | 384 | 367 | 1.5% |  |
| hive-gateway | 2.5.6 | 264 | 270 | 262 | 1.1% |  |
| apollo-gateway | 2.13.2 | 241 | 244 | 240 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1040898     ✗ 0     
     data_received..................: 30 GB   253 MB/s
     data_sent......................: 417 MB  3.5 MB/s
     http_req_blocked...............: avg=2.86µs   min=982ns   med=1.99µs  max=23.6ms   p(90)=3.07µs  p(95)=3.69µs   p(99.9)=31.44µs
     http_req_connecting............: avg=302ns    min=0s      med=0s      max=3.79ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.05ms  min=1.45ms  med=16.24ms max=299.06ms p(90)=25.14ms p(95)=28.77ms  p(99.9)=51.08ms
       { expected_response:true }...: avg=17.05ms  min=1.45ms  med=16.24ms max=299.06ms p(90)=25.14ms p(95)=28.77ms  p(99.9)=51.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 347066
     http_req_receiving.............: avg=117.53µs min=27.53µs med=49.09µs max=133.25ms p(90)=94.68µs p(95)=262.54µs p(99.9)=11.2ms 
     http_req_sending...............: avg=56.14µs  min=5.21µs  med=8.89µs  max=177.05ms p(90)=15.27µs p(95)=119.91µs p(99.9)=7.3ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.88ms  min=1.4ms   med=16.1ms  max=278.91ms p(90)=24.9ms  p(95)=28.44ms  p(99.9)=49.76ms
     http_reqs......................: 347066  2887.624664/s
     iteration_duration.............: avg=17.28ms  min=1.99ms  med=16.44ms max=334.79ms p(90)=25.36ms p(95)=29.03ms  p(99.9)=52.01ms
     iterations.....................: 346966  2886.792654/s
     success_rate...................: 100.00% ✓ 346966      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 715578      ✗ 0     
     data_received..................: 21 GB   174 MB/s
     data_sent......................: 287 MB  2.4 MB/s
     http_req_blocked...............: avg=3.01µs   min=972ns   med=2.13µs  max=16.07ms  p(90)=3.42µs  p(95)=4.14µs   p(99.9)=37.51µs
     http_req_connecting............: avg=424ns    min=0s      med=0s      max=4.07ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.91ms  min=2.01ms  med=24.65ms max=301.06ms p(90)=29.76ms p(95)=31.84ms  p(99.9)=53.2ms 
       { expected_response:true }...: avg=24.91ms  min=2.01ms  med=24.65ms max=301.06ms p(90)=29.76ms p(95)=31.84ms  p(99.9)=53.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 238626
     http_req_receiving.............: avg=101.56µs min=29.83µs med=59.59µs max=56.74ms  p(90)=98.56µs p(95)=142.75µs p(99.9)=7ms    
     http_req_sending...............: avg=42.26µs  min=5.27µs  med=9.92µs  max=209.63ms p(90)=16.16µs p(95)=46.37µs  p(99.9)=2.4ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.77ms  min=1.9ms   med=24.53ms max=300.49ms p(90)=29.6ms  p(95)=31.62ms  p(99.9)=51.85ms
     http_reqs......................: 238626  1984.324559/s
     iteration_duration.............: avg=25.14ms  min=4.02ms  med=24.85ms max=349.09ms p(90)=29.97ms p(95)=32.07ms  p(99.9)=53.65ms
     iterations.....................: 238526  1983.492996/s
     success_rate...................: 100.00% ✓ 238526      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 669609      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 268 MB  2.2 MB/s
     http_req_blocked...............: avg=2.81µs   min=971ns   med=2µs     max=4.99ms   p(90)=3.07µs   p(95)=3.63µs  p(99.9)=33.68µs 
     http_req_connecting............: avg=483ns    min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=26.64ms  min=2.74ms  med=15.02ms max=425.16ms p(90)=64.47ms  p(95)=86.33ms p(99.9)=205.12ms
       { expected_response:true }...: avg=26.64ms  min=2.74ms  med=15.02ms max=425.16ms p(90)=64.47ms  p(95)=86.33ms p(99.9)=205.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223303
     http_req_receiving.............: avg=634.27µs min=50.06µs med=106.3µs max=269.33ms p(90)=768.92µs p(95)=1.19ms  p(99.9)=71.13ms 
     http_req_sending...............: avg=35.77µs  min=5.36µs  med=9.04µs  max=185.09ms p(90)=14.37µs  p(95)=23.8µs  p(99.9)=2.03ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=25.97ms  min=2.65ms  med=14.51ms max=425.09ms p(90)=63.16ms  p(95)=84.94ms p(99.9)=202.05ms
     http_reqs......................: 223303  1855.61409/s
     iteration_duration.............: avg=26.87ms  min=3.47ms  med=15.24ms max=425.34ms p(90)=64.72ms  p(95)=86.61ms p(99.9)=207.69ms
     iterations.....................: 223203  1854.783105/s
     success_rate...................: 100.00% ✓ 223203      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 467673      ✗ 0     
     data_received..................: 14 GB   114 MB/s
     data_sent......................: 187 MB  1.6 MB/s
     http_req_blocked...............: avg=3.53µs  min=1.05µs  med=2.49µs  max=4.71ms   p(90)=3.88µs  p(95)=4.52µs   p(99.9)=36.12µs
     http_req_connecting............: avg=732ns   min=0s      med=0s      max=4.65ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.24ms min=2.15ms  med=37.72ms max=324.19ms p(90)=53.8ms  p(95)=58.7ms   p(99.9)=82.38ms
       { expected_response:true }...: avg=38.24ms min=2.15ms  med=37.72ms max=324.19ms p(90)=53.8ms  p(95)=58.7ms   p(99.9)=82.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155991
     http_req_receiving.............: avg=81.86µs min=28.09µs med=61.34µs max=56.05ms  p(90)=98.04µs p(95)=117.46µs p(99.9)=1.95ms 
     http_req_sending...............: avg=27.36µs min=5.14µs  med=11.03µs max=75.96ms  p(90)=16.87µs p(95)=21.05µs  p(99.9)=1.36ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.13ms min=2.05ms  med=37.62ms max=323.95ms p(90)=53.68ms p(95)=58.59ms  p(99.9)=82.08ms
     http_reqs......................: 155991  1296.922906/s
     iteration_duration.............: avg=38.48ms min=3.76ms  med=37.94ms max=343.25ms p(90)=54.01ms p(95)=58.91ms  p(99.9)=82.78ms
     iterations.....................: 155891  1296.091497/s
     success_rate...................: 100.00% ✓ 155891      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 196578     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 79 MB   654 kB/s
     http_req_blocked...............: avg=4.71µs  min=1.11µs  med=2.76µs  max=4.07ms   p(90)=4.34µs   p(95)=4.95µs   p(99.9)=41.03µs 
     http_req_connecting............: avg=1.68µs  min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=91.19ms min=4.24ms  med=97.92ms max=353.59ms p(90)=127.98ms p(95)=139.92ms p(99.9)=239.53ms
       { expected_response:true }...: avg=91.19ms min=4.24ms  med=97.92ms max=353.59ms p(90)=127.98ms p(95)=139.92ms p(99.9)=239.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65626
     http_req_receiving.............: avg=87.67µs min=30.81µs med=77.6µs  max=89ms     p(90)=113.3µs  p(95)=126.89µs p(99.9)=905.03µs
     http_req_sending...............: avg=23.22µs min=5.65µs  med=13.35µs max=124ms    p(90)=20.39µs  p(95)=22.65µs  p(99.9)=767.03µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.08ms min=4.18ms  med=97.81ms max=353.13ms p(90)=127.87ms p(95)=139.8ms  p(99.9)=238.91ms
     http_reqs......................: 65626   544.379062/s
     iteration_duration.............: avg=91.57ms min=14.37ms med=98.17ms max=365.11ms p(90)=128.25ms p(95)=140.28ms p(99.9)=242.49ms
     iterations.....................: 65526   543.549545/s
     success_rate...................: 100.00% ✓ 65526      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 155454     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 62 MB   517 kB/s
     http_req_blocked...............: avg=4.84µs   min=1.2µs   med=3.34µs   max=3.2ms    p(90)=4.78µs   p(95)=5.34µs   p(99.9)=112.76µs
     http_req_connecting............: avg=1.25µs   min=0s      med=0s       max=3.17ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=115.34ms min=5.31ms  med=115.06ms max=370.53ms p(90)=139.26ms p(95)=146.51ms p(99.9)=180.06ms
       { expected_response:true }...: avg=115.34ms min=5.31ms  med=115.06ms max=370.53ms p(90)=139.26ms p(95)=146.51ms p(99.9)=180.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51918
     http_req_receiving.............: avg=168.64µs min=31.66µs med=85.15µs  max=255.88ms p(90)=115.99µs p(95)=127.75µs p(99.9)=876.76µs
     http_req_sending...............: avg=23.55µs  min=5.8µs   med=15.85µs  max=138.82ms p(90)=21.18µs  p(95)=22.99µs  p(99.9)=773.08µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.15ms min=5.24ms  med=114.92ms max=221.5ms  p(90)=139.09ms p(95)=146.32ms p(99.9)=174.96ms
     http_reqs......................: 51918   430.130734/s
     iteration_duration.............: avg=115.82ms min=24.53ms med=115.33ms max=378.65ms p(90)=139.53ms p(95)=146.79ms p(99.9)=181.58ms
     iterations.....................: 51818   429.302253/s
     success_rate...................: 100.00% ✓ 51818      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 99582      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   331 kB/s
     http_req_blocked...............: avg=6.43µs   min=1.21µs  med=3.56µs   max=4.62ms   p(90)=5.04µs   p(95)=5.68µs   p(99.9)=802.24µs
     http_req_connecting............: avg=2.52µs   min=0s      med=0s       max=4.6ms    p(90)=0s       p(95)=0s       p(99.9)=722.39µs
     http_req_duration..............: avg=180.06ms min=5.81ms  med=163.39ms max=659.34ms p(90)=207.79ms p(95)=250.79ms p(99.9)=590.54ms
       { expected_response:true }...: avg=180.06ms min=5.81ms  med=163.39ms max=659.34ms p(90)=207.79ms p(95)=250.79ms p(99.9)=590.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33294
     http_req_receiving.............: avg=107.91µs min=32.27µs med=95.53µs  max=114.25ms p(90)=127.37µs p(95)=141.3µs  p(99.9)=799.99µs
     http_req_sending...............: avg=24.77µs  min=5.63µs  med=17.94µs  max=32.29ms  p(90)=23.19µs  p(95)=25.24µs  p(99.9)=981.49µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=179.93ms min=5.65ms  med=163.26ms max=659.24ms p(90)=207.64ms p(95)=250.64ms p(99.9)=590.43ms
     http_reqs......................: 33294   275.37855/s
     iteration_duration.............: avg=180.88ms min=35.27ms med=163.74ms max=659.55ms p(90)=208.22ms p(95)=252.22ms p(99.9)=590.86ms
     iterations.....................: 33194   274.551438/s
     success_rate...................: 100.00% ✓ 33194      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 89208      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=6.72µs   min=1.23µs  med=3.29µs   max=3.88ms   p(90)=4.58µs   p(95)=5.08µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=3.22µs   min=0s      med=0s       max=3.84ms   p(90)=0s       p(95)=0s       p(99.9)=1.55ms  
     http_req_duration..............: avg=200.96ms min=8.51ms  med=193.3ms  max=436.68ms p(90)=224.46ms p(95)=234.31ms p(99.9)=295.16ms
       { expected_response:true }...: avg=200.96ms min=8.51ms  med=193.3ms  max=436.68ms p(90)=224.46ms p(95)=234.31ms p(99.9)=295.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29836
     http_req_receiving.............: avg=98.35µs  min=33.71µs med=91.12µs  max=85.69ms  p(90)=121.95µs p(95)=134.16µs p(99.9)=681.27µs
     http_req_sending...............: avg=32.98µs  min=5.46µs  med=16.38µs  max=124.04ms p(90)=21.14µs  p(95)=23.05µs  p(99.9)=595.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.83ms min=8.35ms  med=193.19ms max=435.97ms p(90)=224.33ms p(95)=234.18ms p(99.9)=294.87ms
     http_reqs......................: 29836   246.400787/s
     iteration_duration.............: avg=201.9ms  min=21.92ms med=193.57ms max=444.25ms p(90)=224.75ms p(95)=234.63ms p(99.9)=304.13ms
     iterations.....................: 29736   245.574937/s
     success_rate...................: 100.00% ✓ 29736      ✗ 0    
     vus............................: 37      min=37       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 821433      ✗ 0     
     data_received..................: 24 GB   199 MB/s
     data_sent......................: 329 MB  2.7 MB/s
     http_req_blocked...............: avg=2.88µs   min=990ns   med=2.14µs  max=14.9ms   p(90)=3.51µs   p(95)=4.29µs   p(99.9)=37.29µs
     http_req_connecting............: avg=177ns    min=0s      med=0s      max=2.41ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.67ms  min=1.61ms  med=21.18ms max=302.97ms p(90)=29.46ms  p(95)=32.45ms  p(99.9)=54.17ms
       { expected_response:true }...: avg=21.67ms  min=1.61ms  med=21.18ms max=302.97ms p(90)=29.46ms  p(95)=32.45ms  p(99.9)=54.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 273911
     http_req_receiving.............: avg=108.38µs min=28.48µs med=54.92µs max=37.81ms  p(90)=100.11µs p(95)=236.53µs p(99.9)=8.37ms 
     http_req_sending...............: avg=51.84µs  min=5.15µs  med=9.58µs  max=95.4ms   p(90)=17.27µs  p(95)=120.94µs p(99.9)=6.07ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.5ms   min=1.53ms  med=21.05ms max=302.6ms  p(90)=29.26ms  p(95)=32.18ms  p(99.9)=53.17ms
     http_reqs......................: 273911  2278.454979/s
     iteration_duration.............: avg=21.9ms   min=3.42ms  med=21.39ms max=329.09ms p(90)=29.68ms  p(95)=32.69ms  p(99.9)=54.71ms
     iterations.....................: 273811  2277.623156/s
     success_rate...................: 100.00% ✓ 273811      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 601122      ✗ 0     
     data_received..................: 18 GB   146 MB/s
     data_sent......................: 241 MB  2.0 MB/s
     http_req_blocked...............: avg=3.46µs   min=1.02µs  med=2.55µs   max=4.11ms   p(90)=3.94µs   p(95)=4.59µs  p(99.9)=37.37µs 
     http_req_connecting............: avg=562ns    min=0s      med=0s       max=4.07ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=29.69ms  min=2.26ms  med=18.89ms  max=616.99ms p(90)=66.52ms  p(95)=87.97ms p(99.9)=222.28ms
       { expected_response:true }...: avg=29.69ms  min=2.26ms  med=18.89ms  max=616.99ms p(90)=66.52ms  p(95)=87.97ms p(99.9)=222.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 200474
     http_req_receiving.............: avg=552.01µs min=52.27µs med=115.77µs max=274.96ms p(90)=768.59µs p(95)=1.2ms   p(99.9)=64.6ms  
     http_req_sending...............: avg=34.77µs  min=5.3µs   med=10.74µs  max=92.42ms  p(90)=17.67µs  p(95)=25.45µs p(99.9)=1.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=29.1ms   min=2.15ms  med=18.41ms  max=616.9ms  p(90)=65.44ms  p(95)=86.76ms p(99.9)=220.59ms
     http_reqs......................: 200474  1666.576408/s
     iteration_duration.............: avg=29.93ms  min=2.9ms   med=19.12ms  max=617.13ms p(90)=66.74ms  p(95)=88.21ms p(99.9)=226.7ms 
     iterations.....................: 200374  1665.74509/s
     success_rate...................: 100.00% ✓ 200374      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 560988      ✗ 0     
     data_received..................: 16 GB   136 MB/s
     data_sent......................: 225 MB  1.9 MB/s
     http_req_blocked...............: avg=3.74µs  min=982ns   med=2.31µs  max=18.32ms  p(90)=4.55µs   p(95)=5.76µs   p(99.9)=45.83µs
     http_req_connecting............: avg=760ns   min=0s      med=0s      max=18.26ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.81ms min=2.34ms  med=30.94ms max=330.76ms p(90)=42.08ms  p(95)=46.76ms  p(99.9)=87.07ms
       { expected_response:true }...: avg=31.81ms min=2.34ms  med=30.94ms max=330.76ms p(90)=42.08ms  p(95)=46.76ms  p(99.9)=87.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 187096
     http_req_receiving.............: avg=110.9µs min=30.34µs med=61.23µs max=124.61ms p(90)=134.17µs p(95)=276.84µs p(99.9)=5.27ms 
     http_req_sending...............: avg=45.99µs min=5.34µs  med=10.18µs max=206.6ms  p(90)=23.98µs  p(95)=133.7µs  p(99.9)=3.1ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.65ms min=2.17ms  med=30.81ms max=330.27ms p(90)=41.89ms  p(95)=46.5ms   p(99.9)=86.7ms 
     http_reqs......................: 187096  1555.269352/s
     iteration_duration.............: avg=32.07ms min=4.65ms  med=31.17ms max=354.15ms p(90)=42.32ms  p(95)=47ms     p(99.9)=88.24ms
     iterations.....................: 186996  1554.438084/s
     success_rate...................: 100.00% ✓ 186996      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 428697      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.47µs   min=1.08µs  med=2.36µs  max=6.58ms   p(90)=3.82µs   p(95)=4.47µs   p(99.9)=36.94µs
     http_req_connecting............: avg=728ns    min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.73ms  min=2.11ms  med=41.2ms  max=323.01ms p(90)=58.75ms  p(95)=64.09ms  p(99.9)=90.48ms
       { expected_response:true }...: avg=41.73ms  min=2.11ms  med=41.2ms  max=323.01ms p(90)=58.75ms  p(95)=64.09ms  p(99.9)=90.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142999
     http_req_receiving.............: avg=113.96µs min=29.84µs med=65.41µs max=232.51ms p(90)=103.19µs p(95)=121.68µs p(99.9)=2.14ms 
     http_req_sending...............: avg=25.47µs  min=5.46µs  med=11.01µs max=28.75ms  p(90)=17.33µs  p(95)=21.05µs  p(99.9)=1.27ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.59ms  min=2.05ms  med=41.09ms max=143.05ms p(90)=58.64ms  p(95)=63.96ms  p(99.9)=89.92ms
     http_reqs......................: 142999  1188.810397/s
     iteration_duration.............: avg=41.98ms  min=3.48ms  med=41.41ms max=342.87ms p(90)=58.96ms  p(95)=64.31ms  p(99.9)=90.77ms
     iterations.....................: 142899  1187.979056/s
     success_rate...................: 100.00% ✓ 142899      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 180477     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 72 MB   600 kB/s
     http_req_blocked...............: avg=5µs     min=1.12µs  med=2.95µs  max=4.61ms   p(90)=4.46µs   p(95)=5.05µs   p(99.9)=57.04µs 
     http_req_connecting............: avg=1.73µs  min=0s      med=0s      max=4.56ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=99.35ms min=4.34ms  med=90.04ms max=361.14ms p(90)=144.23ms p(95)=159.57ms p(99.9)=267.75ms
       { expected_response:true }...: avg=99.35ms min=4.34ms  med=90.04ms max=361.14ms p(90)=144.23ms p(95)=159.57ms p(99.9)=267.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60259
     http_req_receiving.............: avg=91.8µs  min=32.34µs med=80.07µs max=97.55ms  p(90)=114.14µs p(95)=126.77µs p(99.9)=892.59µs
     http_req_sending...............: avg=22.55µs min=5.71µs  med=13.56µs max=109.82ms p(90)=19.89µs  p(95)=21.96µs  p(99.9)=649.81µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.23ms min=4.27ms  med=89.93ms max=357.05ms p(90)=144.12ms p(95)=159.46ms p(99.9)=267.62ms
     http_reqs......................: 60259   499.618858/s
     iteration_duration.............: avg=99.75ms min=20.34ms med=90.31ms max=376.79ms p(90)=144.49ms p(95)=159.88ms p(99.9)=273.51ms
     iterations.....................: 60159   498.789738/s
     success_rate...................: 100.00% ✓ 60159      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 134808     ✗ 0    
     data_received..................: 3.9 GB  33 MB/s
     data_sent......................: 54 MB   448 kB/s
     http_req_blocked...............: avg=6.03µs   min=1.25µs  med=3.52µs   max=4.5ms    p(90)=4.98µs   p(95)=5.55µs   p(99.9)=391.01µs
     http_req_connecting............: avg=2.24µs   min=0s      med=0s       max=4.46ms   p(90)=0s       p(95)=0s       p(99.9)=205.05µs
     http_req_duration..............: avg=132.99ms min=5.95ms  med=130.35ms max=356ms    p(90)=176.04ms p(95)=189.93ms p(99.9)=242.68ms
       { expected_response:true }...: avg=132.99ms min=5.95ms  med=130.35ms max=356ms    p(90)=176.04ms p(95)=189.93ms p(99.9)=242.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45036
     http_req_receiving.............: avg=93.43µs  min=33.09µs med=88.94µs  max=6.95ms   p(90)=120.08µs p(95)=133.49µs p(99.9)=776.57µs
     http_req_sending...............: avg=24.21µs  min=5.89µs  med=16.64µs  max=72.97ms  p(90)=21.86µs  p(95)=23.72µs  p(99.9)=703.66µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=132.87ms min=5.81ms  med=130.24ms max=355.02ms p(90)=175.91ms p(95)=189.79ms p(99.9)=242.56ms
     http_reqs......................: 45036   372.951669/s
     iteration_duration.............: avg=133.55ms min=23.74ms med=130.68ms max=365.21ms p(90)=176.39ms p(95)=190.26ms p(99.9)=244.64ms
     iterations.....................: 44936   372.12355/s
     success_rate...................: 100.00% ✓ 44936      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 95682      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   318 kB/s
     http_req_blocked...............: avg=7.01µs   min=1.25µs  med=3.61µs   max=4.16ms   p(90)=5.05µs   p(95)=5.64µs   p(99.9)=1.55ms  
     http_req_connecting............: avg=3.22µs   min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=1.52ms  
     http_req_duration..............: avg=187.39ms min=5.93ms  med=172.39ms max=667.32ms p(90)=224.1ms  p(95)=345.4ms  p(99.9)=546.52ms
       { expected_response:true }...: avg=187.39ms min=5.93ms  med=172.39ms max=667.32ms p(90)=224.1ms  p(95)=345.4ms  p(99.9)=546.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31994
     http_req_receiving.............: avg=100.43µs min=34.47µs med=96.58µs  max=18.66ms  p(90)=127.98µs p(95)=140.8µs  p(99.9)=521.03µs
     http_req_sending...............: avg=34.31µs  min=6.23µs  med=17.85µs  max=116.67ms p(90)=22.84µs  p(95)=24.52µs  p(99.9)=592.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.25ms min=5.8ms   med=172.28ms max=667.21ms p(90)=223.97ms p(95)=345.29ms p(99.9)=546.42ms
     http_reqs......................: 31994   264.682661/s
     iteration_duration.............: avg=188.24ms min=54.74ms med=172.77ms max=667.51ms p(90)=224.43ms p(95)=350.23ms p(99.9)=546.82ms
     iterations.....................: 31894   263.855373/s
     success_rate...................: 100.00% ✓ 31894      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 87582      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=6.13µs   min=1.17µs  med=3.38µs   max=3.54ms   p(90)=4.69µs   p(95)=5.24µs   p(99.9)=1.14ms  
     http_req_connecting............: avg=2.54µs   min=0s      med=0s       max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=1.04ms  
     http_req_duration..............: avg=204.67ms min=8.71ms  med=204.91ms max=447.64ms p(90)=246.68ms p(95)=254.46ms p(99.9)=326.04ms
       { expected_response:true }...: avg=204.67ms min=8.71ms  med=204.91ms max=447.64ms p(90)=246.68ms p(95)=254.46ms p(99.9)=326.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29294
     http_req_receiving.............: avg=163.13µs min=33.36µs med=94.75µs  max=95.96ms  p(90)=126.02µs p(95)=139.19µs p(99.9)=2.41ms  
     http_req_sending...............: avg=38.73µs  min=5.99µs  med=17.76µs  max=163.99ms p(90)=22.45µs  p(95)=24.33µs  p(99.9)=889.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.46ms min=8.56ms  med=204.7ms  max=362.11ms p(90)=246.56ms p(95)=254.33ms p(99.9)=325.91ms
     http_reqs......................: 29294   241.859537/s
     iteration_duration.............: avg=205.65ms min=28.71ms med=205.48ms max=456.27ms p(90)=246.99ms p(95)=254.75ms p(99.9)=328.17ms
     iterations.....................: 29194   241.033908/s
     success_rate...................: 100.00% ✓ 29194      ✗ 0    
     vus............................: 47      min=47       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

