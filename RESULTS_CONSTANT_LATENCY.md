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
| hive-router | v0.0.49 | 1,580 | 1,611 | 1,573 | 0.8% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,464 | 1,480 | 1,460 | 0.4% |  |
| cosmo | 0.307.0 | 1,163 | 1,182 | 1,156 | 0.7% |  |
| grafbase | 0.53.3 | 1,141 | 1,156 | 1,132 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.25 | 500 | 512 | 495 | 1.1% |  |
| apollo-router | v2.13.1 | 368 | 377 | 364 | 1.2% |  |
| apollo-gateway | 2.13.3 | 235 | 238 | 235 | 0.6% |  |
| hive-gateway | 2.5.25 | 235 | 241 | 233 | 1.1% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 578169      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.5µs   min=932ns   med=2.45µs  max=4.16ms   p(90)=4.27µs  p(95)=5.26µs   p(99.9)=40.44µs
     http_req_connecting............: avg=536ns   min=0s      med=0s      max=4.11ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.88ms min=14.18ms med=30.6ms  max=305.31ms p(90)=36.74ms p(95)=38.7ms   p(99.9)=57.09ms
       { expected_response:true }...: avg=30.88ms min=14.18ms med=30.6ms  max=305.31ms p(90)=36.74ms p(95)=38.7ms   p(99.9)=57.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192823
     http_req_receiving.............: avg=87.63µs min=27.38µs med=54.38µs max=151.16ms p(90)=106.7µs p(95)=156.38µs p(99.9)=3.26ms 
     http_req_sending...............: avg=38.24µs min=5.19µs  med=9.92µs  max=162.72ms p(90)=20.26µs p(95)=59.74µs  p(99.9)=2.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.75ms min=14.09ms med=30.48ms max=304.79ms p(90)=36.61ms p(95)=38.54ms  p(99.9)=55.62ms
     http_reqs......................: 192823  1580.488917/s
     iteration_duration.............: avg=31.12ms min=14.48ms med=30.82ms max=346.45ms p(90)=36.96ms p(95)=38.92ms  p(99.9)=57.68ms
     iterations.....................: 192723  1579.669259/s
     success_rate...................: 100.00% ✓ 192723      ✗ 0     
     vus............................: 19      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 535836      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 215 MB  1.8 MB/s
     http_req_blocked...............: avg=3.4µs    min=942ns   med=2.34µs   max=4.03ms   p(90)=4.19µs  p(95)=5.1µs    p(99.9)=36.6µs 
     http_req_connecting............: avg=577ns    min=0s      med=0s       max=3.99ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.34ms  min=13.49ms med=32.42ms  max=342.36ms p(90)=40.94ms p(95)=44.04ms  p(99.9)=81.39ms
       { expected_response:true }...: avg=33.34ms  min=13.49ms med=32.42ms  max=342.36ms p(90)=40.94ms p(95)=44.04ms  p(99.9)=81.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178712
     http_req_receiving.............: avg=778.09µs min=50.29µs med=111.45µs max=236.33ms p(90)=2.21ms  p(95)=3.36ms   p(99.9)=15.77ms
     http_req_sending...............: avg=39.28µs  min=5.39µs  med=9.67µs   max=235.78ms p(90)=20.87µs p(95)=108.89µs p(99.9)=2.51ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.53ms  min=13.4ms  med=31.64ms  max=285.93ms p(90)=39.92ms p(95)=42.92ms  p(99.9)=80.09ms
     http_reqs......................: 178712  1464.502931/s
     iteration_duration.............: avg=33.58ms  min=13.69ms med=32.64ms  max=378.8ms  p(90)=41.16ms p(95)=44.26ms  p(99.9)=81.82ms
     iterations.....................: 178612  1463.683454/s
     success_rate...................: 100.00% ✓ 178612      ✗ 0     
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

     checks.........................: 100.00% ✓ 425823      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.25µs  min=1.07µs  med=2.54µs  max=6.98ms   p(90)=4.22µs   p(95)=4.99µs  p(99.9)=38.91µs
     http_req_connecting............: avg=262ns   min=0s      med=0s      max=1.89ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=42.02ms min=16.13ms med=41.43ms max=338.07ms p(90)=51.11ms  p(95)=54.25ms p(99.9)=73ms   
       { expected_response:true }...: avg=42.02ms min=16.13ms med=41.43ms max=338.07ms p(90)=51.11ms  p(95)=54.25ms p(99.9)=73ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 142041
     http_req_receiving.............: avg=92.69µs min=28.13µs med=64.91µs max=284.75ms p(90)=111.53µs p(95)=138.5µs p(99.9)=2.1ms  
     http_req_sending...............: avg=34.57µs min=5.29µs  med=11.13µs max=294.12ms p(90)=19.2µs   p(95)=24.29µs p(99.9)=1.4ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=41.89ms min=15.97ms med=41.32ms max=302.4ms  p(90)=50.98ms  p(95)=54.11ms p(99.9)=71.48ms
     http_reqs......................: 142041  1163.84226/s
     iteration_duration.............: avg=42.26ms min=18.89ms med=41.64ms max=359.31ms p(90)=51.32ms  p(95)=54.45ms p(99.9)=73.74ms
     iterations.....................: 141941  1163.022889/s
     success_rate...................: 100.00% ✓ 141941      ✗ 0     
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

     checks.........................: 100.00% ✓ 417378      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.6µs    min=961ns   med=2.28µs  max=4.41ms   p(90)=4.68µs   p(95)=5.78µs   p(99.9)=45.88µs
     http_req_connecting............: avg=701ns    min=0s      med=0s      max=4.38ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.85ms  min=16.6ms  med=42.43ms max=355.99ms p(90)=52.13ms  p(95)=55.31ms  p(99.9)=74.3ms 
       { expected_response:true }...: avg=42.85ms  min=16.6ms  med=42.43ms max=355.99ms p(90)=52.13ms  p(95)=55.31ms  p(99.9)=74.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 139226
     http_req_receiving.............: avg=131.28µs min=28.6µs  med=57.85µs max=246.36ms p(90)=129.71µs p(95)=211.07µs p(99.9)=3.97ms 
     http_req_sending...............: avg=37.56µs  min=5.15µs  med=9.82µs  max=240.7ms  p(90)=23.68µs  p(95)=113.95µs p(99.9)=2.33ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.68ms  min=16.54ms med=42.31ms max=109.78ms p(90)=51.98ms  p(95)=55.15ms  p(99.9)=73.6ms 
     http_reqs......................: 139226  1141.020415/s
     iteration_duration.............: avg=43.11ms  min=16.82ms med=42.67ms max=367.58ms p(90)=52.37ms  p(95)=55.54ms  p(99.9)=74.69ms
     iterations.....................: 139126  1140.20087/s
     success_rate...................: 100.00% ✓ 139126      ✗ 0     
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

     checks.........................: 100.00% ✓ 183456     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 74 MB   601 kB/s
     http_req_blocked...............: avg=4.19µs  min=1.22µs  med=3.09µs  max=2.59ms   p(90)=4.63µs   p(95)=5.23µs   p(99.9)=46.32µs 
     http_req_connecting............: avg=856ns   min=0s      med=0s      max=2.55ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=97.75ms min=18.97ms med=95.09ms max=359.93ms p(90)=118.44ms p(95)=129.73ms p(99.9)=225.38ms
       { expected_response:true }...: avg=97.75ms min=18.97ms med=95.09ms max=359.93ms p(90)=118.44ms p(95)=129.73ms p(99.9)=225.38ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61252
     http_req_receiving.............: avg=87.35µs min=32.93µs med=77.94µs max=48.12ms  p(90)=113.48µs p(95)=126.87µs p(99.9)=950.17µs
     http_req_sending...............: avg=21.16µs min=5.94µs  med=14.19µs max=99.53ms  p(90)=20.8µs   p(95)=23.03µs  p(99.9)=630.6µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.64ms min=18.77ms med=94.98ms max=359.45ms p(90)=118.33ms p(95)=129.58ms p(99.9)=225.22ms
     http_reqs......................: 61252   500.141624/s
     iteration_duration.............: avg=98.12ms min=38.67ms med=95.35ms max=375.7ms  p(90)=118.7ms  p(95)=130.02ms p(99.9)=228.42ms
     iterations.....................: 61152   499.325093/s
     success_rate...................: 100.00% ✓ 61152      ✗ 0    
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

     checks.........................: 100.00% ✓ 135210     ✗ 0    
     data_received..................: 4.0 GB  32 MB/s
     data_sent......................: 54 MB   443 kB/s
     http_req_blocked...............: avg=5.66µs   min=1.23µs  med=3.23µs   max=4.05ms   p(90)=4.69µs   p(95)=5.29µs   p(99.9)=410.69µs
     http_req_connecting............: avg=2.24µs   min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=387.65µs
     http_req_duration..............: avg=132.65ms min=21.48ms med=130.58ms max=382.04ms p(90)=165.86ms p(95)=176.6ms  p(99.9)=224.32ms
       { expected_response:true }...: avg=132.65ms min=21.48ms med=130.58ms max=382.04ms p(90)=165.86ms p(95)=176.6ms  p(99.9)=224.32ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45170
     http_req_receiving.............: avg=92.51µs  min=30.63µs med=83.62µs  max=50ms     p(90)=116.62µs p(95)=128.9µs  p(99.9)=921.48µs
     http_req_sending...............: avg=27.91µs  min=5.81µs  med=15.68µs  max=154.91ms p(90)=21.49µs  p(95)=23.54µs  p(99.9)=626.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=132.53ms min=21.29ms med=130.47ms max=370.45ms p(90)=165.75ms p(95)=176.48ms p(99.9)=223.96ms
     http_reqs......................: 45170   368.763549/s
     iteration_duration.............: avg=133.16ms min=41.6ms  med=130.92ms max=392.17ms p(90)=166.15ms p(95)=176.93ms p(99.9)=230.54ms
     iterations.....................: 45070   367.947159/s
     success_rate...................: 100.00% ✓ 45070      ✗ 0    
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

     checks.........................: 100.00% ✓ 86634      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   283 kB/s
     http_req_blocked...............: avg=7.45µs   min=1.3µs   med=3.58µs   max=4.1ms    p(90)=5.03µs   p(95)=5.66µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=3.65µs   min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=1.78ms  
     http_req_duration..............: avg=206.94ms min=22.51ms med=205.95ms max=439.96ms p(90)=222.15ms p(95)=228.21ms p(99.9)=298.93ms
       { expected_response:true }...: avg=206.94ms min=22.51ms med=205.95ms max=439.96ms p(90)=222.15ms p(95)=228.21ms p(99.9)=298.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28978
     http_req_receiving.............: avg=103.65µs min=35.47µs med=95.02µs  max=77.21ms  p(90)=128.4µs  p(95)=141.57µs p(99.9)=751.38µs
     http_req_sending...............: avg=37.89µs  min=6.2µs   med=17.99µs  max=200.01ms p(90)=23.35µs  p(95)=25.43µs  p(99.9)=667.06µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.8ms  min=22.34ms med=205.83ms max=439.33ms p(90)=222.01ms p(95)=228.06ms p(99.9)=298.78ms
     http_reqs......................: 28978   235.900679/s
     iteration_duration.............: avg=207.9ms  min=54.91ms med=206.26ms max=472.45ms p(90)=222.45ms p(95)=228.57ms p(99.9)=318.97ms
     iterations.....................: 28878   235.086611/s
     success_rate...................: 100.00% ✓ 28878      ✗ 0    
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

     checks.........................: 100.00% ✓ 86184      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   283 kB/s
     http_req_blocked...............: avg=5.02µs   min=1.2µs   med=3.45µs   max=2.06ms   p(90)=4.85µs   p(95)=5.47µs   p(99.9)=561.5µs 
     http_req_connecting............: avg=1.36µs   min=0s      med=0s       max=2.03ms   p(90)=0s       p(95)=0s       p(99.9)=538.51µs
     http_req_duration..............: avg=208.06ms min=18.41ms med=193.85ms max=595.73ms p(90)=253ms    p(95)=401.66ms p(99.9)=546.49ms
       { expected_response:true }...: avg=208.06ms min=18.41ms med=193.85ms max=595.73ms p(90)=253ms    p(95)=401.66ms p(99.9)=546.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28828
     http_req_receiving.............: avg=104.43µs min=34.19µs med=95.44µs  max=108.72ms p(90)=127.99µs p(95)=141.43µs p(99.9)=615.58µs
     http_req_sending...............: avg=28.19µs  min=5.85µs  med=17.54µs  max=63.94ms  p(90)=22.63µs  p(95)=24.52µs  p(99.9)=519.41µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.93ms min=18.25ms med=193.73ms max=595.62ms p(90)=252.89ms p(95)=401.54ms p(99.9)=546.36ms
     http_reqs......................: 28828   235.664277/s
     iteration_duration.............: avg=209ms    min=76.52ms med=194.26ms max=596ms    p(90)=253.38ms p(95)=402.2ms  p(99.9)=546.75ms
     iterations.....................: 28728   234.846793/s
     success_rate...................: 100.00% ✓ 28728      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

