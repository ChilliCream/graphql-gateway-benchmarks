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
| hive-router | v0.0.65 | 1,576 | 1,601 | 1,561 | 0.8% |  |
| hotchocolate | 16.1.3 | 1,444 | 1,464 | 1,436 | 0.6% |  |
| grafbase | 0.53.5 | 1,127 | 1,142 | 1,119 | 0.7% |  |
| cosmo | 0.321.1 | 1,123 | 1,141 | 1,118 | 0.7% |  |
| hive-gateway-router-runtime | 2.8.2 | 530 | 543 | 526 | 1.1% |  |
| apollo-router | v2.15.0 | 406 | 415 | 401 | 1.1% |  |
| hive-gateway | 2.8.2 | 241 | 246 | 240 | 1.0% |  |
| apollo-gateway | 2.14.1 | 231 | 234 | 230 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 576510      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.15µs  min=972ns   med=2.08µs  max=3.93ms   p(90)=3.94µs   p(95)=4.92µs   p(99.9)=32.35µs
     http_req_connecting............: avg=539ns   min=0s      med=0s      max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.97ms min=14.51ms med=30.7ms  max=309.46ms p(90)=36.81ms  p(95)=38.7ms   p(99.9)=56.67ms
       { expected_response:true }...: avg=30.97ms min=14.51ms med=30.7ms  max=309.46ms p(90)=36.81ms  p(95)=38.7ms   p(99.9)=56.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192270
     http_req_receiving.............: avg=85.43µs min=28µs    med=52.97µs max=223.91ms p(90)=104.47µs p(95)=151.06µs p(99.9)=2.11ms 
     http_req_sending...............: avg=31.96µs min=4.99µs  med=9.18µs  max=154.17ms p(90)=19.34µs  p(95)=36.44µs  p(99.9)=1.66ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.85ms min=14.11ms med=30.6ms  max=303.91ms p(90)=36.69ms  p(95)=38.57ms  p(99.9)=55.13ms
     http_reqs......................: 192270  1576.301029/s
     iteration_duration.............: avg=31.21ms min=14.74ms med=30.92ms max=358.29ms p(90)=37.02ms  p(95)=38.91ms  p(99.9)=57ms   
     iterations.....................: 192170  1575.481192/s
     success_rate...................: 100.00% ✓ 192170      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 528369      ✗ 0     
     data_received..................: 15 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.31µs  min=990ns   med=2.06µs  max=28.21ms  p(90)=3.88µs  p(95)=4.79µs   p(99.9)=29.96µs
     http_req_connecting............: avg=772ns   min=0s      med=0s      max=28.16ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.81ms min=14.58ms med=32.65ms max=470.46ms p(90)=41.6ms  p(95)=45.16ms  p(99.9)=81.15ms
       { expected_response:true }...: avg=33.81ms min=14.58ms med=32.65ms max=470.46ms p(90)=41.6ms  p(95)=45.16ms  p(99.9)=81.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176223
     http_req_receiving.............: avg=753.3µs min=50.82µs med=113.7µs max=117.46ms p(90)=2.18ms  p(95)=3.29ms   p(99.9)=15.67ms
     http_req_sending...............: avg=35.85µs min=4.95µs  med=9.03µs  max=70.02ms  p(90)=20µs    p(95)=106.69µs p(99.9)=2.17ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.02ms min=14.44ms med=31.87ms max=470.39ms p(90)=40.52ms p(95)=44.09ms  p(99.9)=80.34ms
     http_reqs......................: 176223  1444.038516/s
     iteration_duration.............: avg=34.06ms min=14.79ms med=32.87ms max=470.62ms p(90)=41.82ms p(95)=45.38ms  p(99.9)=81.9ms 
     iterations.....................: 176123  1443.219078/s
     success_rate...................: 100.00% ✓ 176123      ✗ 0     
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

     checks.........................: 100.00% ✓ 412254      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.37µs  min=971ns   med=2.2µs   max=3.72ms   p(90)=4.52µs   p(95)=5.68µs   p(99.9)=43.98µs
     http_req_connecting............: avg=587ns   min=0s      med=0s      max=3.69ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.38ms min=15.4ms  med=42.9ms  max=336.65ms p(90)=52.81ms  p(95)=56.09ms  p(99.9)=78.21ms
       { expected_response:true }...: avg=43.38ms min=15.4ms  med=42.9ms  max=336.65ms p(90)=52.81ms  p(95)=56.09ms  p(99.9)=78.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137518
     http_req_receiving.............: avg=92.98µs min=28.73µs med=58.39µs max=80.97ms  p(90)=129.24µs p(95)=211.13µs p(99.9)=2.77ms 
     http_req_sending...............: avg=39.12µs min=5.17µs  med=9.77µs  max=238.82ms p(90)=23.23µs  p(95)=111.38µs p(99.9)=2.43ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.25ms min=15.23ms med=42.78ms max=332.26ms p(90)=52.66ms  p(95)=55.93ms  p(99.9)=77.73ms
     http_reqs......................: 137518  1127.025976/s
     iteration_duration.............: avg=43.65ms min=17.97ms med=43.15ms max=352.92ms p(90)=53.04ms  p(95)=56.32ms  p(99.9)=78.6ms 
     iterations.....................: 137418  1126.206428/s
     success_rate...................: 100.00% ✓ 137418      ✗ 0     
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

     checks.........................: 100.00% ✓ 411054      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 165 MB  1.3 MB/s
     http_req_blocked...............: avg=3.17µs  min=1.06µs  med=2.19µs  max=3.46ms   p(90)=3.86µs   p(95)=4.64µs   p(99.9)=33.92µs
     http_req_connecting............: avg=591ns   min=0s      med=0s      max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.54ms min=15.78ms med=42.95ms max=362.42ms p(90)=52.83ms  p(95)=55.96ms  p(99.9)=72.73ms
       { expected_response:true }...: avg=43.54ms min=15.78ms med=42.95ms max=362.42ms p(90)=52.83ms  p(95)=55.96ms  p(99.9)=72.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137118
     http_req_receiving.............: avg=84.9µs  min=28.37µs med=61.69µs max=145.67ms p(90)=106.66µs p(95)=130.19µs p(99.9)=1.89ms 
     http_req_sending...............: avg=26.7µs  min=5.28µs  med=10.2µs  max=183.89ms p(90)=18.09µs  p(95)=22.43µs  p(99.9)=1.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.43ms min=15.6ms  med=42.85ms max=361.52ms p(90)=52.72ms  p(95)=55.84ms  p(99.9)=72.31ms
     http_reqs......................: 137118  1123.584349/s
     iteration_duration.............: avg=43.78ms min=20.62ms med=43.16ms max=378.15ms p(90)=53.03ms  p(95)=56.17ms  p(99.9)=73.05ms
     iterations.....................: 137018  1122.76492/s
     success_rate...................: 100.00% ✓ 137018      ✗ 0     
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

     checks.........................: 100.00% ✓ 194352     ✗ 0    
     data_received..................: 5.7 GB  46 MB/s
     data_sent......................: 78 MB   637 kB/s
     http_req_blocked...............: avg=4.28µs  min=1.08µs  med=2.82µs  max=3.88ms   p(90)=4.49µs   p(95)=5.13µs   p(99.9)=43.83µs 
     http_req_connecting............: avg=1.18µs  min=0s      med=0s      max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.28ms min=19.9ms  med=92.05ms max=374.26ms p(90)=119.06ms p(95)=129.21ms p(99.9)=232.48ms
       { expected_response:true }...: avg=92.28ms min=19.9ms  med=92.05ms max=374.26ms p(90)=119.06ms p(95)=129.21ms p(99.9)=232.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64884
     http_req_receiving.............: avg=92.36µs min=30.89µs med=76.62µs max=154.35ms p(90)=113.66µs p(95)=127.62µs p(99.9)=944.19µs
     http_req_sending...............: avg=22.18µs min=5.56µs  med=13.23µs max=109.27ms p(90)=20.21µs  p(95)=22.63µs  p(99.9)=696.71µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.16ms min=19.8ms  med=91.94ms max=373.87ms p(90)=118.95ms p(95)=129.09ms p(99.9)=232.14ms
     http_reqs......................: 64884   530.098112/s
     iteration_duration.............: avg=92.63ms min=34.63ms med=92.32ms max=381.79ms p(90)=119.32ms p(95)=129.47ms p(99.9)=233.55ms
     iterations.....................: 64784   529.281118/s
     success_rate...................: 100.00% ✓ 64784      ✗ 0    
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

     checks.........................: 100.00% ✓ 148989     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   488 kB/s
     http_req_blocked...............: avg=5.79µs   min=1.25µs  med=3.44µs   max=4.58ms   p(90)=5.07µs   p(95)=5.7µs    p(99.9)=126.71µs
     http_req_connecting............: avg=2.08µs   min=0s      med=0s       max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=65.3µs  
     http_req_duration..............: avg=120.37ms min=20.78ms med=118.66ms max=365.41ms p(90)=149.45ms p(95)=159.28ms p(99.9)=203.96ms
       { expected_response:true }...: avg=120.37ms min=20.78ms med=118.66ms max=365.41ms p(90)=149.45ms p(95)=159.28ms p(99.9)=203.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49763
     http_req_receiving.............: avg=90.23µs  min=31.48µs med=85.19µs  max=18.63ms  p(90)=118.19µs p(95)=130.62µs p(99.9)=780.88µs
     http_req_sending...............: avg=29.63µs  min=5.56µs  med=16.09µs  max=136.72ms p(90)=21.88µs  p(95)=24.02µs  p(99.9)=635.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.25ms min=20.65ms med=118.54ms max=364.88ms p(90)=149.33ms p(95)=159.17ms p(99.9)=202.55ms
     http_reqs......................: 49763   406.360992/s
     iteration_duration.............: avg=120.84ms min=49.89ms med=118.95ms max=384.34ms p(90)=149.73ms p(95)=159.58ms p(99.9)=207.13ms
     iterations.....................: 49663   405.544399/s
     success_rate...................: 100.00% ✓ 49663      ✗ 0    
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

     checks.........................: 100.00% ✓ 88218      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=7.62µs   min=1.29µs  med=3.66µs   max=4.23ms   p(90)=5.29µs   p(95)=5.97µs   p(99.9)=1.9ms   
     http_req_connecting............: avg=3.65µs   min=0s      med=0s       max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=1.87ms  
     http_req_duration..............: avg=203.23ms min=19.1ms  med=189.72ms max=639.82ms p(90)=231.9ms  p(95)=267.09ms p(99.9)=598.65ms
       { expected_response:true }...: avg=203.23ms min=19.1ms  med=189.72ms max=639.82ms p(90)=231.9ms  p(95)=267.09ms p(99.9)=598.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29506
     http_req_receiving.............: avg=110.94µs min=35.2µs  med=98.87µs  max=61ms     p(90)=131.74µs p(95)=145.43µs p(99.9)=800.81µs
     http_req_sending...............: avg=29.85µs  min=6.45µs  med=18.08µs  max=75.89ms  p(90)=23.36µs  p(95)=25.31µs  p(99.9)=618.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.09ms min=18.9ms  med=189.59ms max=639.65ms p(90)=231.78ms p(95)=266.6ms  p(99.9)=598.56ms
     http_reqs......................: 29506   241.315835/s
     iteration_duration.............: avg=204.15ms min=68.97ms med=190.13ms max=640.08ms p(90)=232.26ms p(95)=269.43ms p(99.9)=598.91ms
     iterations.....................: 29406   240.497981/s
     success_rate...................: 100.00% ✓ 29406      ✗ 0    
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

     checks.........................: 100.00% ✓ 85152      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   278 kB/s
     http_req_blocked...............: avg=7.59µs   min=1.26µs  med=3.56µs   max=4.33ms   p(90)=5.06µs   p(95)=5.68µs   p(99.9)=1.81ms  
     http_req_connecting............: avg=3.76µs   min=0s      med=0s       max=4.28ms   p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=210.54ms min=24.04ms med=211.38ms max=431.74ms p(90)=257.07ms p(95)=263.14ms p(99.9)=342.83ms
       { expected_response:true }...: avg=210.54ms min=24.04ms med=211.38ms max=431.74ms p(90)=257.07ms p(95)=263.14ms p(99.9)=342.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28484
     http_req_receiving.............: avg=106.22µs min=32.18µs med=92.41µs  max=91.25ms  p(90)=126.88µs p(95)=140.53µs p(99.9)=862.17µs
     http_req_sending...............: avg=36.89µs  min=5.93µs  med=17.24µs  max=167.71ms p(90)=22.7µs   p(95)=24.7µs   p(99.9)=742.96µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.4ms  min=23.86ms med=211.04ms max=431.49ms p(90)=256.96ms p(95)=263.04ms p(99.9)=342.76ms
     http_reqs......................: 28484   231.879693/s
     iteration_duration.............: avg=211.5ms  min=75.16ms med=216.54ms max=461.5ms  p(90)=257.39ms p(95)=263.45ms p(99.9)=348.93ms
     iterations.....................: 28384   231.065623/s
     success_rate...................: 100.00% ✓ 28384      ✗ 0    
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

