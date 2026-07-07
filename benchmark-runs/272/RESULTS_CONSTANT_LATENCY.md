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
| fusion-nightly | 16.5.0-p.1 | 1,857 | 1,899 | 1,841 | 1.0% |  |
| hive-router | v0.0.78 | 1,839 | 1,909 | 1,833 | 1.4% |  |
| fusion | 16.4.0 | 1,826 | 1,877 | 1,820 | 1.0% |  |
| fusion-nightly-net11 | 16.5.0-p.1 | 1,810 | 1,855 | 1,802 | 1.0% |  |
| fusion-nightly-fed | 16.5.0-p.1 | 1,740 | 1,784 | 1,729 | 1.0% |  |
| grafbase | 0.53.5 | 1,321 | 1,342 | 1,318 | 0.6% |  |
| cosmo | 0.329.0 | 1,213 | 1,258 | 1,207 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.2 | 568 | 585 | 562 | 1.3% |  |
| apollo-router | v2.16.0 | 434 | 454 | 433 | 1.9% |  |
| apollo-gateway | 2.14.2 | 268 | 272 | 265 | 0.7% |  |
| hive-gateway | 2.10.2 | 265 | 271 | 264 | 1.0% |  |
| feddi | 77271dc84a06 | 22 | 23 | 21 | 3.2% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 679068      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=2.8µs    min=841ns   med=2.02µs  max=3.31ms   p(90)=3.8µs    p(95)=4.52µs  p(99.9)=29.94µs
     http_req_connecting............: avg=363ns    min=0s      med=0s      max=3.28ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.27ms  min=16.97ms med=25.69ms max=311.48ms p(90)=30.68ms  p(95)=32.53ms p(99.9)=49.03ms
       { expected_response:true }...: avg=26.27ms  min=16.97ms med=25.69ms max=311.48ms p(90)=30.68ms  p(95)=32.53ms p(99.9)=49.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226456
     http_req_receiving.............: avg=315.98µs min=50.42µs med=96.26µs max=174.7ms  p(90)=808.35µs p(95)=1.29ms  p(99.9)=7.71ms 
     http_req_sending...............: avg=31.81µs  min=4.6µs   med=8.66µs  max=214.55ms p(90)=19.12µs  p(95)=32.34µs p(99.9)=1.58ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.92ms  min=16.84ms med=25.36ms max=310.71ms p(90)=30.26ms  p(95)=32.06ms p(99.9)=47.71ms
     http_reqs......................: 226456  1857.133977/s
     iteration_duration.............: avg=26.48ms  min=17.19ms med=25.89ms max=321.88ms p(90)=30.89ms  p(95)=32.73ms p(99.9)=49.38ms
     iterations.....................: 226356  1856.313891/s
     success_rate...................: 100.00% ✓ 226356      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 672624      ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 270 MB  2.2 MB/s
     http_req_blocked...............: avg=2.86µs  min=841ns   med=2µs     max=5.89ms   p(90)=3.63µs  p(95)=4.33µs   p(99.9)=30.06µs
     http_req_connecting............: avg=450ns   min=0s      med=0s      max=3.88ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.54ms min=17.83ms med=26.1ms  max=306.45ms p(90)=30.34ms p(95)=31.77ms  p(99.9)=47.7ms 
       { expected_response:true }...: avg=26.54ms min=17.83ms med=26.1ms  max=306.45ms p(90)=30.34ms p(95)=31.77ms  p(99.9)=47.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 224308
     http_req_receiving.............: avg=73.43µs min=26.2µs  med=48.73µs max=154.93ms p(90)=91.77µs p(95)=118.72µs p(99.9)=2.24ms 
     http_req_sending...............: avg=30.62µs min=3.98µs  med=8.89µs  max=166.81ms p(90)=17.88µs p(95)=24.96µs  p(99.9)=1.36ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.43ms min=17.72ms med=26.01ms max=306.22ms p(90)=30.23ms p(95)=31.64ms  p(99.9)=46.46ms
     http_reqs......................: 224308  1839.195216/s
     iteration_duration.............: avg=26.75ms min=18.26ms med=26.29ms max=318.37ms p(90)=30.54ms p(95)=31.97ms  p(99.9)=48.11ms
     iterations.....................: 224208  1838.375274/s
     success_rate...................: 100.00% ✓ 224208      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.4.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 667719      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 268 MB  2.2 MB/s
     http_req_blocked...............: avg=3.49µs   min=1.06µs  med=2.69µs   max=3.47ms   p(90)=4.31µs   p(95)=5.02µs  p(99.9)=35.29µs
     http_req_connecting............: avg=429ns    min=0s      med=0s       max=3.43ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.72ms  min=17.59ms med=26.1ms   max=304.67ms p(90)=31.35ms  p(95)=33.3ms  p(99.9)=50.93ms
       { expected_response:true }...: avg=26.72ms  min=17.59ms med=26.1ms   max=304.67ms p(90)=31.35ms  p(95)=33.3ms  p(99.9)=50.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 222673
     http_req_receiving.............: avg=348.77µs min=51.32µs med=105.67µs max=74.24ms  p(90)=886.15µs p(95)=1.38ms  p(99.9)=8.23ms 
     http_req_sending...............: avg=33.68µs  min=4.93µs  med=10.2µs   max=181.73ms p(90)=19.03µs  p(95)=29.51µs p(99.9)=1.58ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.34ms  min=17.42ms med=25.74ms  max=304.1ms  p(90)=30.91ms  p(95)=32.81ms p(99.9)=49.4ms 
     http_reqs......................: 222673  1826.12578/s
     iteration_duration.............: avg=26.94ms  min=17.78ms med=26.31ms  max=313.67ms p(90)=31.57ms  p(95)=33.51ms p(99.9)=51.26ms
     iterations.....................: 222573  1825.305687/s
     success_rate...................: 100.00% ✓ 222573      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 661908      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 265 MB  2.2 MB/s
     http_req_blocked...............: avg=2.85µs   min=901ns   med=1.98µs  max=10.47ms  p(90)=3.6µs    p(95)=4.33µs  p(99.9)=27.51µs
     http_req_connecting............: avg=428ns    min=0s      med=0s      max=3.92ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.97ms  min=17.79ms med=26.43ms max=312.07ms p(90)=31.31ms  p(95)=33.09ms p(99.9)=50.06ms
       { expected_response:true }...: avg=26.97ms  min=17.79ms med=26.43ms max=312.07ms p(90)=31.31ms  p(95)=33.09ms p(99.9)=50.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 220736
     http_req_receiving.............: avg=361.81µs min=50.68µs med=98.84µs max=56.61ms  p(90)=976.95µs p(95)=1.5ms   p(99.9)=8.63ms 
     http_req_sending...............: avg=29.74µs  min=4.54µs  med=8.53µs  max=123.93ms p(90)=18.56µs  p(95)=28.07µs p(99.9)=1.46ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.58ms  min=17.69ms med=26.05ms max=288.53ms p(90)=30.83ms  p(95)=32.57ms p(99.9)=47.7ms 
     http_reqs......................: 220736  1810.257973/s
     iteration_duration.............: avg=27.18ms  min=17.96ms med=26.63ms max=327.27ms p(90)=31.5ms   p(95)=33.3ms  p(99.9)=50.54ms
     iterations.....................: 220636  1809.437872/s
     success_rate...................: 100.00% ✓ 220636      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 636570      ✗ 0     
     data_received..................: 19 GB   153 MB/s
     data_sent......................: 255 MB  2.1 MB/s
     http_req_blocked...............: avg=3.52µs   min=982ns   med=2.64µs   max=6.35ms   p(90)=4.3µs    p(95)=5.06µs  p(99.9)=38.99µs
     http_req_connecting............: avg=455ns    min=0s      med=0s       max=4.38ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=28.04ms  min=18.32ms med=27.46ms  max=321.28ms p(90)=32.89ms  p(95)=34.85ms p(99.9)=51.86ms
       { expected_response:true }...: avg=28.04ms  min=18.32ms med=27.46ms  max=321.28ms p(90)=32.89ms  p(95)=34.85ms p(99.9)=51.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 212290
     http_req_receiving.............: avg=379.26µs min=51.7µs  med=109.24µs max=199.93ms p(90)=936.96µs p(95)=1.45ms  p(99.9)=8.53ms 
     http_req_sending...............: avg=32.63µs  min=4.73µs  med=10.15µs  max=185.82ms p(90)=19.96µs  p(95)=32.74µs p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.63ms  min=18.18ms med=27.08ms  max=122.26ms p(90)=32.41ms  p(95)=34.34ms p(99.9)=50.09ms
     http_reqs......................: 212290  1740.182326/s
     iteration_duration.............: avg=28.26ms  min=18.84ms med=27.67ms  max=340.26ms p(90)=33.1ms   p(95)=35.06ms p(99.9)=52.14ms
     iterations.....................: 212190  1739.362606/s
     success_rate...................: 100.00% ✓ 212190      ✗ 0     
     vus............................: 9       min=0         max=50  
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

     checks.........................: 100.00% ✓ 483429      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 194 MB  1.6 MB/s
     http_req_blocked...............: avg=3.56µs  min=861ns   med=2.23µs  max=3.7ms    p(90)=4.78µs   p(95)=5.78µs   p(99.9)=41.27µs
     http_req_connecting............: avg=704ns   min=0s      med=0s      max=3.65ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=36.97ms min=18.1ms  med=36.6ms  max=309.16ms p(90)=43.5ms   p(95)=45.45ms  p(99.9)=58.79ms
       { expected_response:true }...: avg=36.97ms min=18.1ms  med=36.6ms  max=309.16ms p(90)=43.5ms   p(95)=45.45ms  p(99.9)=58.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 161243
     http_req_receiving.............: avg=84.89µs min=27.33µs med=55.8µs  max=165.32ms p(90)=123.31µs p(95)=167.38µs p(99.9)=1.77ms 
     http_req_sending...............: avg=33.58µs min=4.72µs  med=9.39µs  max=141.15ms p(90)=24.22µs  p(95)=44.85µs  p(99.9)=1.65ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=36.85ms min=17.99ms med=36.49ms max=305.86ms p(90)=43.38ms  p(95)=45.3ms   p(99.9)=57.94ms
     http_reqs......................: 161243  1321.78681/s
     iteration_duration.............: avg=37.22ms min=19.9ms  med=36.84ms max=327.08ms p(90)=43.72ms  p(95)=45.67ms  p(99.9)=59.45ms
     iterations.....................: 161143  1320.967062/s
     success_rate...................: 100.00% ✓ 161143      ✗ 0     
     vus............................: 3       min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 443994      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=3.9µs   min=1.14µs  med=3.09µs  max=3.2ms    p(90)=4.76µs  p(95)=5.49µs   p(99.9)=40.27µs
     http_req_connecting............: avg=493ns   min=0s      med=0s      max=3.18ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.28ms min=18.92ms med=39.66ms max=315.92ms p(90)=48.48ms p(95)=51.31ms  p(99.9)=66.52ms
       { expected_response:true }...: avg=40.28ms min=18.92ms med=39.66ms max=315.92ms p(90)=48.48ms p(95)=51.31ms  p(99.9)=66.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148098
     http_req_receiving.............: avg=85.8µs  min=25.33µs med=67.74µs max=168.75ms p(90)=109.8µs p(95)=128.29µs p(99.9)=1.16ms 
     http_req_sending...............: avg=29.33µs min=5.36µs  med=12.97µs max=178.41ms p(90)=20.78µs p(95)=25.04µs  p(99.9)=1.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.17ms min=18.81ms med=39.56ms max=315.39ms p(90)=48.37ms p(95)=51.19ms  p(99.9)=65.79ms
     http_reqs......................: 148098  1213.848241/s
     iteration_duration.............: avg=40.53ms min=21.52ms med=39.88ms max=324.56ms p(90)=48.7ms  p(95)=51.54ms  p(99.9)=67ms   
     iterations.....................: 147998  1213.028616/s
     success_rate...................: 100.00% ✓ 147998      ✗ 0     
     vus............................: 44      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 208185     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   683 kB/s
     http_req_blocked...............: avg=5.32µs  min=1.38µs  med=3.6µs   max=3.58ms   p(90)=5.26µs   p(95)=5.97µs   p(99.9)=54.78µs 
     http_req_connecting............: avg=1.43µs  min=0s      med=0s      max=3.54ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.09ms min=20.69ms med=84.77ms max=341.15ms p(90)=102.88ms p(95)=111.94ms p(99.9)=200.24ms
       { expected_response:true }...: avg=86.09ms min=20.69ms med=84.77ms max=341.15ms p(90)=102.88ms p(95)=111.94ms p(99.9)=200.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69495
     http_req_receiving.............: avg=91.35µs min=30.75µs med=80.1µs  max=118.51ms p(90)=117.85µs p(95)=132.72µs p(99.9)=712.7µs 
     http_req_sending...............: avg=30.48µs min=5.89µs  med=16.18µs max=200.77ms p(90)=22.98µs  p(95)=25.39µs  p(99.9)=635.36µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.97ms min=20.51ms med=84.66ms max=340.67ms p(90)=102.76ms p(95)=111.81ms p(99.9)=199.69ms
     http_reqs......................: 69495   568.509467/s
     iteration_duration.............: avg=86.47ms min=27.94ms med=85.04ms max=358.8ms  p(90)=103.15ms p(95)=112.27ms p(99.9)=203.9ms 
     iterations.....................: 69395   567.691408/s
     success_rate...................: 100.00% ✓ 69395      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 159138     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 64 MB   522 kB/s
     http_req_blocked...............: avg=8.57µs   min=1.45µs  med=3.79µs   max=8.63ms   p(90)=5.38µs   p(95)=6.01µs   p(99.9)=157.74µs
     http_req_connecting............: avg=4.45µs   min=0s      med=0s       max=8.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.67ms min=21.32ms med=110.84ms max=339.78ms p(90)=140.39ms p(95)=149.57ms p(99.9)=189.92ms
       { expected_response:true }...: avg=112.67ms min=21.32ms med=110.84ms max=339.78ms p(90)=140.39ms p(95)=149.57ms p(99.9)=189.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53146
     http_req_receiving.............: avg=89.47µs  min=29.48µs med=84.83µs  max=7.82ms   p(90)=118µs    p(95)=131.71µs p(99.9)=656.62µs
     http_req_sending...............: avg=29.47µs  min=6.31µs  med=18.02µs  max=155.39ms p(90)=23.74µs  p(95)=25.92µs  p(99.9)=596.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.56ms min=21.19ms med=110.73ms max=336.21ms p(90)=140.27ms p(95)=149.44ms p(99.9)=189.43ms
     http_reqs......................: 53146   434.407081/s
     iteration_duration.............: avg=113.14ms min=30.07ms med=111.15ms max=353.65ms p(90)=140.68ms p(95)=149.88ms p(99.9)=191.68ms
     iterations.....................: 53046   433.589697/s
     success_rate...................: 100.00% ✓ 53046      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98559      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   323 kB/s
     http_req_blocked...............: avg=6.17µs   min=1.19µs  med=3.26µs   max=3.54ms   p(90)=4.76µs   p(95)=5.34µs   p(99.9)=1.3ms   
     http_req_connecting............: avg=2.67µs   min=0s      med=0s       max=3.5ms    p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=181.92ms min=23.36ms med=184.38ms max=401.86ms p(90)=202.97ms p(95)=208.13ms p(99.9)=273.69ms
       { expected_response:true }...: avg=181.92ms min=23.36ms med=184.38ms max=401.86ms p(90)=202.97ms p(95)=208.13ms p(99.9)=273.69ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32953
     http_req_receiving.............: avg=100.09µs min=30.94µs med=90.32µs  max=108.82ms p(90)=123.09µs p(95)=136.3µs  p(99.9)=552.86µs
     http_req_sending...............: avg=28.28µs  min=5.22µs  med=16.97µs  max=82.82ms  p(90)=21.8µs   p(95)=23.74µs  p(99.9)=633.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.79ms min=23.26ms med=184.27ms max=401.05ms p(90)=202.86ms p(95)=208ms    p(99.9)=273.45ms
     http_reqs......................: 32953   268.739691/s
     iteration_duration.............: avg=182.71ms min=39.64ms med=184.95ms max=417.98ms p(90)=203.28ms p(95)=208.44ms p(99.9)=276.57ms
     iterations.....................: 32853   267.924167/s
     success_rate...................: 100.00% ✓ 32853      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 96960      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   319 kB/s
     http_req_blocked...............: avg=7.06µs   min=1.66µs  med=3.91µs   max=3.99ms   p(90)=5.5µs    p(95)=6.17µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=2.84µs   min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=1.36ms  
     http_req_duration..............: avg=184.93ms min=17.33ms med=174.16ms max=661.46ms p(90)=215.56ms p(95)=244.17ms p(99.9)=614.82ms
       { expected_response:true }...: avg=184.93ms min=17.33ms med=174.16ms max=661.46ms p(90)=215.56ms p(95)=244.17ms p(99.9)=614.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32420
     http_req_receiving.............: avg=100.85µs min=36.31µs med=93.74µs  max=44.73ms  p(90)=126.44µs p(95)=140.02µs p(99.9)=741.32µs
     http_req_sending...............: avg=30.08µs  min=6.56µs  med=19.35µs  max=113.42ms p(90)=24.46µs  p(95)=26.59µs  p(99.9)=516.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.8ms  min=17.24ms med=174.03ms max=661.35ms p(90)=215.47ms p(95)=243.93ms p(99.9)=614.68ms
     http_reqs......................: 32420   265.657557/s
     iteration_duration.............: avg=185.74ms min=58.31ms med=174.56ms max=661.73ms p(90)=215.95ms p(95)=245.42ms p(99.9)=615.22ms
     iterations.....................: 32320   264.838133/s
     success_rate...................: 100.00% ✓ 32320      ✗ 0    
     vus............................: 20      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 8103      ✗ 0   
     data_received..................: 268 MB  2.1 MB/s
     data_sent......................: 3.4 MB  27 kB/s
     http_req_blocked...............: avg=98.67µs  min=1.52µs   med=3.87µs  max=10.06ms p(90)=5.6µs    p(95)=6.37µs   p(99.9)=9.43ms  
     http_req_connecting............: avg=93.12µs  min=0s       med=0s      max=10.02ms p(90)=0s       p(95)=0s       p(99.9)=9.38ms  
     http_req_duration..............: avg=2.15s    min=36.19ms  med=2.21s   max=4.76s   p(90)=2.78s    p(95)=2.96s    p(99.9)=3.97s   
       { expected_response:true }...: avg=2.15s    min=36.19ms  med=2.21s   max=4.76s   p(90)=2.78s    p(95)=2.96s    p(99.9)=3.97s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2801
     http_req_receiving.............: avg=103.73µs min=33.65µs  med=97.83µs max=1.85ms  p(90)=139.47µs p(95)=156.17µs p(99.9)=603.28µs
     http_req_sending...............: avg=50.38µs  min=6.56µs   med=20.11µs max=18.85ms p(90)=25.72µs  p(95)=29.49µs  p(99.9)=4.34ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.15s    min=36ms     med=2.21s   max=4.76s   p(90)=2.78s    p(95)=2.96s    p(99.9)=3.96s   
     http_reqs......................: 2801    22.204071/s
     iteration_duration.............: avg=2.23s    min=338.33ms med=2.23s   max=4.77s   p(90)=2.79s    p(95)=2.97s    p(99.9)=3.98s   
     iterations.....................: 2701    21.411351/s
     success_rate...................: 100.00% ✓ 2701      ✗ 0   
     vus............................: 17      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

