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
| hive-router | v0.0.49 | 1,579 | 1,603 | 1,569 | 0.8% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,445 | 1,456 | 1,438 | 0.4% |  |
| cosmo | 0.307.0 | 1,163 | 1,179 | 1,157 | 0.7% | non-compatible response (2 across 2/9 runs) |
| grafbase | 0.53.3 | 1,134 | 1,153 | 1,127 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.25 | 505 | 518 | 502 | 1.2% |  |
| apollo-router | v2.13.1 | 380 | 386 | 367 | 1.4% |  |
| hive-gateway | 2.5.25 | 244 | 248 | 243 | 0.8% |  |
| apollo-gateway | 2.13.3 | 235 | 236 | 232 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 577785      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.06µs  min=962ns   med=2.03µs  max=4.26ms   p(90)=3.86µs   p(95)=4.84µs   p(99.9)=30.86µs
     http_req_connecting............: avg=536ns   min=0s      med=0s      max=4.19ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.91ms min=14.09ms med=30.67ms max=326.95ms p(90)=36.77ms  p(95)=38.67ms  p(99.9)=57.37ms
       { expected_response:true }...: avg=30.91ms min=14.09ms med=30.67ms max=326.95ms p(90)=36.77ms  p(95)=38.67ms  p(99.9)=57.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192695
     http_req_receiving.............: avg=93.39µs min=27.54µs med=51.7µs  max=181.72ms p(90)=102.87µs p(95)=149.94µs p(99.9)=3.14ms 
     http_req_sending...............: avg=34.35µs min=5.02µs  med=9.13µs  max=188.29ms p(90)=19.48µs  p(95)=38.98µs  p(99.9)=1.78ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.78ms min=14.05ms med=30.56ms max=207.97ms p(90)=36.64ms  p(95)=38.53ms  p(99.9)=55.3ms 
     http_reqs......................: 192695  1579.246598/s
     iteration_duration.............: avg=31.14ms min=14.28ms med=30.88ms max=360.29ms p(90)=36.98ms  p(95)=38.88ms  p(99.9)=57.96ms
     iterations.....................: 192595  1578.427041/s
     success_rate...................: 100.00% ✓ 192595      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 528780      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.04µs   min=962ns   med=1.96µs   max=4.14ms   p(90)=3.66µs  p(95)=4.53µs   p(99.9)=26.34µs
     http_req_connecting............: avg=583ns    min=0s      med=0s       max=4.09ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.78ms  min=14.1ms  med=32.53ms  max=480.51ms p(90)=41.39ms p(95)=44.94ms  p(99.9)=84.72ms
       { expected_response:true }...: avg=33.78ms  min=14.1ms  med=32.53ms  max=480.51ms p(90)=41.39ms p(95)=44.94ms  p(99.9)=84.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176360
     http_req_receiving.............: avg=807.22µs min=50.04µs med=112.68µs max=296.38ms p(90)=2.34ms  p(95)=3.51ms   p(99.9)=16.88ms
     http_req_sending...............: avg=37.63µs  min=5µs     med=8.79µs   max=117.72ms p(90)=19.62µs p(95)=103.98µs p(99.9)=2.5ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.94ms  min=13.89ms med=31.72ms  max=480.42ms p(90)=40.27ms p(95)=43.69ms  p(99.9)=82.64ms
     http_reqs......................: 176360  1445.599242/s
     iteration_duration.............: avg=34.03ms  min=14.36ms med=32.75ms  max=480.74ms p(90)=41.61ms p(95)=45.17ms  p(99.9)=87.54ms
     iterations.....................: 176260  1444.779556/s
     success_rate...................: 100.00% ✓ 176260      ✗ 0     
     vus............................: 19      min=0         max=50  
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

     checks.........................: 100.00% ✓ 425571      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.12µs  min=992ns   med=2.07µs  max=3.94ms   p(90)=3.66µs   p(95)=4.43µs   p(99.9)=34.89µs
     http_req_connecting............: avg=644ns   min=0s      med=0s      max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.06ms min=19.67ms med=41.42ms max=356.92ms p(90)=51.2ms   p(95)=54.33ms  p(99.9)=72.11ms
       { expected_response:true }...: avg=42.06ms min=19.67ms med=41.42ms max=356.92ms p(90)=51.2ms   p(95)=54.33ms  p(99.9)=72.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141957
     http_req_receiving.............: avg=96.43µs min=28.24µs med=61.17µs max=230.59ms p(90)=105.67µs p(95)=131.25µs p(99.9)=1.72ms 
     http_req_sending...............: avg=28.34µs min=5.09µs  med=10.08µs max=247.35ms p(90)=18.01µs  p(95)=22.7µs   p(99.9)=1.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.94ms min=19.53ms med=41.32ms max=204.24ms p(90)=51.08ms  p(95)=54.22ms  p(99.9)=71.59ms
     http_reqs......................: 141957  1163.109015/s
     iteration_duration.............: avg=42.29ms min=20.33ms med=41.62ms max=365.12ms p(90)=51.4ms   p(95)=54.53ms  p(99.9)=72.65ms
     iterations.....................: 141857  1162.289676/s
     success_rate...................: 100.00% ✓ 141857      ✗ 0     
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

     checks.........................: 100.00% ✓ 414933      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.61µs   min=990ns   med=2.16µs  max=5.52ms   p(90)=4.49µs   p(95)=5.61µs   p(99.9)=44.64µs
     http_req_connecting............: avg=803ns    min=0s      med=0s      max=4.62ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.11ms  min=16.08ms med=42.63ms max=363.91ms p(90)=52.51ms  p(95)=55.73ms  p(99.9)=78.54ms
       { expected_response:true }...: avg=43.11ms  min=16.08ms med=42.63ms max=363.91ms p(90)=52.51ms  p(95)=55.73ms  p(99.9)=78.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138411
     http_req_receiving.............: avg=148.18µs min=28.93µs med=57.78µs max=295.79ms p(90)=128.83µs p(95)=200.49µs p(99.9)=5.63ms 
     http_req_sending...............: avg=36.23µs  min=5.14µs  med=9.75µs  max=46.92ms  p(90)=23.74µs  p(95)=108.99µs p(99.9)=2.46ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.92ms  min=16.02ms med=42.5ms  max=103.29ms p(90)=52.36ms  p(95)=55.55ms  p(99.9)=75.46ms
     http_reqs......................: 138411  1134.358683/s
     iteration_duration.............: avg=43.37ms  min=16.28ms med=42.87ms max=382.63ms p(90)=52.73ms  p(95)=55.96ms  p(99.9)=78.88ms
     iterations.....................: 138311  1133.539125/s
     success_rate...................: 100.00% ✓ 138311      ✗ 0     
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

     checks.........................: 100.00% ✓ 185343     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 74 MB   607 kB/s
     http_req_blocked...............: avg=4.17µs  min=1.13µs  med=2.95µs  max=3.21ms   p(90)=4.59µs   p(95)=5.27µs   p(99.9)=56.76µs 
     http_req_connecting............: avg=925ns   min=0s      med=0s      max=3.18ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.75ms min=19.48ms med=92.65ms max=361.18ms p(90)=125.17ms p(95)=136.26ms p(99.9)=237.57ms
       { expected_response:true }...: avg=96.75ms min=19.48ms med=92.65ms max=361.18ms p(90)=125.17ms p(95)=136.26ms p(99.9)=237.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61881
     http_req_receiving.............: avg=88.92µs min=31.97µs med=79.8µs  max=37.13ms  p(90)=116.3µs  p(95)=129.85µs p(99.9)=985.89µs
     http_req_sending...............: avg=29.23µs min=5.17µs  med=14.37µs max=130.93ms p(90)=21.21µs  p(95)=23.6µs   p(99.9)=749.24µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.63ms min=19.27ms med=92.54ms max=360.79ms p(90)=125.05ms p(95)=136.1ms  p(99.9)=237.43ms
     http_reqs......................: 61881   505.431044/s
     iteration_duration.............: avg=97.13ms min=40.29ms med=92.91ms max=371.61ms p(90)=125.43ms p(95)=136.59ms p(99.9)=239.94ms
     iterations.....................: 61781   504.614265/s
     success_rate...................: 100.00% ✓ 61781      ✗ 0    
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

     checks.........................: 100.00% ✓ 139380     ✗ 0    
     data_received..................: 4.1 GB  33 MB/s
     data_sent......................: 56 MB   456 kB/s
     http_req_blocked...............: avg=5.71µs   min=1.17µs  med=3.4µs    max=4.3ms    p(90)=4.93µs   p(95)=5.55µs   p(99.9)=282.35µs
     http_req_connecting............: avg=2.04µs   min=0s      med=0s       max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=168.22µs
     http_req_duration..............: avg=128.66ms min=20.75ms med=126.63ms max=367.55ms p(90)=160.89ms p(95)=171.71ms p(99.9)=221.66ms
       { expected_response:true }...: avg=128.66ms min=20.75ms med=126.63ms max=367.55ms p(90)=160.89ms p(95)=171.71ms p(99.9)=221.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46560
     http_req_receiving.............: avg=90.79µs  min=32.05µs med=86.07µs  max=16.92ms  p(90)=119.03µs p(95)=131.72µs p(99.9)=684.1µs 
     http_req_sending...............: avg=29.28µs  min=5.32µs  med=16.72µs  max=110.85ms p(90)=22.5µs   p(95)=24.53µs  p(99.9)=709.61µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=128.54ms min=20.61ms med=126.51ms max=366.99ms p(90)=160.76ms p(95)=171.56ms p(99.9)=220.61ms
     http_reqs......................: 46560   380.024622/s
     iteration_duration.............: avg=129.18ms min=37.2ms  med=126.93ms max=408.75ms p(90)=161.21ms p(95)=172.03ms p(99.9)=227.91ms
     iterations.....................: 46460   379.208418/s
     success_rate...................: 100.00% ✓ 46460      ✗ 0    
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

     checks.........................: 100.00% ✓ 89253      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   293 kB/s
     http_req_blocked...............: avg=7.52µs   min=1.15µs  med=3.6µs    max=4.32ms   p(90)=5.19µs   p(95)=5.84µs   p(99.9)=2.01ms  
     http_req_connecting............: avg=3.62µs   min=0s      med=0s       max=4.27ms   p(90)=0s       p(95)=0s       p(99.9)=1.83ms  
     http_req_duration..............: avg=200.86ms min=18.84ms med=188.24ms max=571.97ms p(90)=237.43ms p(95)=404.63ms p(99.9)=519.62ms
       { expected_response:true }...: avg=200.86ms min=18.84ms med=188.24ms max=571.97ms p(90)=237.43ms p(95)=404.63ms p(99.9)=519.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29851
     http_req_receiving.............: avg=159.16µs min=35.69µs med=99.71µs  max=263ms    p(90)=132.77µs p(95)=146.49µs p(99.9)=799.88µs
     http_req_sending...............: avg=37.84µs  min=6.27µs  med=18.67µs  max=272.8ms  p(90)=24.07µs  p(95)=26.06µs  p(99.9)=628.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.66ms min=18.69ms med=188.09ms max=571.85ms p(90)=237.22ms p(95)=404.33ms p(99.9)=519.54ms
     http_reqs......................: 29851   244.195087/s
     iteration_duration.............: avg=201.79ms min=65.4ms  med=188.64ms max=572.19ms p(90)=237.97ms p(95)=405.39ms p(99.9)=519.87ms
     iterations.....................: 29751   243.377041/s
     success_rate...................: 100.00% ✓ 29751      ✗ 0    
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

     checks.........................: 100.00% ✓ 86661      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   283 kB/s
     http_req_blocked...............: avg=5.76µs   min=1.22µs  med=3.4µs    max=12.6ms   p(90)=4.86µs   p(95)=5.46µs   p(99.9)=774.57µs
     http_req_connecting............: avg=1.71µs   min=0s      med=0s       max=2.61ms   p(90)=0s       p(95)=0s       p(99.9)=692.3µs 
     http_req_duration..............: avg=206.9ms  min=22.15ms med=206.52ms max=382.86ms p(90)=218.55ms p(95)=224.22ms p(99.9)=292.47ms
       { expected_response:true }...: avg=206.9ms  min=22.15ms med=206.52ms max=382.86ms p(90)=218.55ms p(95)=224.22ms p(99.9)=292.47ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28987
     http_req_receiving.............: avg=156.13µs min=35.23µs med=94.15µs  max=157.6ms  p(90)=127.4µs  p(95)=141.23µs p(99.9)=976.95µs
     http_req_sending...............: avg=38.19µs  min=5.55µs  med=17.79µs  max=190.12ms p(90)=23.07µs  p(95)=25.03µs  p(99.9)=445.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.71ms min=22.02ms med=206.4ms  max=304.83ms p(90)=218.43ms p(95)=223.95ms p(99.9)=290.01ms
     http_reqs......................: 28987   235.88901/s
     iteration_duration.............: avg=207.83ms min=71.94ms med=206.81ms max=390.21ms p(90)=218.85ms p(95)=224.58ms p(99.9)=294.65ms
     iterations.....................: 28887   235.075235/s
     success_rate...................: 100.00% ✓ 28887      ✗ 0    
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

