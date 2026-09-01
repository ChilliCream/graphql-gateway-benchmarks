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
| fusion | 16.6.2 | 1,892 | 1,935 | 1,879 | 1.0% |  |
| fusion-nightly | 16.7.0-p.1 | 1,892 | 1,939 | 1,884 | 0.9% |  |
| fusion-nightly-net11 | 16.7.0-p.1 | 1,871 | 1,920 | 1,860 | 1.0% |  |
| hive-router | v0.0.84 | 1,823 | 1,901 | 1,813 | 1.7% |  |
| fusion-nightly-fed | 16.7.0-p.1 | 1,793 | 1,851 | 1,783 | 1.3% |  |
| grafbase | 0.53.5 | 1,275 | 1,316 | 1,266 | 1.5% |  |
| cosmo | 0.334.0 | 1,225 | 1,267 | 1,219 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 568 | 584 | 566 | 1.1% |  |
| apollo-router | v2.16.1 | 395 | 415 | 392 | 2.0% |  |
| apollo-gateway | 2.14.3 | 258 | 262 | 256 | 0.9% |  |
| hive-gateway | 2.10.8 | 256 | 264 | 254 | 1.4% |  |
| feddi | 5ff8b6165878 | 16 | 17 | 15 | 4.2% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 691713      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=3.34µs   min=942ns   med=2.51µs  max=9.68ms   p(90)=4.02µs   p(95)=4.72µs  p(99.9)=37.37µs
     http_req_connecting............: avg=449ns    min=0s      med=0s      max=9.63ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.79ms  min=17.28ms med=25.16ms max=296.74ms p(90)=30.21ms  p(95)=32.12ms p(99.9)=49.92ms
       { expected_response:true }...: avg=25.79ms  min=17.28ms med=25.16ms max=296.74ms p(90)=30.21ms  p(95)=32.12ms p(99.9)=49.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230671
     http_req_receiving.............: avg=318.12µs min=51.53µs med=98.89µs max=52.72ms  p(90)=787.31µs p(95)=1.27ms  p(99.9)=8.97ms 
     http_req_sending...............: avg=35.53µs  min=4.8µs   med=9.75µs  max=135.45ms p(90)=18.48µs  p(95)=41.52µs p(99.9)=1.77ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.44ms  min=17.09ms med=24.83ms max=296.09ms p(90)=29.78ms  p(95)=31.65ms p(99.9)=47.96ms
     http_reqs......................: 230671  1892.110859/s
     iteration_duration.............: avg=26.01ms  min=17.48ms med=25.37ms max=304.37ms p(90)=30.41ms  p(95)=32.34ms p(99.9)=50.38ms
     iterations.....................: 230571  1891.290596/s
     success_rate...................: 100.00% ✓ 230571      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 691992      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=2.5µs    min=831ns   med=1.92µs  max=3.54ms   p(90)=3.46µs   p(95)=4.21µs  p(99.9)=27.46µs
     http_req_connecting............: avg=163ns    min=0s      med=0s      max=2.12ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.79ms  min=17.4ms  med=25.22ms max=310.83ms p(90)=30.13ms  p(95)=31.89ms p(99.9)=49.5ms 
       { expected_response:true }...: avg=25.79ms  min=17.4ms  med=25.22ms max=310.83ms p(90)=30.13ms  p(95)=31.89ms p(99.9)=49.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 230764
     http_req_receiving.............: avg=294.02µs min=49.67µs med=91.57µs max=60.08ms  p(90)=728.17µs p(95)=1.21ms  p(99.9)=7.83ms 
     http_req_sending...............: avg=31.17µs  min=4.27µs  med=8.21µs  max=258.78ms p(90)=17.79µs  p(95)=28.51µs p(99.9)=1.48ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.46ms  min=17.27ms med=24.91ms max=310.43ms p(90)=29.73ms  p(95)=31.45ms p(99.9)=47.93ms
     http_reqs......................: 230764  1892.846869/s
     iteration_duration.............: avg=26ms     min=17.59ms med=25.42ms max=319.66ms p(90)=30.33ms  p(95)=32.09ms p(99.9)=49.99ms
     iterations.....................: 230664  1892.026617/s
     success_rate...................: 100.00% ✓ 230664      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 683997      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.06µs   min=901ns   med=2.43µs max=9.86ms   p(90)=4.02µs   p(95)=4.72µs  p(99.9)=35.58µs
     http_req_connecting............: avg=214ns    min=0s      med=0s     max=2.24ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.09ms  min=17.22ms med=25.5ms max=304.16ms p(90)=30.43ms  p(95)=32.24ms p(99.9)=50.4ms 
       { expected_response:true }...: avg=26.09ms  min=17.22ms med=25.5ms max=304.16ms p(90)=30.43ms  p(95)=32.24ms p(99.9)=50.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 228099
     http_req_receiving.............: avg=281.01µs min=50.96µs med=91.9µs max=160.45ms p(90)=682.77µs p(95)=1.19ms  p(99.9)=7.7ms  
     http_req_sending...............: avg=33.9µs   min=4.74µs  med=9.36µs max=168.68ms p(90)=18.19µs  p(95)=41.39µs p(99.9)=1.65ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s     max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.77ms  min=17.15ms med=25.2ms max=303.82ms p(90)=30.07ms  p(95)=31.85ms p(99.9)=48.71ms
     http_reqs......................: 228099  1871.058432/s
     iteration_duration.............: avg=26.3ms   min=17.37ms med=25.7ms max=312.79ms p(90)=30.64ms  p(95)=32.45ms p(99.9)=51.12ms
     iterations.....................: 227999  1870.238148/s
     success_rate...................: 100.00% ✓ 227999      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 666876      ✗ 0     
     data_received..................: 19 GB   160 MB/s
     data_sent......................: 267 MB  2.2 MB/s
     http_req_blocked...............: avg=2.89µs  min=912ns   med=2.08µs  max=4.03ms   p(90)=3.58µs  p(95)=4.26µs   p(99.9)=31.06µs
     http_req_connecting............: avg=468ns   min=0s      med=0s      max=3.99ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.77ms min=17.93ms med=26.37ms max=303.45ms p(90)=30.52ms p(95)=31.91ms  p(99.9)=45.76ms
       { expected_response:true }...: avg=26.77ms min=17.93ms med=26.37ms max=303.45ms p(90)=30.52ms p(95)=31.91ms  p(99.9)=45.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 222392
     http_req_receiving.............: avg=71.73µs min=25.86µs med=49.42µs max=159.71ms p(90)=89.51µs p(95)=112.52µs p(99.9)=1.59ms 
     http_req_sending...............: avg=28.08µs min=4.51µs  med=9.12µs  max=162.22ms p(90)=17.11µs p(95)=23.25µs  p(99.9)=1.27ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.67ms min=17.84ms med=26.28ms max=302.89ms p(90)=30.42ms p(95)=31.8ms   p(99.9)=44.51ms
     http_reqs......................: 222392  1823.850397/s
     iteration_duration.............: avg=26.98ms min=18.64ms med=26.56ms max=312.35ms p(90)=30.71ms p(95)=32.11ms  p(99.9)=46.24ms
     iterations.....................: 222292  1823.030291/s
     success_rate...................: 100.00% ✓ 222292      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 655974      ✗ 0     
     data_received..................: 19 GB   157 MB/s
     data_sent......................: 263 MB  2.2 MB/s
     http_req_blocked...............: avg=2.65µs   min=852ns   med=2.04µs  max=2.83ms   p(90)=3.69µs   p(95)=4.4µs   p(99.9)=30.62µs
     http_req_connecting............: avg=217ns    min=0s      med=0s      max=2.81ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.21ms  min=17.85ms med=26.61ms max=291.41ms p(90)=31.89ms  p(95)=33.8ms  p(99.9)=50.96ms
       { expected_response:true }...: avg=27.21ms  min=17.85ms med=26.61ms max=291.41ms p(90)=31.89ms  p(95)=33.8ms  p(99.9)=50.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 218758
     http_req_receiving.............: avg=324.86µs min=50.55µs med=98.87µs max=177.16ms p(90)=824.87µs p(95)=1.31ms  p(99.9)=7.8ms  
     http_req_sending...............: avg=29.9µs   min=4.13µs  med=8.78µs  max=54.77ms  p(90)=18.86µs  p(95)=31.65µs p(99.9)=1.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.85ms  min=17.76ms med=26.27ms max=278.15ms p(90)=31.46ms  p(95)=33.36ms p(99.9)=49.31ms
     http_reqs......................: 218758  1793.591875/s
     iteration_duration.............: avg=27.43ms  min=18.02ms med=26.82ms max=304.94ms p(90)=32.1ms   p(95)=34.01ms p(99.9)=51.4ms 
     iterations.....................: 218658  1792.771977/s
     success_rate...................: 100.00% ✓ 218658      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 466365      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 187 MB  1.5 MB/s
     http_req_blocked...............: avg=3.36µs  min=912ns   med=2.22µs  max=4.01ms   p(90)=4.55µs   p(95)=5.52µs   p(99.9)=39.04µs
     http_req_connecting............: avg=580ns   min=0s      med=0s      max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.33ms min=18.35ms med=38.13ms max=305.45ms p(90)=45.17ms  p(95)=47.24ms  p(99.9)=61.94ms
       { expected_response:true }...: avg=38.33ms min=18.35ms med=38.13ms max=305.45ms p(90)=45.17ms  p(95)=47.24ms  p(99.9)=61.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155555
     http_req_receiving.............: avg=83.03µs min=26.01µs med=53.65µs max=82.21ms  p(90)=119.71µs p(95)=163.09µs p(99.9)=2.23ms 
     http_req_sending...............: avg=31.62µs min=4.74µs  med=9.33µs  max=62.7ms   p(90)=23.62µs  p(95)=42.6µs   p(99.9)=1.85ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.21ms min=18.26ms med=38.03ms max=296.74ms p(90)=45.06ms  p(95)=47.1ms   p(99.9)=60.62ms
     http_reqs......................: 155555  1275.167418/s
     iteration_duration.............: avg=38.58ms min=21.1ms  med=38.37ms max=315.62ms p(90)=45.38ms  p(95)=47.45ms  p(99.9)=62.54ms
     iterations.....................: 155455  1274.347665/s
     success_rate...................: 100.00% ✓ 155455      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 448254      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=4.08µs  min=1.15µs  med=3.1µs   max=4.43ms   p(90)=4.81µs   p(95)=5.56µs   p(99.9)=37.85µs 
     http_req_connecting............: avg=654ns   min=0s      med=0s      max=4.39ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.9ms  min=18.49ms med=39.31ms max=332.1ms  p(90)=47.92ms  p(95)=50.64ms  p(99.9)=65.92ms 
       { expected_response:true }...: avg=39.9ms  min=18.49ms med=39.31ms max=332.1ms  p(90)=47.92ms  p(95)=50.64ms  p(99.9)=65.92ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 149518
     http_req_receiving.............: avg=84.37µs min=26.92µs med=69.62µs max=46.46ms  p(90)=111.93µs p(95)=130.86µs p(99.9)=982.14µs
     http_req_sending...............: avg=30.52µs min=5.04µs  med=13.01µs max=194.66ms p(90)=20.54µs  p(95)=24.76µs  p(99.9)=1.17ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.79ms min=18.36ms med=39.2ms  max=331.48ms p(90)=47.81ms  p(95)=50.52ms  p(99.9)=65.23ms 
     http_reqs......................: 149518  1225.554535/s
     iteration_duration.............: avg=40.14ms min=22.51ms med=39.53ms max=341.59ms p(90)=48.14ms  p(95)=50.86ms  p(99.9)=66.32ms 
     iterations.....................: 149418  1224.734865/s
     success_rate...................: 100.00% ✓ 149418      ✗ 0     
     vus............................: 21      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 208236     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   683 kB/s
     http_req_blocked...............: avg=4.78µs   min=1.08µs  med=3.06µs  max=3.46ms   p(90)=4.68µs   p(95)=5.35µs   p(99.9)=46.29µs 
     http_req_connecting............: avg=1.49µs   min=0s      med=0s      max=3.44ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.11ms  min=20.31ms med=84.97ms max=333.84ms p(90)=101.99ms p(95)=110.71ms p(99.9)=193.04ms
       { expected_response:true }...: avg=86.11ms  min=20.31ms med=84.97ms max=333.84ms p(90)=101.99ms p(95)=110.71ms p(99.9)=193.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69512
     http_req_receiving.............: avg=134.03µs min=29.57µs med=75.94µs max=171.65ms p(90)=112.2µs  p(95)=125.8µs  p(99.9)=890.11µs
     http_req_sending...............: avg=23.48µs  min=5.04µs  med=13.86µs max=150.26ms p(90)=20.98µs  p(95)=23.24µs  p(99.9)=605.67µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.95ms  min=20.16ms med=84.87ms max=207.97ms p(90)=101.87ms p(95)=110.52ms p(99.9)=189.9ms 
     http_reqs......................: 69512   568.524685/s
     iteration_duration.............: avg=86.45ms  min=35.11ms med=85.23ms max=341.46ms p(90)=102.24ms p(95)=110.98ms p(99.9)=194.4ms 
     iterations.....................: 69412   567.706805/s
     success_rate...................: 100.00% ✓ 69412      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 144705     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   474 kB/s
     http_req_blocked...............: avg=5.33µs   min=1.14µs  med=3.11µs   max=4.26ms   p(90)=4.58µs   p(95)=5.15µs   p(99.9)=426.22µs
     http_req_connecting............: avg=1.99µs   min=0s      med=0s       max=4.22ms   p(90)=0s       p(95)=0s       p(99.9)=308.71µs
     http_req_duration..............: avg=123.93ms min=21.53ms med=122.07ms max=340.44ms p(90)=154.84ms p(95)=165.25ms p(99.9)=212.01ms
       { expected_response:true }...: avg=123.93ms min=21.53ms med=122.07ms max=340.44ms p(90)=154.84ms p(95)=165.25ms p(99.9)=212.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48335
     http_req_receiving.............: avg=84.23µs  min=30.13µs med=81.26µs  max=11.52ms  p(90)=112.64µs p(95)=124.55µs p(99.9)=502.1µs 
     http_req_sending...............: avg=27.02µs  min=5.41µs  med=16.06µs  max=113.03ms p(90)=21.46µs  p(95)=23.37µs  p(99.9)=572.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.82ms min=21.4ms  med=121.97ms max=340.34ms p(90)=154.72ms p(95)=165.11ms p(99.9)=210.64ms
     http_reqs......................: 48335   395.019808/s
     iteration_duration.............: avg=124.42ms min=39.23ms med=122.38ms max=349.62ms p(90)=155.13ms p(95)=165.56ms p(99.9)=214.66ms
     iterations.....................: 48235   394.202554/s
     success_rate...................: 100.00% ✓ 48235      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95004      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   311 kB/s
     http_req_blocked...............: avg=7.14µs   min=1.26µs  med=3.71µs   max=4.23ms   p(90)=5.23µs   p(95)=5.84µs   p(99.9)=1.49ms  
     http_req_connecting............: avg=3.13µs   min=0s      med=0s       max=4.19ms   p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=188.74ms min=23.76ms med=187.12ms max=384.15ms p(90)=200.18ms p(95)=205.76ms p(99.9)=274.74ms
       { expected_response:true }...: avg=188.74ms min=23.76ms med=187.12ms max=384.15ms p(90)=200.18ms p(95)=205.76ms p(99.9)=274.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31768
     http_req_receiving.............: avg=99.6µs   min=32.78µs med=91.07µs  max=74.13ms  p(90)=123.02µs p(95)=136.28µs p(99.9)=571.89µs
     http_req_sending...............: avg=33.45µs  min=6.32µs  med=18.78µs  max=107.42ms p(90)=23.98µs  p(95)=25.91µs  p(99.9)=589.23µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.61ms min=23.61ms med=187.01ms max=383.88ms p(90)=200.06ms p(95)=205.64ms p(99.9)=274.64ms
     http_reqs......................: 31768   258.952285/s
     iteration_duration.............: avg=189.57ms min=50.24ms med=187.44ms max=393.81ms p(90)=200.48ms p(95)=206.12ms p(99.9)=276.21ms
     iterations.....................: 31668   258.13715/s
     success_rate...................: 100.00% ✓ 31668      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 93609      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 38 MB   308 kB/s
     http_req_blocked...............: avg=5.61µs   min=1.23µs  med=3.78µs   max=2.89ms   p(90)=5.27µs   p(95)=5.91µs   p(99.9)=534.94µs
     http_req_connecting............: avg=1.55µs   min=0s      med=0s       max=2.85ms   p(90)=0s       p(95)=0s       p(99.9)=510.79µs
     http_req_duration..............: avg=191.62ms min=18.29ms med=178.55ms max=668.97ms p(90)=233.28ms p(95)=271.97ms p(99.9)=560.7ms 
       { expected_response:true }...: avg=191.62ms min=18.29ms med=178.55ms max=668.97ms p(90)=233.28ms p(95)=271.97ms p(99.9)=560.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31303
     http_req_receiving.............: avg=101.38µs min=32.51µs med=92.12µs  max=64.76ms  p(90)=124.79µs p(95)=138.32µs p(99.9)=701.46µs
     http_req_sending...............: avg=26.15µs  min=5.57µs  med=18.61µs  max=52.64ms  p(90)=23.42µs  p(95)=25.46µs  p(99.9)=449.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.49ms min=18.18ms med=178.44ms max=668.83ms p(90)=233.14ms p(95)=271.82ms p(99.9)=560.58ms
     http_reqs......................: 31303   256.212805/s
     iteration_duration.............: avg=192.48ms min=56.57ms med=179.07ms max=669.24ms p(90)=233.63ms p(95)=273.04ms p(99.9)=560.97ms
     iterations.....................: 31203   255.394313/s
     success_rate...................: 100.00% ✓ 31203      ✗ 0    
     vus............................: 36      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (5ff8b6165878)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 6120      ✗ 0   
     data_received..................: 205 MB  1.6 MB/s
     data_sent......................: 2.6 MB  20 kB/s
     http_req_blocked...............: avg=120.63µs min=992ns   med=3.25µs  max=10.09ms p(90)=4.76µs   p(95)=5.69µs  p(99.9)=9.54ms  
     http_req_connecting............: avg=115.62µs min=0s      med=0s      max=10.04ms p(90)=0s       p(95)=0s      p(99.9)=9.49ms  
     http_req_duration..............: avg=2.83s    min=44.46ms med=2.95s   max=4.87s   p(90)=3.53s    p(95)=3.65s   p(99.9)=4.52s   
       { expected_response:true }...: avg=2.83s    min=44.46ms med=2.95s   max=4.87s   p(90)=3.53s    p(95)=3.65s   p(99.9)=4.52s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2140
     http_req_receiving.............: avg=101.33µs min=28.5µs  med=89.71µs max=8.97ms  p(90)=133.51µs p(95)=150.1µs p(99.9)=381.07µs
     http_req_sending...............: avg=76.69µs  min=6.07µs  med=17.36µs max=27ms    p(90)=22.88µs  p(95)=29.26µs p(99.9)=8.07ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=2.83s    min=44.3ms  med=2.95s   max=4.87s   p(90)=3.53s    p(95)=3.65s   p(99.9)=4.52s   
     http_reqs......................: 2140    16.780111/s
     iteration_duration.............: avg=2.97s    min=1.04s   med=2.97s   max=4.87s   p(90)=3.53s    p(95)=3.66s   p(99.9)=4.52s   
     iterations.....................: 2040    15.995993/s
     success_rate...................: 100.00% ✓ 2040      ✗ 0   
     vus............................: 26      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

