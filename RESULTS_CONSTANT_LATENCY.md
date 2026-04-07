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
| hive-router | v0.0.43 | 1,586 | 1,616 | 1,574 | 0.9% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,434 | 1,453 | 1,425 | 0.7% |  |
| cosmo | 0.298.0 | 1,153 | 1,157 | 1,147 | 0.4% | non-compatible response (3 across 3/9 runs) |
| grafbase | 0.53.2 | 1,135 | 1,148 | 1,126 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.14 | 570 | 586 | 564 | 1.3% |  |
| apollo-router | v2.12.1 | 377 | 389 | 371 | 1.6% |  |
| hive-gateway | 2.5.14 | 262 | 265 | 257 | 1.2% |  |
| apollo-gateway | 2.13.3 | 234 | 236 | 234 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 580596      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=2.91µs   min=990ns   med=2.1µs   max=4.58ms   p(90)=3.87µs   p(95)=4.79µs   p(99.9)=31.24µs
     http_req_connecting............: avg=279ns    min=0s      med=0s      max=2.61ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.76ms  min=13.91ms med=30.52ms max=331.69ms p(90)=36.52ms  p(95)=38.38ms  p(99.9)=55.08ms
       { expected_response:true }...: avg=30.76ms  min=13.91ms med=30.52ms max=331.69ms p(90)=36.52ms  p(95)=38.38ms  p(99.9)=55.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193632
     http_req_receiving.............: avg=108.37µs min=27.72µs med=51.81µs max=257.09ms p(90)=103.07µs p(95)=150.16µs p(99.9)=2.52ms 
     http_req_sending...............: avg=31.62µs  min=4.99µs  med=9.29µs  max=61.14ms  p(90)=20.05µs  p(95)=42.51µs  p(99.9)=1.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.62ms  min=13.85ms med=30.42ms max=124.24ms p(90)=36.41ms  p(95)=38.25ms  p(99.9)=53.4ms 
     http_reqs......................: 193632  1586.540259/s
     iteration_duration.............: avg=30.99ms  min=14.17ms med=30.74ms max=349.16ms p(90)=36.73ms  p(95)=38.59ms  p(99.9)=55.91ms
     iterations.....................: 193532  1585.7209/s
     success_rate...................: 100.00% ✓ 193532      ✗ 0     
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

     checks.........................: 100.00% ✓ 524877      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 210 MB  1.7 MB/s
     http_req_blocked...............: avg=3.37µs   min=932ns   med=2.27µs   max=5.32ms   p(90)=4.03µs  p(95)=4.91µs   p(99.9)=33.05µs 
     http_req_connecting............: avg=624ns    min=0s      med=0s       max=3.91ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=34.05ms  min=14.09ms med=32.78ms  max=469.87ms p(90)=41.64ms p(95)=45.36ms  p(99.9)=102.76ms
       { expected_response:true }...: avg=34.05ms  min=14.09ms med=32.78ms  max=469.87ms p(90)=41.64ms p(95)=45.36ms  p(99.9)=102.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175059
     http_req_receiving.............: avg=776.75µs min=49.54µs med=115.38µs max=288.03ms p(90)=2.2ms   p(95)=3.32ms   p(99.9)=18.33ms 
     http_req_sending...............: avg=38.4µs   min=5.24µs  med=9.45µs   max=290.04ms p(90)=20.38µs p(95)=103.89µs p(99.9)=2.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=33.24ms  min=13.81ms med=31.98ms  max=469.79ms p(90)=40.57ms p(95)=44.09ms  p(99.9)=101.56ms
     http_reqs......................: 175059  1434.249529/s
     iteration_duration.............: avg=34.29ms  min=14.3ms  med=33ms     max=470.06ms p(90)=41.86ms p(95)=45.58ms  p(99.9)=104.02ms
     iterations.....................: 174959  1433.430234/s
     success_rate...................: 100.00% ✓ 174959      ✗ 0     
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

     checks.........................: 100.00% ✓ 422157      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.8µs   min=1.09µs  med=2.63µs  max=4.25ms   p(90)=4.36µs   p(95)=5.15µs  p(99.9)=37.06µs
     http_req_connecting............: avg=788ns   min=0s      med=0s      max=4.21ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=42.39ms min=15.8ms  med=41.79ms max=344.27ms p(90)=51.55ms  p(95)=54.61ms p(99.9)=70.93ms
       { expected_response:true }...: avg=42.39ms min=15.8ms  med=41.79ms max=344.27ms p(90)=51.55ms  p(95)=54.61ms p(99.9)=70.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140819
     http_req_receiving.............: avg=88.84µs min=27.78µs med=64.78µs max=180.78ms p(90)=111.71µs p(95)=138.5µs p(99.9)=1.72ms 
     http_req_sending...............: avg=27.85µs min=5.32µs  med=11.21µs max=85.25ms  p(90)=19.67µs  p(95)=24.81µs p(99.9)=1.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=42.27ms min=15.59ms med=41.69ms max=343.57ms p(90)=51.43ms  p(95)=54.48ms p(99.9)=70.33ms
     http_reqs......................: 140819  1153.855048/s
     iteration_duration.............: avg=42.63ms min=20.26ms med=42.01ms max=372.76ms p(90)=51.75ms  p(95)=54.82ms p(99.9)=71.5ms 
     iterations.....................: 140719  1153.035659/s
     success_rate...................: 100.00% ✓ 140719      ✗ 0     
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

     checks.........................: 100.00% ✓ 415311      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.81µs  min=990ns   med=2.31µs  max=5.64ms   p(90)=4.73µs  p(95)=5.9µs    p(99.9)=45.28µs
     http_req_connecting............: avg=784ns   min=0s      med=0s      max=4.65ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.05ms min=16.94ms med=42.64ms max=331.18ms p(90)=52.23ms p(95)=55.27ms  p(99.9)=76.86ms
       { expected_response:true }...: avg=43.05ms min=16.94ms med=42.64ms max=331.18ms p(90)=52.23ms p(95)=55.27ms  p(99.9)=76.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138537
     http_req_receiving.............: avg=96.74µs min=29.41µs med=60.05µs max=39.06ms  p(90)=133µs   p(95)=216.16µs p(99.9)=3.23ms 
     http_req_sending...............: avg=38.12µs min=5.1µs   med=10.05µs max=113.33ms p(90)=23.97µs p(95)=112.01µs p(99.9)=2.03ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.92ms min=16.85ms med=42.51ms max=330.72ms p(90)=52.08ms p(95)=55.11ms  p(99.9)=76.53ms
     http_reqs......................: 138537  1135.319996/s
     iteration_duration.............: avg=43.33ms min=17.17ms med=42.88ms max=372.07ms p(90)=52.47ms p(95)=55.51ms  p(99.9)=77.43ms
     iterations.....................: 138437  1134.500489/s
     success_rate...................: 100.00% ✓ 138437      ✗ 0     
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

     checks.........................: 100.00% ✓ 209328     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   686 kB/s
     http_req_blocked...............: avg=4.04µs  min=1.14µs  med=3.04µs  max=3.54ms   p(90)=4.63µs   p(95)=5.28µs   p(99.9)=45.11µs 
     http_req_connecting............: avg=685ns   min=0s      med=0s      max=2.56ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.66ms min=19.13ms med=82.92ms max=341.82ms p(90)=104.24ms p(95)=112.78ms p(99.9)=212.73ms
       { expected_response:true }...: avg=85.66ms min=19.13ms med=82.92ms max=341.82ms p(90)=104.24ms p(95)=112.78ms p(99.9)=212.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69876
     http_req_receiving.............: avg=87.18µs min=31.78µs med=77.41µs max=101.21ms p(90)=113.73µs p(95)=127.97µs p(99.9)=889.34µs
     http_req_sending...............: avg=21.18µs min=5.54µs  med=13.2µs  max=91.34ms  p(90)=19.88µs  p(95)=22.26µs  p(99.9)=645.34µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.55ms min=19.01ms med=82.82ms max=341.59ms p(90)=104.15ms p(95)=112.7ms  p(99.9)=212.36ms
     http_reqs......................: 69876   570.915932/s
     iteration_duration.............: avg=86ms    min=30.23ms med=83.15ms max=358.98ms p(90)=104.48ms p(95)=113.07ms p(99.9)=214.8ms 
     iterations.....................: 69776   570.09889/s
     success_rate...................: 100.00% ✓ 69776      ✗ 0    
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

     checks.........................: 100.00% ✓ 138270     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 56 MB   453 kB/s
     http_req_blocked...............: avg=4.8µs    min=1.23µs  med=3.51µs   max=2.5ms    p(90)=5.06µs   p(95)=5.7µs    p(99.9)=170.72µs
     http_req_connecting............: avg=1.07µs   min=0s      med=0s       max=2.48ms   p(90)=0s       p(95)=0s       p(99.9)=96.8µs  
     http_req_duration..............: avg=129.71ms min=20.48ms med=127.7ms  max=375.04ms p(90)=162.21ms p(95)=172.81ms p(99.9)=218.49ms
       { expected_response:true }...: avg=129.71ms min=20.48ms med=127.7ms  max=375.04ms p(90)=162.21ms p(95)=172.81ms p(99.9)=218.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46190
     http_req_receiving.............: avg=92.04µs  min=32.24µs med=86.53µs  max=21.42ms  p(90)=119.84µs p(95)=133.21µs p(99.9)=638.74µs
     http_req_sending...............: avg=22.15µs  min=6.08µs  med=16.62µs  max=28.82ms  p(90)=22.4µs   p(95)=24.35µs  p(99.9)=686.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=129.6ms  min=20.32ms med=127.59ms max=374.77ms p(90)=162.08ms p(95)=172.7ms  p(99.9)=218.41ms
     http_reqs......................: 46190   377.038727/s
     iteration_duration.............: avg=130.21ms min=39.45ms med=128.01ms max=381.72ms p(90)=162.49ms p(95)=173.11ms p(99.9)=220.37ms
     iterations.....................: 46090   376.222449/s
     success_rate...................: 100.00% ✓ 46090      ✗ 0    
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

     checks.........................: 100.00% ✓ 95943      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   315 kB/s
     http_req_blocked...............: avg=7.13µs   min=1.35µs  med=3.74µs   max=4.78ms   p(90)=5.37µs   p(95)=6.04µs   p(99.9)=1.28ms  
     http_req_connecting............: avg=3.15µs   min=0s      med=0s       max=4.75ms   p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=186.89ms min=18.66ms med=174.06ms max=571.16ms p(90)=222.22ms p(95)=377.35ms p(99.9)=527.17ms
       { expected_response:true }...: avg=186.89ms min=18.66ms med=174.06ms max=571.16ms p(90)=222.22ms p(95)=377.35ms p(99.9)=527.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32081
     http_req_receiving.............: avg=105µs    min=35.69µs med=97.32µs  max=68.29ms  p(90)=131.22µs p(95)=145.76µs p(99.9)=674.19µs
     http_req_sending...............: avg=26.26µs  min=6µs     med=18.68µs  max=53.09ms  p(90)=24.1µs   p(95)=26.04µs  p(99.9)=865.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.76ms min=18.5ms  med=173.92ms max=571ms    p(90)=222.07ms p(95)=377.23ms p(99.9)=527.07ms
     http_reqs......................: 32081   262.580197/s
     iteration_duration.............: avg=187.72ms min=44.81ms med=174.48ms max=571.47ms p(90)=222.67ms p(95)=378.59ms p(99.9)=527.43ms
     iterations.....................: 31981   261.761706/s
     success_rate...................: 100.00% ✓ 31981      ✗ 0    
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

     checks.........................: 100.00% ✓ 86094      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   281 kB/s
     http_req_blocked...............: avg=7.74µs   min=1.27µs  med=3.62µs   max=4.83ms   p(90)=4.99µs   p(95)=5.58µs   p(99.9)=1.88ms  
     http_req_connecting............: avg=3.87µs   min=0s      med=0s       max=4.79ms   p(90)=0s       p(95)=0s       p(99.9)=1.86ms  
     http_req_duration..............: avg=208.28ms min=21.86ms med=207.95ms max=458.02ms p(90)=222.47ms p(95)=228.11ms p(99.9)=299.82ms
       { expected_response:true }...: avg=208.28ms min=21.86ms med=207.95ms max=458.02ms p(90)=222.47ms p(95)=228.11ms p(99.9)=299.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28798
     http_req_receiving.............: avg=234.21µs min=34.64µs med=93.35µs  max=195.83ms p(90)=126.68µs p(95)=140.54µs p(99.9)=29ms    
     http_req_sending...............: avg=33.06µs  min=6.28µs  med=17.4µs   max=244.74ms p(90)=22.84µs  p(95)=24.76µs  p(99.9)=506.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.02ms min=21.58ms med=207.82ms max=317.79ms p(90)=222.34ms p(95)=227.94ms p(99.9)=293.52ms
     http_reqs......................: 28798   234.334504/s
     iteration_duration.............: avg=209.25ms min=39.98ms med=208.27ms max=468.5ms  p(90)=222.77ms p(95)=228.44ms p(99.9)=329.13ms
     iterations.....................: 28698   233.520786/s
     success_rate...................: 100.00% ✓ 28698      ✗ 0    
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

