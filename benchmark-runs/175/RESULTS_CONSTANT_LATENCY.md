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
| hive-router | v0.0.49 | 1,596 | 1,617 | 1,591 | 0.5% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,454 | 1,463 | 1,445 | 0.4% |  |
| cosmo | 0.307.0 | 1,167 | 1,182 | 1,160 | 0.6% | non-compatible response (1 across 1/9 runs) |
| grafbase | 0.53.3 | 1,150 | 1,164 | 1,145 | 0.5% |  |
| hive-gateway-router-runtime | 2.5.25 | 508 | 521 | 506 | 1.1% |  |
| apollo-router | v2.13.1 | 394 | 405 | 391 | 1.2% |  |
| hive-gateway | 2.5.25 | 243 | 247 | 241 | 0.9% |  |
| apollo-gateway | 2.13.3 | 236 | 237 | 233 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 584013      ✗ 0     
     data_received..................: 17 GB   140 MB/s
     data_sent......................: 234 MB  1.9 MB/s
     http_req_blocked...............: avg=3.13µs   min=972ns   med=2.07µs  max=3.8ms    p(90)=3.97µs   p(95)=4.88µs   p(99.9)=32.88µs
     http_req_connecting............: avg=560ns    min=0s      med=0s      max=3.75ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.57ms  min=13.37ms med=30.34ms max=324.24ms p(90)=36.23ms  p(95)=38.18ms  p(99.9)=57.75ms
       { expected_response:true }...: avg=30.57ms  min=13.37ms med=30.34ms max=324.24ms p(90)=36.23ms  p(95)=38.18ms  p(99.9)=57.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194771
     http_req_receiving.............: avg=102.98µs min=26.81µs med=50.77µs max=252.84ms p(90)=104.42µs p(95)=152.48µs p(99.9)=2.72ms 
     http_req_sending...............: avg=34.4µs   min=5.19µs  med=9.17µs  max=182.06ms p(90)=20.36µs  p(95)=67.46µs  p(99.9)=1.94ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.44ms  min=13.25ms med=30.24ms max=236.46ms p(90)=36.11ms  p(95)=38.03ms  p(99.9)=56.21ms
     http_reqs......................: 194771  1596.847412/s
     iteration_duration.............: avg=30.81ms  min=13.67ms med=30.57ms max=367.44ms p(90)=36.45ms  p(95)=38.39ms  p(99.9)=58.15ms
     iterations.....................: 194671  1596.027553/s
     success_rate...................: 100.00% ✓ 194671      ✗ 0     
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

     checks.........................: 100.00% ✓ 531933      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 213 MB  1.7 MB/s
     http_req_blocked...............: avg=3.02µs   min=972ns   med=1.97µs   max=4.46ms   p(90)=3.67µs  p(95)=4.48µs   p(99.9)=32.91µs
     http_req_connecting............: avg=595ns    min=0s      med=0s       max=4.43ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.56ms  min=14.15ms med=32.32ms  max=512.92ms p(90)=41.03ms p(95)=44.62ms  p(99.9)=82.36ms
       { expected_response:true }...: avg=33.56ms  min=14.15ms med=32.32ms  max=512.92ms p(90)=41.03ms p(95)=44.62ms  p(99.9)=82.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177411
     http_req_receiving.............: avg=809.61µs min=50.99µs med=112.18µs max=305.76ms p(90)=2.31ms  p(95)=3.53ms   p(99.9)=16.84ms
     http_req_sending...............: avg=34.31µs  min=4.91µs  med=8.82µs   max=26.97ms  p(90)=19.81µs p(95)=100.22µs p(99.9)=2.35ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.71ms  min=14.01ms med=31.52ms  max=512.69ms p(90)=39.93ms p(95)=43.32ms  p(99.9)=80.87ms
     http_reqs......................: 177411  1454.070417/s
     iteration_duration.............: avg=33.8ms   min=14.33ms med=32.54ms  max=513.11ms p(90)=41.25ms p(95)=44.84ms  p(99.9)=83.09ms
     iterations.....................: 177311  1453.250811/s
     success_rate...................: 100.00% ✓ 177311      ✗ 0     
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

     checks.........................: 100.00% ✓ 427290      ✗ 0     
     data_received..................: 13 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=2.89µs  min=992ns   med=2.2µs   max=3.1ms    p(90)=3.85µs   p(95)=4.61µs   p(99.9)=36.55µs
     http_req_connecting............: avg=271ns   min=0s      med=0s      max=2.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.88ms min=15.46ms med=41.33ms max=348.52ms p(90)=50.92ms  p(95)=53.91ms  p(99.9)=71.03ms
       { expected_response:true }...: avg=41.88ms min=15.46ms med=41.33ms max=348.52ms p(90)=50.92ms  p(95)=53.91ms  p(99.9)=71.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142530
     http_req_receiving.............: avg=84.05µs min=28.51µs med=62.02µs max=80.79ms  p(90)=107.49µs p(95)=133.04µs p(99.9)=1.55ms 
     http_req_sending...............: avg=28.93µs min=5.19µs  med=10.59µs max=197.52ms p(90)=18.82µs  p(95)=23.65µs  p(99.9)=1.28ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.77ms min=15.35ms med=41.23ms max=348.24ms p(90)=50.79ms  p(95)=53.78ms  p(99.9)=70.38ms
     http_reqs......................: 142530  1167.846487/s
     iteration_duration.............: avg=42.12ms min=15.7ms  med=41.53ms max=358.15ms p(90)=51.12ms  p(95)=54.11ms  p(99.9)=71.58ms
     iterations.....................: 142430  1167.027118/s
     success_rate...................: 100.00% ✓ 142430      ✗ 0     
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

     checks.........................: 100.00% ✓ 420933      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.41µs  min=1µs     med=2.24µs  max=10.17ms  p(90)=4.63µs   p(95)=5.75µs   p(99.9)=46.77µs
     http_req_connecting............: avg=458ns   min=0s      med=0s      max=3.19ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.48ms min=15.6ms  med=42.06ms max=349.3ms  p(90)=51.61ms  p(95)=54.83ms  p(99.9)=78.79ms
       { expected_response:true }...: avg=42.48ms min=15.6ms  med=42.06ms max=349.3ms  p(90)=51.61ms  p(95)=54.83ms  p(99.9)=78.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140411
     http_req_receiving.............: avg=95.41µs min=29.08µs med=58.55µs max=88.18ms  p(90)=130.19µs p(95)=196.53µs p(99.9)=3.1ms  
     http_req_sending...............: avg=38.58µs min=5.21µs  med=9.76µs  max=166.57ms p(90)=23.96µs  p(95)=108.16µs p(99.9)=2.26ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.35ms min=15.51ms med=41.94ms max=320.91ms p(90)=51.47ms  p(95)=54.67ms  p(99.9)=78.4ms 
     http_reqs......................: 140411  1150.542966/s
     iteration_duration.............: avg=42.76ms min=15.85ms med=42.3ms  max=364.38ms p(90)=51.85ms  p(95)=55.07ms  p(99.9)=79.84ms
     iterations.....................: 140311  1149.723555/s
     success_rate...................: 100.00% ✓ 140311      ✗ 0     
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

     checks.........................: 100.00% ✓ 186450     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 75 MB   611 kB/s
     http_req_blocked...............: avg=4.84µs   min=1.05µs  med=2.77µs  max=7.91ms   p(90)=4.3µs    p(95)=4.93µs   p(99.9)=123.56µs
     http_req_connecting............: avg=1.62µs   min=0s      med=0s      max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.18ms  min=18.9ms  med=93.91ms max=357.92ms p(90)=114.81ms p(95)=125.43ms p(99.9)=226.4ms 
       { expected_response:true }...: avg=96.18ms  min=18.9ms  med=93.91ms max=357.92ms p(90)=114.81ms p(95)=125.43ms p(99.9)=226.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 62250
     http_req_receiving.............: avg=108.49µs min=30.43µs med=77.56µs max=155.82ms p(90)=114.12µs p(95)=127.37µs p(99.9)=900.32µs
     http_req_sending...............: avg=36.35µs  min=5.64µs  med=13.53µs max=232.44ms p(90)=20.37µs  p(95)=22.6µs   p(99.9)=751.42µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.04ms  min=18.68ms med=93.81ms max=280.53ms p(90)=114.7ms  p(95)=125.28ms p(99.9)=223.52ms
     http_reqs......................: 62250   508.432599/s
     iteration_duration.............: avg=96.55ms  min=37.58ms med=94.15ms max=367.67ms p(90)=115.05ms p(95)=125.77ms p(99.9)=230.94ms
     iterations.....................: 62150   507.615839/s
     success_rate...................: 100.00% ✓ 62150      ✗ 0    
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

     checks.........................: 100.00% ✓ 144696     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   474 kB/s
     http_req_blocked...............: avg=5.55µs   min=1.19µs  med=3.14µs   max=4.16ms   p(90)=4.63µs   p(95)=5.25µs   p(99.9)=199.03µs
     http_req_connecting............: avg=2.16µs   min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=105.2µs 
     http_req_duration..............: avg=123.96ms min=18.8ms  med=122.2ms  max=385.94ms p(90)=154.19ms p(95)=164.6ms  p(99.9)=209.49ms
       { expected_response:true }...: avg=123.96ms min=18.8ms  med=122.2ms  max=385.94ms p(90)=154.19ms p(95)=164.6ms  p(99.9)=209.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48332
     http_req_receiving.............: avg=90.88µs  min=31.11µs med=85.48µs  max=37.2ms   p(90)=117.42µs p(95)=129.82µs p(99.9)=648.09µs
     http_req_sending...............: avg=33.26µs  min=5.94µs  med=16.25µs  max=183.2ms  p(90)=21.72µs  p(95)=23.87µs  p(99.9)=608.28µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.84ms min=18.64ms med=122.08ms max=385.37ms p(90)=154.07ms p(95)=164.48ms p(99.9)=209.09ms
     http_reqs......................: 48332   394.583743/s
     iteration_duration.............: avg=124.44ms min=42.49ms med=122.51ms max=396.03ms p(90)=154.48ms p(95)=164.89ms p(99.9)=211.69ms
     iterations.....................: 48232   393.76734/s
     success_rate...................: 100.00% ✓ 48232      ✗ 0    
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

     checks.........................: 100.00% ✓ 88983      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   292 kB/s
     http_req_blocked...............: avg=7.23µs   min=1.22µs  med=3.38µs   max=4.1ms    p(90)=4.85µs   p(95)=5.48µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=3.62µs   min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=201.48ms min=19.17ms med=188.81ms max=564.86ms p(90)=239.25ms p(95)=395.69ms p(99.9)=521.01ms
       { expected_response:true }...: avg=201.48ms min=19.17ms med=188.81ms max=564.86ms p(90)=239.25ms p(95)=395.69ms p(99.9)=521.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29761
     http_req_receiving.............: avg=106.24µs min=34.6µs  med=99.19µs  max=63.01ms  p(90)=131.83µs p(95)=145.44µs p(99.9)=741.54µs
     http_req_sending...............: avg=31.6µs   min=6.18µs  med=18.07µs  max=81.39ms  p(90)=23.18µs  p(95)=25.07µs  p(99.9)=665.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.34ms min=19.06ms med=188.67ms max=564.75ms p(90)=239.11ms p(95)=395.56ms p(99.9)=520.86ms
     http_reqs......................: 29761   243.141192/s
     iteration_duration.............: avg=202.4ms  min=61.35ms med=189.23ms max=565.14ms p(90)=239.67ms p(95)=396.75ms p(99.9)=521.43ms
     iterations.....................: 29661   242.324213/s
     success_rate...................: 100.00% ✓ 29661      ✗ 0    
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

     checks.........................: 100.00% ✓ 86940      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   284 kB/s
     http_req_blocked...............: avg=6.47µs   min=1.25µs  med=3.26µs   max=3.89ms   p(90)=4.71µs   p(95)=5.33µs   p(99.9)=1.26ms  
     http_req_connecting............: avg=2.79µs   min=0s      med=0s       max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=1.07ms  
     http_req_duration..............: avg=206.23ms min=21.33ms med=194.76ms max=453.23ms p(90)=255.5ms  p(95)=261.97ms p(99.9)=335.67ms
       { expected_response:true }...: avg=206.23ms min=21.33ms med=194.76ms max=453.23ms p(90)=255.5ms  p(95)=261.97ms p(99.9)=335.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29080
     http_req_receiving.............: avg=100.27µs min=34.94µs med=92.87µs  max=49.51ms  p(90)=126.6µs  p(95)=140.15µs p(99.9)=770.55µs
     http_req_sending...............: avg=29.88µs  min=6.22µs  med=17.19µs  max=128.61ms p(90)=22.54µs  p(95)=24.58µs  p(99.9)=877.92µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.1ms  min=21.16ms med=194.65ms max=452.25ms p(90)=255.38ms p(95)=261.86ms p(99.9)=335.53ms
     http_reqs......................: 29080   236.65439/s
     iteration_duration.............: avg=207.17ms min=59.82ms med=195.05ms max=460.13ms p(90)=255.83ms p(95)=262.29ms p(99.9)=337.83ms
     iterations.....................: 28980   235.840585/s
     success_rate...................: 100.00% ✓ 28980      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

