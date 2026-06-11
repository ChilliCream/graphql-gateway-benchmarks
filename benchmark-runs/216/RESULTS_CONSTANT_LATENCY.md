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
| hive-router | v0.0.65 | 1,594 | 1,606 | 1,581 | 0.6% |  |
| hotchocolate | 16.1.3 | 1,446 | 1,464 | 1,437 | 0.6% |  |
| grafbase | 0.53.5 | 1,126 | 1,149 | 1,117 | 0.9% |  |
| cosmo | 0.321.1 | 1,120 | 1,137 | 1,111 | 0.8% | non-compatible response (2 across 1/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 525 | 539 | 523 | 1.2% |  |
| apollo-router | v2.15.0 | 374 | 385 | 368 | 1.5% |  |
| hive-gateway | 2.8.2 | 236 | 242 | 235 | 1.0% |  |
| apollo-gateway | 2.14.1 | 232 | 234 | 230 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 583443      ✗ 0     
     data_received..................: 17 GB   140 MB/s
     data_sent......................: 234 MB  1.9 MB/s
     http_req_blocked...............: avg=3.1µs   min=992ns   med=2.06µs  max=4.08ms   p(90)=3.95µs  p(95)=4.89µs   p(99.9)=36.27µs
     http_req_connecting............: avg=534ns   min=0s      med=0s      max=4.03ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.6ms  min=13.53ms med=30.34ms max=330.64ms p(90)=36.33ms p(95)=38.28ms  p(99.9)=58.29ms
       { expected_response:true }...: avg=30.6ms  min=13.53ms med=30.34ms max=330.64ms p(90)=36.33ms p(95)=38.28ms  p(99.9)=58.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194581
     http_req_receiving.............: avg=82.71µs min=27.01µs med=50.45µs max=245.81ms p(90)=102.7µs p(95)=152.88µs p(99.9)=2.32ms 
     http_req_sending...............: avg=35.83µs min=5.13µs  med=9.08µs  max=234.01ms p(90)=19.69µs p(95)=82.15µs  p(99.9)=1.78ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.48ms min=13.41ms med=30.24ms max=330.04ms p(90)=36.21ms p(95)=38.13ms  p(99.9)=57.02ms
     http_reqs......................: 194581  1594.992932/s
     iteration_duration.............: avg=30.84ms min=13.81ms med=30.56ms max=354.91ms p(90)=36.55ms p(95)=38.49ms  p(99.9)=58.78ms
     iterations.....................: 194481  1594.173225/s
     success_rate...................: 100.00% ✓ 194481      ✗ 0     
     vus............................: 24      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 529191      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.09µs   min=982ns   med=2.02µs   max=4.6ms    p(90)=3.83µs  p(95)=4.74µs   p(99.9)=31.96µs
     http_req_connecting............: avg=599ns    min=0s      med=0s       max=4.54ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.76ms  min=13.67ms med=32.63ms  max=485.98ms p(90)=41.56ms p(95)=45.13ms  p(99.9)=82.48ms
       { expected_response:true }...: avg=33.76ms  min=13.67ms med=32.63ms  max=485.98ms p(90)=41.56ms p(95)=45.13ms  p(99.9)=82.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176497
     http_req_receiving.............: avg=742.06µs min=50.56µs med=111.21µs max=44.49ms  p(90)=2.13ms  p(95)=3.25ms   p(99.9)=17.1ms 
     http_req_sending...............: avg=36.26µs  min=5.24µs  med=9µs      max=132.97ms p(90)=19.92µs p(95)=104.64µs p(99.9)=2.33ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.98ms  min=13.58ms med=31.86ms  max=485.9ms  p(90)=40.52ms p(95)=44ms     p(99.9)=81.63ms
     http_reqs......................: 176497  1446.241633/s
     iteration_duration.............: avg=34.01ms  min=13.87ms med=32.85ms  max=486.23ms p(90)=41.78ms p(95)=45.35ms  p(99.9)=83.28ms
     iterations.....................: 176397  1445.422218/s
     success_rate...................: 100.00% ✓ 176397      ✗ 0     
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

     checks.........................: 100.00% ✓ 412218      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.4µs   min=962ns   med=2.24µs  max=3.31ms   p(90)=4.73µs   p(95)=5.93µs   p(99.9)=42.1µs 
     http_req_connecting............: avg=548ns   min=0s      med=0s      max=3.28ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.38ms min=17.57ms med=42.92ms max=344.92ms p(90)=52.64ms  p(95)=55.76ms  p(99.9)=80.67ms
       { expected_response:true }...: avg=43.38ms min=17.57ms med=42.92ms max=344.92ms p(90)=52.64ms  p(95)=55.76ms  p(99.9)=80.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137506
     http_req_receiving.............: avg=99.63µs min=30.12µs med=60.21µs max=199.86ms p(90)=130.88µs p(95)=197.24µs p(99.9)=3.2ms  
     http_req_sending...............: avg=35.05µs min=5.09µs  med=9.87µs  max=198.92ms p(90)=23.66µs  p(95)=104.01µs p(99.9)=1.88ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.25ms min=17.44ms med=42.8ms  max=344.33ms p(90)=52.5ms   p(95)=55.62ms  p(99.9)=79.96ms
     http_reqs......................: 137506  1126.893829/s
     iteration_duration.............: avg=43.66ms min=19.39ms med=43.17ms max=365.12ms p(90)=52.87ms  p(95)=56ms     p(99.9)=81.17ms
     iterations.....................: 137406  1126.074305/s
     success_rate...................: 100.00% ✓ 137406      ✗ 0     
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

     checks.........................: 100.00% ✓ 410067      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 164 MB  1.3 MB/s
     http_req_blocked...............: avg=3.26µs  min=1.03µs  med=2.16µs  max=3.94ms   p(90)=3.78µs   p(95)=4.52µs   p(99.9)=34.91µs
     http_req_connecting............: avg=712ns   min=0s      med=0s      max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.66ms min=19.13ms med=43.04ms max=352.25ms p(90)=53.14ms  p(95)=56.36ms  p(99.9)=73.51ms
       { expected_response:true }...: avg=43.66ms min=19.13ms med=43.04ms max=352.25ms p(90)=53.14ms  p(95)=56.36ms  p(99.9)=73.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136789
     http_req_receiving.............: avg=81.47µs min=28.87µs med=61.37µs max=51.82ms  p(90)=105.53µs p(95)=129.01µs p(99.9)=1.62ms 
     http_req_sending...............: avg=26.52µs min=5.02µs  med=10.26µs max=215.34ms p(90)=17.93µs  p(95)=22.03µs  p(99.9)=1.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.55ms min=19ms    med=42.94ms max=351.88ms p(90)=53.02ms  p(95)=56.26ms  p(99.9)=72.96ms
     http_reqs......................: 136789  1120.884461/s
     iteration_duration.............: avg=43.89ms min=20.34ms med=43.25ms max=373.6ms  p(90)=53.34ms  p(95)=56.56ms  p(99.9)=73.85ms
     iterations.....................: 136689  1120.065035/s
     success_rate...................: 100.00% ✓ 136689      ✗ 0     
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

     checks.........................: 100.00% ✓ 192834     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   632 kB/s
     http_req_blocked...............: avg=4.64µs  min=1.14µs  med=2.95µs  max=4.26ms   p(90)=4.61µs   p(95)=5.26µs   p(99.9)=66.19µs 
     http_req_connecting............: avg=1.42µs  min=0s      med=0s      max=4.22ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.99ms min=22.15ms med=91.69ms max=367.68ms p(90)=108.12ms p(95)=115.53ms p(99.9)=223.96ms
       { expected_response:true }...: avg=92.99ms min=22.15ms med=91.69ms max=367.68ms p(90)=108.12ms p(95)=115.53ms p(99.9)=223.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64378
     http_req_receiving.............: avg=86µs    min=30.88µs med=76.98µs max=55.66ms  p(90)=113.78µs p(95)=127.3µs  p(99.9)=834.4µs 
     http_req_sending...............: avg=24.42µs min=5.2µs   med=13.34µs max=74.42ms  p(90)=20.08µs  p(95)=22.55µs  p(99.9)=842.71µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.88ms min=21.98ms med=91.59ms max=367.05ms p(90)=107.99ms p(95)=115.38ms p(99.9)=223.83ms
     http_reqs......................: 64378   525.802331/s
     iteration_duration.............: avg=93.35ms min=27.49ms med=91.92ms max=380.5ms  p(90)=108.35ms p(95)=115.8ms  p(99.9)=227.6ms 
     iterations.....................: 64278   524.985589/s
     success_rate...................: 100.00% ✓ 64278      ✗ 0    
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

     checks.........................: 100.00% ✓ 137145     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   449 kB/s
     http_req_blocked...............: avg=5.74µs   min=1.19µs  med=3.21µs   max=4.67ms   p(90)=4.73µs   p(95)=5.35µs   p(99.9)=418.02µs
     http_req_connecting............: avg=2.27µs   min=0s      med=0s       max=4.62ms   p(90)=0s       p(95)=0s       p(99.9)=349.25µs
     http_req_duration..............: avg=130.77ms min=21.97ms med=128.81ms max=377.65ms p(90)=163.3ms  p(95)=174.72ms p(99.9)=224.63ms
       { expected_response:true }...: avg=130.77ms min=21.97ms med=128.81ms max=377.65ms p(90)=163.3ms  p(95)=174.72ms p(99.9)=224.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45815
     http_req_receiving.............: avg=96.31µs  min=30.22µs med=83.54µs  max=151.15ms p(90)=117.26µs p(95)=130.64µs p(99.9)=820.62µs
     http_req_sending...............: avg=32.56µs  min=5.73µs  med=15.22µs  max=143.16ms p(90)=21.34µs  p(95)=23.45µs  p(99.9)=737.91µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=130.64ms min=21.87ms med=128.69ms max=376.78ms p(90)=163.19ms p(95)=174.59ms p(99.9)=222.7ms 
     http_reqs......................: 45815   374.05854/s
     iteration_duration.............: avg=131.28ms min=52.13ms med=129.12ms max=393.08ms p(90)=163.58ms p(95)=174.99ms p(99.9)=228.33ms
     iterations.....................: 45715   373.242085/s
     success_rate...................: 100.00% ✓ 45715      ✗ 0    
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

     checks.........................: 100.00% ✓ 86697      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=6.8µs    min=1.15µs  med=3.47µs   max=3.75ms   p(90)=4.91µs   p(95)=5.51µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=3.13µs   min=0s      med=0s       max=3.72ms   p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=206.81ms min=19.02ms med=180.01ms max=734.43ms p(90)=300.28ms p(95)=356.93ms p(99.9)=663.51ms
       { expected_response:true }...: avg=206.81ms min=19.02ms med=180.01ms max=734.43ms p(90)=300.28ms p(95)=356.93ms p(99.9)=663.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28999
     http_req_receiving.............: avg=105.76µs min=36.3µs  med=94.64µs  max=114.37ms p(90)=127.53µs p(95)=141.39µs p(99.9)=879.72µs
     http_req_sending...............: avg=30.3µs   min=6.23µs  med=17.21µs  max=90.89ms  p(90)=22.52µs  p(95)=24.49µs  p(99.9)=580.79µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.68ms min=18.86ms med=179.87ms max=734.3ms  p(90)=300.18ms p(95)=356.82ms p(99.9)=663.37ms
     http_reqs......................: 28999   236.962353/s
     iteration_duration.............: avg=207.75ms min=66.36ms med=180.44ms max=734.69ms p(90)=300.9ms  p(95)=358.13ms p(99.9)=663.84ms
     iterations.....................: 28899   236.145214/s
     success_rate...................: 100.00% ✓ 28899      ✗ 0    
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

     checks.........................: 100.00% ✓ 85503      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   280 kB/s
     http_req_blocked...............: avg=5.08µs   min=1.24µs  med=3.35µs   max=2.47ms   p(90)=4.67µs   p(95)=5.21µs   p(99.9)=584.74µs
     http_req_connecting............: avg=1.52µs   min=0s      med=0s       max=2.44ms   p(90)=0s       p(95)=0s       p(99.9)=523.66µs
     http_req_duration..............: avg=209.69ms min=19.98ms med=208.72ms max=399.46ms p(90)=226.18ms p(95)=231.6ms  p(99.9)=308.48ms
       { expected_response:true }...: avg=209.69ms min=19.98ms med=208.72ms max=399.46ms p(90)=226.18ms p(95)=231.6ms  p(99.9)=308.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28601
     http_req_receiving.............: avg=95.4µs   min=31.77µs med=90.83µs  max=3.45ms   p(90)=123.24µs p(95)=136.73µs p(99.9)=662µs   
     http_req_sending...............: avg=27.36µs  min=6.03µs  med=16.26µs  max=89.74ms  p(90)=21.19µs  p(95)=23.19µs  p(99.9)=559.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.57ms min=19.82ms med=208.61ms max=399.26ms p(90)=226.07ms p(95)=231.47ms p(99.9)=308.25ms
     http_reqs......................: 28601   232.818604/s
     iteration_duration.............: avg=210.63ms min=51.17ms med=209.07ms max=406.94ms p(90)=226.45ms p(95)=231.9ms  p(99.9)=309.9ms 
     iterations.....................: 28501   232.004581/s
     success_rate...................: 100.00% ✓ 28501      ✗ 0    
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

