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
| fusion-nightly | 16.6.2-p.7 | 1,883 | 1,933 | 1,875 | 1.1% |  |
| fusion | 16.6.1 | 1,875 | 1,932 | 1,859 | 1.3% |  |
| fusion-nightly-net11 | 16.6.2-p.7 | 1,867 | 1,923 | 1,861 | 1.1% |  |
| hive-router | v0.0.84 | 1,832 | 1,908 | 1,816 | 1.6% |  |
| fusion-nightly-fed | 16.6.2-p.7 | 1,802 | 1,858 | 1,799 | 1.1% |  |
| grafbase | 0.53.5 | 1,295 | 1,331 | 1,287 | 1.1% |  |
| cosmo | 0.334.0 | 1,162 | 1,209 | 1,153 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 568 | 585 | 562 | 1.4% |  |
| apollo-router | v2.16.1 | 394 | 412 | 391 | 2.0% |  |
| apollo-gateway | 2.14.3 | 268 | 270 | 268 | 0.3% |  |
| hive-gateway | 2.10.8 | 257 | 266 | 254 | 1.3% |  |
| feddi | 5ff8b6165878 | 15 | 15 | 14 | 2.2% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 688437      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.78µs   min=922ns   med=2µs     max=3.81ms   p(90)=3.5µs    p(95)=4.28µs  p(99.9)=31.64µs
     http_req_connecting............: avg=388ns    min=0s      med=0s      max=3.77ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.93ms  min=17.41ms med=25.33ms max=304.99ms p(90)=30.35ms  p(95)=32.16ms p(99.9)=51.06ms
       { expected_response:true }...: avg=25.93ms  min=17.41ms med=25.33ms max=304.99ms p(90)=30.35ms  p(95)=32.16ms p(99.9)=51.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229579
     http_req_receiving.............: avg=323.83µs min=50.44µs med=95.44µs max=47.83ms  p(90)=828.22µs p(95)=1.32ms  p(99.9)=8.57ms 
     http_req_sending...............: avg=28.72µs  min=4.66µs  med=8.38µs  max=42.05ms  p(90)=17.09µs  p(95)=27.1µs  p(99.9)=1.47ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.57ms  min=17.23ms med=25ms    max=294.1ms  p(90)=29.93ms  p(95)=31.7ms  p(99.9)=49.37ms
     http_reqs......................: 229579  1883.053932/s
     iteration_duration.............: avg=26.14ms  min=17.6ms  med=25.53ms max=315.46ms p(90)=30.55ms  p(95)=32.36ms p(99.9)=51.39ms
     iterations.....................: 229479  1882.233712/s
     success_rate...................: 100.00% ✓ 229479      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 685632      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.35µs   min=972ns   med=2.54µs   max=7.5ms    p(90)=4.13µs   p(95)=4.87µs  p(99.9)=36.55µs
     http_req_connecting............: avg=407ns    min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.02ms  min=17.04ms med=25.38ms  max=290.89ms p(90)=30.51ms  p(95)=32.44ms p(99.9)=51.88ms
       { expected_response:true }...: avg=26.02ms  min=17.04ms med=25.38ms  max=290.89ms p(90)=30.51ms  p(95)=32.44ms p(99.9)=51.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228644
     http_req_receiving.............: avg=335.45µs min=51.75µs med=101.74µs max=201.87ms p(90)=835.15µs p(95)=1.33ms  p(99.9)=9.81ms 
     http_req_sending...............: avg=35.41µs  min=4.77µs  med=9.74µs   max=172.89ms p(90)=18.74µs  p(95)=44.23µs p(99.9)=1.67ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.64ms  min=16.95ms med=25.03ms  max=290.65ms p(90)=30.07ms  p(95)=31.95ms p(99.9)=49.6ms 
     http_reqs......................: 228644  1875.301323/s
     iteration_duration.............: avg=26.24ms  min=17.49ms med=25.59ms  max=310.08ms p(90)=30.72ms  p(95)=32.66ms p(99.9)=52.21ms
     iterations.....................: 228544  1874.481139/s
     success_rate...................: 100.00% ✓ 228544      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 682797      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=2.76µs   min=902ns   med=1.95µs  max=4.43ms   p(90)=3.45µs  p(95)=4.16µs  p(99.9)=29.62µs
     http_req_connecting............: avg=415ns    min=0s      med=0s      max=3.48ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.14ms  min=17.27ms med=25.56ms max=298.96ms p(90)=30.48ms p(95)=32.26ms p(99.9)=49.54ms
       { expected_response:true }...: avg=26.14ms  min=17.27ms med=25.56ms max=298.96ms p(90)=30.48ms p(95)=32.26ms p(99.9)=49.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227699
     http_req_receiving.............: avg=280.06µs min=50.93µs med=90.43µs max=181.31ms p(90)=683.3µs p(95)=1.18ms  p(99.9)=7.71ms 
     http_req_sending...............: avg=30.93µs  min=4.61µs  med=8.34µs  max=147.23ms p(90)=17.59µs p(95)=29.11µs p(99.9)=1.51ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.83ms  min=17.18ms med=25.27ms max=298.53ms p(90)=30.1ms  p(95)=31.85ms p(99.9)=47.93ms
     http_reqs......................: 227699  1867.497936/s
     iteration_duration.............: avg=26.35ms  min=17.51ms med=25.76ms max=315.72ms p(90)=30.68ms p(95)=32.46ms p(99.9)=50ms   
     iterations.....................: 227599  1866.677775/s
     success_rate...................: 100.00% ✓ 227599      ✗ 0     
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

     checks.........................: 100.00% ✓ 670260      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=3µs     min=922ns   med=2.23µs  max=3.99ms   p(90)=3.89µs  p(95)=4.59µs   p(99.9)=28.81µs
     http_req_connecting............: avg=400ns   min=0s      med=0s      max=3.94ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.63ms min=17.94ms med=26.22ms max=296.16ms p(90)=30.33ms p(95)=31.73ms  p(99.9)=47.11ms
       { expected_response:true }...: avg=26.63ms min=17.94ms med=26.22ms max=296.16ms p(90)=30.33ms p(95)=31.73ms  p(99.9)=47.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223520
     http_req_receiving.............: avg=73.59µs min=25.7µs  med=50.88µs max=173.99ms p(90)=93.14µs p(95)=117.33µs p(99.9)=1.55ms 
     http_req_sending...............: avg=30.28µs min=4.68µs  med=9.45µs  max=228.27ms p(90)=18µs    p(95)=24.13µs  p(99.9)=1.33ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.53ms min=17.85ms med=26.13ms max=286.79ms p(90)=30.22ms p(95)=31.61ms  p(99.9)=45.28ms
     http_reqs......................: 223520  1832.847084/s
     iteration_duration.............: avg=26.84ms min=18.66ms med=26.42ms max=306.88ms p(90)=30.53ms p(95)=31.93ms  p(99.9)=47.55ms
     iterations.....................: 223420  1832.027092/s
     success_rate...................: 100.00% ✓ 223420      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 659217      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 264 MB  2.2 MB/s
     http_req_blocked...............: avg=3.42µs   min=962ns   med=2.59µs   max=4.14ms   p(90)=4.21µs   p(95)=4.96µs  p(99.9)=36.71µs
     http_req_connecting............: avg=457ns    min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.07ms  min=18.22ms med=26.46ms  max=302.41ms p(90)=31.68ms  p(95)=33.63ms p(99.9)=50.65ms
       { expected_response:true }...: avg=27.07ms  min=18.22ms med=26.46ms  max=302.41ms p(90)=31.68ms  p(95)=33.63ms p(99.9)=50.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 219839
     http_req_receiving.............: avg=323.35µs min=52.59µs med=103.78µs max=145.19ms p(90)=801.92µs p(95)=1.29ms  p(99.9)=8.38ms 
     http_req_sending...............: avg=33.6µs   min=4.65µs  med=9.98µs   max=87.29ms  p(90)=19.78µs  p(95)=45.75µs p(99.9)=1.65ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.71ms  min=17.95ms med=26.11ms  max=302.11ms p(90)=31.26ms  p(95)=33.16ms p(99.9)=49.35ms
     http_reqs......................: 219839  1802.23732/s
     iteration_duration.............: avg=27.29ms  min=18.44ms med=26.67ms  max=313.27ms p(90)=31.89ms  p(95)=33.84ms p(99.9)=50.96ms
     iterations.....................: 219739  1801.417522/s
     success_rate...................: 100.00% ✓ 219739      ✗ 0     
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

     checks.........................: 100.00% ✓ 473664      ✗ 0     
     data_received..................: 14 GB   114 MB/s
     data_sent......................: 190 MB  1.6 MB/s
     http_req_blocked...............: avg=4.17µs  min=1.03µs  med=3µs     max=4.12ms   p(90)=5.33µs   p(95)=6.36µs   p(99.9)=44.14µs
     http_req_connecting............: avg=657ns   min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.72ms min=17.79ms med=37.44ms max=311.76ms p(90)=44.58ms  p(95)=46.72ms  p(99.9)=62.23ms
       { expected_response:true }...: avg=37.72ms min=17.79ms med=37.44ms max=311.76ms p(90)=44.58ms  p(95)=46.72ms  p(99.9)=62.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157988
     http_req_receiving.............: avg=92.77µs min=27.49µs med=60.86µs max=176.28ms p(90)=127.83µs p(95)=180.47µs p(99.9)=2.47ms 
     http_req_sending...............: avg=40.05µs min=4.58µs  med=11.42µs max=240.04ms p(90)=25.14µs  p(95)=75.59µs  p(99.9)=1.79ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.59ms min=17.68ms med=37.32ms max=311.51ms p(90)=44.44ms  p(95)=46.58ms  p(99.9)=61.73ms
     http_reqs......................: 157988  1295.258601/s
     iteration_duration.............: avg=37.99ms min=20.16ms med=37.68ms max=321.97ms p(90)=44.81ms  p(95)=46.94ms  p(99.9)=62.53ms
     iterations.....................: 157888  1294.438755/s
     success_rate...................: 100.00% ✓ 157888      ✗ 0     
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

     checks.........................: 100.00% ✓ 425028      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.28µs  min=1.03µs  med=2.26µs  max=3.49ms   p(90)=3.79µs   p(95)=4.48µs   p(99.9)=37.46µs 
     http_req_connecting............: avg=683ns   min=0s      med=0s      max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.11ms min=18.88ms med=41.46ms max=322.04ms p(90)=50.88ms  p(95)=53.88ms  p(99.9)=69.82ms 
       { expected_response:true }...: avg=42.11ms min=18.88ms med=41.46ms max=322.04ms p(90)=50.88ms  p(95)=53.88ms  p(99.9)=69.82ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 141776
     http_req_receiving.............: avg=77.43µs min=27.86µs med=64.1µs  max=48.04ms  p(90)=105.43µs p(95)=123.47µs p(99.9)=765.69µs
     http_req_sending...............: avg=23.77µs min=5.09µs  med=10.81µs max=203.69ms p(90)=18.09µs  p(95)=21.69µs  p(99.9)=853.15µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=42.01ms min=18.72ms med=41.36ms max=321.59ms p(90)=50.78ms  p(95)=53.76ms  p(99.9)=69.41ms 
     http_reqs......................: 141776  1162.124413/s
     iteration_duration.............: avg=42.34ms min=21.71ms med=41.67ms max=332.59ms p(90)=51.08ms  p(95)=54.07ms  p(99.9)=70.56ms 
     iterations.....................: 141676  1161.304722/s
     success_rate...................: 100.00% ✓ 141676      ✗ 0     
     vus............................: 20      min=0         max=50  
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

     checks.........................: 100.00% ✓ 208134     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 83 MB   683 kB/s
     http_req_blocked...............: avg=5.18µs  min=1.23µs  med=3.59µs  max=4.07ms   p(90)=5.26µs   p(95)=5.96µs   p(99.9)=48.49µs 
     http_req_connecting............: avg=1.31µs  min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.13ms min=20.24ms med=84.77ms max=342.1ms  p(90)=102.35ms p(95)=111.71ms p(99.9)=201.57ms
       { expected_response:true }...: avg=86.13ms min=20.24ms med=84.77ms max=342.1ms  p(90)=102.35ms p(95)=111.71ms p(99.9)=201.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69478
     http_req_receiving.............: avg=93.84µs min=30.75µs med=80.76µs max=131.3ms  p(90)=117.66µs p(95)=132.24µs p(99.9)=701.07µs
     http_req_sending...............: avg=28.01µs min=5.66µs  med=16.15µs max=137.91ms p(90)=22.67µs  p(95)=24.99µs  p(99.9)=632.38µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.01ms min=20.1ms  med=84.67ms max=341.82ms p(90)=102.23ms p(95)=111.57ms p(99.9)=200.85ms
     http_reqs......................: 69478   568.415639/s
     iteration_duration.............: avg=86.49ms min=32.59ms med=85.04ms max=353.87ms p(90)=102.61ms p(95)=111.97ms p(99.9)=202.56ms
     iterations.....................: 69378   567.597516/s
     success_rate...................: 100.00% ✓ 69378      ✗ 0    
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

     checks.........................: 100.00% ✓ 144447     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   474 kB/s
     http_req_blocked...............: avg=5.96µs   min=1.34µs  med=3.65µs   max=4.12ms   p(90)=5.15µs   p(95)=5.79µs   p(99.9)=785.19µs
     http_req_connecting............: avg=2.06µs   min=0s      med=0s       max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=763.43µs
     http_req_duration..............: avg=124.14ms min=21.35ms med=122.34ms max=330.71ms p(90)=155.32ms p(95)=165.45ms p(99.9)=210.28ms
       { expected_response:true }...: avg=124.14ms min=21.35ms med=122.34ms max=330.71ms p(90)=155.32ms p(95)=165.45ms p(99.9)=210.28ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48249
     http_req_receiving.............: avg=87.92µs  min=32.12µs med=82.47µs  max=41.15ms  p(90)=115.54µs p(95)=127.87µs p(99.9)=566.65µs
     http_req_sending...............: avg=23.98µs  min=6.07µs  med=17.18µs  max=92.31ms  p(90)=23.1µs   p(95)=25.21µs  p(99.9)=582.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.03ms min=21.2ms  med=122.23ms max=330.18ms p(90)=155.2ms  p(95)=165.33ms p(99.9)=210.16ms
     http_reqs......................: 48249   394.378934/s
     iteration_duration.............: avg=124.64ms min=36.4ms  med=122.65ms max=348.31ms p(90)=155.63ms p(95)=165.77ms p(99.9)=214.66ms
     iterations.....................: 48149   393.561551/s
     success_rate...................: 100.00% ✓ 48149      ✗ 0    
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

     checks.........................: 100.00% ✓ 98505      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   322 kB/s
     http_req_blocked...............: avg=6.38µs   min=1.1µs   med=3.32µs   max=3.91ms   p(90)=4.71µs   p(95)=5.25µs   p(99.9)=1.34ms  
     http_req_connecting............: avg=2.79µs   min=0s      med=0s       max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=182.02ms min=23.66ms med=174.56ms max=381.35ms p(90)=249.3ms  p(95)=253.53ms p(99.9)=327.44ms
       { expected_response:true }...: avg=182.02ms min=23.66ms med=174.56ms max=381.35ms p(90)=249.3ms  p(95)=253.53ms p(99.9)=327.44ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32935
     http_req_receiving.............: avg=95.6µs   min=31.59µs med=90.43µs  max=39.04ms  p(90)=122.04µs p(95)=135.25µs p(99.9)=544.43µs
     http_req_sending...............: avg=23.26µs  min=5.18µs  med=17.78µs  max=34.27ms  p(90)=22.74µs  p(95)=24.65µs  p(99.9)=494.09µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.9ms  min=23.54ms med=174.45ms max=381.24ms p(90)=249.18ms p(95)=253.41ms p(99.9)=327.17ms
     http_reqs......................: 32935   268.49987/s
     iteration_duration.............: avg=182.81ms min=51.25ms med=174.85ms max=392.56ms p(90)=249.61ms p(95)=253.83ms p(99.9)=329.03ms
     iterations.....................: 32835   267.684629/s
     success_rate...................: 100.00% ✓ 32835      ✗ 0    
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

     checks.........................: 100.00% ✓ 94056      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   309 kB/s
     http_req_blocked...............: avg=6.22µs   min=1.11µs  med=3.26µs   max=3.42ms   p(90)=4.67µs   p(95)=5.23µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=2.74µs   min=0s      med=0s       max=3.38ms   p(90)=0s       p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=190.64ms min=17.45ms med=177.63ms max=715.48ms p(90)=226.87ms p(95)=258ms    p(99.9)=633.53ms
       { expected_response:true }...: avg=190.64ms min=17.45ms med=177.63ms max=715.48ms p(90)=226.87ms p(95)=258ms    p(99.9)=633.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31452
     http_req_receiving.............: avg=97.09µs  min=31.81µs med=92.19µs  max=59.79ms  p(90)=123.06µs p(95)=135.51µs p(99.9)=666.43µs
     http_req_sending...............: avg=34.77µs  min=5.52µs  med=17.76µs  max=89.2ms   p(90)=22.34µs  p(95)=24.07µs  p(99.9)=606.85µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.51ms min=17.29ms med=177.5ms  max=715.36ms p(90)=226.74ms p(95)=257.89ms p(99.9)=633.42ms
     http_reqs......................: 31452   257.628739/s
     iteration_duration.............: avg=191.49ms min=42.13ms med=178.04ms max=715.71ms p(90)=227.31ms p(95)=260.36ms p(99.9)=633.88ms
     iterations.....................: 31352   256.809622/s
     success_rate...................: 100.00% ✓ 31352      ✗ 0    
     vus............................: 39      min=0        max=50 
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

     checks.........................: 100.00% ✓ 5664      ✗ 0   
     data_received..................: 190 MB  1.5 MB/s
     data_sent......................: 2.4 MB  19 kB/s
     http_req_blocked...............: avg=60.65µs min=1.21µs  med=3.46µs  max=4.03ms  p(90)=5.22µs   p(95)=6.29µs   p(99.9)=3.66ms  
     http_req_connecting............: avg=55.9µs  min=0s      med=0s      max=3.99ms  p(90)=0s       p(95)=0s       p(99.9)=3.63ms  
     http_req_duration..............: avg=3.05s   min=49.38ms med=3.17s   max=5.23s   p(90)=3.81s    p(95)=4s       p(99.9)=5.21s   
       { expected_response:true }...: avg=3.05s   min=49.38ms med=3.17s   max=5.23s   p(90)=3.81s    p(95)=4s       p(99.9)=5.21s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 1988
     http_req_receiving.............: avg=94.74µs min=32.51µs med=89.32µs max=1.48ms  p(90)=132.78µs p(95)=147.25µs p(99.9)=420.64µs
     http_req_sending...............: avg=93.21µs min=6.05µs  med=18.1µs  max=42.88ms p(90)=24.01µs  p(95)=31.4µs   p(99.9)=15.37ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=3.05s   min=49.16ms med=3.17s   max=5.23s   p(90)=3.81s    p(95)=4s       p(99.9)=5.21s   
     http_reqs......................: 1988    15.544855/s
     iteration_duration.............: avg=3.21s   min=1.18s   med=3.2s    max=5.23s   p(90)=3.82s    p(95)=4.02s    p(99.9)=5.21s   
     iterations.....................: 1888    14.762921/s
     success_rate...................: 100.00% ✓ 1888      ✗ 0   
     vus............................: 33      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

