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
| hive-router | v0.0.49 | 1,579 | 1,608 | 1,576 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,460 | 1,473 | 1,444 | 0.6% |  |
| cosmo | 0.307.0 | 1,170 | 1,179 | 1,158 | 0.7% | non-compatible response (6 across 4/9 runs) |
| grafbase | 0.53.3 | 1,128 | 1,152 | 1,120 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.25 | 495 | 508 | 492 | 1.1% |  |
| apollo-router | v2.13.1 | 395 | 405 | 391 | 1.2% |  |
| hive-gateway | 2.5.25 | 236 | 240 | 233 | 1.0% |  |
| apollo-gateway | 2.13.3 | 233 | 235 | 233 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 577878      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=4.5µs   min=1µs     med=2.24µs  max=10.36ms  p(90)=4.19µs   p(95)=5.14µs  p(99.9)=38.42µs
     http_req_connecting............: avg=1.68µs  min=0s      med=0s      max=10.32ms  p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=30.9ms  min=13.49ms med=30.63ms max=327.13ms p(90)=36.75ms  p(95)=38.62ms p(99.9)=56.7ms 
       { expected_response:true }...: avg=30.9ms  min=13.49ms med=30.63ms max=327.13ms p(90)=36.75ms  p(95)=38.62ms p(99.9)=56.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 192726
     http_req_receiving.............: avg=82.62µs min=26.89µs med=52.53µs max=78.28ms  p(90)=103.81µs p(95)=145.5µs p(99.9)=2.27ms 
     http_req_sending...............: avg=34.46µs min=5.02µs  med=9.39µs  max=185.82ms p(90)=19.63µs  p(95)=32.99µs p(99.9)=1.72ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.78ms min=13.4ms  med=30.53ms max=325.95ms p(90)=36.63ms  p(95)=38.49ms p(99.9)=54.64ms
     http_reqs......................: 192726  1579.414481/s
     iteration_duration.............: avg=31.14ms min=13.67ms med=30.85ms max=356.29ms p(90)=36.97ms  p(95)=38.83ms p(99.9)=57.06ms
     iterations.....................: 192626  1578.594968/s
     success_rate...................: 100.00% ✓ 192626      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 534468      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 214 MB  1.8 MB/s
     http_req_blocked...............: avg=2.84µs   min=1µs     med=2.04µs   max=5.84ms   p(90)=3.79µs  p(95)=4.73µs   p(99.9)=31.79µs
     http_req_connecting............: avg=284ns    min=0s      med=0s       max=2.66ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.42ms  min=14.05ms med=32.63ms  max=343.13ms p(90)=41.02ms p(95)=44.01ms  p(99.9)=94.37ms
       { expected_response:true }...: avg=33.42ms  min=14.05ms med=32.63ms  max=343.13ms p(90)=41.02ms p(95)=44.01ms  p(99.9)=94.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178256
     http_req_receiving.............: avg=769.68µs min=50.75µs med=111.21µs max=106.04ms p(90)=2.21ms  p(95)=3.42ms   p(99.9)=16.1ms 
     http_req_sending...............: avg=36.06µs  min=5.06µs  med=8.83µs   max=66.83ms  p(90)=19.98µs p(95)=101.73µs p(99.9)=2.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.62ms  min=13.95ms med=31.84ms  max=322.68ms p(90)=39.97ms p(95)=42.83ms  p(99.9)=93.05ms
     http_reqs......................: 178256  1460.094762/s
     iteration_duration.............: avg=33.67ms  min=14.25ms med=32.85ms  max=350.44ms p(90)=41.24ms p(95)=44.23ms  p(99.9)=94.82ms
     iterations.....................: 178156  1459.275662/s
     success_rate...................: 100.00% ✓ 178156      ✗ 0     
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

     checks.........................: 100.00% ✓ 428154      ✗ 0     
     data_received..................: 13 GB   102 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.5µs   min=1.08µs  med=2.38µs  max=4.1ms    p(90)=4.05µs   p(95)=4.82µs   p(99.9)=38.08µs
     http_req_connecting............: avg=746ns   min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.79ms min=16.39ms med=41.18ms max=334.46ms p(90)=50.73ms  p(95)=53.76ms  p(99.9)=70.3ms 
       { expected_response:true }...: avg=41.79ms min=16.39ms med=41.18ms max=334.46ms p(90)=50.73ms  p(95)=53.76ms  p(99.9)=70.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142818
     http_req_receiving.............: avg=83.15µs min=28.2µs  med=62.18µs max=148.73ms p(90)=106.64µs p(95)=132.93µs p(99.9)=1.61ms 
     http_req_sending...............: avg=25.14µs min=5.1µs   med=10.41µs max=55.49ms  p(90)=18.25µs  p(95)=23.04µs  p(99.9)=1.11ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.68ms min=16.35ms med=41.07ms max=333.77ms p(90)=50.62ms  p(95)=53.65ms  p(99.9)=69.89ms
     http_reqs......................: 142818  1170.31102/s
     iteration_duration.............: avg=42.03ms min=16.58ms med=41.39ms max=352.47ms p(90)=50.93ms  p(95)=53.96ms  p(99.9)=70.97ms
     iterations.....................: 142718  1169.491578/s
     success_rate...................: 100.00% ✓ 142718      ✗ 0     
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

     checks.........................: 100.00% ✓ 412944      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.72µs   min=982ns   med=2.25µs  max=4.43ms   p(90)=4.72µs   p(95)=5.94µs   p(99.9)=47.49µs
     http_req_connecting............: avg=789ns    min=0s      med=0s      max=4.38ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.31ms  min=16.56ms med=42.91ms max=355.92ms p(90)=52.57ms  p(95)=55.68ms  p(99.9)=77.41ms
       { expected_response:true }...: avg=43.31ms  min=16.56ms med=42.91ms max=355.92ms p(90)=52.57ms  p(95)=55.68ms  p(99.9)=77.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137748
     http_req_receiving.............: avg=140.86µs min=28.39µs med=59.35µs max=293.37ms p(90)=132.47µs p(95)=206.85µs p(99.9)=3.83ms 
     http_req_sending...............: avg=35.94µs  min=5.08µs  med=9.8µs   max=45.25ms  p(90)=23.83µs  p(95)=109.42µs p(99.9)=2.36ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.14ms  min=16.39ms med=42.79ms max=104.6ms  p(90)=52.42ms  p(95)=55.5ms   p(99.9)=75.18ms
     http_reqs......................: 137748  1128.800582/s
     iteration_duration.............: avg=43.58ms  min=16.79ms med=43.15ms max=369.75ms p(90)=52.8ms   p(95)=55.91ms  p(99.9)=77.86ms
     iterations.....................: 137648  1127.981114/s
     success_rate...................: 100.00% ✓ 137648      ✗ 0     
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

     checks.........................: 100.00% ✓ 181479     ✗ 0    
     data_received..................: 5.3 GB  43 MB/s
     data_sent......................: 73 MB   595 kB/s
     http_req_blocked...............: avg=5.21µs  min=1.13µs  med=3.24µs  max=4.61ms   p(90)=4.88µs   p(95)=5.53µs   p(99.9)=52.44µs 
     http_req_connecting............: avg=1.73µs  min=0s      med=0s      max=4.56ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=98.82ms min=21.5ms  med=96.38ms max=357.12ms p(90)=118.66ms p(95)=128.55ms p(99.9)=230.98ms
       { expected_response:true }...: avg=98.82ms min=21.5ms  med=96.38ms max=357.12ms p(90)=118.66ms p(95)=128.55ms p(99.9)=230.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60593
     http_req_receiving.............: avg=92.62µs min=31.44µs med=80.17µs max=125.65ms p(90)=116.14µs p(95)=129.53µs p(99.9)=933.08µs
     http_req_sending...............: avg=31.49µs min=5.63µs  med=14.47µs max=148.75ms p(90)=21.27µs  p(95)=23.53µs  p(99.9)=636.24µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.7ms  min=21.29ms med=96.28ms max=353.94ms p(90)=118.54ms p(95)=128.42ms p(99.9)=230.33ms
     http_reqs......................: 60593   495.054926/s
     iteration_duration.............: avg=99.2ms  min=44.12ms med=96.65ms max=393.52ms p(90)=118.9ms  p(95)=128.9ms  p(99.9)=233.22ms
     iterations.....................: 60493   494.237909/s
     success_rate...................: 100.00% ✓ 60493      ✗ 0    
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

     checks.........................: 100.00% ✓ 144972     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   475 kB/s
     http_req_blocked...............: avg=5.76µs   min=1.16µs  med=3.4µs    max=4.1ms    p(90)=5.03µs   p(95)=5.69µs   p(99.9)=291.13µs
     http_req_connecting............: avg=2.05µs   min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=100.09µs
     http_req_duration..............: avg=123.69ms min=21.71ms med=121.7ms  max=374.98ms p(90)=154.1ms  p(95)=164.17ms p(99.9)=214.29ms
       { expected_response:true }...: avg=123.69ms min=21.71ms med=121.7ms  max=374.98ms p(90)=154.1ms  p(95)=164.17ms p(99.9)=214.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48424
     http_req_receiving.............: avg=92.67µs  min=30.39µs med=85.65µs  max=102.52ms p(90)=119.59µs p(95)=132.73µs p(99.9)=713.93µs
     http_req_sending...............: avg=29.8µs   min=5.79µs  med=16.19µs  max=216.9ms  p(90)=22.18µs  p(95)=24.36µs  p(99.9)=632.83µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.57ms min=21.5ms  med=121.59ms max=373.31ms p(90)=153.96ms p(95)=164.04ms p(99.9)=213.1ms 
     http_reqs......................: 48424   395.295256/s
     iteration_duration.............: avg=124.19ms min=50.86ms med=122.01ms max=414ms    p(90)=154.37ms p(95)=164.47ms p(99.9)=219.63ms
     iterations.....................: 48324   394.478935/s
     success_rate...................: 100.00% ✓ 48324      ✗ 0    
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

     checks.........................: 100.00% ✓ 86574      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   284 kB/s
     http_req_blocked...............: avg=7.24µs   min=1.25µs  med=3.49µs   max=4.15ms   p(90)=4.91µs   p(95)=5.52µs   p(99.9)=1.9ms   
     http_req_connecting............: avg=3.58µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=1.86ms  
     http_req_duration..............: avg=207.15ms min=18.82ms med=194.02ms max=579.34ms p(90)=256.11ms p(95)=412.34ms p(99.9)=550.85ms
       { expected_response:true }...: avg=207.15ms min=18.82ms med=194.02ms max=579.34ms p(90)=256.11ms p(95)=412.34ms p(99.9)=550.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28958
     http_req_receiving.............: avg=137.64µs min=33.5µs  med=92.26µs  max=83.03ms  p(90)=125.26µs p(95)=139.43µs p(99.9)=17.7ms  
     http_req_sending...............: avg=27.69µs  min=5.95µs  med=17.21µs  max=85.71ms  p(90)=22.25µs  p(95)=24.05µs  p(99.9)=524.17µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.98ms min=18.67ms med=193.89ms max=579.22ms p(90)=255.97ms p(95)=412.19ms p(99.9)=550.73ms
     http_reqs......................: 28958   236.485474/s
     iteration_duration.............: avg=208.09ms min=44.02ms med=194.54ms max=579.59ms p(90)=256.61ms p(95)=413.03ms p(99.9)=551.1ms 
     iterations.....................: 28858   235.668824/s
     success_rate...................: 100.00% ✓ 28858      ✗ 0    
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

     checks.........................: 100.00% ✓ 85869      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   281 kB/s
     http_req_blocked...............: avg=6.29µs   min=1.31µs  med=3.51µs   max=3.62ms   p(90)=4.96µs   p(95)=5.56µs   p(99.9)=1.17ms  
     http_req_connecting............: avg=2.58µs   min=0s      med=0s       max=3.58ms   p(90)=0s       p(95)=0s       p(99.9)=1.15ms  
     http_req_duration..............: avg=208.79ms min=23.75ms med=208.25ms max=443.65ms p(90)=222.69ms p(95)=229.19ms p(99.9)=296.96ms
       { expected_response:true }...: avg=208.79ms min=23.75ms med=208.25ms max=443.65ms p(90)=222.69ms p(95)=229.19ms p(99.9)=296.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28723
     http_req_receiving.............: avg=99.48µs  min=33.92µs med=92.3µs   max=65.89ms  p(90)=125.46µs p(95)=139.46µs p(99.9)=601.01µs
     http_req_sending...............: avg=44.37µs  min=6.07µs  med=17.37µs  max=218.64ms p(90)=22.54µs  p(95)=24.43µs  p(99.9)=943.28µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.64ms min=23.63ms med=208.13ms max=413.22ms p(90)=222.56ms p(95)=229.07ms p(99.9)=296.19ms
     http_reqs......................: 28723   233.75511/s
     iteration_duration.............: avg=209.76ms min=68.11ms med=208.58ms max=456.06ms p(90)=222.98ms p(95)=229.52ms p(99.9)=312.37ms
     iterations.....................: 28623   232.941284/s
     success_rate...................: 100.00% ✓ 28623      ✗ 0    
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

