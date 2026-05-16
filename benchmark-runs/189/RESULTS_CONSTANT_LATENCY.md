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
| hive-router | v0.0.49 | 1,583 | 1,609 | 1,571 | 0.8% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,446 | 1,464 | 1,441 | 0.5% |  |
| cosmo | 0.307.0 | 1,165 | 1,180 | 1,156 | 0.7% | non-compatible response (2 across 1/9 runs) |
| grafbase | 0.53.3 | 1,120 | 1,145 | 1,113 | 1.1% |  |
| hive-gateway-router-runtime | 2.5.25 | 500 | 509 | 493 | 1.0% |  |
| apollo-router | v2.13.1 | 394 | 404 | 391 | 1.1% |  |
| hive-gateway | 2.5.25 | 237 | 242 | 234 | 1.1% |  |
| apollo-gateway | 2.13.3 | 231 | 233 | 231 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 579171      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.06µs  min=952ns   med=2µs     max=9.54ms   p(90)=3.75µs   p(95)=4.67µs   p(99.9)=30.43µs
     http_req_connecting............: avg=542ns   min=0s      med=0s      max=4.67ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.83ms min=14.29ms med=30.57ms max=331.08ms p(90)=36.66ms  p(95)=38.63ms  p(99.9)=58.39ms
       { expected_response:true }...: avg=30.83ms min=14.29ms med=30.57ms max=331.08ms p(90)=36.66ms  p(95)=38.63ms  p(99.9)=58.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193157
     http_req_receiving.............: avg=82.81µs min=27.61µs med=50.15µs max=129.59ms p(90)=101.27µs p(95)=151.95µs p(99.9)=2.46ms 
     http_req_sending...............: avg=36.06µs min=5.03µs  med=8.87µs  max=251.74ms p(90)=18.82µs  p(95)=66.15µs  p(99.9)=1.84ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.71ms min=14.22ms med=30.46ms max=322.25ms p(90)=36.54ms  p(95)=38.48ms  p(99.9)=57.09ms
     http_reqs......................: 193157  1583.135703/s
     iteration_duration.............: avg=31.07ms min=14.81ms med=30.78ms max=341.91ms p(90)=36.87ms  p(95)=38.84ms  p(99.9)=58.75ms
     iterations.....................: 193057  1582.316092/s
     success_rate...................: 100.00% ✓ 193057      ✗ 0     
     vus............................: 48      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 529152      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.11µs   min=952ns   med=2.05µs   max=4.02ms   p(90)=3.84µs  p(95)=4.72µs   p(99.9)=30.22µs
     http_req_connecting............: avg=584ns    min=0s      med=0s       max=3.98ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.76ms  min=14.82ms med=32.51ms  max=484.74ms p(90)=41.29ms p(95)=44.86ms  p(99.9)=88.05ms
       { expected_response:true }...: avg=33.76ms  min=14.82ms med=32.51ms  max=484.74ms p(90)=41.29ms p(95)=44.86ms  p(99.9)=88.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176484
     http_req_receiving.............: avg=749.11µs min=49.33µs med=113.23µs max=97.27ms  p(90)=2.18ms  p(95)=3.27ms   p(99.9)=14.89ms
     http_req_sending...............: avg=37.26µs  min=5.21µs  med=9.04µs   max=177ms    p(90)=19.78µs p(95)=105.67µs p(99.9)=2.26ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.98ms  min=14.58ms med=31.75ms  max=484.67ms p(90)=40.26ms p(95)=43.7ms   p(99.9)=84.28ms
     http_reqs......................: 176484  1446.311888/s
     iteration_duration.............: avg=34.01ms  min=15.11ms med=32.74ms  max=484.95ms p(90)=41.5ms  p(95)=45.09ms  p(99.9)=90.15ms
     iterations.....................: 176384  1445.492374/s
     success_rate...................: 100.00% ✓ 176384      ✗ 0     
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

     checks.........................: 100.00% ✓ 426525     ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.48µs   min=1.03µs  med=2.53µs  max=3.74ms   p(90)=4.23µs   p(95)=5µs      p(99.9)=37.34µs
     http_req_connecting............: avg=560ns    min=0s      med=0s      max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.96ms  min=15.9ms  med=41.38ms max=347.66ms p(90)=51.06ms  p(95)=54.12ms  p(99.9)=71.41ms
       { expected_response:true }...: avg=41.96ms  min=15.9ms  med=41.38ms max=347.66ms p(90)=51.06ms  p(95)=54.12ms  p(99.9)=71.41ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 142275
     http_req_receiving.............: avg=127.49µs min=27.57µs med=63.76µs max=294.51ms p(90)=109.45µs p(95)=135.39µs p(99.9)=2.03ms 
     http_req_sending...............: avg=25.16µs  min=5.35µs  med=10.86µs max=38.7ms   p(90)=18.77µs  p(95)=23.48µs  p(99.9)=1.13ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.8ms   min=15.8ms  med=41.28ms max=138.79ms p(90)=50.94ms  p(95)=53.97ms  p(99.9)=69.73ms
     http_reqs......................: 142275  1165.90008/s
     iteration_duration.............: avg=42.19ms  min=19.25ms med=41.59ms max=373.96ms p(90)=51.26ms  p(95)=54.32ms  p(99.9)=71.92ms
     iterations.....................: 142175  1165.08061/s
     success_rate...................: 100.00% ✓ 142175     ✗ 0     
     vus............................: 50      min=0        max=50  
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 409698      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 164 MB  1.3 MB/s
     http_req_blocked...............: avg=3.64µs  min=972ns   med=2.23µs  max=5.8ms    p(90)=4.68µs   p(95)=5.84µs   p(99.9)=42.22µs
     http_req_connecting............: avg=736ns   min=0s      med=0s      max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.64ms min=15.31ms med=43.18ms max=340ms    p(90)=53.07ms  p(95)=56.35ms  p(99.9)=80.78ms
       { expected_response:true }...: avg=43.64ms min=15.31ms med=43.18ms max=340ms    p(90)=53.07ms  p(95)=56.35ms  p(99.9)=80.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136666
     http_req_receiving.............: avg=96.75µs min=29.29µs med=60.48µs max=119.23ms p(90)=132.14µs p(95)=204.31µs p(99.9)=2.9ms  
     http_req_sending...............: avg=42.25µs min=5.28µs  med=9.91µs  max=241.51ms p(90)=23.7µs   p(95)=111.36µs p(99.9)=2.81ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.5ms  min=15.16ms med=43.06ms max=339.34ms p(90)=52.92ms  p(95)=56.19ms  p(99.9)=80.02ms
     http_reqs......................: 136666  1120.165045/s
     iteration_duration.............: avg=43.92ms min=18.46ms med=43.43ms max=360.75ms p(90)=53.3ms   p(95)=56.59ms  p(99.9)=81.22ms
     iterations.....................: 136566  1119.345408/s
     success_rate...................: 100.00% ✓ 136566      ✗ 0     
     vus............................: 36      min=0         max=50  
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

     checks.........................: 100.00% ✓ 183414     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 74 MB   601 kB/s
     http_req_blocked...............: avg=4.8µs   min=1.15µs  med=3.1µs   max=3.97ms   p(90)=4.62µs   p(95)=5.25µs   p(99.9)=51.18µs 
     http_req_connecting............: avg=1.47µs  min=0s      med=0s      max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=97.77ms min=21.2ms  med=95.23ms max=363.53ms p(90)=117.73ms p(95)=129.94ms p(99.9)=222.21ms
       { expected_response:true }...: avg=97.77ms min=21.2ms  med=95.23ms max=363.53ms p(90)=117.73ms p(95)=129.94ms p(99.9)=222.21ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61238
     http_req_receiving.............: avg=88.03µs min=31.82µs med=78.76µs max=65.01ms  p(90)=114.18µs p(95)=127.8µs  p(99.9)=907.07µs
     http_req_sending...............: avg=26.7µs  min=5.69µs  med=13.9µs  max=126.52ms p(90)=20.36µs  p(95)=22.68µs  p(99.9)=800.76µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.66ms min=21.04ms med=95.12ms max=362.52ms p(90)=117.62ms p(95)=129.8ms  p(99.9)=221.95ms
     http_reqs......................: 61238   500.080846/s
     iteration_duration.............: avg=98.15ms min=41.15ms med=95.48ms max=373.63ms p(90)=117.98ms p(95)=130.26ms p(99.9)=224.33ms
     iterations.....................: 61138   499.264228/s
     success_rate...................: 100.00% ✓ 61138      ✗ 0    
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

     checks.........................: 100.00% ✓ 144519     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   473 kB/s
     http_req_blocked...............: avg=5.71µs   min=1.14µs  med=3.44µs   max=3.99ms   p(90)=5µs      p(95)=5.63µs   p(99.9)=235.18µs
     http_req_connecting............: avg=2.07µs   min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=105.98µs
     http_req_duration..............: avg=124.11ms min=19.41ms med=122.16ms max=399.3ms  p(90)=154.98ms p(95)=165.05ms p(99.9)=209.86ms
       { expected_response:true }...: avg=124.11ms min=19.41ms med=122.16ms max=399.3ms  p(90)=154.98ms p(95)=165.05ms p(99.9)=209.86ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48273
     http_req_receiving.............: avg=92.81µs  min=31.87µs med=86.78µs  max=22.58ms  p(90)=120.15µs p(95)=133.91µs p(99.9)=799.24µs
     http_req_sending...............: avg=29.2µs   min=6.01µs  med=15.97µs  max=159.48ms p(90)=21.89µs  p(95)=24.06µs  p(99.9)=600.77µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.99ms min=19.25ms med=122.04ms max=393.77ms p(90)=154.86ms p(95)=164.93ms p(99.9)=209.19ms
     http_reqs......................: 48273   394.041429/s
     iteration_duration.............: avg=124.59ms min=40.27ms med=122.46ms max=407.65ms p(90)=155.26ms p(95)=165.34ms p(99.9)=214.29ms
     iterations.....................: 48173   393.225152/s
     success_rate...................: 100.00% ✓ 48173      ✗ 0    
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

     checks.........................: 100.00% ✓ 86958      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=7.42µs   min=1.27µs  med=3.5µs    max=4.35ms   p(90)=4.98µs   p(95)=5.59µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=3.7µs    min=0s      med=0s       max=4.3ms    p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=206.26ms min=18.99ms med=193.68ms max=567.47ms p(90)=245.69ms p(95)=401.57ms p(99.9)=511.45ms
       { expected_response:true }...: avg=206.26ms min=18.99ms med=193.68ms max=567.47ms p(90)=245.69ms p(95)=401.57ms p(99.9)=511.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29086
     http_req_receiving.............: avg=101.43µs min=34.66µs med=96.65µs  max=16.03ms  p(90)=129.73µs p(95)=143.27µs p(99.9)=774.59µs
     http_req_sending...............: avg=43.29µs  min=6.23µs  med=17.25µs  max=186.25ms p(90)=22.38µs  p(95)=24.35µs  p(99.9)=744.23µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.12ms min=18.84ms med=193.56ms max=567.35ms p(90)=245.55ms p(95)=401.34ms p(99.9)=511.36ms
     http_reqs......................: 29086   237.495375/s
     iteration_duration.............: avg=207.21ms min=42.85ms med=194.11ms max=567.76ms p(90)=246.18ms p(95)=402.29ms p(99.9)=511.74ms
     iterations.....................: 28986   236.678847/s
     success_rate...................: 100.00% ✓ 28986      ✗ 0    
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

     checks.........................: 100.00% ✓ 85200      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   279 kB/s
     http_req_blocked...............: avg=7.94µs   min=1.25µs  med=3.42µs   max=4.75ms   p(90)=4.78µs   p(95)=5.35µs   p(99.9)=2.1ms   
     http_req_connecting............: avg=4.32µs   min=0s      med=0s       max=4.71ms   p(90)=0s       p(95)=0s       p(99.9)=2.07ms  
     http_req_duration..............: avg=210.48ms min=21.82ms med=216.58ms max=436.69ms p(90)=228.97ms p(95)=235.06ms p(99.9)=303.59ms
       { expected_response:true }...: avg=210.48ms min=21.82ms med=216.58ms max=436.69ms p(90)=228.97ms p(95)=235.06ms p(99.9)=303.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28500
     http_req_receiving.............: avg=111.41µs min=35.1µs  med=92.54µs  max=260.97ms p(90)=126.16µs p(95)=139.42µs p(99.9)=643.47µs
     http_req_sending...............: avg=30.23µs  min=5.88µs  med=16.5µs   max=92.1ms   p(90)=21.79µs  p(95)=23.76µs  p(99.9)=539.16µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.34ms min=21.7ms  med=216.46ms max=415.96ms p(90)=228.85ms p(95)=234.93ms p(99.9)=303.05ms
     http_reqs......................: 28500   231.921975/s
     iteration_duration.............: avg=211.42ms min=68.06ms med=216.86ms max=444.87ms p(90)=229.25ms p(95)=235.34ms p(99.9)=306.8ms 
     iterations.....................: 28400   231.108213/s
     success_rate...................: 100.00% ✓ 28400      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

