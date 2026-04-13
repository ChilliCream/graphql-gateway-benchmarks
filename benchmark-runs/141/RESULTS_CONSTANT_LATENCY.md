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
| hive-router | v0.0.43 | 1,585 | 1,619 | 1,580 | 0.8% |  |
| hotchocolate | 16.0.0-rc.1.29 | 1,457 | 1,471 | 1,429 | 0.9% |  |
| cosmo | 0.298.0 | 1,138 | 1,150 | 1,130 | 0.6% | non-compatible response (1 across 1/9 runs) |
| grafbase | 0.53.2 | 1,130 | 1,157 | 1,124 | 1.0% |  |
| hive-gateway-router-runtime | 2.5.14 | 567 | 582 | 561 | 1.2% |  |
| apollo-router | v2.12.1 | 381 | 396 | 374 | 2.2% |  |
| hive-gateway | 2.5.14 | 249 | 255 | 243 | 1.3% |  |
| apollo-gateway | 2.13.3 | 231 | 233 | 230 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 580251      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=3.34µs  min=1.01µs  med=2.43µs  max=3.97ms   p(90)=4.28µs   p(95)=5.22µs   p(99.9)=35.67µs
     http_req_connecting............: avg=455ns   min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.77ms min=14.07ms med=30.51ms max=323.44ms p(90)=36.59ms  p(95)=38.56ms  p(99.9)=57.81ms
       { expected_response:true }...: avg=30.77ms min=14.07ms med=30.51ms max=323.44ms p(90)=36.59ms  p(95)=38.56ms  p(99.9)=57.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193517
     http_req_receiving.............: avg=87.49µs min=27.54µs med=53.83µs max=222.8ms  p(90)=107.18µs p(95)=160.25µs p(99.9)=2.54ms 
     http_req_sending...............: avg=36.34µs min=5.15µs  med=9.99µs  max=277.71ms p(90)=20.71µs  p(95)=95.52µs  p(99.9)=1.82ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.64ms min=13.99ms med=30.4ms  max=323.26ms p(90)=36.47ms  p(95)=38.4ms   p(99.9)=56.37ms
     http_reqs......................: 193517  1585.986459/s
     iteration_duration.............: avg=31.01ms min=14.23ms med=30.74ms max=337.31ms p(90)=36.8ms   p(95)=38.78ms  p(99.9)=58.31ms
     iterations.....................: 193417  1585.166899/s
     success_rate...................: 100.00% ✓ 193417      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.29)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 533022      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 214 MB  1.8 MB/s
     http_req_blocked...............: avg=3.2µs    min=1µs     med=2.23µs   max=4.06ms   p(90)=4µs     p(95)=4.89µs  p(99.9)=30.33µs
     http_req_connecting............: avg=488ns    min=0s      med=0s       max=4.02ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=33.52ms  min=13.75ms med=32.56ms  max=493.32ms p(90)=40.93ms p(95)=43.84ms p(99.9)=96.79ms
       { expected_response:true }...: avg=33.52ms  min=13.75ms med=32.56ms  max=493.32ms p(90)=40.93ms p(95)=43.84ms p(99.9)=96.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177774
     http_req_receiving.............: avg=779.09µs min=50.78µs med=114.75µs max=166.63ms p(90)=2.23ms  p(95)=3.36ms  p(99.9)=18.35ms
     http_req_sending...............: avg=37.66µs  min=5.24µs  med=9.27µs   max=114.18ms p(90)=20.06µs p(95)=99.4µs  p(99.9)=2.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=32.7ms   min=13.64ms med=31.79ms  max=492.91ms p(90)=39.88ms p(95)=42.73ms p(99.9)=95.46ms
     http_reqs......................: 177774  1457.257142/s
     iteration_duration.............: avg=33.76ms  min=13.98ms med=32.79ms  max=493.52ms p(90)=41.15ms p(95)=44.06ms p(99.9)=97.97ms
     iterations.....................: 177674  1456.437417/s
     success_rate...................: 100.00% ✓ 177674      ✗ 0     
     vus............................: 31      min=0         max=50  
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

     checks.........................: 100.00% ✓ 416685      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.34µs  min=1.01µs  med=2.13µs  max=4.48ms   p(90)=3.65µs   p(95)=4.37µs   p(99.9)=35.87µs
     http_req_connecting............: avg=825ns   min=0s      med=0s      max=4.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.96ms min=19.03ms med=42.37ms max=324.44ms p(90)=52.3ms   p(95)=55.37ms  p(99.9)=71.92ms
       { expected_response:true }...: avg=42.96ms min=19.03ms med=42.37ms max=324.44ms p(90)=52.3ms   p(95)=55.37ms  p(99.9)=71.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138995
     http_req_receiving.............: avg=83.18µs min=29.05µs med=61.74µs max=188.39ms p(90)=104.37µs p(95)=128.64µs p(99.9)=1.66ms 
     http_req_sending...............: avg=27.6µs  min=5.2µs   med=10.1µs  max=173.12ms p(90)=17.67µs  p(95)=22.25µs  p(99.9)=1.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.85ms min=18.88ms med=42.27ms max=314.92ms p(90)=52.18ms  p(95)=55.24ms  p(99.9)=71.35ms
     http_reqs......................: 138995  1138.973167/s
     iteration_duration.............: avg=43.19ms min=20.53ms med=42.57ms max=358.66ms p(90)=52.49ms  p(95)=55.57ms  p(99.9)=72.56ms
     iterations.....................: 138895  1138.153733/s
     success_rate...................: 100.00% ✓ 138895      ✗ 0     
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

     checks.........................: 100.00% ✓ 413547      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.71µs   min=1.01µs  med=2.28µs  max=4.32ms   p(90)=4.61µs   p(95)=5.76µs   p(99.9)=48.05µs
     http_req_connecting............: avg=796ns    min=0s      med=0s      max=4.27ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.24ms  min=16.06ms med=42.69ms max=349.57ms p(90)=52.65ms  p(95)=56.18ms  p(99.9)=81.36ms
       { expected_response:true }...: avg=43.24ms  min=16.06ms med=42.69ms max=349.57ms p(90)=52.65ms  p(95)=56.18ms  p(99.9)=81.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137949
     http_req_receiving.............: avg=110.31µs min=28.81µs med=58.88µs max=131.97ms p(90)=130.37µs p(95)=218.68µs p(99.9)=3.49ms 
     http_req_sending...............: avg=39.04µs  min=5.19µs  med=9.89µs  max=161.73ms p(90)=23.86µs  p(95)=113.38µs p(99.9)=2.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.09ms  min=16ms    med=42.57ms max=216.32ms p(90)=52.51ms  p(95)=56.01ms  p(99.9)=80.59ms
     http_reqs......................: 137949  1130.529484/s
     iteration_duration.............: avg=43.52ms  min=16.28ms med=42.93ms max=370.81ms p(90)=52.88ms  p(95)=56.42ms  p(99.9)=81.81ms
     iterations.....................: 137849  1129.709957/s
     success_rate...................: 100.00% ✓ 137849      ✗ 0     
     vus............................: 47      min=0         max=50  
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

     checks.........................: 100.00% ✓ 207924     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 83 MB   681 kB/s
     http_req_blocked...............: avg=5.01µs  min=1.21µs  med=3.01µs  max=4.54ms   p(90)=4.6µs    p(95)=5.24µs   p(99.9)=46.09µs 
     http_req_connecting............: avg=1.7µs   min=0s      med=0s      max=4.5ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.24ms min=20.56ms med=83.6ms  max=378.8ms  p(90)=104.94ms p(95)=113.1ms  p(99.9)=213.61ms
       { expected_response:true }...: avg=86.24ms min=20.56ms med=83.6ms  max=378.8ms  p(90)=104.94ms p(95)=113.1ms  p(99.9)=213.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69408
     http_req_receiving.............: avg=87.2µs  min=31.6µs  med=77.09µs max=21.05ms  p(90)=113.37µs p(95)=127.58µs p(99.9)=1.09ms  
     http_req_sending...............: avg=27.14µs min=5.58µs  med=13.6µs  max=170.4ms  p(90)=20.1µs   p(95)=22.59µs  p(99.9)=745.84µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.13ms min=20.42ms med=83.49ms max=372.29ms p(90)=104.82ms p(95)=112.96ms p(99.9)=213.24ms
     http_reqs......................: 69408   567.089564/s
     iteration_duration.............: avg=86.58ms min=36.52ms med=83.84ms max=389.18ms p(90)=105.16ms p(95)=113.38ms p(99.9)=215.42ms
     iterations.....................: 69308   566.272526/s
     success_rate...................: 100.00% ✓ 69308      ✗ 0    
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

     checks.........................: 100.00% ✓ 139920     ✗ 0    
     data_received..................: 4.1 GB  33 MB/s
     data_sent......................: 56 MB   458 kB/s
     http_req_blocked...............: avg=5.91µs   min=1.24µs  med=3.49µs   max=4.15ms   p(90)=5.09µs   p(95)=5.73µs   p(99.9)=269.74µs
     http_req_connecting............: avg=2.19µs   min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=242.5µs 
     http_req_duration..............: avg=128.17ms min=21.48ms med=126.06ms max=361.61ms p(90)=160.41ms p(95)=171.19ms p(99.9)=222.6ms 
       { expected_response:true }...: avg=128.17ms min=21.48ms med=126.06ms max=361.61ms p(90)=160.41ms p(95)=171.19ms p(99.9)=222.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 46740
     http_req_receiving.............: avg=92.91µs  min=33.51µs med=87.23µs  max=32.29ms  p(90)=120.33µs p(95)=132.85µs p(99.9)=791.04µs
     http_req_sending...............: avg=30.59µs  min=6.05µs  med=17µs     max=118.75ms p(90)=22.77µs  p(95)=24.77µs  p(99.9)=574.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=128.05ms min=21.19ms med=125.94ms max=360.96ms p(90)=160.29ms p(95)=171.08ms p(99.9)=221.42ms
     http_reqs......................: 46740   381.556263/s
     iteration_duration.............: avg=128.68ms min=36.24ms med=126.37ms max=378.72ms p(90)=160.72ms p(95)=171.49ms p(99.9)=227.14ms
     iterations.....................: 46640   380.739926/s
     success_rate...................: 100.00% ✓ 46640      ✗ 0    
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

     checks.........................: 100.00% ✓ 91287      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   300 kB/s
     http_req_blocked...............: avg=6.98µs   min=1.23µs  med=3.6µs    max=3.88ms   p(90)=5.1µs    p(95)=5.71µs   p(99.9)=1.57ms  
     http_req_connecting............: avg=3.08µs   min=0s      med=0s       max=3.83ms   p(90)=0s       p(95)=0s       p(99.9)=1.47ms  
     http_req_duration..............: avg=196.42ms min=18.39ms med=183.32ms max=577.37ms p(90)=234.25ms p(95)=398ms    p(99.9)=536.42ms
       { expected_response:true }...: avg=196.42ms min=18.39ms med=183.32ms max=577.37ms p(90)=234.25ms p(95)=398ms    p(99.9)=536.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30529
     http_req_receiving.............: avg=195.83µs min=36.89µs med=93.91µs  max=204.07ms p(90)=126.48µs p(95)=139.69µs p(99.9)=1.49ms  
     http_req_sending...............: avg=27.62µs  min=6.45µs  med=17.62µs  max=49ms     p(90)=22.88µs  p(95)=24.73µs  p(99.9)=558.12µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.2ms  min=18.22ms med=183.14ms max=577.28ms p(90)=233.95ms p(95)=397.88ms p(99.9)=536.3ms 
     http_reqs......................: 30529   249.635905/s
     iteration_duration.............: avg=197.3ms  min=43.93ms med=183.71ms max=577.53ms p(90)=234.63ms p(95)=399.64ms p(99.9)=536.67ms
     iterations.....................: 30429   248.818205/s
     success_rate...................: 100.00% ✓ 30429      ✗ 0    
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

     checks.........................: 100.00% ✓ 84903      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   277 kB/s
     http_req_blocked...............: avg=7.52µs   min=1.34µs  med=3.4µs    max=4.15ms   p(90)=4.81µs   p(95)=5.4µs    p(99.9)=2.11ms  
     http_req_connecting............: avg=3.94µs   min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=2.08ms  
     http_req_duration..............: avg=211.18ms min=23.88ms med=212.33ms max=440.2ms  p(90)=238.44ms p(95)=245.99ms p(99.9)=314.24ms
       { expected_response:true }...: avg=211.18ms min=23.88ms med=212.33ms max=440.2ms  p(90)=238.44ms p(95)=245.99ms p(99.9)=314.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28401
     http_req_receiving.............: avg=97.68µs  min=33.4µs  med=91.96µs  max=24.31ms  p(90)=125.18µs p(95)=138.64µs p(99.9)=657.01µs
     http_req_sending...............: avg=29.35µs  min=5.92µs  med=17.16µs  max=181.58ms p(90)=22.7µs   p(95)=24.6µs   p(99.9)=617.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.05ms min=23.72ms med=212.21ms max=439.65ms p(90)=238.32ms p(95)=245.84ms p(99.9)=313.65ms
     http_reqs......................: 28401   231.074322/s
     iteration_duration.............: avg=212.15ms min=48.67ms med=212.78ms max=457.9ms  p(90)=238.74ms p(95)=246.36ms p(99.9)=327.66ms
     iterations.....................: 28301   230.260708/s
     success_rate...................: 100.00% ✓ 28301      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

