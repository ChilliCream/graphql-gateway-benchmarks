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
| hive-router | v0.0.43 | 1,583 | 1,612 | 1,574 | 0.8% |  |
| hotchocolate | 16.0.0-rc.1.21 | 1,434 | 1,448 | 1,420 | 0.6% |  |
| grafbase | 0.53.2 | 1,146 | 1,169 | 1,139 | 0.8% |  |
| cosmo | 0.298.0 | 1,136 | 1,153 | 1,129 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.14 | 559 | 573 | 555 | 1.0% |  |
| apollo-router | v2.12.1 | 392 | 400 | 389 | 0.9% |  |
| hive-gateway | 2.5.14 | 262 | 266 | 257 | 1.1% |  |
| apollo-gateway | 2.13.3 | 235 | 237 | 234 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 579087      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.17µs   min=1.03µs  med=2.41µs  max=2.82ms   p(90)=4.27µs   p(95)=5.27µs   p(99.9)=35.49µs
     http_req_connecting............: avg=309ns    min=0s      med=0s      max=2.8ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.84ms  min=14.1ms  med=30.57ms max=341.35ms p(90)=36.68ms  p(95)=38.66ms  p(99.9)=57.36ms
       { expected_response:true }...: avg=30.84ms  min=14.1ms  med=30.57ms max=341.35ms p(90)=36.68ms  p(95)=38.66ms  p(99.9)=57.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193129
     http_req_receiving.............: avg=118.57µs min=27.42µs med=54.02µs max=291.22ms p(90)=105.74µs p(95)=157.26µs p(99.9)=3.24ms 
     http_req_sending...............: avg=34.84µs  min=4.92µs  med=9.71µs  max=133.35ms p(90)=19.8µs   p(95)=73.27µs  p(99.9)=1.91ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.68ms  min=14.04ms med=30.46ms max=81.89ms  p(90)=36.56ms  p(95)=38.52ms  p(99.9)=53.87ms
     http_reqs......................: 193129  1583.279455/s
     iteration_duration.............: avg=31.07ms  min=14.33ms med=30.79ms max=363.82ms p(90)=36.9ms   p(95)=38.88ms  p(99.9)=57.66ms
     iterations.....................: 193029  1582.45965/s
     success_rate...................: 100.00% ✓ 193029      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.21)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 524913      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 210 MB  1.7 MB/s
     http_req_blocked...............: avg=3.3µs    min=1µs     med=2.26µs   max=4.11ms   p(90)=3.99µs  p(95)=4.88µs  p(99.9)=35.27µs
     http_req_connecting............: avg=569ns    min=0s      med=0s       max=3.99ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=34.04ms  min=14.15ms med=32.92ms  max=429.7ms  p(90)=41.98ms p(95)=45.6ms  p(99.9)=79.1ms 
       { expected_response:true }...: avg=34.04ms  min=14.15ms med=32.92ms  max=429.7ms  p(90)=41.98ms p(95)=45.6ms  p(99.9)=79.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 175071
     http_req_receiving.............: avg=848.23µs min=51.58µs med=117.66µs max=295.08ms p(90)=2.35ms  p(95)=3.51ms  p(99.9)=19.4ms 
     http_req_sending...............: avg=39.34µs  min=5.22µs  med=9.37µs   max=307.97ms p(90)=19.89µs p(95)=107.7µs p(99.9)=2.64ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=33.15ms  min=13.96ms med=32.09ms  max=429.61ms p(90)=40.84ms p(95)=44.39ms p(99.9)=77.28ms
     http_reqs......................: 175071  1434.867933/s
     iteration_duration.............: avg=34.28ms  min=14.35ms med=33.14ms  max=429.92ms p(90)=42.21ms p(95)=45.84ms p(99.9)=79.75ms
     iterations.....................: 174971  1434.048341/s
     success_rate...................: 100.00% ✓ 174971      ✗ 0     
     vus............................: 47      min=0         max=50  
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

     checks.........................: 100.00% ✓ 419343      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.33µs  min=952ns   med=2.26µs  max=3.86ms   p(90)=4.82µs   p(95)=6.02µs   p(99.9)=47.12µs
     http_req_connecting............: avg=359ns   min=0s      med=0s      max=2.73ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.63ms min=15.61ms med=42.11ms max=343.98ms p(90)=51.83ms  p(95)=54.99ms  p(99.9)=77.6ms 
       { expected_response:true }...: avg=42.63ms min=15.61ms med=42.11ms max=343.98ms p(90)=51.83ms  p(95)=54.99ms  p(99.9)=77.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 139881
     http_req_receiving.............: avg=99µs    min=28.3µs  med=60.41µs max=91.83ms  p(90)=134.02µs p(95)=210.65µs p(99.9)=3.35ms 
     http_req_sending...............: avg=37.25µs min=5.21µs  med=9.91µs  max=129.94ms p(90)=24.15µs  p(95)=112.79µs p(99.9)=2.17ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.5ms  min=15.52ms med=41.98ms max=313.96ms p(90)=51.67ms  p(95)=54.82ms  p(99.9)=77.26ms
     http_reqs......................: 139881  1146.393686/s
     iteration_duration.............: avg=42.91ms min=15.85ms med=42.35ms max=365.45ms p(90)=52.06ms  p(95)=55.22ms  p(99.9)=78.19ms
     iterations.....................: 139781  1145.574137/s
     success_rate...................: 100.00% ✓ 139781      ✗ 0     
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

     checks.........................: 100.00% ✓ 415935      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.4µs   min=1.04µs  med=2.28µs  max=3.98ms   p(90)=3.95µs   p(95)=4.7µs    p(99.9)=39.55µs
     http_req_connecting............: avg=706ns   min=0s      med=0s      max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.03ms min=15.72ms med=42.44ms max=337.89ms p(90)=52.31ms  p(95)=55.44ms  p(99.9)=73.15ms
       { expected_response:true }...: avg=43.03ms min=15.72ms med=42.44ms max=337.89ms p(90)=52.31ms  p(95)=55.44ms  p(99.9)=73.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138745
     http_req_receiving.............: avg=84.87µs min=29.17µs med=62.69µs max=93.41ms  p(90)=105.73µs p(95)=130.41µs p(99.9)=1.86ms 
     http_req_sending...............: avg=25.37µs min=5.13µs  med=10.42µs max=53.53ms  p(90)=17.83µs  p(95)=22.47µs  p(99.9)=1.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.92ms min=15.54ms med=42.34ms max=337.23ms p(90)=52.19ms  p(95)=55.33ms  p(99.9)=72.63ms
     http_reqs......................: 138745  1136.992184/s
     iteration_duration.............: avg=43.26ms min=19.49ms med=42.65ms max=351.01ms p(90)=52.51ms  p(95)=55.65ms  p(99.9)=73.56ms
     iterations.....................: 138645  1136.172701/s
     success_rate...................: 100.00% ✓ 138645      ✗ 0     
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

     checks.........................: 100.00% ✓ 205113     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 82 MB   672 kB/s
     http_req_blocked...............: avg=4.54µs  min=1.21µs  med=3.03µs  max=4.07ms   p(90)=4.62µs   p(95)=5.26µs   p(99.9)=51.46µs 
     http_req_connecting............: avg=1.23µs  min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.43ms min=18.02ms med=85.4ms  max=362.85ms p(90)=102.38ms p(95)=110.44ms p(99.9)=210.41ms
       { expected_response:true }...: avg=87.43ms min=18.02ms med=85.4ms  max=362.85ms p(90)=102.38ms p(95)=110.44ms p(99.9)=210.41ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68471
     http_req_receiving.............: avg=159.3µs min=31.26µs med=76.09µs max=253.56ms p(90)=111.37µs p(95)=124.97µs p(99.9)=1.26ms  
     http_req_sending...............: avg=28.06µs min=5.46µs  med=13.51µs max=270.18ms p(90)=19.77µs  p(95)=22.19µs  p(99.9)=673.18µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.24ms min=17.9ms  med=85.3ms  max=224.61ms p(90)=102.28ms p(95)=110.08ms p(99.9)=207.64ms
     http_reqs......................: 68471   559.39917/s
     iteration_duration.............: avg=87.76ms min=25.28ms med=85.64ms max=380.12ms p(90)=102.62ms p(95)=110.68ms p(99.9)=211.1ms 
     iterations.....................: 68371   558.582183/s
     success_rate...................: 100.00% ✓ 68371      ✗ 0    
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

     checks.........................: 100.00% ✓ 143880     ✗ 0    
     data_received..................: 4.2 GB  34 MB/s
     data_sent......................: 58 MB   471 kB/s
     http_req_blocked...............: avg=5.72µs   min=1.28µs  med=3.31µs   max=4.71ms   p(90)=4.89µs   p(95)=5.52µs   p(99.9)=293.03µs
     http_req_connecting............: avg=2.18µs   min=0s      med=0s       max=4.67ms   p(90)=0s       p(95)=0s       p(99.9)=186.94µs
     http_req_duration..............: avg=124.64ms min=20.56ms med=122.88ms max=378.02ms p(90)=155.1ms  p(95)=165.52ms p(99.9)=214.62ms
       { expected_response:true }...: avg=124.64ms min=20.56ms med=122.88ms max=378.02ms p(90)=155.1ms  p(95)=165.52ms p(99.9)=214.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48060
     http_req_receiving.............: avg=91.81µs  min=32.09µs med=84.1µs   max=94.8ms   p(90)=117.29µs p(95)=129.8µs  p(99.9)=776.42µs
     http_req_sending...............: avg=32.3µs   min=5.01µs  med=15.6µs   max=163.91ms p(90)=21.41µs  p(95)=23.58µs  p(99.9)=624.42µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.52ms min=20.41ms med=122.78ms max=377.39ms p(90)=154.99ms p(95)=165.4ms  p(99.9)=213.2ms 
     http_reqs......................: 48060   392.354508/s
     iteration_duration.............: avg=125.14ms min=50.39ms med=123.17ms max=406.08ms p(90)=155.39ms p(95)=165.82ms p(99.9)=216.78ms
     iterations.....................: 47960   391.538124/s
     success_rate...................: 100.00% ✓ 47960      ✗ 0    
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

     checks.........................: 100.00% ✓ 95964      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   315 kB/s
     http_req_blocked...............: avg=7.01µs   min=1.29µs  med=3.67µs   max=3.87ms   p(90)=5.32µs   p(95)=5.95µs   p(99.9)=1.49ms  
     http_req_connecting............: avg=3.05µs   min=0s      med=0s       max=3.83ms   p(90)=0s       p(95)=0s       p(99.9)=1.44ms  
     http_req_duration..............: avg=186.85ms min=17.79ms med=174.39ms max=635.23ms p(90)=216.73ms p(95)=380.28ms p(99.9)=541.79ms
       { expected_response:true }...: avg=186.85ms min=17.79ms med=174.39ms max=635.23ms p(90)=216.73ms p(95)=380.28ms p(99.9)=541.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32088
     http_req_receiving.............: avg=103.11µs min=36.81µs med=95.43µs  max=53.83ms  p(90)=129.53µs p(95)=143.36µs p(99.9)=728.11µs
     http_req_sending...............: avg=32.6µs   min=6.06µs  med=17.64µs  max=144.61ms p(90)=23.12µs  p(95)=25.03µs  p(99.9)=669.88µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.71ms min=17.64ms med=174.26ms max=635.13ms p(90)=216.59ms p(95)=380.17ms p(99.9)=541.69ms
     http_reqs......................: 32088   262.621679/s
     iteration_duration.............: avg=187.67ms min=67.25ms med=174.76ms max=635.43ms p(90)=217.12ms p(95)=381ms    p(99.9)=542.09ms
     iterations.....................: 31988   261.803237/s
     success_rate...................: 100.00% ✓ 31988      ✗ 0    
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

     checks.........................: 100.00% ✓ 86496      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   283 kB/s
     http_req_blocked...............: avg=7.41µs   min=1.22µs  med=3.55µs   max=4.14ms   p(90)=5.03µs   p(95)=5.62µs   p(99.9)=1.83ms  
     http_req_connecting............: avg=3.64µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=207.31ms min=22.21ms med=213.91ms max=451.26ms p(90)=225.68ms p(95)=231.15ms p(99.9)=306.14ms
       { expected_response:true }...: avg=207.31ms min=22.21ms med=213.91ms max=451.26ms p(90)=225.68ms p(95)=231.15ms p(99.9)=306.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28932
     http_req_receiving.............: avg=104.85µs min=32.81µs med=91.05µs  max=194.95ms p(90)=125.46µs p(95)=138.8µs  p(99.9)=554.56µs
     http_req_sending...............: avg=42.8µs   min=6.12µs  med=16.57µs  max=126.38ms p(90)=22.2µs   p(95)=24.14µs  p(99.9)=633.1µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.17ms min=22.09ms med=213.79ms max=423.91ms p(90)=225.55ms p(95)=231.02ms p(99.9)=305.23ms
     http_reqs......................: 28932   235.528159/s
     iteration_duration.............: avg=208.27ms min=67.55ms med=214.2ms  max=468.33ms p(90)=225.96ms p(95)=231.46ms p(99.9)=326.78ms
     iterations.....................: 28832   234.714084/s
     success_rate...................: 100.00% ✓ 28832      ✗ 0    
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

