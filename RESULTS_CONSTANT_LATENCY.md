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
| hive-router | v0.0.41 | 1,555 | 1,579 | 1,546 | 0.7% |  |
| hotchocolate | 16.0.0-rc.1.0 | 1,423 | 1,438 | 1,409 | 0.7% |  |
| cosmo | 0.291.0 | 1,171 | 1,182 | 1,162 | 0.6% | non-compatible response (1 across 1/9 runs) |
| grafbase | 0.53.2 | 1,152 | 1,164 | 1,134 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.6 | 488 | 500 | 484 | 1.1% |  |
| apollo-router | v2.12.0 | 397 | 406 | 394 | 1.0% |  |
| hive-gateway | 2.5.6 | 262 | 267 | 261 | 0.8% |  |
| apollo-gateway | 2.13.2 | 235 | 236 | 234 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 569049      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 228 MB  1.9 MB/s
     http_req_blocked...............: avg=3.53µs   min=972ns   med=2.48µs  max=4.36ms   p(90)=4.31µs   p(95)=5.22µs   p(99.9)=38.76µs
     http_req_connecting............: avg=591ns    min=0s      med=0s      max=4.32ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.38ms  min=14.38ms med=31.07ms max=348.1ms  p(90)=37.39ms  p(95)=39.37ms  p(99.9)=58.68ms
       { expected_response:true }...: avg=31.38ms  min=14.38ms med=31.07ms max=348.1ms  p(90)=37.39ms  p(95)=39.37ms  p(99.9)=58.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 189783
     http_req_receiving.............: avg=103.65µs min=26.72µs med=53.89µs max=225.77ms p(90)=104.49µs p(95)=149.35µs p(99.9)=2.95ms 
     http_req_sending...............: avg=35.69µs  min=5.2µs   med=9.98µs  max=203.88ms p(90)=20.12µs  p(95)=43.87µs  p(99.9)=1.88ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.24ms  min=14.3ms  med=30.97ms max=142.9ms  p(90)=37.27ms  p(95)=39.22ms  p(99.9)=57.48ms
     http_reqs......................: 189783  1555.894342/s
     iteration_duration.............: avg=31.62ms  min=14.57ms med=31.3ms  max=356.97ms p(90)=37.62ms  p(95)=39.59ms  p(99.9)=59.25ms
     iterations.....................: 189683  1555.074514/s
     success_rate...................: 100.00% ✓ 189683      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 520680      ✗ 0     
     data_received..................: 15 GB   125 MB/s
     data_sent......................: 209 MB  1.7 MB/s
     http_req_blocked...............: avg=3.16µs   min=1.01µs  med=2.52µs   max=1.96ms   p(90)=4.17µs  p(95)=4.98µs  p(99.9)=37.55µs
     http_req_connecting............: avg=244ns    min=0s      med=0s       max=1.93ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=34.31ms  min=14.23ms med=32.98ms  max=477.28ms p(90)=42.62ms p(95)=46.89ms p(99.9)=83.8ms 
       { expected_response:true }...: avg=34.31ms  min=14.23ms med=32.98ms  max=477.28ms p(90)=42.62ms p(95)=46.89ms p(99.9)=83.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 173660
     http_req_receiving.............: avg=614.42µs min=50.75µs med=124.16µs max=79.36ms  p(90)=1.68ms  p(95)=2.54ms  p(99.9)=15.18ms
     http_req_sending...............: avg=34.76µs  min=5.17µs  med=10.09µs  max=221.94ms p(90)=19.63µs p(95)=48.17µs p(99.9)=1.68ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=33.66ms  min=14.14ms med=32.35ms  max=476.3ms  p(90)=41.83ms p(95)=46.03ms p(99.9)=82.69ms
     http_reqs......................: 173660  1423.240975/s
     iteration_duration.............: avg=34.56ms  min=14.44ms med=33.2ms   max=477.6ms  p(90)=42.84ms p(95)=47.12ms p(99.9)=84.2ms 
     iterations.....................: 173560  1422.421419/s
     success_rate...................: 100.00% ✓ 173560      ✗ 0     
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

     checks.........................: 100.00% ✓ 428601      ✗ 0     
     data_received..................: 13 GB   103 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.58µs  min=1.03µs  med=2.53µs  max=4.19ms   p(90)=4.18µs   p(95)=4.96µs   p(99.9)=36.16µs
     http_req_connecting............: avg=683ns   min=0s      med=0s      max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.76ms min=17.79ms med=41.15ms max=340.47ms p(90)=50.78ms  p(95)=53.89ms  p(99.9)=71.57ms
       { expected_response:true }...: avg=41.76ms min=17.79ms med=41.15ms max=340.47ms p(90)=50.78ms  p(95)=53.89ms  p(99.9)=71.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142967
     http_req_receiving.............: avg=85.81µs min=28.31µs med=62.89µs max=184.65ms p(90)=109.09µs p(95)=137.45µs p(99.9)=1.78ms 
     http_req_sending...............: avg=28.8µs  min=5.32µs  med=10.89µs max=171.64ms p(90)=19.02µs  p(95)=24.49µs  p(99.9)=1.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.64ms min=17.69ms med=41.04ms max=324.17ms p(90)=50.67ms  p(95)=53.75ms  p(99.9)=70.51ms
     http_reqs......................: 142967  1171.593213/s
     iteration_duration.............: avg=41.99ms min=18ms    med=41.36ms max=349.08ms p(90)=50.99ms  p(95)=54.1ms   p(99.9)=71.94ms
     iterations.....................: 142867  1170.773727/s
     success_rate...................: 100.00% ✓ 142867      ✗ 0     
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

     checks.........................: 100.00% ✓ 421545      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.75µs   min=982ns   med=2.31µs  max=4.72ms   p(90)=4.77µs   p(95)=5.9µs    p(99.9)=46.63µs
     http_req_connecting............: avg=760ns    min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.41ms  min=14.89ms med=41.97ms max=354.07ms p(90)=51.73ms  p(95)=54.88ms  p(99.9)=75.82ms
       { expected_response:true }...: avg=42.41ms  min=14.89ms med=41.97ms max=354.07ms p(90)=51.73ms  p(95)=54.88ms  p(99.9)=75.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140615
     http_req_receiving.............: avg=111.44µs min=28.89µs med=59µs    max=154.67ms p(90)=132.52µs p(95)=213.84µs p(99.9)=3.44ms 
     http_req_sending...............: avg=38.22µs  min=5.16µs  med=10.08µs max=227.6ms  p(90)=24.17µs  p(95)=112.06µs p(99.9)=2.35ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.26ms  min=14.75ms med=41.84ms max=208.5ms  p(90)=51.59ms  p(95)=54.71ms  p(99.9)=74.99ms
     http_reqs......................: 140615  1152.435627/s
     iteration_duration.............: avg=42.69ms  min=15.22ms med=42.21ms max=370.54ms p(90)=51.96ms  p(95)=55.12ms  p(99.9)=76.49ms
     iterations.....................: 140515  1151.616059/s
     success_rate...................: 100.00% ✓ 140515      ✗ 0     
     vus............................: 34      min=0         max=50  
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

     checks.........................: 100.00% ✓ 179289     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 72 MB   587 kB/s
     http_req_blocked...............: avg=6.43µs   min=1.1µs   med=3.05µs  max=8.09ms   p(90)=4.59µs   p(95)=5.24µs   p(99.9)=51.75µs 
     http_req_connecting............: avg=3.07µs   min=0s      med=0s      max=8.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=100.03ms min=19.27ms med=97.85ms max=349.15ms p(90)=117.08ms p(95)=125.75ms p(99.9)=227.8ms 
       { expected_response:true }...: avg=100.03ms min=19.27ms med=97.85ms max=349.15ms p(90)=117.08ms p(95)=125.75ms p(99.9)=227.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 59863
     http_req_receiving.............: avg=87.53µs  min=30.58µs med=79µs    max=45.19ms  p(90)=113.7µs  p(95)=126.56µs p(99.9)=851.64µs
     http_req_sending...............: avg=23.42µs  min=5.48µs  med=14.1µs  max=60.95ms  p(90)=20.6µs   p(95)=22.84µs  p(99.9)=876.42µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.92ms  min=19.15ms med=97.74ms max=338.02ms p(90)=116.98ms p(95)=125.62ms p(99.9)=227.52ms
     http_reqs......................: 59863   488.808493/s
     iteration_duration.............: avg=100.41ms min=28.98ms med=98.11ms max=366.92ms p(90)=117.33ms p(95)=126.02ms p(99.9)=230.52ms
     iterations.....................: 59763   487.991947/s
     success_rate...................: 100.00% ✓ 59763      ✗ 0    
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

     checks.........................: 100.00% ✓ 145623     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 58 MB   477 kB/s
     http_req_blocked...............: avg=5.89µs   min=1.12µs  med=3.5µs    max=4.21ms   p(90)=5.08µs   p(95)=5.72µs   p(99.9)=200.26µs
     http_req_connecting............: avg=2.17µs   min=0s      med=0s       max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=96.75µs 
     http_req_duration..............: avg=123.18ms min=19.3ms  med=121.37ms max=393.82ms p(90)=153.52ms p(95)=163.35ms p(99.9)=208.09ms
       { expected_response:true }...: avg=123.18ms min=19.3ms  med=121.37ms max=393.82ms p(90)=153.52ms p(95)=163.35ms p(99.9)=208.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48641
     http_req_receiving.............: avg=193.5µs  min=29.76µs med=86.96µs  max=273.5ms  p(90)=120.26µs p(95)=133.66µs p(99.9)=1.26ms  
     http_req_sending...............: avg=33.96µs  min=5.79µs  med=16.69µs  max=272.34ms p(90)=22.33µs  p(95)=24.46µs  p(99.9)=626.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.95ms min=19.2ms  med=121.22ms max=229.27ms p(90)=153.29ms p(95)=163.1ms  p(99.9)=201.4ms 
     http_reqs......................: 48641   397.092006/s
     iteration_duration.............: avg=123.64ms min=32.87ms med=121.67ms max=405.29ms p(90)=153.8ms  p(95)=163.64ms p(99.9)=210.35ms
     iterations.....................: 48541   396.275632/s
     success_rate...................: 100.00% ✓ 48541      ✗ 0    
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

     checks.........................: 100.00% ✓ 96078      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   315 kB/s
     http_req_blocked...............: avg=6.96µs   min=1.32µs  med=3.76µs   max=3.78ms   p(90)=5.29µs   p(95)=5.92µs   p(99.9)=1.43ms  
     http_req_connecting............: avg=2.97µs   min=0s      med=0s       max=3.74ms   p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=186.68ms min=18.81ms med=170.74ms max=602.36ms p(90)=241.74ms p(95)=342.98ms p(99.9)=557.29ms
       { expected_response:true }...: avg=186.68ms min=18.81ms med=170.74ms max=602.36ms p(90)=241.74ms p(95)=342.98ms p(99.9)=557.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32126
     http_req_receiving.............: avg=108.47µs min=37.21µs med=96.33µs  max=85.81ms  p(90)=130.33µs p(95)=144.68µs p(99.9)=731.93µs
     http_req_sending...............: avg=27.81µs  min=6.24µs  med=18.21µs  max=80.16ms  p(90)=23.4µs   p(95)=25.27µs  p(99.9)=545.14µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.54ms min=18.62ms med=170.6ms  max=602.26ms p(90)=241.61ms p(95)=339.54ms p(99.9)=557.17ms
     http_reqs......................: 32126   262.734338/s
     iteration_duration.............: avg=187.51ms min=40.84ms med=171.14ms max=602.58ms p(90)=242.17ms p(95)=353.99ms p(99.9)=557.61ms
     iterations.....................: 32026   261.916514/s
     success_rate...................: 100.00% ✓ 32026      ✗ 0    
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

     checks.........................: 100.00% ✓ 86505      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   283 kB/s
     http_req_blocked...............: avg=7.36µs   min=1.23µs  med=3.55µs   max=4.1ms    p(90)=4.98µs   p(95)=5.56µs   p(99.9)=1.87ms  
     http_req_connecting............: avg=3.51µs   min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=207.27ms min=21.15ms med=213.08ms max=447.33ms p(90)=224.86ms p(95)=230.51ms p(99.9)=301.83ms
       { expected_response:true }...: avg=207.27ms min=21.15ms med=213.08ms max=447.33ms p(90)=224.86ms p(95)=230.51ms p(99.9)=301.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28935
     http_req_receiving.............: avg=101.81µs min=35.58µs med=93.37µs  max=81.59ms  p(90)=127.65µs p(95)=140.36µs p(99.9)=596.61µs
     http_req_sending...............: avg=68.4µs   min=5.93µs  med=17.47µs  max=248.48ms p(90)=22.82µs  p(95)=24.77µs  p(99.9)=618.93µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.1ms  min=21.04ms med=212.95ms max=443.93ms p(90)=224.72ms p(95)=230.37ms p(99.9)=299.1ms 
     http_reqs......................: 28935   235.549547/s
     iteration_duration.............: avg=208.22ms min=59.17ms med=213.37ms max=462.69ms p(90)=225.14ms p(95)=230.85ms p(99.9)=319.29ms
     iterations.....................: 28835   234.735482/s
     success_rate...................: 100.00% ✓ 28835      ✗ 0    
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

