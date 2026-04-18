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
| hive-router | v0.0.43 | 1,585 | 1,609 | 1,575 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.5 | 1,471 | 1,479 | 1,464 | 0.3% |  |
| cosmo | 0.298.0 | 1,165 | 1,177 | 1,154 | 0.7% | non-compatible response (2 across 1/9 runs) |
| grafbase | 0.53.2 | 1,138 | 1,155 | 1,128 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.14 | 579 | 595 | 576 | 1.1% |  |
| apollo-router | v2.12.1 | 390 | 399 | 386 | 1.1% |  |
| hive-gateway | 2.5.14 | 258 | 265 | 256 | 1.1% |  |
| apollo-gateway | 2.13.3 | 233 | 235 | 228 | 0.9% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 580221      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=3.03µs  min=972ns   med=2.03µs  max=4.1ms    p(90)=3.83µs   p(95)=4.81µs   p(99.9)=33.1µs 
     http_req_connecting............: avg=523ns   min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.77ms min=14.15ms med=30.5ms  max=320.17ms p(90)=36.52ms  p(95)=38.47ms  p(99.9)=59.71ms
       { expected_response:true }...: avg=30.77ms min=14.15ms med=30.5ms  max=320.17ms p(90)=36.52ms  p(95)=38.47ms  p(99.9)=59.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193507
     http_req_receiving.............: avg=81.55µs min=27.57µs med=52.05µs max=46.25ms  p(90)=102.91µs p(95)=146.39µs p(99.9)=2.12ms 
     http_req_sending...............: avg=34.79µs min=5.16µs  med=9.21µs  max=129.42ms p(90)=19.43µs  p(95)=33.64µs  p(99.9)=1.77ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.66ms min=14.07ms med=30.39ms max=319.59ms p(90)=36.41ms  p(95)=38.33ms  p(99.9)=58.6ms 
     http_reqs......................: 193507  1585.693241/s
     iteration_duration.............: avg=31.01ms min=14.41ms med=30.72ms max=356.58ms p(90)=36.74ms  p(95)=38.67ms  p(99.9)=60.48ms
     iterations.....................: 193407  1584.87379/s
     success_rate...................: 100.00% ✓ 193407      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 538365      ✗ 0     
     data_received..................: 16 GB   129 MB/s
     data_sent......................: 216 MB  1.8 MB/s
     http_req_blocked...............: avg=3.04µs   min=972ns   med=1.99µs   max=4.87ms   p(90)=3.83µs  p(95)=4.72µs   p(99.9)=31.11µs
     http_req_connecting............: avg=516ns    min=0s      med=0s       max=4.02ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.19ms  min=14.76ms med=32.2ms   max=404.82ms p(90)=40.63ms p(95)=43.88ms  p(99.9)=83.76ms
       { expected_response:true }...: avg=33.19ms  min=14.76ms med=32.2ms   max=404.82ms p(90)=40.63ms p(95)=43.88ms  p(99.9)=83.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 179555
     http_req_receiving.............: avg=760.69µs min=50.25µs med=109.87µs max=203.12ms p(90)=2.15ms  p(95)=3.26ms   p(99.9)=17.44ms
     http_req_sending...............: avg=37.88µs  min=5.18µs  med=8.96µs   max=214.24ms p(90)=20.16µs p(95)=104.37µs p(99.9)=2.59ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.39ms  min=14.31ms med=31.46ms  max=404.72ms p(90)=39.58ms p(95)=42.69ms  p(99.9)=81.91ms
     http_reqs......................: 179555  1471.447052/s
     iteration_duration.............: avg=33.42ms  min=15.05ms med=32.42ms  max=405.03ms p(90)=40.85ms p(95)=44.1ms   p(99.9)=84.38ms
     iterations.....................: 179455  1470.627555/s
     success_rate...................: 100.00% ✓ 179455      ✗ 0     
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

     checks.........................: 100.00% ✓ 426288      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.42µs  min=1.06µs  med=2.29µs  max=3.99ms   p(90)=4.04µs   p(95)=4.83µs   p(99.9)=36.92µs
     http_req_connecting............: avg=729ns   min=0s      med=0s      max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.98ms min=15.97ms med=41.39ms max=330.43ms p(90)=51.09ms  p(95)=54.11ms  p(99.9)=70.51ms
       { expected_response:true }...: avg=41.98ms min=15.97ms med=41.39ms max=330.43ms p(90)=51.09ms  p(95)=54.11ms  p(99.9)=70.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142196
     http_req_receiving.............: avg=86.18µs min=28.25µs med=63.01µs max=228.59ms p(90)=109.01µs p(95)=135.77µs p(99.9)=1.79ms 
     http_req_sending...............: avg=27.39µs min=5.22µs  med=10.78µs max=104.38ms p(90)=18.9µs   p(95)=23.84µs  p(99.9)=1.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.87ms min=15.83ms med=41.29ms max=329.86ms p(90)=50.98ms  p(95)=53.99ms  p(99.9)=70.15ms
     http_reqs......................: 142196  1165.337104/s
     iteration_duration.............: avg=42.21ms min=18.53ms med=41.6ms  max=355.29ms p(90)=51.29ms  p(95)=54.32ms  p(99.9)=71.02ms
     iterations.....................: 142096  1164.517575/s
     success_rate...................: 100.00% ✓ 142096      ✗ 0     
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

     checks.........................: 100.00% ✓ 416646      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.64µs   min=1µs     med=2.16µs  max=77.86ms  p(90)=4.6µs    p(95)=5.77µs   p(99.9)=42.46µs
     http_req_connecting............: avg=287ns    min=0s      med=0s      max=2.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.93ms  min=15.57ms med=42.56ms max=323.07ms p(90)=52.08ms  p(95)=55.25ms  p(99.9)=79.59ms
       { expected_response:true }...: avg=42.93ms  min=15.57ms med=42.56ms max=323.07ms p(90)=52.08ms  p(95)=55.25ms  p(99.9)=79.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138982
     http_req_receiving.............: avg=109.09µs min=28.81µs med=57.65µs max=187.43ms p(90)=128.27µs p(95)=199.49µs p(99.9)=3.69ms 
     http_req_sending...............: avg=39.57µs  min=5.2µs   med=9.85µs  max=194.31ms p(90)=23.38µs  p(95)=109.25µs p(99.9)=2.51ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.78ms  min=15.41ms med=42.43ms max=207.87ms p(90)=51.93ms  p(95)=55.09ms  p(99.9)=78.7ms 
     http_reqs......................: 138982  1138.934777/s
     iteration_duration.............: avg=43.2ms   min=16.47ms med=42.8ms  max=360.92ms p(90)=52.31ms  p(95)=55.47ms  p(99.9)=80.36ms
     iterations.....................: 138882  1138.115293/s
     success_rate...................: 100.00% ✓ 138882      ✗ 0     
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

     checks.........................: 100.00% ✓ 212541     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   696 kB/s
     http_req_blocked...............: avg=4.93µs   min=1.07µs  med=3.02µs  max=4.35ms   p(90)=4.7µs    p(95)=5.37µs   p(99.9)=55.03µs 
     http_req_connecting............: avg=1.59µs   min=0s      med=0s      max=4.31ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.37ms  min=18.5ms  med=82.53ms max=362.44ms p(90)=97.93ms  p(95)=105.31ms p(99.9)=203.99ms
       { expected_response:true }...: avg=84.37ms  min=18.5ms  med=82.53ms max=362.44ms p(90)=97.93ms  p(95)=105.31ms p(99.9)=203.99ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70947
     http_req_receiving.............: avg=160.28µs min=31.16µs med=77.67µs max=264.17ms p(90)=114.06µs p(95)=128.07µs p(99.9)=1.07ms  
     http_req_sending...............: avg=22.77µs  min=5.08µs  med=14µs    max=69.65ms  p(90)=20.73µs  p(95)=23.27µs  p(99.9)=775.14µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.19ms  min=18.34ms med=82.43ms max=227.95ms p(90)=97.79ms  p(95)=104.97ms p(99.9)=199.95ms
     http_reqs......................: 70947   579.729132/s
     iteration_duration.............: avg=84.7ms   min=29.39ms med=82.77ms max=373.96ms p(90)=98.16ms  p(95)=105.57ms p(99.9)=205.73ms
     iterations.....................: 70847   578.912002/s
     success_rate...................: 100.00% ✓ 70847      ✗ 0    
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

     checks.........................: 100.00% ✓ 143115     ✗ 0    
     data_received..................: 4.2 GB  34 MB/s
     data_sent......................: 57 MB   469 kB/s
     http_req_blocked...............: avg=5.74µs   min=1.22µs  med=3.29µs   max=4.23ms   p(90)=4.89µs   p(95)=5.47µs   p(99.9)=239.19µs
     http_req_connecting............: avg=2.27µs   min=0s      med=0s       max=4.19ms   p(90)=0s       p(95)=0s       p(99.9)=212.3µs 
     http_req_duration..............: avg=125.3ms  min=19.54ms med=123.43ms max=392.93ms p(90)=156.29ms p(95)=166.54ms p(99.9)=215.2ms 
       { expected_response:true }...: avg=125.3ms  min=19.54ms med=123.43ms max=392.93ms p(90)=156.29ms p(95)=166.54ms p(99.9)=215.2ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 47805
     http_req_receiving.............: avg=90.81µs  min=31.43µs med=85µs     max=25.66ms  p(90)=119.01µs p(95)=132.53µs p(99.9)=715.98µs
     http_req_sending...............: avg=27.96µs  min=5.86µs  med=15.85µs  max=123.38ms p(90)=21.76µs  p(95)=23.88µs  p(99.9)=585.61µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.18ms min=19.37ms med=123.32ms max=392.27ms p(90)=156.18ms p(95)=166.41ms p(99.9)=215.02ms
     http_reqs......................: 47805   390.192798/s
     iteration_duration.............: avg=125.8ms  min=47.55ms med=123.73ms max=405.6ms  p(90)=156.57ms p(95)=166.87ms p(99.9)=219.74ms
     iterations.....................: 47705   389.37658/s
     success_rate...................: 100.00% ✓ 47705      ✗ 0    
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

     checks.........................: 100.00% ✓ 94344      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=7.17µs   min=1.29µs  med=3.61µs   max=4.37ms   p(90)=5.18µs   p(95)=5.8µs    p(99.9)=1.52ms  
     http_req_connecting............: avg=3.34µs   min=0s      med=0s       max=4.33ms   p(90)=0s       p(95)=0s       p(99.9)=1.42ms  
     http_req_duration..............: avg=190.06ms min=18.94ms med=191.07ms max=648.8ms  p(90)=258.25ms p(95)=374.57ms p(99.9)=572.12ms
       { expected_response:true }...: avg=190.06ms min=18.94ms med=191.07ms max=648.8ms  p(90)=258.25ms p(95)=374.57ms p(99.9)=572.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31548
     http_req_receiving.............: avg=100.87µs min=33.76µs med=95.41µs  max=14.02ms  p(90)=129.35µs p(95)=143.62µs p(99.9)=673.75µs
     http_req_sending...............: avg=26.83µs  min=6.03µs  med=17.71µs  max=70.21ms  p(90)=23.02µs  p(95)=24.91µs  p(99.9)=518.21µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.93ms min=18.77ms med=190.96ms max=648.7ms  p(90)=258.12ms p(95)=374.47ms p(99.9)=571.98ms
     http_reqs......................: 31548   258.114719/s
     iteration_duration.............: avg=190.9ms  min=50.92ms med=191.49ms max=648.98ms p(90)=258.65ms p(95)=376.15ms p(99.9)=572.61ms
     iterations.....................: 31448   257.296554/s
     success_rate...................: 100.00% ✓ 31448      ✗ 0    
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

     checks.........................: 100.00% ✓ 85746      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   280 kB/s
     http_req_blocked...............: avg=8.34µs   min=1.27µs  med=3.35µs   max=6.38ms   p(90)=4.79µs   p(95)=5.37µs   p(99.9)=2.08ms  
     http_req_connecting............: avg=4.67µs   min=0s      med=0s       max=6.35ms   p(90)=0s       p(95)=0s       p(99.9)=1.98ms  
     http_req_duration..............: avg=209.03ms min=21.02ms med=214.92ms max=449.64ms p(90)=227.56ms p(95)=233.83ms p(99.9)=301.6ms 
       { expected_response:true }...: avg=209.03ms min=21.02ms med=214.92ms max=449.64ms p(90)=227.56ms p(95)=233.83ms p(99.9)=301.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 28682
     http_req_receiving.............: avg=106.34µs min=33.74µs med=92.06µs  max=159.2ms  p(90)=125.32µs p(95)=138.43µs p(99.9)=633.55µs
     http_req_sending...............: avg=38.55µs  min=6.12µs  med=16.94µs  max=104.65ms p(90)=22.03µs  p(95)=24.08µs  p(99.9)=3.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.88ms min=20.9ms  med=214.81ms max=446.26ms p(90)=227.44ms p(95)=233.72ms p(99.9)=301.34ms
     http_reqs......................: 28682   233.524819/s
     iteration_duration.............: avg=210ms    min=67.45ms med=215.2ms  max=464.38ms p(90)=227.86ms p(95)=234.19ms p(99.9)=315.27ms
     iterations.....................: 28582   232.710633/s
     success_rate...................: 100.00% ✓ 28582      ✗ 0    
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

