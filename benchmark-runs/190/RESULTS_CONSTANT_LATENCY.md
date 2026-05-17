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
| hive-router | v0.0.49 | 1,574 | 1,605 | 1,568 | 0.8% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,433 | 1,450 | 1,422 | 0.6% |  |
| cosmo | 0.307.0 | 1,130 | 1,147 | 1,118 | 0.9% | non-compatible response (1 across 1/9 runs) |
| grafbase | 0.53.3 | 1,128 | 1,154 | 1,125 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.25 | 495 | 507 | 489 | 1.2% |  |
| apollo-router | v2.13.1 | 363 | 375 | 358 | 1.6% |  |
| hive-gateway | 2.5.25 | 242 | 248 | 240 | 1.2% |  |
| apollo-gateway | 2.13.3 | 239 | 240 | 237 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 575934      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.5µs   min=1.01µs  med=2.5µs   max=5.03ms   p(90)=4.29µs   p(95)=5.2µs    p(99.9)=35.95µs
     http_req_connecting............: avg=530ns   min=0s      med=0s      max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31ms    min=13.67ms med=30.72ms max=347.8ms  p(90)=36.85ms  p(95)=38.84ms  p(99.9)=58.34ms
       { expected_response:true }...: avg=31ms    min=13.67ms med=30.72ms max=347.8ms  p(90)=36.85ms  p(95)=38.84ms  p(99.9)=58.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192078
     http_req_receiving.............: avg=86.5µs  min=26.68µs med=54.29µs max=31.36ms  p(90)=105.54µs p(95)=152.83µs p(99.9)=2.89ms 
     http_req_sending...............: avg=35.35µs min=5.14µs  med=10.1µs  max=112.52ms p(90)=19.88µs  p(95)=48.97µs  p(99.9)=1.93ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.87ms min=13.61ms med=30.61ms max=347.09ms p(90)=36.73ms  p(95)=38.69ms  p(99.9)=57.24ms
     http_reqs......................: 192078  1574.190948/s
     iteration_duration.............: avg=31.24ms min=13.85ms med=30.95ms max=354.48ms p(90)=37.07ms  p(95)=39.06ms  p(99.9)=58.79ms
     iterations.....................: 191978  1573.37139/s
     success_rate...................: 100.00% ✓ 191978      ✗ 0     
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

     checks.........................: 100.00% ✓ 524508      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 210 MB  1.7 MB/s
     http_req_blocked...............: avg=3.33µs  min=1µs     med=2.28µs   max=4.11ms   p(90)=3.98µs  p(95)=4.83µs   p(99.9)=38µs   
     http_req_connecting............: avg=584ns   min=0s      med=0s       max=4.05ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=34.06ms min=14.19ms med=32.8ms   max=493.87ms p(90)=41.71ms p(95)=45.32ms  p(99.9)=83.87ms
       { expected_response:true }...: avg=34.06ms min=14.19ms med=32.8ms   max=493.87ms p(90)=41.71ms p(95)=45.32ms  p(99.9)=83.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 174936
     http_req_receiving.............: avg=826.4µs min=50.72µs med=120.44µs max=266.22ms p(90)=2.36ms  p(95)=3.5ms    p(99.9)=16.25ms
     http_req_sending...............: avg=38.03µs min=4.98µs  med=9.41µs   max=188.46ms p(90)=19.89µs p(95)=103.21µs p(99.9)=2.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.19ms min=14.02ms med=31.95ms  max=493.78ms p(90)=40.62ms p(95)=44.06ms  p(99.9)=83.08ms
     http_reqs......................: 174936  1433.040978/s
     iteration_duration.............: avg=34.31ms min=14.4ms  med=33.02ms  max=494.09ms p(90)=41.93ms p(95)=45.55ms  p(99.9)=87.52ms
     iterations.....................: 174836  1432.221798/s
     success_rate...................: 100.00% ✓ 174836      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 413565      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.51µs  min=1.09µs  med=2.41µs  max=3.87ms   p(90)=4.03µs   p(95)=4.78µs  p(99.9)=37.24µs
     http_req_connecting............: avg=704ns   min=0s      med=0s      max=3.83ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=43.27ms min=19.21ms med=42.68ms max=352.03ms p(90)=52.67ms  p(95)=55.86ms p(99.9)=73.53ms
       { expected_response:true }...: avg=43.27ms min=19.21ms med=42.68ms max=352.03ms p(90)=52.67ms  p(95)=55.86ms p(99.9)=73.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137955
     http_req_receiving.............: avg=85.65µs min=28.02µs med=64.25µs max=83.92ms  p(90)=107.92µs p(95)=132.9µs p(99.9)=1.68ms 
     http_req_sending...............: avg=25.89µs min=5.14µs  med=10.47µs max=106.22ms p(90)=17.49µs  p(95)=22.25µs p(99.9)=1.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=43.16ms min=19.12ms med=42.58ms max=310.25ms p(90)=52.56ms  p(95)=55.73ms p(99.9)=72.98ms
     http_reqs......................: 137955  1130.543199/s
     iteration_duration.............: avg=43.51ms min=19.45ms med=42.89ms max=364.83ms p(90)=52.88ms  p(95)=56.06ms p(99.9)=74.01ms
     iterations.....................: 137855  1129.723698/s
     success_rate...................: 100.00% ✓ 137855      ✗ 0     
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

     checks.........................: 100.00% ✓ 412821      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.58µs  min=962ns   med=2.18µs  max=4.27ms   p(90)=4.51µs   p(95)=5.69µs   p(99.9)=46.76µs
     http_req_connecting............: avg=747ns   min=0s      med=0s      max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.31ms min=17.03ms med=42.8ms  max=347.9ms  p(90)=52.7ms   p(95)=56.02ms  p(99.9)=79.74ms
       { expected_response:true }...: avg=43.31ms min=17.03ms med=42.8ms  max=347.9ms  p(90)=52.7ms   p(95)=56.02ms  p(99.9)=79.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137707
     http_req_receiving.............: avg=96.01µs min=30.38µs med=60.05µs max=115.81ms p(90)=130.25µs p(95)=202.45µs p(99.9)=2.8ms  
     http_req_sending...............: avg=37.42µs min=4.98µs  med=9.72µs  max=146.82ms p(90)=23.14µs  p(95)=110.49µs p(99.9)=2.11ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.18ms min=16.97ms med=42.67ms max=347.47ms p(90)=52.55ms  p(95)=55.85ms  p(99.9)=79.17ms
     http_reqs......................: 137707  1128.568927/s
     iteration_duration.............: avg=43.59ms min=17.19ms med=43.05ms max=364.08ms p(90)=52.93ms  p(95)=56.26ms  p(99.9)=80.49ms
     iterations.....................: 137607  1127.749384/s
     success_rate...................: 100.00% ✓ 137607      ✗ 0     
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

     checks.........................: 100.00% ✓ 181830     ✗ 0    
     data_received..................: 5.3 GB  43 MB/s
     data_sent......................: 73 MB   596 kB/s
     http_req_blocked...............: avg=4.02µs  min=1.17µs  med=2.95µs  max=2.22ms   p(90)=4.47µs   p(95)=5.1µs    p(99.9)=49.04µs 
     http_req_connecting............: avg=828ns   min=0s      med=0s      max=2.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=98.64ms min=19.11ms med=95.85ms max=376.36ms p(90)=120.21ms p(95)=131.06ms p(99.9)=231.06ms
       { expected_response:true }...: avg=98.64ms min=19.11ms med=95.85ms max=376.36ms p(90)=120.21ms p(95)=131.06ms p(99.9)=231.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60710
     http_req_receiving.............: avg=93.43µs min=31.83µs med=77.25µs max=154.1ms  p(90)=112.62µs p(95)=126µs    p(99.9)=796.44µs
     http_req_sending...............: avg=25.59µs min=5.39µs  med=13.42µs max=184.65ms p(90)=19.99µs  p(95)=22.34µs  p(99.9)=609.1µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.52ms min=18.97ms med=95.74ms max=376.17ms p(90)=120.09ms p(95)=130.92ms p(99.9)=230.57ms
     http_reqs......................: 60710   495.86162/s
     iteration_duration.............: avg=99.01ms min=37.53ms med=96.11ms max=384.24ms p(90)=120.46ms p(95)=131.42ms p(99.9)=232.58ms
     iterations.....................: 60610   495.044849/s
     success_rate...................: 100.00% ✓ 60610      ✗ 0    
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

     checks.........................: 100.00% ✓ 133401     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   437 kB/s
     http_req_blocked...............: avg=5.91µs   min=1.15µs  med=3.32µs   max=4.01ms   p(90)=4.85µs   p(95)=5.46µs   p(99.9)=461.23µs
     http_req_connecting............: avg=2.36µs   min=0s      med=0s       max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=346.51µs
     http_req_duration..............: avg=134.43ms min=19.85ms med=132.34ms max=374.98ms p(90)=168.29ms p(95)=179.61ms p(99.9)=230.26ms
       { expected_response:true }...: avg=134.43ms min=19.85ms med=132.34ms max=374.98ms p(90)=168.29ms p(95)=179.61ms p(99.9)=230.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44567
     http_req_receiving.............: avg=89.9µs   min=31.24µs med=84.38µs  max=32.26ms  p(90)=118.09µs p(95)=130.43µs p(99.9)=702.18µs
     http_req_sending...............: avg=21.91µs  min=5.91µs  med=15.32µs  max=51.16ms  p(90)=21.26µs  p(95)=23.32µs  p(99.9)=641.01µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=134.31ms min=19.7ms  med=132.23ms max=374.49ms p(90)=168.18ms p(95)=179.49ms p(99.9)=230.04ms
     http_reqs......................: 44567   363.87496/s
     iteration_duration.............: avg=134.96ms min=48.44ms med=132.65ms max=397.87ms p(90)=168.63ms p(95)=179.9ms  p(99.9)=233.82ms
     iterations.....................: 44467   363.058493/s
     success_rate...................: 100.00% ✓ 44467      ✗ 0    
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

     checks.........................: 100.00% ✓ 88851      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   291 kB/s
     http_req_blocked...............: avg=5.55µs   min=1.32µs  med=3.64µs   max=2.62ms   p(90)=5.19µs   p(95)=5.82µs   p(99.9)=716.92µs
     http_req_connecting............: avg=1.61µs   min=0s      med=0s       max=2.59ms   p(90)=0s       p(95)=0s       p(99.9)=651.75µs
     http_req_duration..............: avg=201.87ms min=17.23ms med=189.75ms max=601.06ms p(90)=235.56ms p(95)=396.83ms p(99.9)=555.45ms
       { expected_response:true }...: avg=201.87ms min=17.23ms med=189.75ms max=601.06ms p(90)=235.56ms p(95)=396.83ms p(99.9)=555.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29717
     http_req_receiving.............: avg=103.17µs min=36.51µs med=97.66µs  max=14.27ms  p(90)=131.08µs p(95)=145.19µs p(99.9)=800.23µs
     http_req_sending...............: avg=26.28µs  min=6.16µs  med=17.93µs  max=65.65ms  p(90)=23.18µs  p(95)=25.12µs  p(99.9)=596.72µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.74ms min=17.07ms med=189.61ms max=600.98ms p(90)=235.45ms p(95)=396.72ms p(99.9)=555.33ms
     http_reqs......................: 29717   242.74431/s
     iteration_duration.............: avg=202.77ms min=42.31ms med=190.16ms max=601.23ms p(90)=235.99ms p(95)=397.23ms p(99.9)=555.81ms
     iterations.....................: 29617   241.927457/s
     success_rate...................: 100.00% ✓ 29617      ✗ 0    
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

     checks.........................: 100.00% ✓ 88077      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=7.07µs   min=1.12µs  med=3.35µs   max=3.97ms   p(90)=4.75µs   p(95)=5.32µs   p(99.9)=1.85ms  
     http_req_connecting............: avg=3.53µs   min=0s      med=0s       max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=203.57ms min=21.49ms med=202.97ms max=454.75ms p(90)=218.03ms p(95)=224.34ms p(99.9)=296.14ms
       { expected_response:true }...: avg=203.57ms min=21.49ms med=202.97ms max=454.75ms p(90)=218.03ms p(95)=224.34ms p(99.9)=296.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29459
     http_req_receiving.............: avg=104.3µs  min=30.92µs med=91.26µs  max=104.04ms p(90)=124.3µs  p(95)=137.91µs p(99.9)=657.37µs
     http_req_sending...............: avg=37.39µs  min=5.82µs  med=16.75µs  max=136.75ms p(90)=22.05µs  p(95)=23.97µs  p(99.9)=496.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.43ms min=21.33ms med=202.86ms max=454.6ms  p(90)=217.89ms p(95)=224.19ms p(99.9)=293.58ms
     http_reqs......................: 29459   239.822586/s
     iteration_duration.............: avg=204.48ms min=43.23ms med=203.31ms max=463.89ms p(90)=218.31ms p(95)=224.65ms p(99.9)=307.29ms
     iterations.....................: 29359   239.008497/s
     success_rate...................: 100.00% ✓ 29359      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

