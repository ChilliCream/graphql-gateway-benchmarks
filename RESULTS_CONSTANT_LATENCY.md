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
| hive-router | v0.0.43 | 1,577 | 1,611 | 1,571 | 0.8% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,431 | 1,449 | 1,418 | 0.6% |  |
| cosmo | 0.298.0 | 1,151 | 1,163 | 1,142 | 0.7% | non-compatible response (1 across 1/9 runs) |
| grafbase | 0.53.2 | 1,127 | 1,136 | 1,119 | 0.6% |  |
| hive-gateway-router-runtime | 2.5.14 | 578 | 593 | 574 | 1.1% |  |
| apollo-router | v2.12.1 | 393 | 401 | 389 | 1.0% | non-compatible response (1 across 1/9 runs) |
| hive-gateway | 2.5.14 | 262 | 267 | 259 | 1.1% |  |
| apollo-gateway | 2.13.3 | 238 | 239 | 235 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 577179      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.28µs  min=1µs     med=2.22µs  max=10.09ms  p(90)=4.08µs   p(95)=5.09µs   p(99.9)=37.3µs 
     http_req_connecting............: avg=525ns   min=0s      med=0s      max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.94ms min=14.01ms med=30.67ms max=337.4ms  p(90)=36.81ms  p(95)=38.79ms  p(99.9)=56.87ms
       { expected_response:true }...: avg=30.94ms min=14.01ms med=30.67ms max=337.4ms  p(90)=36.81ms  p(95)=38.79ms  p(99.9)=56.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192493
     http_req_receiving.............: avg=84.36µs min=26.91µs med=52.66µs max=157.61ms p(90)=103.37µs p(95)=150.35µs p(99.9)=2.47ms 
     http_req_sending...............: avg=36.58µs min=4.95µs  med=9.55µs  max=265.04ms p(90)=19.95µs  p(95)=57.61µs  p(99.9)=1.79ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.82ms min=13.96ms med=30.56ms max=319.17ms p(90)=36.69ms  p(95)=38.64ms  p(99.9)=54.96ms
     http_reqs......................: 192493  1577.718295/s
     iteration_duration.............: avg=31.18ms min=14.21ms med=30.89ms max=348.75ms p(90)=37.02ms  p(95)=39ms     p(99.9)=57.25ms
     iterations.....................: 192393  1576.898672/s
     success_rate...................: 100.00% ✓ 192393      ✗ 0     
     vus............................: 46      min=0         max=50  
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

     checks.........................: 100.00% ✓ 523548      ✗ 0     
     data_received..................: 15 GB   125 MB/s
     data_sent......................: 210 MB  1.7 MB/s
     http_req_blocked...............: avg=2.84µs   min=941ns   med=2.06µs  max=2.53ms   p(90)=3.76µs  p(95)=4.7µs   p(99.9)=32.11µs
     http_req_connecting............: avg=283ns    min=0s      med=0s      max=2.36ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=34.12ms  min=13.45ms med=33.03ms max=445.59ms p(90)=41.99ms p(95)=45.63ms p(99.9)=81.18ms
       { expected_response:true }...: avg=34.12ms  min=13.45ms med=33.03ms max=445.59ms p(90)=41.99ms p(95)=45.63ms p(99.9)=81.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 174616
     http_req_receiving.............: avg=832.84µs min=51.74µs med=118.1µs max=276.6ms  p(90)=2.39ms  p(95)=3.6ms   p(99.9)=15.78ms
     http_req_sending...............: avg=36.44µs  min=5.17µs  med=8.92µs  max=138.27ms p(90)=19.81µs p(95)=102.9µs p(99.9)=2.18ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=33.25ms  min=13.32ms med=32.19ms max=443.87ms p(90)=40.88ms p(95)=44.37ms p(99.9)=79.84ms
     http_reqs......................: 174616  1431.228719/s
     iteration_duration.............: avg=34.37ms  min=13.71ms med=33.25ms max=445.82ms p(90)=42.21ms p(95)=45.86ms p(99.9)=82.16ms
     iterations.....................: 174516  1430.409075/s
     success_rate...................: 100.00% ✓ 174516      ✗ 0     
     vus............................: 37      min=0         max=50  
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

     checks.........................: 100.00% ✓ 421158      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.64µs   min=1.03µs  med=2.52µs  max=4.07ms   p(90)=4.24µs   p(95)=5.04µs   p(99.9)=40.14µs
     http_req_connecting............: avg=730ns    min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.49ms  min=19.47ms med=41.88ms max=339.5ms  p(90)=51.72ms  p(95)=54.91ms  p(99.9)=71.48ms
       { expected_response:true }...: avg=42.49ms  min=19.47ms med=41.88ms max=339.5ms  p(90)=51.72ms  p(95)=54.91ms  p(99.9)=71.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140486
     http_req_receiving.............: avg=123.23µs min=28.39µs med=63.58µs max=230.6ms  p(90)=109.16µs p(95)=137.67µs p(99.9)=2.55ms 
     http_req_sending...............: avg=29.5µs   min=5.25µs  med=10.85µs max=247.11ms p(90)=18.88µs  p(95)=24.3µs   p(99.9)=1.42ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.34ms  min=19.26ms med=41.77ms max=108.82ms p(90)=51.6ms   p(95)=54.77ms  p(99.9)=70.7ms 
     http_reqs......................: 140486  1151.336433/s
     iteration_duration.............: avg=42.73ms  min=20.19ms med=42.1ms  max=373.07ms p(90)=51.93ms  p(95)=55.13ms  p(99.9)=71.81ms
     iterations.....................: 140386  1150.516895/s
     success_rate...................: 100.00% ✓ 140386      ✗ 0     
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

     checks.........................: 100.00% ✓ 412329      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.16µs   min=992ns   med=2.25µs  max=1.93ms   p(90)=4.67µs  p(95)=5.88µs   p(99.9)=43.18µs
     http_req_connecting............: avg=297ns    min=0s      med=0s      max=1.9ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.38ms  min=18.72ms med=42.94ms max=349.66ms p(90)=52.62ms p(95)=55.64ms  p(99.9)=80.48ms
       { expected_response:true }...: avg=43.38ms  min=18.72ms med=42.94ms max=349.66ms p(90)=52.62ms p(95)=55.64ms  p(99.9)=80.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137543
     http_req_receiving.............: avg=125.62µs min=29.87µs med=59.69µs max=233.92ms p(90)=129.9µs p(95)=201.14µs p(99.9)=3.51ms 
     http_req_sending...............: avg=36.14µs  min=5.13µs  med=9.87µs  max=86.52ms  p(90)=24.09µs p(95)=109.45µs p(99.9)=2.53ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.22ms  min=18.64ms med=42.82ms max=144.97ms p(90)=52.49ms p(95)=55.46ms  p(99.9)=79.89ms
     http_reqs......................: 137543  1127.147706/s
     iteration_duration.............: avg=43.65ms  min=18.87ms med=43.18ms max=370.89ms p(90)=52.86ms p(95)=55.88ms  p(99.9)=81.08ms
     iterations.....................: 137443  1126.328218/s
     success_rate...................: 100.00% ✓ 137443      ✗ 0     
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

     checks.........................: 100.00% ✓ 211881     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   694 kB/s
     http_req_blocked...............: avg=4.82µs  min=1.16µs  med=3.13µs  max=3.95ms   p(90)=4.8µs    p(95)=5.49µs   p(99.9)=48.9µs  
     http_req_connecting............: avg=1.37µs  min=0s      med=0s      max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.6ms  min=18.37ms med=82.02ms max=359ms    p(90)=102.62ms p(95)=110.67ms p(99.9)=208.17ms
       { expected_response:true }...: avg=84.6ms  min=18.37ms med=82.02ms max=359ms    p(90)=102.62ms p(95)=110.67ms p(99.9)=208.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70727
     http_req_receiving.............: avg=88.83µs min=32.41µs med=78.41µs max=103.09ms p(90)=114.6µs  p(95)=128.97µs p(99.9)=941.34µs
     http_req_sending...............: avg=25.56µs min=5.83µs  med=14.26µs max=197.77ms p(90)=21.34µs  p(95)=23.86µs  p(99.9)=772.79µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.49ms min=18.2ms  med=81.91ms max=358.34ms p(90)=102.52ms p(95)=110.56ms p(99.9)=207.88ms
     http_reqs......................: 70727   578.035421/s
     iteration_duration.............: avg=84.95ms min=29.42ms med=82.25ms max=372.15ms p(90)=102.87ms p(95)=110.94ms p(99.9)=210.52ms
     iterations.....................: 70627   577.218144/s
     success_rate...................: 100.00% ✓ 70627      ✗ 0    
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

     checks.........................: 100.00% ✓ 144231     ✗ 0    
     data_received..................: 4.2 GB  34 MB/s
     data_sent......................: 58 MB   472 kB/s
     http_req_blocked...............: avg=5.88µs   min=1.15µs  med=3.52µs   max=4.6ms    p(90)=5.13µs   p(95)=5.77µs   p(99.9)=301.06µs
     http_req_connecting............: avg=2.14µs   min=0s      med=0s       max=4.56ms   p(90)=0s       p(95)=0s       p(99.9)=190.56µs
     http_req_duration..............: avg=124.33ms min=19.5ms  med=122.56ms max=344.77ms p(90)=155.23ms p(95)=165.21ms p(99.9)=213.95ms
       { expected_response:true }...: avg=124.33ms min=19.5ms  med=122.56ms max=344.77ms p(90)=155.23ms p(95)=165.21ms p(99.9)=213.95ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48177
     http_req_receiving.............: avg=92.83µs  min=30.18µs med=86.08µs  max=51.88ms  p(90)=119.75µs p(95)=132.99µs p(99.9)=674.74µs
     http_req_sending...............: avg=43.59µs  min=6µs     med=16.93µs  max=231.62ms p(90)=22.73µs  p(95)=24.92µs  p(99.9)=706.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.2ms  min=19.35ms med=122.44ms max=344.22ms p(90)=155.09ms p(95)=165.03ms p(99.9)=212.33ms
     http_reqs......................: 48177   393.314958/s
     iteration_duration.............: avg=124.83ms min=42.92ms med=122.84ms max=394ms    p(90)=155.53ms p(95)=165.52ms p(99.9)=219.35ms
     iterations.....................: 48077   392.498563/s
     success_rate...................: 100.00% ✓ 48077      ✗ 0    
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

     checks.........................: 100.00% ✓ 95856      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   315 kB/s
     http_req_blocked...............: avg=7.04µs   min=1.26µs  med=3.75µs   max=3.78ms   p(90)=5.39µs   p(95)=6.06µs   p(99.9)=1.44ms  
     http_req_connecting............: avg=3.05µs   min=0s      med=0s       max=3.74ms   p(90)=0s       p(95)=0s       p(99.9)=1.42ms  
     http_req_duration..............: avg=187.04ms min=18.48ms med=174.57ms max=572.04ms p(90)=230.45ms p(95)=379.53ms p(99.9)=531.47ms
       { expected_response:true }...: avg=187.04ms min=18.48ms med=174.57ms max=572.04ms p(90)=230.45ms p(95)=379.53ms p(99.9)=531.47ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32052
     http_req_receiving.............: avg=152.75µs min=35.41µs med=96.97µs  max=194.61ms p(90)=131.44µs p(95)=145.93µs p(99.9)=1.13ms  
     http_req_sending...............: avg=30.53µs  min=6.42µs  med=18.98µs  max=78.47ms  p(90)=24.6µs   p(95)=26.7µs   p(99.9)=671.96µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.86ms min=18.33ms med=174.43ms max=571.9ms  p(90)=230.27ms p(95)=379.17ms p(99.9)=531.34ms
     http_reqs......................: 32052   262.320058/s
     iteration_duration.............: avg=187.87ms min=56.02ms med=174.98ms max=572.32ms p(90)=230.85ms p(95)=386.72ms p(99.9)=531.71ms
     iterations.....................: 31952   261.501638/s
     success_rate...................: 100.00% ✓ 31952      ✗ 0    
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

     checks.........................: 100.00% ✓ 87483      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=7.21µs   min=1.29µs  med=3.49µs   max=4.18ms   p(90)=4.96µs   p(95)=5.6µs    p(99.9)=1.75ms  
     http_req_connecting............: avg=3.51µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=204.98ms min=20.61ms med=211.05ms max=436.93ms p(90)=249.84ms p(95)=256.09ms p(99.9)=327ms   
       { expected_response:true }...: avg=204.98ms min=20.61ms med=211.05ms max=436.93ms p(90)=249.84ms p(95)=256.09ms p(99.9)=327ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 29261
     http_req_receiving.............: avg=146.52µs min=32.85µs med=92.22µs  max=202.44ms p(90)=125.88µs p(95)=138.8µs  p(99.9)=962.48µs
     http_req_sending...............: avg=25.82µs  min=6.24µs  med=17.32µs  max=89.68ms  p(90)=22.56µs  p(95)=24.54µs  p(99.9)=552.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.81ms min=20.46ms med=210.59ms max=436.35ms p(90)=249.67ms p(95)=255.9ms  p(99.9)=326.11ms
     http_reqs......................: 29261   238.148184/s
     iteration_duration.............: avg=205.91ms min=53.99ms med=212.42ms max=453.35ms p(90)=250.14ms p(95)=256.43ms p(99.9)=330.18ms
     iterations.....................: 29161   237.334309/s
     success_rate...................: 100.00% ✓ 29161      ✗ 0    
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

