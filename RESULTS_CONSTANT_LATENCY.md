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
| hive-router | v0.0.43 | 1,583 | 1,601 | 1,572 | 0.6% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,445 | 1,463 | 1,434 | 0.6% |  |
| grafbase | 0.53.2 | 1,146 | 1,165 | 1,142 | 0.6% |  |
| cosmo | 0.298.0 | 1,132 | 1,144 | 1,126 | 0.6% | non-compatible response (4 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 589 | 603 | 584 | 1.0% |  |
| apollo-router | v2.12.1 | 377 | 382 | 371 | 1.0% |  |
| hive-gateway | 2.5.14 | 258 | 263 | 253 | 1.1% |  |
| apollo-gateway | 2.13.3 | 239 | 240 | 239 | 0.2% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 579237      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.06µs  min=952ns   med=2.08µs  max=4.19ms   p(90)=3.89µs   p(95)=4.79µs   p(99.9)=28.8µs 
     http_req_connecting............: avg=518ns   min=0s      med=0s      max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.83ms min=13.73ms med=30.55ms max=320.43ms p(90)=36.63ms  p(95)=38.54ms  p(99.9)=56.64ms
       { expected_response:true }...: avg=30.83ms min=13.73ms med=30.55ms max=320.43ms p(90)=36.63ms  p(95)=38.54ms  p(99.9)=56.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193179
     http_req_receiving.............: avg=80.1µs  min=27.32µs med=51.22µs max=64.7ms   p(90)=100.68µs p(95)=143.01µs p(99.9)=2.25ms 
     http_req_sending...............: avg=35.3µs  min=4.97µs  med=9.15µs  max=180.35ms p(90)=19.37µs  p(95)=33.84µs  p(99.9)=1.78ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.71ms min=13.67ms med=30.45ms max=299.46ms p(90)=36.51ms  p(95)=38.4ms   p(99.9)=55.39ms
     http_reqs......................: 193179  1583.248957/s
     iteration_duration.............: avg=31.06ms min=13.93ms med=30.77ms max=350.74ms p(90)=36.84ms  p(95)=38.76ms  p(99.9)=57.21ms
     iterations.....................: 193079  1582.429381/s
     success_rate...................: 100.00% ✓ 193079      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 528720      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.12µs   min=990ns   med=2.01µs   max=9.81ms   p(90)=3.77µs  p(95)=4.66µs   p(99.9)=31.55µs
     http_req_connecting............: avg=584ns    min=0s      med=0s       max=3.92ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.79ms  min=14.05ms med=32.66ms  max=476.42ms p(90)=41.42ms p(95)=44.95ms  p(99.9)=84.42ms
       { expected_response:true }...: avg=33.79ms  min=14.05ms med=32.66ms  max=476.42ms p(90)=41.42ms p(95)=44.95ms  p(99.9)=84.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176340
     http_req_receiving.............: avg=745.62µs min=50.42µs med=109.99µs max=182.78ms p(90)=2.15ms  p(95)=3.29ms   p(99.9)=15.21ms
     http_req_sending...............: avg=36.73µs  min=5.05µs  med=8.91µs   max=123.05ms p(90)=20.08µs p(95)=104.34µs p(99.9)=2.42ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.01ms  min=13.94ms med=31.92ms  max=476.22ms p(90)=40.36ms p(95)=43.71ms  p(99.9)=82.53ms
     http_reqs......................: 176340  1445.392295/s
     iteration_duration.............: avg=34.03ms  min=14.27ms med=32.88ms  max=476.65ms p(90)=41.64ms p(95)=45.18ms  p(99.9)=86.03ms
     iterations.....................: 176240  1444.572633/s
     success_rate...................: 100.00% ✓ 176240      ✗ 0     
     vus............................: 10      min=0         max=50  
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

     checks.........................: 100.00% ✓ 419433      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.36µs  min=982ns   med=2.26µs  max=4.88ms   p(90)=4.7µs    p(95)=5.8µs    p(99.9)=45.44µs
     http_req_connecting............: avg=417ns   min=0s      med=0s      max=3.26ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.63ms min=17.42ms med=42.14ms max=357.34ms p(90)=51.74ms  p(95)=54.97ms  p(99.9)=80.12ms
       { expected_response:true }...: avg=42.63ms min=17.42ms med=42.14ms max=357.34ms p(90)=51.74ms  p(95)=54.97ms  p(99.9)=80.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139911
     http_req_receiving.............: avg=95.91µs min=29.27µs med=59.16µs max=276.52ms p(90)=131.44µs p(95)=194.49µs p(99.9)=2.84ms 
     http_req_sending...............: avg=38.58µs min=5.3µs   med=9.98µs  max=151.68ms p(90)=23.67µs  p(95)=105.99µs p(99.9)=2.6ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.5ms  min=17.3ms  med=42.02ms max=356.42ms p(90)=51.59ms  p(95)=54.8ms   p(99.9)=79.81ms
     http_reqs......................: 139911  1146.592751/s
     iteration_duration.............: avg=42.91ms min=17.79ms med=42.38ms max=371.87ms p(90)=51.98ms  p(95)=55.2ms   p(99.9)=80.76ms
     iterations.....................: 139811  1145.773235/s
     success_rate...................: 100.00% ✓ 139811      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 414162      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.22µs  min=1.07µs  med=2.4µs   max=5.21ms   p(90)=4.02µs   p(95)=4.77µs   p(99.9)=40.28µs
     http_req_connecting............: avg=446ns   min=0s      med=0s      max=5.16ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.21ms min=18.31ms med=42.65ms max=337.01ms p(90)=52.61ms  p(95)=55.74ms  p(99.9)=71.78ms
       { expected_response:true }...: avg=43.21ms min=18.31ms med=42.65ms max=337.01ms p(90)=52.61ms  p(95)=55.74ms  p(99.9)=71.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138154
     http_req_receiving.............: avg=84.82µs min=27.62µs med=63.22µs max=142.77ms p(90)=107.39µs p(95)=133.39µs p(99.9)=1.67ms 
     http_req_sending...............: avg=29.48µs min=5.2µs   med=10.59µs max=174.23ms p(90)=18.3µs   p(95)=23.18µs  p(99.9)=1.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.1ms  min=18.25ms med=42.54ms max=336.7ms  p(90)=52.5ms   p(95)=55.61ms  p(99.9)=71.42ms
     http_reqs......................: 138154  1132.239674/s
     iteration_duration.............: avg=43.45ms min=18.47ms med=42.85ms max=354.21ms p(90)=52.81ms  p(95)=55.93ms  p(99.9)=72.34ms
     iterations.....................: 138054  1131.420125/s
     success_rate...................: 100.00% ✓ 138054      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 216039     ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 87 MB   708 kB/s
     http_req_blocked...............: avg=4.79µs  min=1.14µs  med=3.09µs  max=4.11ms   p(90)=4.72µs   p(95)=5.38µs   p(99.9)=49.43µs 
     http_req_connecting............: avg=1.43µs  min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=82.99ms min=18.97ms med=75.58ms max=350.05ms p(90)=123.52ms p(95)=134.6ms  p(99.9)=235.43ms
       { expected_response:true }...: avg=82.99ms min=18.97ms med=75.58ms max=350.05ms p(90)=123.52ms p(95)=134.6ms  p(99.9)=235.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 72113
     http_req_receiving.............: avg=88.57µs min=30.69µs med=76.74µs max=239.49ms p(90)=114.13µs p(95)=128.47µs p(99.9)=867.03µs
     http_req_sending...............: avg=30.43µs min=5.59µs  med=13.83µs max=217.2ms  p(90)=21.03µs  p(95)=23.52µs  p(99.9)=756.48µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.87ms min=18.84ms med=75.48ms max=349.33ms p(90)=123.4ms  p(95)=134.45ms p(99.9)=234.95ms
     http_reqs......................: 72113   589.358237/s
     iteration_duration.............: avg=83.32ms min=31.19ms med=75.85ms max=361.41ms p(90)=123.76ms p(95)=134.87ms p(99.9)=237.64ms
     iterations.....................: 72013   588.540966/s
     success_rate...................: 100.00% ✓ 72013      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 138501     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 56 MB   454 kB/s
     http_req_blocked...............: avg=5.12µs   min=1.16µs  med=3.11µs   max=3.87ms   p(90)=4.62µs   p(95)=5.21µs   p(99.9)=158.02µs
     http_req_connecting............: avg=1.8µs    min=0s      med=0s       max=3.84ms   p(90)=0s       p(95)=0s       p(99.9)=104.51µs
     http_req_duration..............: avg=129.5ms  min=21.84ms med=127.39ms max=344.81ms p(90)=162.37ms p(95)=173.25ms p(99.9)=222.68ms
       { expected_response:true }...: avg=129.5ms  min=21.84ms med=127.39ms max=344.81ms p(90)=162.37ms p(95)=173.25ms p(99.9)=222.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46267
     http_req_receiving.............: avg=140.85µs min=30.7µs  med=81.21µs  max=231.75ms p(90)=115.5µs  p(95)=127.93µs p(99.9)=917.66µs
     http_req_sending...............: avg=33.72µs  min=5.49µs  med=15.12µs  max=237.64ms p(90)=21.09µs  p(95)=23.2µs   p(99.9)=718.77µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=129.33ms min=21.72ms med=127.24ms max=314ms    p(90)=162.19ms p(95)=173.04ms p(99.9)=220.09ms
     http_reqs......................: 46267   377.733526/s
     iteration_duration.............: avg=130ms    min=54.4ms  med=127.67ms max=374.35ms p(90)=162.64ms p(95)=173.55ms p(99.9)=229.48ms
     iterations.....................: 46167   376.917105/s
     success_rate...................: 100.00% ✓ 46167      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94338      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=7.15µs   min=1.26µs  med=3.58µs   max=3.84ms   p(90)=5.14µs   p(95)=5.79µs   p(99.9)=1.72ms  
     http_req_connecting............: avg=3.3µs    min=0s      med=0s       max=3.8ms    p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=190.08ms min=18.81ms med=174.58ms max=638.85ms p(90)=232.35ms p(95)=396.05ms p(99.9)=537.02ms
       { expected_response:true }...: avg=190.08ms min=18.81ms med=174.58ms max=638.85ms p(90)=232.35ms p(95)=396.05ms p(99.9)=537.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31546
     http_req_receiving.............: avg=105.22µs min=33.44µs med=97.02µs  max=84.19ms  p(90)=130.58µs p(95)=144.08µs p(99.9)=408.05µs
     http_req_sending...............: avg=51.36µs  min=6.25µs  med=18.12µs  max=285.89ms p(90)=23.64µs  p(95)=25.54µs  p(99.9)=475.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.93ms min=18.64ms med=174.45ms max=638.74ms p(90)=232.2ms  p(95)=395.82ms p(99.9)=536.92ms
     http_reqs......................: 31546   258.039746/s
     iteration_duration.............: avg=190.93ms min=46.51ms med=174.98ms max=639.13ms p(90)=232.83ms p(95)=396.87ms p(99.9)=537.51ms
     iterations.....................: 31446   257.221767/s
     success_rate...................: 100.00% ✓ 31446      ✗ 0    
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

     checks.........................: 100.00% ✓ 88113      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=7.19µs   min=1.34µs  med=3.53µs   max=4.12ms   p(90)=5.03µs   p(95)=5.65µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=3.43µs   min=0s      med=0s       max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=203.47ms min=23.33ms med=203.09ms max=431.03ms p(90)=218.13ms p(95)=223.88ms p(99.9)=296.59ms
       { expected_response:true }...: avg=203.47ms min=23.33ms med=203.09ms max=431.03ms p(90)=218.13ms p(95)=223.88ms p(99.9)=296.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29471
     http_req_receiving.............: avg=102.03µs min=31.76µs med=94.57µs  max=20.65ms  p(90)=129.83µs p(95)=144.05µs p(99.9)=757.05µs
     http_req_sending...............: avg=45.96µs  min=6.32µs  med=17.74µs  max=183.53ms p(90)=23.3µs   p(95)=25.38µs  p(99.9)=555.26µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.33ms min=23.13ms med=202.96ms max=430.43ms p(90)=218ms    p(95)=223.74ms p(99.9)=296.44ms
     http_reqs......................: 29471   239.794552/s
     iteration_duration.............: avg=204.41ms min=55.78ms med=203.46ms max=461.6ms  p(90)=218.43ms p(95)=224.24ms p(99.9)=306.06ms
     iterations.....................: 29371   238.980889/s
     success_rate...................: 100.00% ✓ 29371      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

