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
| hive-router | v0.0.72 | 2,962 | 3,094 | 2,907 | 2.0% |  |
| fusion-nightly | 16.3.0-p.2 | 2,201 | 2,252 | 2,174 | 1.1% |  |
| fusion | 16.2.3 | 2,180 | 2,232 | 2,171 | 0.9% |  |
| grafbase | 0.53.5 | 2,021 | 2,132 | 2,006 | 2.3% |  |
| cosmo | 0.326.0 | 1,183 | 1,207 | 1,172 | 1.0% |  |
| hive-gateway-router-runtime | 2.9.0 | 553 | 567 | 549 | 1.0% |  |
| apollo-router | v2.15.1 | 443 | 455 | 440 | 1.2% |  |
| apollo-gateway | 2.14.1 | 247 | 250 | 245 | 0.6% |  |
| hive-gateway | 2.9.0 | 230 | 236 | 228 | 1.2% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.72 | 2,292 | 2,432 | 2,266 | 2.5% |  |
| fusion-nightly | 16.3.0-p.2 | 2,085 | 2,128 | 2,079 | 0.8% |  |
| fusion | 16.2.3 | 2,009 | 2,063 | 1,987 | 1.2% |  |
| grafbase | 0.53.5 | 1,502 | 1,537 | 1,489 | 1.0% |  |
| cosmo | 0.326.0 | 1,132 | 1,155 | 1,124 | 0.9% |  |
| hive-gateway-router-runtime | 2.9.0 | 520 | 537 | 513 | 1.6% |  |
| apollo-router | v2.15.1 | 409 | 421 | 405 | 1.3% |  |
| apollo-gateway | 2.14.1 | 239 | 242 | 236 | 0.8% |  |
| hive-gateway | 2.9.0 | 239 | 243 | 236 | 1.1% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1068153     ✗ 0     
     data_received..................: 31 GB   260 MB/s
     data_sent......................: 428 MB  3.6 MB/s
     http_req_blocked...............: avg=3.01µs   min=922ns   med=2.13µs  max=17.74ms  p(90)=3.42µs  p(95)=4.11µs   p(99.9)=32.89µs
     http_req_connecting............: avg=306ns    min=0s      med=0s      max=3.91ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.61ms  min=1.62ms  med=15.61ms max=266.83ms p(90)=24.78ms p(95)=28.8ms   p(99.9)=51.15ms
       { expected_response:true }...: avg=16.61ms  min=1.62ms  med=15.61ms max=266.83ms p(90)=24.78ms p(95)=28.8ms   p(99.9)=51.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 356151
     http_req_receiving.............: avg=143.24µs min=27.61µs med=48.71µs max=212.48ms p(90)=97.04µs p(95)=273.17µs p(99.9)=13.24ms
     http_req_sending...............: avg=60.62µs  min=5.15µs  med=9.06µs  max=191.87ms p(90)=15.61µs p(95)=120.31µs p(99.9)=13.55ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.4ms   min=1.56ms  med=15.45ms max=129.2ms  p(90)=24.5ms  p(95)=28.4ms   p(99.9)=49.88ms
     http_reqs......................: 356151  2962.919613/s
     iteration_duration.............: avg=16.84ms  min=2.05ms  med=15.81ms max=367.17ms p(90)=25.02ms p(95)=29.07ms  p(99.9)=52.38ms
     iterations.....................: 356051  2962.087685/s
     success_rate...................: 100.00% ✓ 356051      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.3.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 794175      ✗ 0     
     data_received..................: 23 GB   193 MB/s
     data_sent......................: 318 MB  2.6 MB/s
     http_req_blocked...............: avg=3.06µs  min=951ns   med=2.24µs   max=14.16ms  p(90)=3.5µs   p(95)=4.16µs   p(99.9)=31.28µs 
     http_req_connecting............: avg=369ns   min=0s      med=0s       max=3.91ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.41ms min=2.31ms  med=19.02ms  max=321.23ms p(90)=38.78ms p(95)=48.46ms  p(99.9)=117.8ms 
       { expected_response:true }...: avg=22.41ms min=2.31ms  med=19.02ms  max=321.23ms p(90)=38.78ms p(95)=48.46ms  p(99.9)=117.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 264825
     http_req_receiving.............: avg=1.04ms  min=49.61µs med=337.67µs max=281.79ms p(90)=2.15ms  p(95)=3.2ms    p(99.9)=40.01ms 
     http_req_sending...............: avg=46.32µs min=5.17µs  med=9.42µs   max=280.31ms p(90)=17.59µs p(95)=114.42µs p(99.9)=3.5ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.33ms min=2.21ms  med=17.94ms  max=304.41ms p(90)=37.21ms p(95)=46.66ms  p(99.9)=116.25ms
     http_reqs......................: 264825  2201.487825/s
     iteration_duration.............: avg=22.65ms min=2.7ms   med=19.24ms  max=352.2ms  p(90)=39.02ms p(95)=48.72ms  p(99.9)=118.88ms
     iterations.....................: 264725  2200.656526/s
     success_rate...................: 100.00% ✓ 264725      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.2.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 786777      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 315 MB  2.6 MB/s
     http_req_blocked...............: avg=3.1µs    min=961ns   med=2.14µs   max=13.06ms  p(90)=3.39µs  p(95)=4.05µs   p(99.9)=32.62µs 
     http_req_connecting............: avg=475ns    min=0s      med=0s       max=4.83ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.63ms  min=2.51ms  med=14.91ms  max=311.88ms p(90)=49.52ms p(95)=67.06ms  p(99.9)=162.58ms
       { expected_response:true }...: avg=22.63ms  min=2.51ms  med=14.91ms  max=311.88ms p(90)=49.52ms p(95)=67.06ms  p(99.9)=162.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 262359
     http_req_receiving.............: avg=912.48µs min=51.31µs med=135.75µs max=154.05ms p(90)=1.34ms  p(95)=2.19ms   p(99.9)=62.53ms 
     http_req_sending...............: avg=43.51µs  min=5.13µs  med=9.39µs   max=230.54ms p(90)=16.77µs p(95)=108.72µs p(99.9)=2.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.67ms  min=2.37ms  med=14.16ms  max=311.43ms p(90)=47.71ms p(95)=65.08ms  p(99.9)=159.76ms
     http_reqs......................: 262359  2180.974315/s
     iteration_duration.............: avg=22.86ms  min=2.7ms   med=15.13ms  max=342.02ms p(90)=49.75ms p(95)=67.28ms  p(99.9)=163.7ms 
     iterations.....................: 262259  2180.143021/s
     success_rate...................: 100.00% ✓ 262259      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 729105      ✗ 0     
     data_received..................: 21 GB   178 MB/s
     data_sent......................: 292 MB  2.4 MB/s
     http_req_blocked...............: avg=3.12µs   min=992ns   med=2.21µs  max=13.5ms   p(90)=3.65µs   p(95)=4.4µs    p(99.9)=36.64µs
     http_req_connecting............: avg=424ns    min=0s      med=0s      max=4.37ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.44ms  min=1.98ms  med=24.18ms max=307.03ms p(90)=29.25ms  p(95)=31.4ms   p(99.9)=52.02ms
       { expected_response:true }...: avg=24.44ms  min=1.98ms  med=24.18ms max=307.03ms p(90)=29.25ms  p(95)=31.4ms   p(99.9)=52.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 243135
     http_req_receiving.............: avg=109.73µs min=29.95µs med=58.86µs max=102.92ms p(90)=100.01µs p(95)=165.72µs p(99.9)=9.31ms 
     http_req_sending...............: avg=40.43µs  min=4.96µs  med=9.94µs  max=81.12ms  p(90)=17.16µs  p(95)=97.7µs   p(99.9)=2.22ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.29ms  min=1.85ms  med=24.07ms max=306.14ms p(90)=29.09ms  p(95)=31.16ms  p(99.9)=50.52ms
     http_reqs......................: 243135  2021.472205/s
     iteration_duration.............: avg=24.68ms  min=3.71ms  med=24.39ms max=352.85ms p(90)=29.47ms  p(95)=31.64ms  p(99.9)=52.62ms
     iterations.....................: 243035  2020.640786/s
     success_rate...................: 100.00% ✓ 243035      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.326.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 426654      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.16µs  min=1.01µs  med=2.53µs  max=3.87ms   p(90)=3.91µs   p(95)=4.54µs   p(99.9)=37.49µs
     http_req_connecting............: avg=295ns   min=0s      med=0s      max=1.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.93ms min=2.12ms  med=41.37ms max=330.28ms p(90)=59.18ms  p(95)=64.62ms  p(99.9)=91.37ms
       { expected_response:true }...: avg=41.93ms min=2.12ms  med=41.37ms max=330.28ms p(90)=59.18ms  p(95)=64.62ms  p(99.9)=91.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142318
     http_req_receiving.............: avg=86.27µs min=29.91µs med=65.04µs max=132.38ms p(90)=102.48µs p(95)=120.73µs p(99.9)=1.94ms 
     http_req_sending...............: avg=26.68µs min=5.29µs  med=11.04µs max=166.11ms p(90)=16.98µs  p(95)=20.76µs  p(99.9)=1.19ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.82ms min=2.03ms  med=41.26ms max=330.11ms p(90)=59.06ms  p(95)=64.49ms  p(99.9)=91.03ms
     http_reqs......................: 142318  1183.274314/s
     iteration_duration.............: avg=42.18ms min=4.28ms  med=41.58ms max=342.26ms p(90)=59.4ms   p(95)=64.83ms  p(99.9)=92.15ms
     iterations.....................: 142218  1182.442884/s
     success_rate...................: 100.00% ✓ 142218      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 200007     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 80 MB   665 kB/s
     http_req_blocked...............: avg=4.74µs  min=1.16µs  med=2.9µs   max=3.9ms    p(90)=4.4µs    p(95)=4.99µs   p(99.9)=48.16µs 
     http_req_connecting............: avg=1.54µs  min=0s      med=0s      max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=89.64ms min=4.06ms  med=87.33ms max=358.3ms  p(90)=108.83ms p(95)=119.53ms p(99.9)=220.91ms
       { expected_response:true }...: avg=89.64ms min=4.06ms  med=87.33ms max=358.3ms  p(90)=108.83ms p(95)=119.53ms p(99.9)=220.91ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 66769
     http_req_receiving.............: avg=85.43µs min=30.8µs  med=76.1µs  max=63.59ms  p(90)=111.36µs p(95)=123.86µs p(99.9)=983.82µs
     http_req_sending...............: avg=24.52µs min=5.53µs  med=13.14µs max=114.51ms p(90)=19.83µs  p(95)=22.29µs  p(99.9)=645.89µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.53ms min=3.97ms  med=87.23ms max=348.86ms p(90)=108.71ms p(95)=119.39ms p(99.9)=220.65ms
     http_reqs......................: 66769   553.950152/s
     iteration_duration.............: avg=90.01ms min=14.59ms med=87.57ms max=372.52ms p(90)=109.08ms p(95)=119.81ms p(99.9)=222.35ms
     iterations.....................: 66669   553.1205/s
     success_rate...................: 100.00% ✓ 66669      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 160416     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   533 kB/s
     http_req_blocked...............: avg=5.58µs   min=1.15µs  med=3.4µs    max=4.22ms   p(90)=4.82µs   p(95)=5.37µs   p(99.9)=104.68µs
     http_req_connecting............: avg=1.95µs   min=0s      med=0s       max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.75ms min=5.19ms  med=111.52ms max=356.59ms p(90)=134.63ms p(95)=141.44ms p(99.9)=174.08ms
       { expected_response:true }...: avg=111.75ms min=5.19ms  med=111.52ms max=356.59ms p(90)=134.63ms p(95)=141.44ms p(99.9)=174.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53572
     http_req_receiving.............: avg=93.26µs  min=31.16µs med=84.88µs  max=127.84ms p(90)=116.54µs p(95)=128.45µs p(99.9)=827.66µs
     http_req_sending...............: avg=26.58µs  min=5.88µs  med=15.92µs  max=92.38ms  p(90)=21.26µs  p(95)=23.07µs  p(99.9)=631.59µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.63ms min=5.07ms  med=111.41ms max=355.95ms p(90)=134.52ms p(95)=141.31ms p(99.9)=173.63ms
     http_reqs......................: 53572   443.956654/s
     iteration_duration.............: avg=112.23ms min=17.94ms med=111.81ms max=365.26ms p(90)=134.88ms p(95)=141.69ms p(99.9)=177.17ms
     iterations.....................: 53472   443.127944/s
     success_rate...................: 100.00% ✓ 53472      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 89760      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   298 kB/s
     http_req_blocked...............: avg=7.15µs   min=1.18µs  med=3.45µs   max=4.14ms   p(90)=4.73µs   p(95)=5.26µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=3.48µs   min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=199.69ms min=8.53ms  med=199.76ms max=446.66ms p(90)=207.76ms p(95)=212.05ms p(99.9)=292.71ms
       { expected_response:true }...: avg=199.69ms min=8.53ms  med=199.76ms max=446.66ms p(90)=207.76ms p(95)=212.05ms p(99.9)=292.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30020
     http_req_receiving.............: avg=97.29µs  min=35.17µs med=91.71µs  max=47.22ms  p(90)=123.21µs p(95)=135.39µs p(99.9)=544.33µs
     http_req_sending...............: avg=35.7µs   min=5.96µs  med=16.78µs  max=148.32ms p(90)=21.51µs  p(95)=23.25µs  p(99.9)=585.03µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.56ms min=8.38ms  med=199.63ms max=446.06ms p(90)=207.64ms p(95)=211.91ms p(99.9)=292.62ms
     http_reqs......................: 30020   247.986033/s
     iteration_duration.............: avg=200.64ms min=63.39ms med=200.07ms max=466.61ms p(90)=208.01ms p(95)=212.31ms p(99.9)=301.1ms 
     iterations.....................: 29920   247.159964/s
     success_rate...................: 100.00% ✓ 29920      ✗ 0    
     vus............................: 29      min=29       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 83289      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 34 MB   276 kB/s
     http_req_blocked...............: avg=7.39µs   min=1.22µs  med=3.42µs   max=4.08ms   p(90)=4.73µs   p(95)=5.31µs   p(99.9)=1.94ms  
     http_req_connecting............: avg=3.7µs    min=0s      med=0s       max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=1.88ms  
     http_req_duration..............: avg=215.34ms min=6.61ms  med=242.74ms max=845.59ms p(90)=358.42ms p(95)=508.18ms p(99.9)=732.93ms
       { expected_response:true }...: avg=215.34ms min=6.61ms  med=242.74ms max=845.59ms p(90)=358.42ms p(95)=508.18ms p(99.9)=732.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 27863
     http_req_receiving.............: avg=98.83µs  min=34.98µs med=92.3µs   max=32.43ms  p(90)=123.67µs p(95)=136.59µs p(99.9)=946.48µs
     http_req_sending...............: avg=24.11µs  min=6.12µs  med=17.12µs  max=29.75ms  p(90)=22.01µs  p(95)=23.8µs   p(99.9)=600.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=215.22ms min=6.45ms  med=242.59ms max=845.53ms p(90)=358.26ms p(95)=508.07ms p(99.9)=732.81ms
     http_reqs......................: 27863   230.114552/s
     iteration_duration.............: avg=216.37ms min=10.24ms med=243.97ms max=845.82ms p(90)=359.01ms p(95)=509.01ms p(99.9)=733.21ms
     iterations.....................: 27763   229.288673/s
     success_rate...................: 100.00% ✓ 27763      ✗ 0    
     vus............................: 18      min=18       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 826692      ✗ 0     
     data_received..................: 24 GB   201 MB/s
     data_sent......................: 331 MB  2.8 MB/s
     http_req_blocked...............: avg=3.4µs   min=971ns   med=2.31µs  max=43.42ms  p(90)=3.8µs    p(95)=4.58µs   p(99.9)=35.9µs 
     http_req_connecting............: avg=393ns   min=0s      med=0s      max=4.35ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.53ms min=1.93ms  med=21.07ms max=316.5ms  p(90)=29.81ms  p(95)=32.79ms  p(99.9)=54.37ms
       { expected_response:true }...: avg=21.53ms min=1.93ms  med=21.07ms max=316.5ms  p(90)=29.81ms  p(95)=32.79ms  p(99.9)=54.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 275664
     http_req_receiving.............: avg=114.4µs min=28.44µs med=55.18µs max=122.13ms p(90)=104.06µs p(95)=254.07µs p(99.9)=8.76ms 
     http_req_sending...............: avg=50.18µs min=4.96µs  med=9.97µs  max=117.11ms p(90)=18.55µs  p(95)=124.48µs p(99.9)=4.16ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.36ms min=1.87ms  med=20.93ms max=307.95ms p(90)=29.61ms  p(95)=32.53ms  p(99.9)=53.49ms
     http_reqs......................: 275664  2292.51403/s
     iteration_duration.............: avg=21.76ms min=3.26ms  med=21.28ms max=349.09ms p(90)=30.03ms  p(95)=33.02ms  p(99.9)=55.01ms
     iterations.....................: 275564  2291.682396/s
     success_rate...................: 100.00% ✓ 275564      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.3.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 751764      ✗ 0     
     data_received..................: 22 GB   183 MB/s
     data_sent......................: 301 MB  2.5 MB/s
     http_req_blocked...............: avg=3.29µs  min=971ns  med=2.38µs   max=11.1ms   p(90)=4.04µs  p(95)=4.85µs   p(99.9)=35.38µs 
     http_req_connecting............: avg=420ns   min=0s     med=0s       max=4.63ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.68ms min=1.86ms med=20.89ms  max=327.45ms p(90)=39.37ms p(95)=47.75ms  p(99.9)=107.41ms
       { expected_response:true }...: avg=23.68ms min=1.86ms med=20.89ms  max=327.45ms p(90)=39.37ms p(95)=47.75ms  p(99.9)=107.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 250688
     http_req_receiving.............: avg=1.1ms   min=51.3µs med=361.15µs max=203.26ms p(90)=2.4ms   p(95)=3.54ms   p(99.9)=36.65ms 
     http_req_sending...............: avg=46.08µs min=5.26µs med=10.12µs  max=207.04ms p(90)=20.52µs p(95)=118.32µs p(99.9)=3.05ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.53ms min=1.73ms med=19.76ms  max=302.26ms p(90)=37.83ms p(95)=45.98ms  p(99.9)=104.33ms
     http_reqs......................: 250688  2085.057572/s
     iteration_duration.............: avg=23.93ms min=2.25ms med=21.12ms  max=351.94ms p(90)=39.62ms p(95)=47.99ms  p(99.9)=108.17ms
     iterations.....................: 250588  2084.225838/s
     success_rate...................: 100.00% ✓ 250588      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.2.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 724578      ✗ 0     
     data_received..................: 21 GB   176 MB/s
     data_sent......................: 290 MB  2.4 MB/s
     http_req_blocked...............: avg=3.41µs   min=952ns   med=2.41µs   max=15.52ms  p(90)=3.86µs  p(95)=4.59µs   p(99.9)=39.67µs 
     http_req_connecting............: avg=463ns    min=0s      med=0s       max=4.58ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.59ms  min=1.91ms  med=18.08ms  max=398.66ms p(90)=49.11ms p(95)=65.73ms  p(99.9)=167.58ms
       { expected_response:true }...: avg=24.59ms  min=1.91ms  med=18.08ms  max=398.66ms p(90)=49.11ms p(95)=65.73ms  p(99.9)=167.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 241626
     http_req_receiving.............: avg=964.41µs min=52.87µs med=128.14µs max=262.38ms p(90)=1.62ms  p(95)=2.63ms   p(99.9)=56.74ms 
     http_req_sending...............: avg=49.26µs  min=5.08µs  med=10µs     max=212.01ms p(90)=18.55µs p(95)=109.06µs p(99.9)=3.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.58ms  min=1.78ms  med=17.26ms  max=398.21ms p(90)=47.27ms p(95)=63.71ms  p(99.9)=163.04ms
     http_reqs......................: 241626  2009.468163/s
     iteration_duration.............: avg=24.83ms  min=2.42ms  med=18.31ms  max=398.88ms p(90)=49.36ms p(95)=65.98ms  p(99.9)=168.5ms 
     iterations.....................: 241526  2008.636519/s
     success_rate...................: 100.00% ✓ 241526      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 542187      ✗ 0     
     data_received..................: 16 GB   132 MB/s
     data_sent......................: 217 MB  1.8 MB/s
     http_req_blocked...............: avg=3.51µs   min=932ns   med=2.39µs  max=3.66ms   p(90)=4.75µs   p(95)=5.89µs   p(99.9)=48.55µs
     http_req_connecting............: avg=448ns    min=0s      med=0s      max=3.62ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.91ms  min=2.44ms  med=32.06ms max=275.65ms p(90)=43.54ms  p(95)=48.28ms  p(99.9)=84.11ms
       { expected_response:true }...: avg=32.91ms  min=2.44ms  med=32.06ms max=275.65ms p(90)=43.54ms  p(95)=48.28ms  p(99.9)=84.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 180829
     http_req_receiving.............: avg=140.72µs min=30.01µs med=63.09µs max=194.43ms p(90)=138.78µs p(95)=292.4µs  p(99.9)=6.17ms 
     http_req_sending...............: avg=46.34µs  min=5.18µs  med=10.66µs max=103.5ms  p(90)=24.9µs   p(95)=138.28µs p(99.9)=3.33ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.73ms  min=2.36ms  med=31.93ms max=120.95ms p(90)=43.34ms  p(95)=48.03ms  p(99.9)=81.24ms
     http_reqs......................: 180829  1502.933422/s
     iteration_duration.............: avg=33.19ms  min=4.57ms  med=32.3ms  max=390.47ms p(90)=43.79ms  p(95)=48.55ms  p(99.9)=85.04ms
     iterations.....................: 180729  1502.102287/s
     success_rate...................: 100.00% ✓ 180729      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 408546      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 164 MB  1.4 MB/s
     http_req_blocked...............: avg=3.74µs  min=1.1µs   med=2.92µs  max=3.63ms   p(90)=4.51µs   p(95)=5.24µs   p(99.9)=39.88µs
     http_req_connecting............: avg=507ns   min=0s      med=0s      max=3.6ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.79ms min=2.24ms  med=43.22ms max=342.78ms p(90)=61.46ms  p(95)=66.97ms  p(99.9)=93.49ms
       { expected_response:true }...: avg=43.79ms min=2.24ms  med=43.22ms max=342.78ms p(90)=61.46ms  p(95)=66.97ms  p(99.9)=93.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136282
     http_req_receiving.............: avg=88.89µs min=29.71µs med=73.11µs max=57.63ms  p(90)=112.63µs p(95)=130.59µs p(99.9)=1.51ms 
     http_req_sending...............: avg=27.55µs min=5.24µs  med=12.81µs max=90.41ms  p(90)=19.75µs  p(95)=23.44µs  p(99.9)=1.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.67ms min=2.13ms  med=43.11ms max=333.05ms p(90)=61.35ms  p(95)=66.86ms  p(99.9)=93ms   
     http_reqs......................: 136282  1132.773316/s
     iteration_duration.............: avg=44.05ms min=4.26ms  med=43.45ms max=353.14ms p(90)=61.68ms  p(95)=67.19ms  p(99.9)=93.93ms
     iterations.....................: 136182  1131.942118/s
     success_rate...................: 100.00% ✓ 136182      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 188118     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 75 MB   625 kB/s
     http_req_blocked...............: avg=4.23µs  min=1.11µs  med=3.14µs  max=3.03ms   p(90)=4.62µs   p(95)=5.22µs   p(99.9)=61.78µs 
     http_req_connecting............: avg=842ns   min=0s      med=0s      max=2.99ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.3ms  min=4.23ms  med=92.91ms max=369.9ms  p(90)=115.25ms p(95)=126.48ms p(99.9)=231.48ms
       { expected_response:true }...: avg=95.3ms  min=4.23ms  med=92.91ms max=369.9ms  p(90)=115.25ms p(95)=126.48ms p(99.9)=231.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62806
     http_req_receiving.............: avg=94.51µs min=31.97µs med=81.72µs max=67.54ms  p(90)=115.96µs p(95)=129.12µs p(99.9)=918.61µs
     http_req_sending...............: avg=34.98µs min=5.82µs  med=14.48µs max=255.6ms  p(90)=20.83µs  p(95)=22.97µs  p(99.9)=769.69µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.17ms min=4.11ms  med=92.8ms  max=302.96ms p(90)=115.13ms p(95)=126.3ms  p(99.9)=231.07ms
     http_reqs......................: 62806   520.736187/s
     iteration_duration.............: avg=95.7ms  min=24.67ms med=93.16ms max=370.26ms p(90)=115.52ms p(95)=126.8ms  p(99.9)=233.4ms 
     iterations.....................: 62706   519.907069/s
     success_rate...................: 100.00% ✓ 62706      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 148194     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   492 kB/s
     http_req_blocked...............: avg=5.62µs   min=1.2µs   med=3.49µs   max=3.87ms   p(90)=5µs      p(95)=5.58µs   p(99.9)=161.67µs
     http_req_connecting............: avg=1.92µs   min=0s      med=0s       max=3.84ms   p(90)=0s       p(95)=0s       p(99.9)=74.05µs 
     http_req_duration..............: avg=120.98ms min=5.61ms  med=118.47ms max=344.84ms p(90)=160.18ms p(95)=172.45ms p(99.9)=221.73ms
       { expected_response:true }...: avg=120.98ms min=5.61ms  med=118.47ms max=344.84ms p(90)=160.18ms p(95)=172.45ms p(99.9)=221.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49498
     http_req_receiving.............: avg=135.62µs min=28.77µs med=87.57µs  max=144.24ms p(90)=119.27µs p(95)=132.02µs p(99.9)=999.06µs
     http_req_sending...............: avg=25.18µs  min=5.65µs  med=16.59µs  max=122.66ms p(90)=22µs     p(95)=23.89µs  p(99.9)=674.35µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.81ms min=5.52ms  med=118.34ms max=285.63ms p(90)=160.03ms p(95)=172.26ms p(99.9)=217.48ms
     http_reqs......................: 49498   409.997626/s
     iteration_duration.............: avg=121.5ms  min=16.47ms med=118.8ms  max=356.81ms p(90)=160.48ms p(95)=172.81ms p(99.9)=224.23ms
     iterations.....................: 49398   409.169315/s
     success_rate...................: 100.00% ✓ 49398      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86814      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=7.49µs   min=1.14µs  med=3.59µs   max=4.05ms   p(90)=5µs      p(95)=5.59µs   p(99.9)=1.94ms  
     http_req_connecting............: avg=3.6µs    min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=206.48ms min=8.96ms  med=207.13ms max=465.6ms  p(90)=218.51ms p(95)=222.82ms p(99.9)=307.57ms
       { expected_response:true }...: avg=206.48ms min=8.96ms  med=207.13ms max=465.6ms  p(90)=218.51ms p(95)=222.82ms p(99.9)=307.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29038
     http_req_receiving.............: avg=115.95µs min=33.69µs med=97.24µs  max=227.11ms p(90)=129.91µs p(95)=142.94µs p(99.9)=620.89µs
     http_req_sending...............: avg=40.59µs  min=6.16µs  med=17.87µs  max=174.58ms p(90)=22.88µs  p(95)=24.76µs  p(99.9)=614.74µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.32ms min=8.82ms  med=206.96ms max=440.89ms p(90)=218.38ms p(95)=222.59ms p(99.9)=307.03ms
     http_reqs......................: 29038   239.710658/s
     iteration_duration.............: avg=207.48ms min=55.32ms med=207.7ms  max=477.03ms p(90)=218.78ms p(95)=223.15ms p(99.9)=335.14ms
     iterations.....................: 28938   238.885152/s
     success_rate...................: 100.00% ✓ 28938      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86760      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=7.27µs   min=1.3µs   med=3.51µs   max=4.41ms   p(90)=4.86µs   p(95)=5.42µs   p(99.9)=1.69ms  
     http_req_connecting............: avg=3.58µs   min=0s      med=0s       max=4.37ms   p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=206.61ms min=6.61ms  med=215.86ms max=894.88ms p(90)=273.65ms p(95)=349.07ms p(99.9)=672.42ms
       { expected_response:true }...: avg=206.61ms min=6.61ms  med=215.86ms max=894.88ms p(90)=273.65ms p(95)=349.07ms p(99.9)=672.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29020
     http_req_receiving.............: avg=101.51µs min=34.83µs med=96.75µs  max=24.9ms   p(90)=128.3µs  p(95)=141.9µs  p(99.9)=564.75µs
     http_req_sending...............: avg=22.32µs  min=6.08µs  med=17.67µs  max=14.93ms  p(90)=22.56µs  p(95)=24.29µs  p(99.9)=543.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.49ms min=6.47ms  med=215.73ms max=894.74ms p(90)=273.5ms  p(95)=348.98ms p(99.9)=672.3ms 
     http_reqs......................: 29020   239.981506/s
     iteration_duration.............: avg=207.59ms min=33.82ms med=216.31ms max=895.16ms p(90)=274.13ms p(95)=351.35ms p(99.9)=672.78ms
     iterations.....................: 28920   239.154554/s
     success_rate...................: 100.00% ✓ 28920      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

