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
| hive-router | v0.0.65 | 1,577 | 1,601 | 1,570 | 0.6% |  |
| fusion-nightly | 16.2.0-p.4 | 1,527 | 1,547 | 1,512 | 0.7% |  |
| fusion | 16.1.4 | 1,454 | 1,475 | 1,442 | 0.7% |  |
| grafbase | 0.53.5 | 1,124 | 1,146 | 1,118 | 0.8% |  |
| cosmo | 0.321.1 | 1,102 | 1,117 | 1,091 | 1.1% | non-compatible response (7 across 4/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 510 | 524 | 504 | 1.2% |  |
| apollo-router | v2.15.0 | 392 | 402 | 388 | 1.1% |  |
| hive-gateway | 2.8.2 | 239 | 243 | 238 | 0.8% |  |
| apollo-gateway | 2.14.1 | 231 | 233 | 230 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 577251      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.42µs  min=972ns   med=2.62µs  max=3.23ms   p(90)=4.48µs   p(95)=5.43µs   p(99.9)=39.11µs
     http_req_connecting............: avg=328ns   min=0s      med=0s      max=3.2ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.92ms min=14.34ms med=30.66ms max=322.46ms p(90)=36.74ms  p(95)=38.66ms  p(99.9)=58.03ms
       { expected_response:true }...: avg=30.92ms min=14.34ms med=30.66ms max=322.46ms p(90)=36.74ms  p(95)=38.66ms  p(99.9)=58.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192517
     http_req_receiving.............: avg=87.64µs min=27.69µs med=57.33µs max=126.48ms p(90)=109.12µs p(95)=156.43µs p(99.9)=2.29ms 
     http_req_sending...............: avg=36.13µs min=5.35µs  med=10.44µs max=205.14ms p(90)=20.96µs  p(95)=47.27µs  p(99.9)=1.87ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.8ms  min=14.27ms med=30.55ms max=313.87ms p(90)=36.61ms  p(95)=38.51ms  p(99.9)=56.79ms
     http_reqs......................: 192517  1577.89649/s
     iteration_duration.............: avg=31.17ms min=14.56ms med=30.88ms max=359.18ms p(90)=36.96ms  p(95)=38.88ms  p(99.9)=58.38ms
     iterations.....................: 192417  1577.076876/s
     success_rate...................: 100.00% ✓ 192417      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.2.0-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 558810      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 224 MB  1.8 MB/s
     http_req_blocked...............: avg=3.13µs   min=982ns   med=2.42µs   max=8.97ms   p(90)=4.08µs  p(95)=4.91µs   p(99.9)=36.12µs
     http_req_connecting............: avg=232ns    min=0s      med=0s       max=2.35ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.96ms  min=13.64ms med=30.71ms  max=481ms    p(90)=39.03ms p(95)=42.67ms  p(99.9)=85.02ms
       { expected_response:true }...: avg=31.96ms  min=13.64ms med=30.71ms  max=481ms    p(90)=39.03ms p(95)=42.67ms  p(99.9)=85.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 186370
     http_req_receiving.............: avg=614.91µs min=50.6µs  med=108.59µs max=85.55ms  p(90)=1.74ms  p(95)=2.75ms   p(99.9)=14.09ms
     http_req_sending...............: avg=42.58µs  min=5.16µs  med=9.59µs   max=189.68ms p(90)=19.92µs p(95)=108.58µs p(99.9)=2.42ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.3ms   min=13.53ms med=30.08ms  max=480.65ms p(90)=38.16ms p(95)=41.67ms  p(99.9)=83.46ms
     http_reqs......................: 186370  1527.675515/s
     iteration_duration.............: avg=32.2ms   min=13.86ms med=30.93ms  max=481.22ms p(90)=39.26ms p(95)=42.91ms  p(99.9)=86.29ms
     iterations.....................: 186270  1526.855815/s
     success_rate...................: 100.00% ✓ 186270      ✗ 0     
     vus............................: 31      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.1.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 531921      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 213 MB  1.7 MB/s
     http_req_blocked...............: avg=3.4µs    min=1.02µs  med=2.29µs   max=5.49ms   p(90)=3.98µs  p(95)=4.88µs   p(99.9)=32.53µs
     http_req_connecting............: avg=613ns    min=0s      med=0s       max=4.06ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.58ms  min=14.22ms med=32.5ms   max=851.68ms p(90)=40.97ms p(95)=43.99ms  p(99.9)=96.9ms 
       { expected_response:true }...: avg=33.58ms  min=14.22ms med=32.5ms   max=851.68ms p(90)=40.97ms p(95)=43.99ms  p(99.9)=96.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 177407
     http_req_receiving.............: avg=839.15µs min=50.59µs med=114.42µs max=109.18ms p(90)=2.39ms  p(95)=3.6ms    p(99.9)=22.49ms
     http_req_sending...............: avg=40.03µs  min=5.19µs  med=9.36µs   max=263.92ms p(90)=20.38µs p(95)=105.99µs p(99.9)=2.47ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.7ms   min=14.11ms med=31.67ms  max=851.53ms p(90)=39.85ms p(95)=42.77ms  p(99.9)=95.58ms
     http_reqs......................: 177407  1454.110512/s
     iteration_duration.............: avg=33.83ms  min=14.43ms med=32.73ms  max=852.07ms p(90)=41.2ms  p(95)=44.21ms  p(99.9)=97.42ms
     iterations.....................: 177307  1453.290866/s
     success_rate...................: 100.00% ✓ 177307      ✗ 0     
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

     checks.........................: 100.00% ✓ 411330      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.56µs  min=951ns   med=2.23µs  max=3.79ms   p(90)=4.64µs   p(95)=5.81µs   p(99.9)=49.6µs 
     http_req_connecting............: avg=702ns   min=0s      med=0s      max=3.75ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.47ms min=15.24ms med=43ms    max=352.82ms p(90)=52.76ms  p(95)=55.93ms  p(99.9)=78.63ms
       { expected_response:true }...: avg=43.47ms min=15.24ms med=43ms    max=352.82ms p(90)=52.76ms  p(95)=55.93ms  p(99.9)=78.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137210
     http_req_receiving.............: avg=99.03µs min=29.39µs med=59.9µs  max=240.04ms p(90)=130.79µs p(95)=200.91µs p(99.9)=3ms    
     http_req_sending...............: avg=37.71µs min=5.15µs  med=9.98µs  max=239.81ms p(90)=24.04µs  p(95)=108.01µs p(99.9)=2.04ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.34ms min=15.13ms med=42.88ms max=316.79ms p(90)=52.62ms  p(95)=55.77ms  p(99.9)=78.1ms 
     http_reqs......................: 137210  1124.424525/s
     iteration_duration.............: avg=43.75ms min=16.96ms med=43.24ms max=370.07ms p(90)=52.99ms  p(95)=56.16ms  p(99.9)=79.38ms
     iterations.....................: 137110  1123.605033/s
     success_rate...................: 100.00% ✓ 137110      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 403260      ✗ 0     
     data_received..................: 12 GB   96 MB/s
     data_sent......................: 162 MB  1.3 MB/s
     http_req_blocked...............: avg=3.61µs  min=1.1µs   med=2.57µs  max=4.05ms   p(90)=4.13µs   p(95)=4.84µs   p(99.9)=36µs   
     http_req_connecting............: avg=667ns   min=0s      med=0s      max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.4ms  min=17.31ms med=43.82ms max=330.57ms p(90)=53.93ms  p(95)=57.19ms  p(99.9)=74.4ms 
       { expected_response:true }...: avg=44.4ms  min=17.31ms med=43.82ms max=330.57ms p(90)=53.93ms  p(95)=57.19ms  p(99.9)=74.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 134520
     http_req_receiving.............: avg=84.87µs min=28.37µs med=63.98µs max=31.61ms  p(90)=107.46µs p(95)=132.59µs p(99.9)=1.76ms 
     http_req_sending...............: avg=30.11µs min=5.5µs   med=10.91µs max=179.6ms  p(90)=18.55µs  p(95)=23.32µs  p(99.9)=1.31ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=44.28ms min=17.19ms med=43.71ms max=329.68ms p(90)=53.81ms  p(95)=57.06ms  p(99.9)=73.84ms
     http_reqs......................: 134520  1102.395097/s
     iteration_duration.............: avg=44.63ms min=19.01ms med=44.03ms max=370.3ms  p(90)=54.13ms  p(95)=57.39ms  p(99.9)=74.9ms 
     iterations.....................: 134420  1101.575594/s
     success_rate...................: 100.00% ✓ 134420      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 187203     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 75 MB   613 kB/s
     http_req_blocked...............: avg=4.26µs  min=1.18µs  med=3.11µs  max=2.86ms   p(90)=4.63µs   p(95)=5.27µs   p(99.9)=47.61µs 
     http_req_connecting............: avg=892ns   min=0s      med=0s      max=2.83ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.8ms  min=18.02ms med=93.73ms max=357.36ms p(90)=119.52ms p(95)=128.63ms p(99.9)=233.76ms
       { expected_response:true }...: avg=95.8ms  min=18.02ms med=93.73ms max=357.36ms p(90)=119.52ms p(95)=128.63ms p(99.9)=233.76ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62501
     http_req_receiving.............: avg=87.34µs min=32.95µs med=77.81µs max=104.03ms p(90)=113.16µs p(95)=126.66µs p(99.9)=889.51µs
     http_req_sending...............: avg=27.13µs min=5.79µs  med=14.05µs max=110.4ms  p(90)=20.83µs  p(95)=23.18µs  p(99.9)=683.13µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.69ms min=17.88ms med=93.62ms max=356.9ms  p(90)=119.41ms p(95)=128.5ms  p(99.9)=233.33ms
     http_reqs......................: 62501   510.514676/s
     iteration_duration.............: avg=96.16ms min=40.92ms med=93.99ms max=376.3ms  p(90)=119.77ms p(95)=128.91ms p(99.9)=235.06ms
     iterations.....................: 62401   509.697866/s
     success_rate...................: 100.00% ✓ 62401      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 143772     ✗ 0    
     data_received..................: 4.2 GB  34 MB/s
     data_sent......................: 58 MB   471 kB/s
     http_req_blocked...............: avg=4.57µs   min=1.26µs  med=3.49µs   max=1.89ms   p(90)=5.04µs   p(95)=5.66µs   p(99.9)=117.92µs
     http_req_connecting............: avg=868ns    min=0s      med=0s       max=1.85ms   p(90)=0s       p(95)=0s       p(99.9)=68.75µs 
     http_req_duration..............: avg=124.75ms min=21.95ms med=122.87ms max=354.23ms p(90)=155.14ms p(95)=165.66ms p(99.9)=212.22ms
       { expected_response:true }...: avg=124.75ms min=21.95ms med=122.87ms max=354.23ms p(90)=155.14ms p(95)=165.66ms p(99.9)=212.22ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48024
     http_req_receiving.............: avg=95.35µs  min=30.81µs med=85.84µs  max=95.97ms  p(90)=119.99µs p(95)=133.76µs p(99.9)=840.08µs
     http_req_sending...............: avg=34.72µs  min=5.45µs  med=16.14µs  max=174.41ms p(90)=22.34µs  p(95)=24.43µs  p(99.9)=714.49µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.62ms min=21.82ms med=122.76ms max=338.81ms p(90)=155.02ms p(95)=165.52ms p(99.9)=211.03ms
     http_reqs......................: 48024   392.05476/s
     iteration_duration.............: avg=125.24ms min=41.71ms med=123.18ms max=380.8ms  p(90)=155.43ms p(95)=165.97ms p(99.9)=218.06ms
     iterations.....................: 47924   391.238387/s
     success_rate...................: 100.00% ✓ 47924      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 87546      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=7.67µs   min=1.28µs  med=3.84µs   max=4.49ms   p(90)=5.43µs   p(95)=6.06µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=3.53µs   min=0s      med=0s       max=4.45ms   p(90)=0s       p(95)=0s       p(99.9)=1.52ms  
     http_req_duration..............: avg=204.76ms min=18.73ms med=190.28ms max=692.39ms p(90)=239.11ms p(95)=275.81ms p(99.9)=624.21ms
       { expected_response:true }...: avg=204.76ms min=18.73ms med=190.28ms max=692.39ms p(90)=239.11ms p(95)=275.81ms p(99.9)=624.21ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29282
     http_req_receiving.............: avg=109.39µs min=36.65µs med=101.64µs max=96.8ms   p(90)=134.79µs p(95)=147.97µs p(99.9)=673.75µs
     http_req_sending...............: avg=29.29µs  min=6.51µs  med=19.26µs  max=91.93ms  p(90)=24.46µs  p(95)=26.43µs  p(99.9)=563.65µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.62ms min=18.53ms med=190.14ms max=692.26ms p(90)=239ms    p(95)=275.7ms  p(99.9)=624.08ms
     http_reqs......................: 29282   239.455382/s
     iteration_duration.............: avg=205.73ms min=62.58ms med=190.75ms max=692.57ms p(90)=239.56ms p(95)=278.65ms p(99.9)=624.47ms
     iterations.....................: 29182   238.637626/s
     success_rate...................: 100.00% ✓ 29182      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 85143      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   278 kB/s
     http_req_blocked...............: avg=7.64µs   min=1.39µs  med=3.62µs   max=4.67ms   p(90)=5.14µs   p(95)=5.72µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=3.7µs    min=0s      med=0s       max=4.63ms   p(90)=0s       p(95)=0s       p(99.9)=1.63ms  
     http_req_duration..............: avg=210.59ms min=20.68ms med=232.24ms max=420.16ms p(90)=245.88ms p(95)=250.9ms  p(99.9)=329.01ms
       { expected_response:true }...: avg=210.59ms min=20.68ms med=232.24ms max=420.16ms p(90)=245.88ms p(95)=250.9ms  p(99.9)=329.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28481
     http_req_receiving.............: avg=105.31µs min=35.85µs med=94.87µs  max=151.81ms p(90)=128.8µs  p(95)=141.81µs p(99.9)=535.87µs
     http_req_sending...............: avg=30.04µs  min=6.23µs  med=18.34µs  max=83.51ms  p(90)=23.57µs  p(95)=25.63µs  p(99.9)=613.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.46ms min=20.52ms med=232.12ms max=416.16ms p(90)=245.75ms p(95)=250.75ms p(99.9)=328.43ms
     http_reqs......................: 28481   231.830685/s
     iteration_duration.............: avg=211.54ms min=48.16ms med=232.53ms max=430.19ms p(90)=246.18ms p(95)=251.2ms  p(99.9)=331.87ms
     iterations.....................: 28381   231.016701/s
     success_rate...................: 100.00% ✓ 28381      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

