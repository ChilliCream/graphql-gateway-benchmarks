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
| hive-router | v0.0.43 | 1,596 | 1,623 | 1,589 | 0.7% |  |
| hotchocolate | 16.0.0-rc.1.27 | 1,449 | 1,462 | 1,441 | 0.4% |  |
| cosmo | 0.298.0 | 1,153 | 1,167 | 1,143 | 0.8% | non-compatible response (3 across 2/9 runs) |
| grafbase | 0.53.2 | 1,134 | 1,155 | 1,128 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.14 | 588 | 602 | 583 | 1.1% |  |
| apollo-router | v2.12.1 | 361 | 373 | 356 | 1.6% |  |
| hive-gateway | 2.5.14 | 256 | 261 | 253 | 1.1% |  |
| apollo-gateway | 2.13.3 | 237 | 240 | 235 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 583863      ✗ 0     
     data_received..................: 17 GB   140 MB/s
     data_sent......................: 234 MB  1.9 MB/s
     http_req_blocked...............: avg=3.21µs  min=992ns   med=2.08µs  max=10.08ms  p(90)=4µs      p(95)=4.96µs  p(99.9)=32.6µs 
     http_req_connecting............: avg=568ns   min=0s      med=0s      max=3.9ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=30.57ms min=13.73ms med=30.35ms max=347.54ms p(90)=36.23ms  p(95)=38.12ms p(99.9)=55.5ms 
       { expected_response:true }...: avg=30.57ms min=13.73ms med=30.35ms max=347.54ms p(90)=36.23ms  p(95)=38.12ms p(99.9)=55.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 194721
     http_req_receiving.............: avg=82.97µs min=27.02µs med=51.5µs  max=48.85ms  p(90)=105.06µs p(95)=155.1µs p(99.9)=2.7ms  
     http_req_sending...............: avg=35.39µs min=5.13µs  med=9.35µs  max=237.53ms p(90)=20.66µs  p(95)=71.92µs p(99.9)=1.82ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.46ms min=13.61ms med=30.25ms max=347.33ms p(90)=36.11ms  p(95)=37.98ms p(99.9)=54.06ms
     http_reqs......................: 194721  1596.071298/s
     iteration_duration.............: avg=30.82ms min=14.06ms med=30.57ms max=367.35ms p(90)=36.45ms  p(95)=38.34ms p(99.9)=56.02ms
     iterations.....................: 194621  1595.251627/s
     success_rate...................: 100.00% ✓ 194621      ✗ 0     
     vus............................: 41      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.27)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 530046      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.11µs   min=981ns   med=1.99µs   max=11.32ms  p(90)=3.66µs  p(95)=4.54µs   p(99.9)=32.28µs
     http_req_connecting............: avg=555ns    min=0s      med=0s       max=4.23ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.71ms  min=13.73ms med=32.72ms  max=518.75ms p(90)=41.39ms p(95)=44.5ms   p(99.9)=82.02ms
       { expected_response:true }...: avg=33.71ms  min=13.73ms med=32.72ms  max=518.75ms p(90)=41.39ms p(95)=44.5ms   p(99.9)=82.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176782
     http_req_receiving.............: avg=820.35µs min=50.39µs med=117.04µs max=67.65ms  p(90)=2.34ms  p(95)=3.54ms   p(99.9)=16.9ms 
     http_req_sending...............: avg=36.41µs  min=5µs     med=8.88µs   max=114.38ms p(90)=19.81µs p(95)=104.22µs p(99.9)=2.25ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.85ms  min=13.64ms med=31.89ms  max=518.29ms p(90)=40.24ms p(95)=43.29ms  p(99.9)=80.48ms
     http_reqs......................: 176782  1449.057576/s
     iteration_duration.............: avg=33.94ms  min=13.93ms med=32.94ms  max=519.05ms p(90)=41.61ms p(95)=44.73ms  p(99.9)=82.44ms
     iterations.....................: 176682  1448.23789/s
     success_rate...................: 100.00% ✓ 176682      ✗ 0     
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

     checks.........................: 100.00% ✓ 422154      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=2.88µs  min=942ns   med=2.1µs   max=2.88ms   p(90)=3.63µs   p(95)=4.39µs  p(99.9)=37.05µs
     http_req_connecting............: avg=406ns   min=0s      med=0s      max=2.86ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=42.4ms  min=18.47ms med=41.78ms max=338.44ms p(90)=51.59ms  p(95)=54.66ms p(99.9)=71.54ms
       { expected_response:true }...: avg=42.4ms  min=18.47ms med=41.78ms max=338.44ms p(90)=51.59ms  p(95)=54.66ms p(99.9)=71.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140818
     http_req_receiving.............: avg=83.63µs min=27.91µs med=61.03µs max=258.3ms  p(90)=104.45µs p(95)=129.8µs p(99.9)=1.66ms 
     http_req_sending...............: avg=28.33µs min=4.84µs  med=10.24µs max=267.59ms p(90)=18.02µs  p(95)=22.47µs p(99.9)=1.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=42.29ms min=18.33ms med=41.68ms max=338.13ms p(90)=51.48ms  p(95)=54.55ms p(99.9)=70.73ms
     http_reqs......................: 140818  1153.881186/s
     iteration_duration.............: avg=42.63ms min=18.68ms med=41.98ms max=346.73ms p(90)=51.79ms  p(95)=54.85ms p(99.9)=72ms   
     iterations.....................: 140718  1153.061773/s
     success_rate...................: 100.00% ✓ 140718      ✗ 0     
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

     checks.........................: 100.00% ✓ 414957      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.11µs  min=972ns   med=2.21µs  max=1.92ms   p(90)=4.53µs   p(95)=5.62µs   p(99.9)=43.95µs
     http_req_connecting............: avg=290ns   min=0s      med=0s      max=1.88ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.1ms  min=18.15ms med=42.67ms max=349.97ms p(90)=52.35ms  p(95)=55.53ms  p(99.9)=80.99ms
       { expected_response:true }...: avg=43.1ms  min=18.15ms med=42.67ms max=349.97ms p(90)=52.35ms  p(95)=55.53ms  p(99.9)=80.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138419
     http_req_receiving.............: avg=95.05µs min=29.14µs med=57.37µs max=177.08ms p(90)=127.47µs p(95)=198.64µs p(99.9)=3.03ms 
     http_req_sending...............: avg=37.64µs min=5.05µs  med=9.78µs  max=175.77ms p(90)=23.48µs  p(95)=109.98µs p(99.9)=2.09ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.96ms min=18.07ms med=42.55ms max=349.76ms p(90)=52.2ms   p(95)=55.35ms  p(99.9)=80.54ms
     http_reqs......................: 138419  1134.315821/s
     iteration_duration.............: avg=43.37ms min=18.36ms med=42.91ms max=374.92ms p(90)=52.58ms  p(95)=55.76ms  p(99.9)=81.32ms
     iterations.....................: 138319  1133.496341/s
     success_rate...................: 100.00% ✓ 138319      ✗ 0     
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

     checks.........................: 100.00% ✓ 215865     ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 87 MB   707 kB/s
     http_req_blocked...............: avg=3.91µs  min=1.13µs  med=2.97µs  max=2.74ms   p(90)=4.62µs   p(95)=5.29µs   p(99.9)=45.68µs 
     http_req_connecting............: avg=674ns   min=0s      med=0s      max=2.71ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.06ms min=20.53ms med=83.32ms max=340.37ms p(90)=103.88ms p(95)=111.39ms p(99.9)=207.21ms
       { expected_response:true }...: avg=83.06ms min=20.53ms med=83.32ms max=340.37ms p(90)=103.88ms p(95)=111.39ms p(99.9)=207.21ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 72055
     http_req_receiving.............: avg=92.43µs min=32.08µs med=78.08µs max=224.81ms p(90)=114.52µs p(95)=128.3µs  p(99.9)=964.37µs
     http_req_sending...............: avg=24.62µs min=5.7µs   med=14.33µs max=136.8ms  p(90)=21.18µs  p(95)=23.67µs  p(99.9)=638.85µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.94ms min=20.36ms med=83.22ms max=339.63ms p(90)=103.77ms p(95)=111.27ms p(99.9)=206.86ms
     http_reqs......................: 72055   588.502572/s
     iteration_duration.............: avg=83.39ms min=29.91ms med=83.57ms max=376.96ms p(90)=104.12ms p(95)=111.65ms p(99.9)=208.39ms
     iterations.....................: 71955   587.685832/s
     success_rate...................: 100.00% ✓ 71955      ✗ 0    
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

     checks.........................: 100.00% ✓ 132630     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 53 MB   434 kB/s
     http_req_blocked...............: avg=4.64µs   min=1.18µs  med=3.07µs   max=3.09ms   p(90)=4.54µs   p(95)=5.12µs   p(99.9)=235.83µs
     http_req_connecting............: avg=1.33µs   min=0s      med=0s       max=3.07ms   p(90)=0s       p(95)=0s       p(99.9)=120.24µs
     http_req_duration..............: avg=135.24ms min=19.9ms  med=133.15ms max=377.15ms p(90)=169.38ms p(95)=181.06ms p(99.9)=229.84ms
       { expected_response:true }...: avg=135.24ms min=19.9ms  med=133.15ms max=377.15ms p(90)=169.38ms p(95)=181.06ms p(99.9)=229.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44310
     http_req_receiving.............: avg=92.95µs  min=31.28µs med=81.3µs   max=115.59ms p(90)=115.52µs p(95)=127.89µs p(99.9)=647.12µs
     http_req_sending...............: avg=25.58µs  min=5.61µs  med=15.31µs  max=74.84ms  p(90)=21.31µs  p(95)=23.36µs  p(99.9)=569.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=135.13ms min=19.79ms med=133.05ms max=368.24ms p(90)=169.29ms p(95)=180.95ms p(99.9)=228.96ms
     http_reqs......................: 44310   361.677648/s
     iteration_duration.............: avg=135.76ms min=48.95ms med=133.46ms max=390.99ms p(90)=169.63ms p(95)=181.4ms  p(99.9)=233.62ms
     iterations.....................: 44210   360.861404/s
     success_rate...................: 100.00% ✓ 44210      ✗ 0    
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

     checks.........................: 100.00% ✓ 93639      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 38 MB   308 kB/s
     http_req_blocked...............: avg=6.28µs   min=1.24µs  med=3.49µs   max=3.5ms    p(90)=5.01µs   p(95)=5.6µs    p(99.9)=1.05ms  
     http_req_connecting............: avg=2.56µs   min=0s      med=0s       max=3.47ms   p(90)=0s       p(95)=0s       p(99.9)=1.03ms  
     http_req_duration..............: avg=191.48ms min=18.86ms med=176.82ms max=598.28ms p(90)=235.1ms  p(95)=390.19ms p(99.9)=514.5ms 
       { expected_response:true }...: avg=191.48ms min=18.86ms med=176.82ms max=598.28ms p(90)=235.1ms  p(95)=390.19ms p(99.9)=514.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31313
     http_req_receiving.............: avg=177.8µs  min=36.43µs med=95.64µs  max=162.15ms p(90)=129.48µs p(95)=143.53µs p(99.9)=1.52ms  
     http_req_sending...............: avg=24.69µs  min=6.4µs   med=18.27µs  max=38ms     p(90)=23.43µs  p(95)=25.35µs  p(99.9)=589.71µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.27ms min=18.74ms med=176.67ms max=598.19ms p(90)=234.79ms p(95)=389.92ms p(99.9)=514.4ms 
     http_reqs......................: 31313   256.177798/s
     iteration_duration.............: avg=192.33ms min=48ms    med=177.18ms max=598.51ms p(90)=235.6ms  p(95)=391.46ms p(99.9)=514.72ms
     iterations.....................: 31213   255.359678/s
     success_rate...................: 100.00% ✓ 31213      ✗ 0    
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

     checks.........................: 100.00% ✓ 87390      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=6.81µs   min=1.27µs  med=3.34µs   max=3.94ms   p(90)=4.76µs   p(95)=5.38µs   p(99.9)=1.47ms  
     http_req_connecting............: avg=3.16µs   min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=205.11ms min=22.1ms  med=201.03ms max=458.76ms p(90)=227.78ms p(95)=234.11ms p(99.9)=308.55ms
       { expected_response:true }...: avg=205.11ms min=22.1ms  med=201.03ms max=458.76ms p(90)=227.78ms p(95)=234.11ms p(99.9)=308.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29230
     http_req_receiving.............: avg=117.35µs min=32.58µs med=93.39µs  max=194.9ms  p(90)=127.06µs p(95)=140.71µs p(99.9)=635.01µs
     http_req_sending...............: avg=36.29µs  min=6.14µs  med=17.76µs  max=151.19ms p(90)=22.94µs  p(95)=24.94µs  p(99.9)=878.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.96ms min=21.91ms med=200.9ms  max=411.67ms p(90)=227.66ms p(95)=233.95ms p(99.9)=307.37ms
     http_reqs......................: 29230   237.953189/s
     iteration_duration.............: avg=206.05ms min=38.8ms  med=201.32ms max=468.89ms p(90)=228.09ms p(95)=234.43ms p(99.9)=316.12ms
     iterations.....................: 29130   237.139117/s
     success_rate...................: 100.00% ✓ 29130      ✗ 0    
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

