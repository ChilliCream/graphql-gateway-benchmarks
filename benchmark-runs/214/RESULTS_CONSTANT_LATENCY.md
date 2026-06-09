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
| hive-router | v0.0.65 | 1,580 | 1,598 | 1,561 | 0.7% |  |
| hotchocolate | 16.1.3 | 1,452 | 1,472 | 1,442 | 0.6% |  |
| grafbase | 0.53.5 | 1,139 | 1,162 | 1,131 | 0.8% |  |
| cosmo | 0.321.1 | 1,120 | 1,137 | 1,114 | 0.7% |  |
| hive-gateway-router-runtime | 2.8.2 | 524 | 538 | 518 | 1.2% |  |
| apollo-router | v2.15.0 | 387 | 401 | 382 | 1.7% |  |
| hive-gateway | 2.8.2 | 241 | 248 | 240 | 1.2% |  |
| apollo-gateway | 2.14.1 | 234 | 235 | 232 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 578433      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.19µs   min=992ns   med=2.13µs  max=11.53ms  p(90)=3.92µs   p(95)=4.89µs   p(99.9)=31.25µs
     http_req_connecting............: avg=519ns    min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.87ms  min=13.35ms med=30.6ms  max=347.67ms p(90)=36.69ms  p(95)=38.61ms  p(99.9)=56.4ms 
       { expected_response:true }...: avg=30.87ms  min=13.35ms med=30.6ms  max=347.67ms p(90)=36.69ms  p(95)=38.61ms  p(99.9)=56.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 192911
     http_req_receiving.............: avg=101.57µs min=27.07µs med=52.37µs max=208.63ms p(90)=102.55µs p(95)=149.33µs p(99.9)=2.77ms 
     http_req_sending...............: avg=33.63µs  min=5.15µs  med=9.29µs  max=104.22ms p(90)=19.44µs  p(95)=48.92µs  p(99.9)=1.8ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.74ms  min=13.31ms med=30.49ms max=203.74ms p(90)=36.57ms  p(95)=38.47ms  p(99.9)=54.82ms
     http_reqs......................: 192911  1580.680203/s
     iteration_duration.............: avg=31.11ms  min=13.54ms med=30.82ms max=356.82ms p(90)=36.9ms   p(95)=38.83ms  p(99.9)=56.68ms
     iterations.....................: 192811  1579.86082/s
     success_rate...................: 100.00% ✓ 192811      ✗ 0     
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

     checks.........................: 100.00% ✓ 531192      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 213 MB  1.7 MB/s
     http_req_blocked...............: avg=3.14µs   min=992ns   med=2.03µs   max=9.4ms    p(90)=3.81µs  p(95)=4.68µs  p(99.9)=28.33µs
     http_req_connecting............: avg=594ns    min=0s      med=0s       max=4.03ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=33.63ms  min=14.73ms med=32.34ms  max=485.21ms p(90)=41.23ms p(95)=44.77ms p(99.9)=87.9ms 
       { expected_response:true }...: avg=33.63ms  min=14.73ms med=32.34ms  max=485.21ms p(90)=41.23ms p(95)=44.77ms p(99.9)=87.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 177164
     http_req_receiving.............: avg=744.42µs min=50.44µs med=106.86µs max=35.43ms  p(90)=2.18ms  p(95)=3.31ms  p(99.9)=15.46ms
     http_req_sending...............: avg=35.55µs  min=5.01µs  med=8.87µs   max=130.03ms p(90)=19.62µs p(95)=90.74µs p(99.9)=2.18ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=32.85ms  min=14.09ms med=31.62ms  max=485.11ms p(90)=40.15ms p(95)=43.67ms p(99.9)=86.95ms
     http_reqs......................: 177164  1452.142569/s
     iteration_duration.............: avg=33.87ms  min=14.92ms med=32.56ms  max=485.4ms  p(90)=41.45ms p(95)=44.99ms p(99.9)=89.29ms
     iterations.....................: 177064  1451.322909/s
     success_rate...................: 100.00% ✓ 177064      ✗ 0     
     vus............................: 34      min=0         max=50  
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

     checks.........................: 100.00% ✓ 416781      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.39µs   min=1.01µs  med=2.27µs  max=3.28ms   p(90)=4.74µs   p(95)=5.89µs   p(99.9)=38.28µs
     http_req_connecting............: avg=508ns    min=0s      med=0s      max=3.26ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.9ms   min=15.73ms med=42.51ms max=347.27ms p(90)=52.08ms  p(95)=55.1ms   p(99.9)=79.23ms
       { expected_response:true }...: avg=42.9ms   min=15.73ms med=42.51ms max=347.27ms p(90)=52.08ms  p(95)=55.1ms   p(99.9)=79.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139027
     http_req_receiving.............: avg=129.67µs min=29.4µs  med=59.11µs max=291.4ms  p(90)=131.18µs p(95)=213.67µs p(99.9)=3.86ms 
     http_req_sending...............: avg=36.48µs  min=5.08µs  med=9.93µs  max=34.03ms  p(90)=24.2µs   p(95)=113.4µs  p(99.9)=2.26ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.74ms  min=15.57ms med=42.38ms max=100.45ms p(90)=51.92ms  p(95)=54.93ms  p(99.9)=78.34ms
     http_reqs......................: 139027  1139.43287/s
     iteration_duration.............: avg=43.18ms  min=16.06ms med=42.75ms max=366.93ms p(90)=52.31ms  p(95)=55.32ms  p(99.9)=79.98ms
     iterations.....................: 138927  1138.613294/s
     success_rate...................: 100.00% ✓ 138927      ✗ 0     
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

     checks.........................: 100.00% ✓ 410139      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 164 MB  1.3 MB/s
     http_req_blocked...............: avg=3.41µs  min=1.05µs  med=2.24µs  max=4.88ms   p(90)=3.83µs   p(95)=4.59µs   p(99.9)=37.24µs
     http_req_connecting............: avg=777ns   min=0s      med=0s      max=4.8ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.64ms min=18.19ms med=43.03ms max=359.62ms p(90)=52.97ms  p(95)=56.18ms  p(99.9)=75.96ms
       { expected_response:true }...: avg=43.64ms min=18.19ms med=43.03ms max=359.62ms p(90)=52.97ms  p(95)=56.18ms  p(99.9)=75.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136813
     http_req_receiving.............: avg=83.2µs  min=28.34µs med=61.3µs  max=81.13ms  p(90)=105.54µs p(95)=130.32µs p(99.9)=1.77ms 
     http_req_sending...............: avg=26.43µs min=5.14µs  med=10.4µs  max=110.48ms p(90)=18.08µs  p(95)=22.48µs  p(99.9)=1.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.53ms min=18.08ms med=42.93ms max=337.87ms p(90)=52.86ms  p(95)=56.06ms  p(99.9)=75.34ms
     http_reqs......................: 136813  1120.884789/s
     iteration_duration.............: avg=43.88ms min=18.75ms med=43.23ms max=372.28ms p(90)=53.16ms  p(95)=56.38ms  p(99.9)=76.74ms
     iterations.....................: 136713  1120.065507/s
     success_rate...................: 100.00% ✓ 136713      ✗ 0     
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

     checks.........................: 100.00% ✓ 192228     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   630 kB/s
     http_req_blocked...............: avg=4.67µs  min=1.11µs  med=2.86µs  max=3.95ms   p(90)=4.42µs   p(95)=5.02µs   p(99.9)=43.67µs 
     http_req_connecting............: avg=1.53µs  min=0s      med=0s      max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.29ms min=21.9ms  med=91.46ms max=365.26ms p(90)=110.1ms  p(95)=118.86ms p(99.9)=226.2ms 
       { expected_response:true }...: avg=93.29ms min=21.9ms  med=91.46ms max=365.26ms p(90)=110.1ms  p(95)=118.86ms p(99.9)=226.2ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 64176
     http_req_receiving.............: avg=85.04µs min=30.17µs med=76.68µs max=16.06ms  p(90)=113.22µs p(95)=127µs    p(99.9)=945.87µs
     http_req_sending...............: avg=25.46µs min=5.28µs  med=13.21µs max=133.18ms p(90)=20.05µs  p(95)=22.43µs  p(99.9)=732.93µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.18ms min=21.73ms med=91.36ms max=364.78ms p(90)=109.98ms p(95)=118.76ms p(99.9)=226.1ms 
     http_reqs......................: 64176   524.149722/s
     iteration_duration.............: avg=93.65ms min=42.82ms med=91.71ms max=376.72ms p(90)=110.34ms p(95)=119.14ms p(99.9)=229.79ms
     iterations.....................: 64076   523.332984/s
     success_rate...................: 100.00% ✓ 64076      ✗ 0    
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

     checks.........................: 100.00% ✓ 142182     ✗ 0    
     data_received..................: 4.2 GB  34 MB/s
     data_sent......................: 57 MB   466 kB/s
     http_req_blocked...............: avg=4.54µs   min=1.25µs  med=3.39µs   max=1.94ms   p(90)=4.99µs   p(95)=5.62µs   p(99.9)=121.19µs
     http_req_connecting............: avg=922ns    min=0s      med=0s       max=1.91ms   p(90)=0s       p(95)=0s       p(99.9)=76.34µs 
     http_req_duration..............: avg=126.14ms min=19.03ms med=124.24ms max=387.15ms p(90)=157.96ms p(95)=168.6ms  p(99.9)=212.58ms
       { expected_response:true }...: avg=126.14ms min=19.03ms med=124.24ms max=387.15ms p(90)=157.96ms p(95)=168.6ms  p(99.9)=212.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47494
     http_req_receiving.............: avg=92.54µs  min=31.85µs med=85.37µs  max=67.76ms  p(90)=119.76µs p(95)=133.55µs p(99.9)=800.94µs
     http_req_sending...............: avg=31.78µs  min=5.85µs  med=16.02µs  max=151.35ms p(90)=21.79µs  p(95)=23.96µs  p(99.9)=653.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=126.02ms min=18.92ms med=124.12ms max=373.27ms p(90)=157.84ms p(95)=168.47ms p(99.9)=212.23ms
     http_reqs......................: 47494   387.754404/s
     iteration_duration.............: avg=126.64ms min=35.34ms med=124.52ms max=393.04ms p(90)=158.26ms p(95)=168.91ms p(99.9)=218.3ms 
     iterations.....................: 47394   386.937976/s
     success_rate...................: 100.00% ✓ 47394      ✗ 0    
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

     checks.........................: 100.00% ✓ 88302      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   290 kB/s
     http_req_blocked...............: avg=7.54µs   min=1.23µs  med=3.51µs   max=4.22ms   p(90)=5.04µs   p(95)=5.71µs   p(99.9)=1.94ms  
     http_req_connecting............: avg=3.75µs   min=0s      med=0s       max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=1.91ms  
     http_req_duration..............: avg=203.1ms  min=19.08ms med=192.83ms max=691.9ms  p(90)=256.69ms p(95)=293.14ms p(99.9)=629.43ms
       { expected_response:true }...: avg=203.1ms  min=19.08ms med=192.83ms max=691.9ms  p(90)=256.69ms p(95)=293.14ms p(99.9)=629.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29534
     http_req_receiving.............: avg=102.43µs min=31.58µs med=98.07µs  max=22.01ms  p(90)=130.76µs p(95)=144.58µs p(99.9)=683.19µs
     http_req_sending...............: avg=35.24µs  min=6.13µs  med=17.76µs  max=78.85ms  p(90)=22.87µs  p(95)=24.74µs  p(99.9)=575.71µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.96ms min=18.92ms med=192.67ms max=691.8ms  p(90)=256.59ms p(95)=292.99ms p(99.9)=629.31ms
     http_reqs......................: 29534   241.453158/s
     iteration_duration.............: avg=204.03ms min=41.34ms med=193.34ms max=692.21ms p(90)=257.07ms p(95)=294.41ms p(99.9)=629.71ms
     iterations.....................: 29434   240.635615/s
     success_rate...................: 100.00% ✓ 29434      ✗ 0    
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

     checks.........................: 100.00% ✓ 86268      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   282 kB/s
     http_req_blocked...............: avg=5.48µs   min=1.21µs  med=3.49µs   max=2.85ms   p(90)=4.93µs   p(95)=5.53µs   p(99.9)=553.6µs 
     http_req_connecting............: avg=1.77µs   min=0s      med=0s       max=2.82ms   p(90)=0s       p(95)=0s       p(99.9)=527.2µs 
     http_req_duration..............: avg=207.83ms min=21.73ms med=207.23ms max=367.52ms p(90)=222.57ms p(95)=228.07ms p(99.9)=305.32ms
       { expected_response:true }...: avg=207.83ms min=21.73ms med=207.23ms max=367.52ms p(90)=222.57ms p(95)=228.07ms p(99.9)=305.32ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28856
     http_req_receiving.............: avg=103.71µs min=33.24µs med=94.41µs  max=121.37ms p(90)=128.25µs p(95)=141.63µs p(99.9)=622.54µs
     http_req_sending...............: avg=26.22µs  min=6.11µs  med=17.52µs  max=53.52ms  p(90)=22.9µs   p(95)=24.87µs  p(99.9)=623.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.7ms  min=21.57ms med=207.1ms  max=366.8ms  p(90)=222.45ms p(95)=227.95ms p(99.9)=305.25ms
     http_reqs......................: 28856   234.831876/s
     iteration_duration.............: avg=208.78ms min=53.23ms med=207.57ms max=410.9ms  p(90)=222.86ms p(95)=228.4ms  p(99.9)=309.02ms
     iterations.....................: 28756   234.01807/s
     success_rate...................: 100.00% ✓ 28756      ✗ 0    
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

