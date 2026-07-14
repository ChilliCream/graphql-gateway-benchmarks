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
| fusion | 16.5.0 | 1,869 | 1,920 | 1,856 | 1.1% |  |
| hive-router | v0.0.78 | 1,830 | 1,910 | 1,823 | 1.6% |  |
| grafbase | 0.53.5 | 1,287 | 1,323 | 1,277 | 1.2% |  |
| cosmo | 0.329.0 | 1,194 | 1,236 | 1,189 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.2 | 568 | 589 | 566 | 1.4% |  |
| apollo-router | v2.16.0 | 394 | 414 | 391 | 2.2% |  |
| hive-gateway | 2.10.2 | 263 | 269 | 262 | 0.9% |  |
| apollo-gateway | 2.14.2 | 259 | 263 | 258 | 0.7% |  |
| feddi | 5ff8b6165878 | 21 | 22 | 21 | 2.5% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 683427      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.8µs    min=931ns   med=2.25µs  max=9.18ms   p(90)=3.99µs   p(95)=4.71µs  p(99.9)=31.78µs
     http_req_connecting............: avg=1.07µs   min=0s      med=0s      max=9.13ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.11ms  min=17.42ms med=25.5ms  max=295.86ms p(90)=30.54ms  p(95)=32.43ms p(99.9)=49.42ms
       { expected_response:true }...: avg=26.11ms  min=17.42ms med=25.5ms  max=295.86ms p(90)=30.54ms  p(95)=32.43ms p(99.9)=49.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227909
     http_req_receiving.............: avg=321.91µs min=50.27µs med=99.6µs  max=75.71ms  p(90)=813.38µs p(95)=1.28ms  p(99.9)=8.42ms 
     http_req_sending...............: avg=32.71µs  min=4.71µs  med=9.27µs  max=194.36ms p(90)=18.96µs  p(95)=29.65µs p(99.9)=1.65ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.75ms  min=17.32ms med=25.16ms max=295.47ms p(90)=30.12ms  p(95)=31.98ms p(99.9)=47.85ms
     http_reqs......................: 227909  1869.143515/s
     iteration_duration.............: avg=26.32ms  min=17.62ms med=25.71ms max=314.83ms p(90)=30.75ms  p(95)=32.64ms p(99.9)=49.92ms
     iterations.....................: 227809  1868.323388/s
     success_rate...................: 100.00% ✓ 227809      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 669252      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 268 MB  2.2 MB/s
     http_req_blocked...............: avg=2.93µs  min=922ns   med=2.11µs  max=4.31ms   p(90)=3.69µs  p(95)=4.4µs    p(99.9)=25.95µs
     http_req_connecting............: avg=451ns   min=0s      med=0s      max=4.27ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.67ms min=18.1ms  med=26.25ms max=303.34ms p(90)=30.44ms p(95)=31.83ms  p(99.9)=47.11ms
       { expected_response:true }...: avg=26.67ms min=18.1ms  med=26.25ms max=303.34ms p(90)=30.44ms p(95)=31.83ms  p(99.9)=47.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223184
     http_req_receiving.............: avg=73.12µs min=26.24µs med=50.52µs max=143.75ms p(90)=90.47µs p(95)=112.78µs p(99.9)=1.59ms 
     http_req_sending...............: avg=26.89µs min=4.58µs  med=9.05µs  max=142.36ms p(90)=16.76µs p(95)=22.87µs  p(99.9)=1.33ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.57ms min=17.96ms med=26.17ms max=303.06ms p(90)=30.33ms p(95)=31.72ms  p(99.9)=45.82ms
     http_reqs......................: 223184  1830.138831/s
     iteration_duration.............: avg=26.88ms min=18.86ms med=26.45ms max=314.56ms p(90)=30.63ms p(95)=32.03ms  p(99.9)=47.45ms
     iterations.....................: 223084  1829.318817/s
     success_rate...................: 100.00% ✓ 223084      ✗ 0     
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

     checks.........................: 100.00% ✓ 471087      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 189 MB  1.5 MB/s
     http_req_blocked...............: avg=3.45µs  min=912ns   med=2.25µs  max=4.1ms    p(90)=4.57µs   p(95)=5.53µs   p(99.9)=41.16µs
     http_req_connecting............: avg=616ns   min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.94ms min=17.76ms med=37.69ms max=311.31ms p(90)=44.65ms  p(95)=46.67ms  p(99.9)=63.19ms
       { expected_response:true }...: avg=37.94ms min=17.76ms med=37.69ms max=311.31ms p(90)=44.65ms  p(95)=46.67ms  p(99.9)=63.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157129
     http_req_receiving.............: avg=84.11µs min=27.11µs med=55.42µs max=88.65ms  p(90)=121.56µs p(95)=165.16µs p(99.9)=1.86ms 
     http_req_sending...............: avg=35.05µs min=4.73µs  med=9.3µs   max=185.31ms p(90)=23.18µs  p(95)=37.96µs  p(99.9)=1.93ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.82ms min=17.65ms med=37.59ms max=310.78ms p(90)=44.53ms  p(95)=46.53ms  p(99.9)=62.12ms
     http_reqs......................: 157129  1287.957327/s
     iteration_duration.............: avg=38.2ms  min=20.81ms med=37.92ms max=327.84ms p(90)=44.86ms  p(95)=46.88ms  p(99.9)=63.61ms
     iterations.....................: 157029  1287.137646/s
     success_rate...................: 100.00% ✓ 157029      ✗ 0     
     vus............................: 9       min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 436797      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 175 MB  1.4 MB/s
     http_req_blocked...............: avg=5.27µs  min=1.15µs  med=3µs     max=177.86ms p(90)=4.73µs   p(95)=5.47µs   p(99.9)=37.76µs 
     http_req_connecting............: avg=717ns   min=0s      med=0s      max=3.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.95ms min=19.01ms med=40.31ms max=308ms    p(90)=49.29ms  p(95)=52.25ms  p(99.9)=68.88ms 
       { expected_response:true }...: avg=40.95ms min=19.01ms med=40.31ms max=308ms    p(90)=49.29ms  p(95)=52.25ms  p(99.9)=68.88ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 145699
     http_req_receiving.............: avg=84.48µs min=26.94µs med=68.04µs max=229.36ms p(90)=110.59µs p(95)=129.36µs p(99.9)=893.99µs
     http_req_sending...............: avg=29.36µs min=5.11µs  med=12.61µs max=241.97ms p(90)=20.13µs  p(95)=24.06µs  p(99.9)=1.1ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.84ms min=18.83ms med=40.21ms max=307.26ms p(90)=49.18ms  p(95)=52.12ms  p(99.9)=68.38ms 
     http_reqs......................: 145699  1194.192316/s
     iteration_duration.............: avg=41.2ms  min=22.77ms med=40.53ms max=324.31ms p(90)=49.51ms  p(95)=52.47ms  p(99.9)=69.2ms  
     iterations.....................: 145599  1193.372686/s
     success_rate...................: 100.00% ✓ 145599      ✗ 0     
     vus............................: 20      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 208242     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   683 kB/s
     http_req_blocked...............: avg=4.57µs  min=1.02µs  med=2.86µs  max=3.65ms   p(90)=4.44µs   p(95)=5.11µs   p(99.9)=44.78µs 
     http_req_connecting............: avg=1.46µs  min=0s      med=0s      max=3.62ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.11ms min=21.15ms med=83.8ms  max=329.77ms p(90)=110.72ms p(95)=120.79ms p(99.9)=197.63ms
       { expected_response:true }...: avg=86.11ms min=21.15ms med=83.8ms  max=329.77ms p(90)=110.72ms p(95)=120.79ms p(99.9)=197.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69514
     http_req_receiving.............: avg=87.61µs min=28.9µs  med=74.37µs max=116.37ms p(90)=111.48µs p(95)=125.94µs p(99.9)=658.15µs
     http_req_sending...............: avg=22.16µs min=5.25µs  med=14.43µs max=117.13ms p(90)=21.14µs  p(95)=23.35µs  p(99.9)=711µs   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86ms    min=21ms    med=83.7ms  max=328.7ms  p(90)=110.62ms p(95)=120.67ms p(99.9)=197.08ms
     http_reqs......................: 69514   568.53838/s
     iteration_duration.............: avg=86.45ms min=36.94ms med=84.07ms max=342.82ms p(90)=110.98ms p(95)=121.11ms p(99.9)=199.73ms
     iterations.....................: 69414   567.720504/s
     success_rate...................: 100.00% ✓ 69414      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 144666     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   474 kB/s
     http_req_blocked...............: avg=5.58µs   min=1.39µs  med=3.57µs   max=3.37ms   p(90)=5.08µs   p(95)=5.69µs   p(99.9)=117.07µs
     http_req_connecting............: avg=1.76µs   min=0s      med=0s       max=3.33ms   p(90)=0s       p(95)=0s       p(99.9)=82.43µs 
     http_req_duration..............: avg=123.97ms min=20.95ms med=121.88ms max=338.26ms p(90)=155.46ms p(95)=165.4ms  p(99.9)=210.48ms
       { expected_response:true }...: avg=123.97ms min=20.95ms med=121.88ms max=338.26ms p(90)=155.46ms p(95)=165.4ms  p(99.9)=210.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48322
     http_req_receiving.............: avg=90.9µs   min=32.21µs med=82.84µs  max=77.87ms  p(90)=116.13µs p(95)=128.54µs p(99.9)=607.04µs
     http_req_sending...............: avg=24.01µs  min=5.69µs  med=17.18µs  max=71.38ms  p(90)=23.13µs  p(95)=25.26µs  p(99.9)=504.11µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.86ms min=20.86ms med=121.77ms max=337.75ms p(90)=155.35ms p(95)=165.28ms p(99.9)=210.08ms
     http_reqs......................: 48322   394.925719/s
     iteration_duration.............: avg=124.46ms min=42.26ms med=122.21ms max=350.58ms p(90)=155.77ms p(95)=165.72ms p(99.9)=212.74ms
     iterations.....................: 48222   394.108439/s
     success_rate...................: 100.00% ✓ 48222      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 96138      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   316 kB/s
     http_req_blocked...............: avg=6.32µs   min=1.09µs  med=3.33µs   max=3.55ms   p(90)=4.77µs   p(95)=5.36µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=2.76µs   min=0s      med=0s       max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=186.54ms min=18.51ms med=174.61ms max=593.91ms p(90)=222.07ms p(95)=252.96ms p(99.9)=554.04ms
       { expected_response:true }...: avg=186.54ms min=18.51ms med=174.61ms max=593.91ms p(90)=222.07ms p(95)=252.96ms p(99.9)=554.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32146
     http_req_receiving.............: avg=97.64µs  min=31.98µs med=90.79µs  max=59.33ms  p(90)=122.01µs p(95)=135.36µs p(99.9)=848.29µs
     http_req_sending...............: avg=31.45µs  min=5.2µs   med=18.11µs  max=66.55ms  p(90)=22.88µs  p(95)=24.76µs  p(99.9)=543.38µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.41ms min=18.39ms med=174.48ms max=593.8ms  p(90)=221.95ms p(95)=252.87ms p(99.9)=553.97ms
     http_reqs......................: 32146   263.23979/s
     iteration_duration.............: avg=187.35ms min=37.61ms med=175.05ms max=594.16ms p(90)=222.41ms p(95)=253.84ms p(99.9)=554.49ms
     iterations.....................: 32046   262.420902/s
     success_rate...................: 100.00% ✓ 32046      ✗ 0    
     vus............................: 43      min=0        max=50 
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

     checks.........................: 100.00% ✓ 95097      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   311 kB/s
     http_req_blocked...............: avg=7.38µs   min=1.39µs  med=3.7µs    max=4.25ms   p(90)=5.24µs   p(95)=5.84µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=3.38µs   min=0s      med=0s       max=4.19ms   p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=188.56ms min=23.36ms med=194.05ms max=392.92ms p(90)=202.5ms  p(95)=206.75ms p(99.9)=281.32ms
       { expected_response:true }...: avg=188.56ms min=23.36ms med=194.05ms max=392.92ms p(90)=202.5ms  p(95)=206.75ms p(99.9)=281.32ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31799
     http_req_receiving.............: avg=97.72µs  min=37.09µs med=91.6µs   max=43.03ms  p(90)=123.76µs p(95)=137.13µs p(99.9)=529.06µs
     http_req_sending...............: avg=30.38µs  min=6.43µs  med=18.35µs  max=127.32ms p(90)=23.22µs  p(95)=25.1µs   p(99.9)=525.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.43ms min=23.21ms med=193.93ms max=392.62ms p(90)=202.37ms p(95)=206.62ms p(99.9)=281.2ms 
     http_reqs......................: 31799   259.199216/s
     iteration_duration.............: avg=189.39ms min=56.82ms med=194.35ms max=403.45ms p(90)=202.82ms p(95)=207.1ms  p(99.9)=282.4ms 
     iterations.....................: 31699   258.384099/s
     success_rate...................: 100.00% ✓ 31699      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (5ff8b6165878)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 7884      ✗ 0   
     data_received..................: 261 MB  2.1 MB/s
     data_sent......................: 3.3 MB  26 kB/s
     http_req_blocked...............: avg=79.9µs   min=1.17µs   med=3.7µs    max=8.6ms   p(90)=5.33µs   p(95)=6.24µs   p(99.9)=7.79ms  
     http_req_connecting............: avg=73.42µs  min=0s       med=0s       max=8.39ms  p(90)=0s       p(95)=0s       p(99.9)=7.72ms  
     http_req_duration..............: avg=2.22s    min=37.83ms  med=2.29s    max=5.62s   p(90)=2.88s    p(95)=3.02s    p(99.9)=4.75s   
       { expected_response:true }...: avg=2.22s    min=37.83ms  med=2.29s    max=5.62s   p(90)=2.88s    p(95)=3.02s    p(99.9)=4.75s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2728
     http_req_receiving.............: avg=105.47µs min=35.16µs  med=100.49µs max=1.45ms  p(90)=140.46µs p(95)=156.76µs p(99.9)=544.86µs
     http_req_sending...............: avg=66.69µs  min=6.19µs   med=20.03µs  max=23.29ms p(90)=25.84µs  p(95)=29.24µs  p(99.9)=7.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.22s    min=37.71ms  med=2.29s    max=5.62s   p(90)=2.88s    p(95)=3.02s    p(99.9)=4.75s   
     http_reqs......................: 2728    21.498279/s
     iteration_duration.............: avg=2.31s    min=837.21ms med=2.31s    max=5.62s   p(90)=2.89s    p(95)=3.03s    p(99.9)=4.79s   
     iterations.....................: 2628    20.710219/s
     success_rate...................: 100.00% ✓ 2628      ✗ 0   
     vus............................: 39      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

