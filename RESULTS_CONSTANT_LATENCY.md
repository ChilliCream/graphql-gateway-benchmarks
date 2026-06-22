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
| hive-router | v0.0.72 | 1,562 | 1,584 | 1,555 | 0.7% |  |
| fusion-nightly | 16.3.0-p.1 | 1,558 | 1,575 | 1,550 | 0.5% |  |
| fusion | 16.2.2 | 1,539 | 1,563 | 1,534 | 0.6% |  |
| grafbase | 0.53.5 | 1,119 | 1,134 | 1,104 | 0.9% |  |
| cosmo | 0.324.0 | 1,069 | 1,091 | 1,064 | 0.9% |  |
| hive-gateway-router-runtime | 2.9.0 | 512 | 525 | 507 | 1.2% |  |
| apollo-router | v2.15.1 | 407 | 417 | 404 | 1.1% |  |
| hive-gateway | 2.9.0 | 237 | 242 | 235 | 1.1% |  |
| apollo-gateway | 2.14.1 | 233 | 235 | 231 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 571419      ✗ 0     
     data_received..................: 17 GB   137 MB/s
     data_sent......................: 229 MB  1.9 MB/s
     http_req_blocked...............: avg=3.23µs  min=1.04µs  med=2.5µs   max=5.75ms   p(90)=4.26µs   p(95)=5.2µs    p(99.9)=39.39µs
     http_req_connecting............: avg=238ns   min=0s      med=0s      max=2.49ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.25ms min=14.16ms med=30.94ms max=327.82ms p(90)=37.27ms  p(95)=39.28ms  p(99.9)=60.17ms
       { expected_response:true }...: avg=31.25ms min=14.16ms med=30.94ms max=327.82ms p(90)=37.27ms  p(95)=39.28ms  p(99.9)=60.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 190573
     http_req_receiving.............: avg=84.92µs min=27.07µs med=54.66µs max=27.23ms  p(90)=105.85µs p(95)=154.07µs p(99.9)=2.19ms 
     http_req_sending...............: avg=35.23µs min=5.21µs  med=10.02µs max=102.52ms p(90)=20.14µs  p(95)=53.7µs   p(99.9)=1.82ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.13ms min=14.08ms med=30.84ms max=327.65ms p(90)=37.14ms  p(95)=39.13ms  p(99.9)=58.89ms
     http_reqs......................: 190573  1562.295217/s
     iteration_duration.............: avg=31.49ms min=14.38ms med=31.17ms max=351.95ms p(90)=37.49ms  p(95)=39.49ms  p(99.9)=60.58ms
     iterations.....................: 190473  1561.475429/s
     success_rate...................: 100.00% ✓ 190473      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.3.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 570216      ✗ 0     
     data_received..................: 17 GB   137 MB/s
     data_sent......................: 229 MB  1.9 MB/s
     http_req_blocked...............: avg=3.12µs  min=1.01µs  med=2.42µs   max=2.23ms   p(90)=4.16µs  p(95)=5.09µs   p(99.9)=39.3µs 
     http_req_connecting............: avg=249ns   min=0s      med=0s       max=2.2ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.31ms min=13.49ms med=30.78ms  max=336.1ms  p(90)=38.38ms p(95)=40.93ms  p(99.9)=58.85ms
       { expected_response:true }...: avg=31.31ms min=13.49ms med=30.78ms  max=336.1ms  p(90)=38.38ms p(95)=40.93ms  p(99.9)=58.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 190172
     http_req_receiving.............: avg=635.4µs min=50.68µs med=113.99µs max=165.98ms p(90)=1.78ms  p(95)=2.76ms   p(99.9)=12.73ms
     http_req_sending...............: avg=37.18µs min=5µs     med=9.71µs   max=103.76ms p(90)=20.48µs p(95)=107.14µs p(99.9)=2.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.63ms min=13.39ms med=30.16ms  max=205.28ms p(90)=37.53ms p(95)=40.01ms  p(99.9)=57.73ms
     http_reqs......................: 190172  1558.656252/s
     iteration_duration.............: avg=31.55ms min=13.73ms med=31ms     max=365.42ms p(90)=38.6ms  p(95)=41.16ms  p(99.9)=59.3ms 
     iterations.....................: 190072  1557.836648/s
     success_rate...................: 100.00% ✓ 190072      ✗ 0     
     vus............................: 40      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.2.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 563127      ✗ 0     
     data_received..................: 17 GB   135 MB/s
     data_sent......................: 226 MB  1.8 MB/s
     http_req_blocked...............: avg=3.49µs   min=1.01µs  med=2.4µs    max=10.7ms   p(90)=4.1µs   p(95)=4.95µs   p(99.9)=36.85µs
     http_req_connecting............: avg=549ns    min=0s      med=0s       max=4.01ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.71ms  min=13.48ms med=31.14ms  max=345.39ms p(90)=39ms    p(95)=41.66ms  p(99.9)=63.8ms 
       { expected_response:true }...: avg=31.71ms  min=13.48ms med=31.14ms  max=345.39ms p(90)=39ms    p(95)=41.66ms  p(99.9)=63.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 187809
     http_req_receiving.............: avg=591.14µs min=51.15µs med=111.77µs max=312.51ms p(90)=1.62ms  p(95)=2.56ms   p(99.9)=13.97ms
     http_req_sending...............: avg=37.46µs  min=5.22µs  med=9.7µs    max=249.61ms p(90)=20.13µs p(95)=107.04µs p(99.9)=2.04ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.08ms  min=13.37ms med=30.54ms  max=306.11ms p(90)=38.2ms  p(95)=40.78ms  p(99.9)=61.54ms
     http_reqs......................: 187809  1539.278698/s
     iteration_duration.............: avg=31.95ms  min=13.68ms med=31.37ms  max=374.27ms p(90)=39.22ms p(95)=41.88ms  p(99.9)=64.65ms
     iterations.....................: 187709  1538.4591/s
     success_rate...................: 100.00% ✓ 187709      ✗ 0     
     vus............................: 49      min=0         max=50  
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

     checks.........................: 100.00% ✓ 409317      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 164 MB  1.3 MB/s
     http_req_blocked...............: avg=3.77µs  min=1µs     med=2.39µs  max=4.63ms   p(90)=4.73µs   p(95)=5.91µs   p(99.9)=53.66µs
     http_req_connecting............: avg=751ns   min=0s      med=0s      max=4.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.69ms min=15.31ms med=43.2ms  max=356.83ms p(90)=53.16ms  p(95)=56.57ms  p(99.9)=82.76ms
       { expected_response:true }...: avg=43.69ms min=15.31ms med=43.2ms  max=356.83ms p(90)=53.16ms  p(95)=56.57ms  p(99.9)=82.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136539
     http_req_receiving.............: avg=99.18µs min=29.57µs med=61.99µs max=102.16ms p(90)=133.56µs p(95)=218.22µs p(99.9)=3.2ms  
     http_req_sending...............: avg=37.1µs  min=5.22µs  med=10.28µs max=70.77ms  p(90)=24.11µs  p(95)=114.58µs p(99.9)=2.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.55ms min=15.16ms med=43.07ms max=338.01ms p(90)=53.02ms  p(95)=56.39ms  p(99.9)=82.12ms
     http_reqs......................: 136539  1119.110707/s
     iteration_duration.............: avg=43.97ms min=17.69ms med=43.45ms max=376.83ms p(90)=53.4ms   p(95)=56.81ms  p(99.9)=83.42ms
     iterations.....................: 136439  1118.29108/s
     success_rate...................: 100.00% ✓ 136439      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.324.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 391110      ✗ 0     
     data_received..................: 11 GB   94 MB/s
     data_sent......................: 157 MB  1.3 MB/s
     http_req_blocked...............: avg=3.83µs  min=1.14µs  med=2.62µs  max=4.74ms   p(90)=4.21µs   p(95)=4.98µs   p(99.9)=39.14µs
     http_req_connecting............: avg=847ns   min=0s      med=0s      max=4.68ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=45.77ms min=19.41ms med=45.14ms max=333.05ms p(90)=55.73ms  p(95)=59.08ms  p(99.9)=79.53ms
       { expected_response:true }...: avg=45.77ms min=19.41ms med=45.14ms max=333.05ms p(90)=55.73ms  p(95)=59.08ms  p(99.9)=79.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130470
     http_req_receiving.............: avg=91.21µs min=29.99µs med=70.43µs max=185.91ms p(90)=117.24µs p(95)=143.43µs p(99.9)=1.7ms  
     http_req_sending...............: avg=27.71µs min=5.42µs  med=11.46µs max=91.51ms  p(90)=19.03µs  p(95)=23.83µs  p(99.9)=1.15ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=45.65ms min=19.26ms med=45.03ms max=322.19ms p(90)=55.61ms  p(95)=58.95ms  p(99.9)=78.01ms
     http_reqs......................: 130470  1069.037249/s
     iteration_duration.............: avg=46.01ms min=21.14ms med=45.35ms max=363.45ms p(90)=55.94ms  p(95)=59.28ms  p(99.9)=79.86ms
     iterations.....................: 130370  1068.217875/s
     success_rate...................: 100.00% ✓ 130370      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 187947     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 75 MB   616 kB/s
     http_req_blocked...............: avg=5.04µs  min=1.27µs  med=3.13µs  max=4.59ms   p(90)=4.68µs   p(95)=5.33µs   p(99.9)=62.58µs 
     http_req_connecting............: avg=1.63µs  min=0s      med=0s      max=4.55ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.43ms min=21.31ms med=93.76ms max=359.13ms p(90)=112.6ms  p(95)=120.84ms p(99.9)=228.5ms 
       { expected_response:true }...: avg=95.43ms min=21.31ms med=93.76ms max=359.13ms p(90)=112.6ms  p(95)=120.84ms p(99.9)=228.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 62749
     http_req_receiving.............: avg=87.65µs min=31.65µs med=78.84µs max=12.65ms  p(90)=114.93µs p(95)=129.47µs p(99.9)=902.33µs
     http_req_sending...............: avg=32.5µs  min=5.98µs  med=14.01µs max=174.31ms p(90)=20.73µs  p(95)=23.11µs  p(99.9)=766.49µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.31ms min=20.91ms med=93.65ms max=358.36ms p(90)=112.48ms p(95)=120.67ms p(99.9)=228.02ms
     http_reqs......................: 62749   512.516036/s
     iteration_duration.............: avg=95.79ms min=32.33ms med=94ms    max=379.52ms p(90)=112.83ms p(95)=121.11ms p(99.9)=230.63ms
     iterations.....................: 62649   511.699264/s
     success_rate...................: 100.00% ✓ 62649      ✗ 0    
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

     checks.........................: 100.00% ✓ 149364     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   489 kB/s
     http_req_blocked...............: avg=5.72µs   min=1.09µs  med=3.42µs   max=3.85ms   p(90)=5.05µs   p(95)=5.68µs   p(99.9)=194.1µs 
     http_req_connecting............: avg=1.98µs   min=0s      med=0s       max=3.82ms   p(90)=0s       p(95)=0s       p(99.9)=105.03µs
     http_req_duration..............: avg=120.07ms min=19.04ms med=118.18ms max=400.58ms p(90)=149.2ms  p(95)=159.02ms p(99.9)=209.02ms
       { expected_response:true }...: avg=120.07ms min=19.04ms med=118.18ms max=400.58ms p(90)=149.2ms  p(95)=159.02ms p(99.9)=209.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49888
     http_req_receiving.............: avg=173.96µs min=30.68µs med=85.09µs  max=195.09ms p(90)=119.24µs p(95)=132.28µs p(99.9)=1.11ms  
     http_req_sending...............: avg=31.98µs  min=5.8µs   med=16.42µs  max=196.24ms p(90)=22.58µs  p(95)=24.75µs  p(99.9)=653.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.86ms min=18.89ms med=118.05ms max=265.52ms p(90)=149.05ms p(95)=158.82ms p(99.9)=201.98ms
     http_reqs......................: 49888   407.326165/s
     iteration_duration.............: avg=120.55ms min=32.4ms  med=118.48ms max=407.54ms p(90)=149.5ms  p(95)=159.35ms p(99.9)=215.01ms
     iterations.....................: 49788   406.509683/s
     success_rate...................: 100.00% ✓ 49788      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 87000     ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=7.85µs   min=1.21µs  med=3.7µs    max=4.23ms   p(90)=5.34µs   p(95)=6µs      p(99.9)=2.02ms  
     http_req_connecting............: avg=3.78µs   min=0s      med=0s       max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=1.97ms  
     http_req_duration..............: avg=206.07ms min=17.59ms med=191.69ms max=671.98ms p(90)=238.03ms p(95)=273.64ms p(99.9)=623.85ms
       { expected_response:true }...: avg=206.07ms min=17.59ms med=191.69ms max=671.98ms p(90)=238.03ms p(95)=273.64ms p(99.9)=623.85ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 29100
     http_req_receiving.............: avg=106.82µs min=32.86µs med=97.62µs  max=81.13ms  p(90)=131.02µs p(95)=144.04µs p(99.9)=609.16µs
     http_req_sending...............: avg=37.19µs  min=6µs     med=18.48µs  max=138.51ms p(90)=23.96µs  p(95)=25.77µs  p(99.9)=495.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.93ms min=17.48ms med=191.54ms max=671.84ms p(90)=237.88ms p(95)=273.21ms p(99.9)=623.73ms
     http_reqs......................: 29100   237.98281/s
     iteration_duration.............: avg=207.03ms min=49.64ms med=192.12ms max=672.21ms p(90)=238.46ms p(95)=276.25ms p(99.9)=624.14ms
     iterations.....................: 29000   237.165/s
     success_rate...................: 100.00% ✓ 29000     ✗ 0    
     vus............................: 50      min=0       max=50 
     vus_max........................: 50      min=50      max=50
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

     checks.........................: 100.00% ✓ 85788      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   280 kB/s
     http_req_blocked...............: avg=7.51µs   min=1.26µs  med=3.45µs   max=4.13ms   p(90)=4.84µs   p(95)=5.45µs   p(99.9)=2.1ms   
     http_req_connecting............: avg=3.84µs   min=0s      med=0s       max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=2.07ms  
     http_req_duration..............: avg=209.02ms min=22.58ms med=201.85ms max=470.61ms p(90)=267.68ms p(95)=273.42ms p(99.9)=354.79ms
       { expected_response:true }...: avg=209.02ms min=22.58ms med=201.85ms max=470.61ms p(90)=267.68ms p(95)=273.42ms p(99.9)=354.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28696
     http_req_receiving.............: avg=211.1µs  min=35.31µs med=91.24µs  max=237.89ms p(90)=123.96µs p(95)=136.55µs p(99.9)=1.59ms  
     http_req_sending...............: avg=44.29µs  min=6.01µs  med=16.65µs  max=295.06ms p(90)=22.07µs  p(95)=23.95µs  p(99.9)=508.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.77ms min=22.46ms med=199.6ms  max=362.83ms p(90)=267.47ms p(95)=273.21ms p(99.9)=351.22ms
     http_reqs......................: 28696   233.486417/s
     iteration_duration.............: avg=209.95ms min=60.31ms med=205.64ms max=470.9ms  p(90)=267.97ms p(95)=273.74ms p(99.9)=357.09ms
     iterations.....................: 28596   232.672762/s
     success_rate...................: 100.00% ✓ 28596      ✗ 0    
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

