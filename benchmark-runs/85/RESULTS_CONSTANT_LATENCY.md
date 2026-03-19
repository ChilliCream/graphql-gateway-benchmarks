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
| hive-router | v0.0.41 | 1,554 | 1,582 | 1,542 | 0.8% |  |
| hotchocolate | 16.0.0-p.11.49 | 1,425 | 1,432 | 1,401 | 0.7% |  |
| cosmo | 0.291.0 | 1,175 | 1,189 | 1,164 | 0.8% | non-compatible response (1 across 1/9 runs) |
| grafbase | 0.53.2 | 1,128 | 1,144 | 1,119 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.6 | 502 | 513 | 495 | 1.1% |  |
| apollo-router | v2.12.0 | 365 | 377 | 360 | 1.6% |  |
| hive-gateway | 2.5.6 | 262 | 265 | 258 | 1.0% |  |
| apollo-gateway | 2.13.2 | 239 | 240 | 237 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 568545      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 228 MB  1.9 MB/s
     http_req_blocked...............: avg=3.16µs  min=982ns   med=2.15µs  max=4.01ms   p(90)=4.05µs   p(95)=4.98µs   p(99.9)=33.88µs
     http_req_connecting............: avg=526ns   min=0s      med=0s      max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.41ms min=14.23ms med=31.16ms max=321.15ms p(90)=37.34ms  p(95)=39.25ms  p(99.9)=56.45ms
       { expected_response:true }...: avg=31.41ms min=14.23ms med=31.16ms max=321.15ms p(90)=37.34ms  p(95)=39.25ms  p(99.9)=56.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 189615
     http_req_receiving.............: avg=81.71µs min=26.34µs med=53.05µs max=163.23ms p(90)=104.98µs p(95)=148.24µs p(99.9)=2.02ms 
     http_req_sending...............: avg=36.06µs min=5.04µs  med=9.5µs   max=229.69ms p(90)=19.72µs  p(95)=36.39µs  p(99.9)=1.71ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.29ms min=14.11ms med=31.06ms max=320.42ms p(90)=37.23ms  p(95)=39.12ms  p(99.9)=55.17ms
     http_reqs......................: 189615  1554.259555/s
     iteration_duration.............: avg=31.65ms min=14.43ms med=31.38ms max=356.5ms  p(90)=37.56ms  p(95)=39.46ms  p(99.9)=56.73ms
     iterations.....................: 189515  1553.439863/s
     success_rate...................: 100.00% ✓ 189515      ✗ 0     
     vus............................: 31      min=0         max=50  
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

     checks.........................: 100.00% ✓ 521415      ✗ 0     
     data_received..................: 15 GB   125 MB/s
     data_sent......................: 209 MB  1.7 MB/s
     http_req_blocked...............: avg=3.17µs   min=982ns   med=2.12µs   max=4.76ms   p(90)=3.78µs  p(95)=4.54µs  p(99.9)=34.37µs 
     http_req_connecting............: avg=601ns    min=0s      med=0s       max=4.72ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=34.27ms  min=14.39ms med=32.85ms  max=479.81ms p(90)=42.57ms p(95)=46.7ms  p(99.9)=105.92ms
       { expected_response:true }...: avg=34.27ms  min=14.39ms med=32.85ms  max=479.81ms p(90)=42.57ms p(95)=46.7ms  p(99.9)=105.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 173905
     http_req_receiving.............: avg=617.22µs min=50.43µs med=114.32µs max=160.22ms p(90)=1.68ms  p(95)=2.56ms  p(99.9)=15.24ms 
     http_req_sending...............: avg=36.28µs  min=5.1µs   med=9.35µs   max=146.49ms p(90)=19.29µs p(95)=76.42µs p(99.9)=1.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=33.62ms  min=13.87ms med=32.22ms  max=479.71ms p(90)=41.71ms p(95)=45.76ms p(99.9)=99.85ms 
     http_reqs......................: 173905  1425.057351/s
     iteration_duration.............: avg=34.51ms  min=14.63ms med=33.07ms  max=479.96ms p(90)=42.79ms p(95)=46.91ms p(99.9)=124.27ms
     iterations.....................: 173805  1424.237905/s
     success_rate...................: 100.00% ✓ 173805      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 430194      ✗ 0     
     data_received..................: 13 GB   103 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.32µs  min=1.03µs  med=2.21µs  max=4.46ms   p(90)=3.87µs   p(95)=4.63µs   p(99.9)=34.66µs
     http_req_connecting............: avg=718ns   min=0s      med=0s      max=4.37ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.59ms min=17.92ms med=41ms    max=322.66ms p(90)=50.57ms  p(95)=53.61ms  p(99.9)=69.08ms
       { expected_response:true }...: avg=41.59ms min=17.92ms med=41ms    max=322.66ms p(90)=50.57ms  p(95)=53.61ms  p(99.9)=69.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143498
     http_req_receiving.............: avg=84.09µs min=27.67µs med=61.79µs max=144.31ms p(90)=107.15µs p(95)=132.82µs p(99.9)=1.96ms 
     http_req_sending...............: avg=24.74µs min=4.95µs  med=10.4µs  max=97.9ms   p(90)=18.31µs  p(95)=23.03µs  p(99.9)=1.09ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.48ms min=17.81ms med=40.9ms  max=321.64ms p(90)=50.45ms  p(95)=53.49ms  p(99.9)=68.68ms
     http_reqs......................: 143498  1175.941545/s
     iteration_duration.............: avg=41.83ms min=19.47ms med=41.21ms max=360.34ms p(90)=50.76ms  p(95)=53.81ms  p(99.9)=69.52ms
     iterations.....................: 143398  1175.122062/s
     success_rate...................: 100.00% ✓ 143398      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 412896      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.56µs   min=971ns   med=2.2µs   max=4.12ms   p(90)=4.51µs   p(95)=5.72µs   p(99.9)=42.05µs
     http_req_connecting............: avg=767ns    min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.32ms  min=15.62ms med=42.89ms max=347.69ms p(90)=52.55ms  p(95)=55.78ms  p(99.9)=78.2ms 
       { expected_response:true }...: avg=43.32ms  min=15.62ms med=42.89ms max=347.69ms p(90)=52.55ms  p(95)=55.78ms  p(99.9)=78.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 137732
     http_req_receiving.............: avg=124.74µs min=28.85µs med=59.32µs max=213.63ms p(90)=131.32µs p(95)=211.39µs p(99.9)=3.91ms 
     http_req_sending...............: avg=36.11µs  min=5.22µs  med=9.81µs  max=27.62ms  p(90)=23.52µs  p(95)=111.67µs p(99.9)=2.38ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.16ms  min=15.51ms med=42.77ms max=134.06ms p(90)=52.41ms  p(95)=55.61ms  p(99.9)=77.66ms
     http_reqs......................: 137732  1128.862511/s
     iteration_duration.............: avg=43.59ms  min=16.36ms med=43.13ms max=373.69ms p(90)=52.78ms  p(95)=56.01ms  p(99.9)=78.72ms
     iterations.....................: 137632  1128.042903/s
     success_rate...................: 100.00% ✓ 137632      ✗ 0     
     vus............................: 44      min=0         max=50  
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

     checks.........................: 100.00% ✓ 184317     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 74 MB   603 kB/s
     http_req_blocked...............: avg=5.07µs  min=1.11µs  med=3.04µs  max=4.46ms   p(90)=4.71µs   p(95)=5.37µs   p(99.9)=94.05µs 
     http_req_connecting............: avg=1.72µs  min=0s      med=0s      max=4.41ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=97.29ms min=22.03ms med=94.01ms max=378.35ms p(90)=119.55ms p(95)=130.25ms p(99.9)=233.08ms
       { expected_response:true }...: avg=97.29ms min=22.03ms med=94.01ms max=378.35ms p(90)=119.55ms p(95)=130.25ms p(99.9)=233.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61539
     http_req_receiving.............: avg=92.66µs min=31.31µs med=79.85µs max=131.34ms p(90)=115.5µs  p(95)=129.53µs p(99.9)=908.08µs
     http_req_sending...............: avg=30.22µs min=5.64µs  med=13.98µs max=173.42ms p(90)=20.85µs  p(95)=23.23µs  p(99.9)=653.31µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.17ms min=21.9ms  med=93.9ms  max=325.56ms p(90)=119.43ms p(95)=130.13ms p(99.9)=231.92ms
     http_reqs......................: 61539   502.312642/s
     iteration_duration.............: avg=97.67ms min=38.5ms  med=94.26ms max=387.59ms p(90)=119.81ms p(95)=130.52ms p(99.9)=235.69ms
     iterations.....................: 61439   501.496391/s
     success_rate...................: 100.00% ✓ 61439      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 134151     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   439 kB/s
     http_req_blocked...............: avg=4.61µs   min=1.22µs  med=3.3µs    max=2.8ms    p(90)=4.81µs   p(95)=5.41µs   p(99.9)=168.78µs
     http_req_connecting............: avg=1.12µs   min=0s      med=0s       max=2.78ms   p(90)=0s       p(95)=0s       p(99.9)=120.84µs
     http_req_duration..............: avg=133.71ms min=18.88ms med=131.69ms max=357.26ms p(90)=167.81ms p(95)=178.72ms p(99.9)=233.1ms 
       { expected_response:true }...: avg=133.71ms min=18.88ms med=131.69ms max=357.26ms p(90)=167.81ms p(95)=178.72ms p(99.9)=233.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 44817
     http_req_receiving.............: avg=221.11µs min=31.42µs med=85.53µs  max=235.33ms p(90)=118.95µs p(95)=132.44µs p(99.9)=22.46ms 
     http_req_sending...............: avg=31.27µs  min=5.61µs  med=16.01µs  max=176.53ms p(90)=21.75µs  p(95)=23.79µs  p(99.9)=603.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.46ms min=18.73ms med=131.52ms max=259.47ms p(90)=167.53ms p(95)=178.26ms p(99.9)=224.5ms 
     http_reqs......................: 44817   365.806476/s
     iteration_duration.............: avg=134.22ms min=30.18ms med=132.01ms max=399.19ms p(90)=168.11ms p(95)=179.01ms p(99.9)=235.05ms
     iterations.....................: 44717   364.990253/s
     success_rate...................: 100.00% ✓ 44717      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 96012      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   315 kB/s
     http_req_blocked...............: avg=7.65µs   min=1.22µs  med=3.5µs    max=4.48ms   p(90)=5.09µs   p(95)=5.73µs   p(99.9)=2.17ms  
     http_req_connecting............: avg=3.65µs   min=0s      med=0s       max=4.43ms   p(90)=0s       p(95)=0s       p(99.9)=1.91ms  
     http_req_duration..............: avg=186.74ms min=18.69ms med=178.21ms max=604.52ms p(90)=234.91ms p(95)=367.71ms p(99.9)=540.46ms
       { expected_response:true }...: avg=186.74ms min=18.69ms med=178.21ms max=604.52ms p(90)=234.91ms p(95)=367.71ms p(99.9)=540.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32104
     http_req_receiving.............: avg=110.88µs min=35.38µs med=96.22µs  max=98.41ms  p(90)=129.26µs p(95)=143.47µs p(99.9)=750.56µs
     http_req_sending...............: avg=25.26µs  min=6.07µs  med=18.13µs  max=45.19ms  p(90)=23.49µs  p(95)=25.45µs  p(99.9)=540.11µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.61ms min=18.57ms med=178.08ms max=604.38ms p(90)=234.75ms p(95)=367.58ms p(99.9)=540.32ms
     http_reqs......................: 32104   262.694272/s
     iteration_duration.............: avg=187.56ms min=51.1ms  med=178.67ms max=604.84ms p(90)=235.26ms p(95)=369.3ms  p(99.9)=540.84ms
     iterations.....................: 32004   261.876011/s
     success_rate...................: 100.00% ✓ 32004      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 88065      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=7.05µs   min=1.32µs  med=3.48µs   max=4.41ms   p(90)=4.94µs   p(95)=5.6µs    p(99.9)=1.59ms  
     http_req_connecting............: avg=3.29µs   min=0s      med=0s       max=4.35ms   p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=203.66ms min=20.36ms med=209.98ms max=436.53ms p(90)=231.03ms p(95)=237.65ms p(99.9)=308.22ms
       { expected_response:true }...: avg=203.66ms min=20.36ms med=209.98ms max=436.53ms p(90)=231.03ms p(95)=237.65ms p(99.9)=308.22ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29455
     http_req_receiving.............: avg=118.1µs  min=34.4µs  med=92.97µs  max=218.17ms p(90)=127.12µs p(95)=140.11µs p(99.9)=763.13µs
     http_req_sending...............: avg=31.55µs  min=6.16µs  med=17.54µs  max=105.84ms p(90)=23.22µs  p(95)=25.27µs  p(99.9)=849.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.51ms min=20.21ms med=209.86ms max=435.46ms p(90)=230.89ms p(95)=237.52ms p(99.9)=307.61ms
     http_reqs......................: 29455   239.702253/s
     iteration_duration.............: avg=204.56ms min=57.8ms  med=210.29ms max=452.31ms p(90)=231.33ms p(95)=237.99ms p(99.9)=311.64ms
     iterations.....................: 29355   238.888462/s
     success_rate...................: 100.00% ✓ 29355      ✗ 0    
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

