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
| hive-router | v0.0.42 | 1,602 | 1,622 | 1,591 | 0.6% |  |
| hotchocolate | 16.0.0-rc.1.1 | 1,376 | 1,385 | 1,360 | 0.5% |  |
| cosmo | 0.295.0 | 1,164 | 1,178 | 1,153 | 0.7% | non-compatible response (1 across 1/9 runs) |
| grafbase | 0.53.2 | 1,133 | 1,157 | 1,129 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.11 | 565 | 580 | 558 | 1.4% |  |
| apollo-router | v2.12.0 | 364 | 376 | 358 | 1.6% |  |
| hive-gateway | 2.5.11 | 262 | 268 | 259 | 1.2% |  |
| apollo-gateway | 2.13.3 | 239 | 241 | 238 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 586197      ✗ 0     
     data_received..................: 17 GB   140 MB/s
     data_sent......................: 235 MB  1.9 MB/s
     http_req_blocked...............: avg=3.2µs   min=982ns   med=2.1µs   max=4.82ms   p(90)=4.04µs   p(95)=5.05µs   p(99.9)=38.39µs
     http_req_connecting............: avg=582ns   min=0s      med=0s      max=4.72ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.46ms min=14.08ms med=30.24ms max=331.09ms p(90)=36.1ms   p(95)=37.98ms  p(99.9)=56.02ms
       { expected_response:true }...: avg=30.46ms min=14.08ms med=30.24ms max=331.09ms p(90)=36.1ms   p(95)=37.98ms  p(99.9)=56.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 195499
     http_req_receiving.............: avg=84.65µs min=27µs    med=51.52µs max=286.64ms p(90)=104.83µs p(95)=155.58µs p(99.9)=2.43ms 
     http_req_sending...............: avg=35.49µs min=5.09µs  med=9.26µs  max=297.88ms p(90)=20.54µs  p(95)=76.56µs  p(99.9)=1.79ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.34ms min=14.01ms med=30.14ms max=326.26ms p(90)=35.98ms  p(95)=37.85ms  p(99.9)=54.87ms
     http_reqs......................: 195499  1602.422571/s
     iteration_duration.............: avg=30.69ms min=14.23ms med=30.46ms max=363.52ms p(90)=36.31ms  p(95)=38.2ms   p(99.9)=56.49ms
     iterations.....................: 195399  1601.602913/s
     success_rate...................: 100.00% ✓ 195399      ✗ 0     
     vus............................: 25      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 503751      ✗ 0     
     data_received..................: 15 GB   121 MB/s
     data_sent......................: 202 MB  1.7 MB/s
     http_req_blocked...............: avg=3µs      min=1µs     med=2.01µs   max=4.82ms   p(90)=3.87µs  p(95)=4.71µs   p(99.9)=32.61µs
     http_req_connecting............: avg=474ns    min=0s      med=0s       max=3.83ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=35.48ms  min=14.12ms med=34.38ms  max=480.5ms  p(90)=43.71ms p(95)=47.33ms  p(99.9)=82.93ms
       { expected_response:true }...: avg=35.48ms  min=14.12ms med=34.38ms  max=480.5ms  p(90)=43.71ms p(95)=47.33ms  p(99.9)=82.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 168017
     http_req_receiving.............: avg=828.02µs min=49.23µs med=116.09µs max=263.5ms  p(90)=2.42ms  p(95)=3.62ms   p(99.9)=14.74ms
     http_req_sending...............: avg=35.71µs  min=5.1µs   med=8.94µs   max=203.15ms p(90)=19.97µs p(95)=100.26µs p(99.9)=2.17ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=34.62ms  min=14.03ms med=33.53ms  max=477.74ms p(90)=42.58ms p(95)=46.11ms  p(99.9)=81.78ms
     http_reqs......................: 168017  1376.67676/s
     iteration_duration.............: avg=35.72ms  min=14.27ms med=34.6ms   max=480.79ms p(90)=43.93ms p(95)=47.56ms  p(99.9)=83.61ms
     iterations.....................: 167917  1375.857392/s
     success_rate...................: 100.00% ✓ 167917      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.295.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 426162      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.28µs  min=1.06µs  med=2.11µs  max=4.35ms   p(90)=3.67µs  p(95)=4.45µs   p(99.9)=32.31µs
     http_req_connecting............: avg=794ns   min=0s      med=0s      max=4.3ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42ms    min=19.16ms med=41.42ms max=346.3ms  p(90)=50.99ms p(95)=54.05ms  p(99.9)=71.52ms
       { expected_response:true }...: avg=42ms    min=19.16ms med=41.42ms max=346.3ms  p(90)=50.99ms p(95)=54.05ms  p(99.9)=71.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142154
     http_req_receiving.............: avg=84.98µs min=27.14µs med=61.45µs max=118.37ms p(90)=106.5µs p(95)=133.58µs p(99.9)=1.84ms 
     http_req_sending...............: avg=28.98µs min=5.19µs  med=10.09µs max=171.16ms p(90)=17.99µs p(95)=22.87µs  p(99.9)=1.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.89ms min=19.02ms med=41.31ms max=302.4ms  p(90)=50.87ms p(95)=53.93ms  p(99.9)=70.63ms
     http_reqs......................: 142154  1164.850984/s
     iteration_duration.............: avg=42.23ms min=20.55ms med=41.62ms max=355.03ms p(90)=51.19ms p(95)=54.25ms  p(99.9)=72.29ms
     iterations.....................: 142054  1164.031555/s
     success_rate...................: 100.00% ✓ 142054      ✗ 0     
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

     checks.........................: 100.00% ✓ 414618      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.54µs  min=992ns   med=2.2µs   max=6.59ms   p(90)=4.59µs   p(95)=5.75µs   p(99.9)=44.14µs
     http_req_connecting............: avg=630ns   min=0s      med=0s      max=3.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.13ms min=15.62ms med=42.73ms max=327.18ms p(90)=52.29ms  p(95)=55.43ms  p(99.9)=80.4ms 
       { expected_response:true }...: avg=43.13ms min=15.62ms med=42.73ms max=327.18ms p(90)=52.29ms  p(95)=55.43ms  p(99.9)=80.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 138306
     http_req_receiving.............: avg=93.04µs min=29.43µs med=58.64µs max=82.53ms  p(90)=129.69µs p(95)=195.55µs p(99.9)=2.9ms  
     http_req_sending...............: avg=40.23µs min=4.99µs  med=9.77µs  max=189.57ms p(90)=23.43µs  p(95)=107.26µs p(99.9)=2.06ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43ms    min=15.47ms med=42.61ms max=326.18ms p(90)=52.16ms  p(95)=55.27ms  p(99.9)=79.55ms
     http_reqs......................: 138306  1133.675723/s
     iteration_duration.............: avg=43.4ms  min=17.82ms med=42.97ms max=337.15ms p(90)=52.53ms  p(95)=55.66ms  p(99.9)=80.89ms
     iterations.....................: 138206  1132.856036/s
     success_rate...................: 100.00% ✓ 138206      ✗ 0     
     vus............................: 45      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 207237     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 83 MB   679 kB/s
     http_req_blocked...............: avg=3.47µs  min=1.13µs  med=2.56µs  max=1.87ms   p(90)=4.17µs   p(95)=4.74µs   p(99.9)=45.83µs 
     http_req_connecting............: avg=600ns   min=0s      med=0s      max=1.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.53ms min=21.92ms med=84.52ms max=349.27ms p(90)=100.86ms p(95)=108.6ms  p(99.9)=207.4ms 
       { expected_response:true }...: avg=86.53ms min=21.92ms med=84.52ms max=349.27ms p(90)=100.86ms p(95)=108.6ms  p(99.9)=207.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 69179
     http_req_receiving.............: avg=87.74µs min=31.17µs med=75.14µs max=118.29ms p(90)=111.06µs p(95)=124.19µs p(99.9)=879.91µs
     http_req_sending...............: avg=20.32µs min=5.5µs   med=12.53µs max=101.94ms p(90)=19.16µs  p(95)=21.4µs   p(99.9)=635.45µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.42ms min=21.75ms med=84.42ms max=348.79ms p(90)=100.75ms p(95)=108.49ms p(99.9)=207.05ms
     http_reqs......................: 69179   565.186283/s
     iteration_duration.............: avg=86.86ms min=34.13ms med=84.76ms max=360.62ms p(90)=101.07ms p(95)=108.87ms p(99.9)=209.2ms 
     iterations.....................: 69079   564.369292/s
     success_rate...................: 100.00% ✓ 69079      ✗ 0    
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

     checks.........................: 100.00% ✓ 133545     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   437 kB/s
     http_req_blocked...............: avg=5.48µs   min=1.08µs  med=2.89µs   max=4.55ms   p(90)=4.33µs   p(95)=4.89µs   p(99.9)=740.69µs
     http_req_connecting............: avg=2.36µs   min=0s      med=0s       max=4.51ms   p(90)=0s       p(95)=0s       p(99.9)=718.21µs
     http_req_duration..............: avg=134.3ms  min=19.92ms med=132.4ms  max=343.59ms p(90)=167.59ms p(95)=178.85ms p(99.9)=230.78ms
       { expected_response:true }...: avg=134.3ms  min=19.92ms med=132.4ms  max=343.59ms p(90)=167.59ms p(95)=178.85ms p(99.9)=230.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44615
     http_req_receiving.............: avg=92.87µs  min=30.64µs med=81.9µs   max=192.23ms p(90)=115.65µs p(95)=128.05µs p(99.9)=818.74µs
     http_req_sending...............: avg=28.81µs  min=6.13µs  med=15.04µs  max=135.59ms p(90)=20.94µs  p(95)=23.04µs  p(99.9)=534.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=134.18ms min=19.82ms med=132.29ms max=330.74ms p(90)=167.47ms p(95)=178.71ms p(99.9)=229.44ms
     http_reqs......................: 44615   364.225573/s
     iteration_duration.............: avg=134.82ms min=39.9ms  med=132.69ms max=375.5ms  p(90)=167.87ms p(95)=179.19ms p(99.9)=234.49ms
     iterations.....................: 44515   363.409198/s
     success_rate...................: 100.00% ✓ 44515      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95973      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   315 kB/s
     http_req_blocked...............: avg=6.77µs   min=1.27µs  med=3.31µs   max=3.97ms   p(90)=4.8µs    p(95)=5.44µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=3.22µs   min=0s      med=0s       max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=1.51ms  
     http_req_duration..............: avg=186.86ms min=18.82ms med=145.62ms max=675.2ms  p(90)=310.43ms p(95)=373.19ms p(99.9)=617ms   
       { expected_response:true }...: avg=186.86ms min=18.82ms med=145.62ms max=675.2ms  p(90)=310.43ms p(95)=373.19ms p(99.9)=617ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32091
     http_req_receiving.............: avg=100.71µs min=35.06µs med=95.53µs  max=16.54ms  p(90)=128.37µs p(95)=141.96µs p(99.9)=607.8µs 
     http_req_sending...............: avg=23.41µs  min=5.8µs   med=17.64µs  max=52.58ms  p(90)=22.72µs  p(95)=24.67µs  p(99.9)=699.06µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.74ms min=18.72ms med=145.51ms max=674.18ms p(90)=310.3ms  p(95)=373.08ms p(99.9)=616.83ms
     http_reqs......................: 32091   262.575058/s
     iteration_duration.............: avg=187.66ms min=54.27ms med=147.14ms max=681.28ms p(90)=310.89ms p(95)=374.32ms p(99.9)=620.04ms
     iterations.....................: 31991   261.756838/s
     success_rate...................: 100.00% ✓ 31991      ✗ 0    
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

     checks.........................: 100.00% ✓ 87921      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=6.82µs   min=1.26µs  med=3.35µs   max=4.15ms   p(90)=4.78µs   p(95)=5.35µs   p(99.9)=1.48ms  
     http_req_connecting............: avg=3.27µs   min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=203.9ms  min=23.85ms med=203.66ms max=427.79ms p(90)=218.35ms p(95)=224.4ms  p(99.9)=295.85ms
       { expected_response:true }...: avg=203.9ms  min=23.85ms med=203.66ms max=427.79ms p(90)=218.35ms p(95)=224.4ms  p(99.9)=295.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29407
     http_req_receiving.............: avg=101.27µs min=34.66µs med=93.97µs  max=47.12ms  p(90)=127.7µs  p(95)=141.58µs p(99.9)=541.42µs
     http_req_sending...............: avg=25.74µs  min=6.27µs  med=17.55µs  max=53.6ms   p(90)=22.8µs   p(95)=24.78µs  p(99.9)=537.72µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.77ms min=23.68ms med=203.54ms max=426.92ms p(90)=218.24ms p(95)=224.25ms p(99.9)=295.76ms
     http_reqs......................: 29407   239.399375/s
     iteration_duration.............: avg=204.85ms min=66.17ms med=203.99ms max=464.38ms p(90)=218.64ms p(95)=224.76ms p(99.9)=316.22ms
     iterations.....................: 29307   238.585286/s
     success_rate...................: 100.00% ✓ 29307      ✗ 0    
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

