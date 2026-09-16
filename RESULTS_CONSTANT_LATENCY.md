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
| fusion-nightly | 16.7.0-p.7 | 1,890 | 1,941 | 1,884 | 1.0% |  |
| fusion | 16.6.6 | 1,875 | 1,923 | 1,863 | 1.1% |  |
| fusion-nightly-net11 | 16.7.0-p.7 | 1,864 | 1,913 | 1,854 | 1.0% |  |
| hive-router | v0.0.84 | 1,848 | 1,923 | 1,834 | 1.6% |  |
| fusion-nightly-fed | 16.7.0-p.7 | 1,802 | 1,862 | 1,791 | 1.4% |  |
| grafbase | 0.53.5 | 1,286 | 1,313 | 1,282 | 0.8% |  |
| cosmo | 0.334.0 | 1,225 | 1,266 | 1,218 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 556 | 576 | 553 | 1.3% |  |
| apollo-router | v2.16.1 | 397 | 414 | 393 | 1.9% |  |
| hive-gateway | 2.10.8 | 257 | 263 | 254 | 1.2% |  |
| apollo-gateway | 2.14.3 | 256 | 261 | 256 | 0.6% |  |
| feddi | 5ff8b6165878 | 16 | 18 | 16 | 4.5% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 691230      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=2.81µs   min=842ns   med=1.96µs  max=3.54ms   p(90)=3.7µs    p(95)=4.42µs  p(99.9)=32.45µs
     http_req_connecting............: avg=407ns    min=0s      med=0s      max=3.48ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.82ms  min=17.28ms med=25.22ms max=301.32ms p(90)=30.12ms  p(95)=31.88ms p(99.9)=49.8ms 
       { expected_response:true }...: avg=25.82ms  min=17.28ms med=25.22ms max=301.32ms p(90)=30.12ms  p(95)=31.88ms p(99.9)=49.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 230510
     http_req_receiving.............: avg=297.99µs min=49.7µs  med=92.88µs max=153.4ms  p(90)=741.72µs p(95)=1.22ms  p(99.9)=7.78ms 
     http_req_sending...............: avg=32.75µs  min=4.4µs   med=8.59µs  max=238.05ms p(90)=19.09µs  p(95)=32.12µs p(99.9)=1.58ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.49ms  min=17.19ms med=24.91ms max=288.26ms p(90)=29.72ms  p(95)=31.47ms p(99.9)=48.32ms
     http_reqs......................: 230510  1890.201746/s
     iteration_duration.............: avg=26.03ms  min=17.47ms med=25.43ms max=309.6ms  p(90)=30.31ms  p(95)=32.08ms p(99.9)=50.17ms
     iterations.....................: 230410  1889.381737/s
     success_rate...................: 100.00% ✓ 230410      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 685875      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.91µs   min=862ns   med=1.99µs  max=4.49ms   p(90)=3.78µs   p(95)=4.52µs  p(99.9)=32.94µs
     http_req_connecting............: avg=445ns    min=0s      med=0s      max=3.47ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.01ms  min=17.42ms med=25.44ms max=289.92ms p(90)=30.42ms  p(95)=32.21ms p(99.9)=48.69ms
       { expected_response:true }...: avg=26.01ms  min=17.42ms med=25.44ms max=289.92ms p(90)=30.42ms  p(95)=32.21ms p(99.9)=48.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228725
     http_req_receiving.............: avg=308.87µs min=50.2µs  med=95.15µs max=253.62ms p(90)=777.88µs p(95)=1.26ms  p(99.9)=7.81ms 
     http_req_sending...............: avg=29.59µs  min=4.42µs  med=8.39µs  max=142.56ms p(90)=18.45µs  p(95)=28.86µs p(99.9)=1.49ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.68ms  min=17.25ms med=25.12ms max=289.42ms p(90)=29.99ms  p(95)=31.76ms p(99.9)=46.81ms
     http_reqs......................: 228725  1875.595492/s
     iteration_duration.............: avg=26.23ms  min=17.58ms med=25.64ms max=312.64ms p(90)=30.61ms  p(95)=32.41ms p(99.9)=49.06ms
     iterations.....................: 228625  1874.77547/s
     success_rate...................: 100.00% ✓ 228625      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 681735      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=3.51µs   min=1µs     med=2.64µs  max=6.2ms    p(90)=4.39µs  p(95)=5.15µs  p(99.9)=36.01µs
     http_req_connecting............: avg=433ns    min=0s      med=0s      max=3.75ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.17ms  min=17.34ms med=25.58ms max=306.25ms p(90)=30.49ms p(95)=32.32ms p(99.9)=50.45ms
       { expected_response:true }...: avg=26.17ms  min=17.34ms med=25.58ms max=306.25ms p(90)=30.49ms p(95)=32.32ms p(99.9)=50.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227345
     http_req_receiving.............: avg=407.64µs min=49.43µs med=96.11µs max=266.63ms p(90)=1.18ms  p(95)=1.93ms  p(99.9)=9.48ms 
     http_req_sending...............: avg=34.35µs  min=4.3µs   med=9.92µs  max=111.78ms p(90)=20.06µs p(95)=57.5µs  p(99.9)=2.13ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.73ms  min=17.2ms  med=25.16ms max=305.92ms p(90)=29.89ms p(95)=31.66ms p(99.9)=49.2ms 
     http_reqs......................: 227345  1864.645842/s
     iteration_duration.............: avg=26.39ms  min=17.55ms med=25.79ms max=320.79ms p(90)=30.7ms  p(95)=32.53ms p(99.9)=50.79ms
     iterations.....................: 227245  1863.825659/s
     success_rate...................: 100.00% ✓ 227245      ✗ 0     
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

     checks.........................: 100.00% ✓ 676038      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=3.42µs  min=1.03µs  med=2.69µs  max=10.27ms  p(90)=4.33µs  p(95)=5.06µs  p(99.9)=40.97µs
     http_req_connecting............: avg=310ns   min=0s      med=0s      max=3.07ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.39ms min=18.11ms med=25.93ms max=299.19ms p(90)=30.16ms p(95)=31.63ms p(99.9)=48.02ms
       { expected_response:true }...: avg=26.39ms min=18.11ms med=25.93ms max=299.19ms p(90)=30.16ms p(95)=31.63ms p(99.9)=48.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 225446
     http_req_receiving.............: avg=79.38µs min=26.69µs med=53.91µs max=26.55ms  p(90)=97.51µs p(95)=126.2µs p(99.9)=2.57ms 
     http_req_sending...............: avg=33.99µs min=4.86µs  med=10.6µs  max=139.95ms p(90)=19.2µs  p(95)=27.62µs p(99.9)=1.51ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.27ms min=18.05ms med=25.83ms max=299.04ms p(90)=30.04ms p(95)=31.5ms  p(99.9)=46.7ms 
     http_reqs......................: 225446  1848.649363/s
     iteration_duration.............: avg=26.61ms min=18.24ms med=26.14ms max=320.66ms p(90)=30.37ms p(95)=31.84ms p(99.9)=48.55ms
     iterations.....................: 225346  1847.829367/s
     success_rate...................: 100.00% ✓ 225346      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 659154      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 264 MB  2.2 MB/s
     http_req_blocked...............: avg=2.82µs   min=932ns   med=2.03µs  max=3.79ms   p(90)=3.62µs   p(95)=4.36µs  p(99.9)=24.59µs
     http_req_connecting............: avg=414ns    min=0s      med=0s      max=3.75ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.08ms  min=17.76ms med=26.49ms max=290.44ms p(90)=31.69ms  p(95)=33.54ms p(99.9)=51.17ms
       { expected_response:true }...: avg=27.08ms  min=17.76ms med=26.49ms max=290.44ms p(90)=31.69ms  p(95)=33.54ms p(99.9)=51.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 219818
     http_req_receiving.............: avg=330.23µs min=51.64µs med=99.16µs max=199.69ms p(90)=833.05µs p(95)=1.33ms  p(99.9)=8.53ms 
     http_req_sending...............: avg=31.2µs   min=4.66µs  med=8.59µs  max=134.47ms p(90)=17.86µs  p(95)=30.07µs p(99.9)=1.49ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.72ms  min=17.64ms med=26.15ms max=290.21ms p(90)=31.24ms  p(95)=33.07ms p(99.9)=48.97ms
     http_reqs......................: 219818  1802.140573/s
     iteration_duration.............: avg=27.29ms  min=17.98ms med=26.7ms  max=310.5ms  p(90)=31.89ms  p(95)=33.74ms p(99.9)=51.39ms
     iterations.....................: 219718  1801.32074/s
     success_rate...................: 100.00% ✓ 219718      ✗ 0     
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

     checks.........................: 100.00% ✓ 470508      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 189 MB  1.5 MB/s
     http_req_blocked...............: avg=4.18µs   min=922ns   med=3.05µs  max=3.81ms   p(90)=5.42µs   p(95)=6.48µs   p(99.9)=46.38µs
     http_req_connecting............: avg=617ns    min=0s      med=0s      max=3.77ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.98ms  min=18ms    med=37.72ms max=307.19ms p(90)=44.78ms  p(95)=46.92ms  p(99.9)=63.3ms 
       { expected_response:true }...: avg=37.98ms  min=18ms    med=37.72ms max=307.19ms p(90)=44.78ms  p(95)=46.92ms  p(99.9)=63.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 156936
     http_req_receiving.............: avg=118.94µs min=28.18µs med=61.21µs max=232.59ms p(90)=127.96µs p(95)=178.68µs p(99.9)=3.1ms  
     http_req_sending...............: avg=36.73µs  min=4.83µs  med=11.17µs max=222.36ms p(90)=24.99µs  p(95)=66.31µs  p(99.9)=2.21ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.82ms  min=17.74ms med=37.6ms  max=116.98ms p(90)=44.65ms  p(95)=46.77ms  p(99.9)=62.07ms
     http_reqs......................: 156936  1286.587231/s
     iteration_duration.............: avg=38.24ms  min=20.69ms med=37.97ms max=321.61ms p(90)=45.01ms  p(95)=47.15ms  p(99.9)=63.74ms
     iterations.....................: 156836  1285.767415/s
     success_rate...................: 100.00% ✓ 156836      ✗ 0     
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

     checks.........................: 100.00% ✓ 448194      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.96µs  min=1.06µs  med=3.08µs  max=3.42ms   p(90)=4.76µs   p(95)=5.5µs    p(99.9)=39.98µs
     http_req_connecting............: avg=566ns   min=0s      med=0s      max=3.38ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.9ms  min=18.61ms med=39.29ms max=315.48ms p(90)=47.87ms  p(95)=50.65ms  p(99.9)=64.89ms
       { expected_response:true }...: avg=39.9ms  min=18.61ms med=39.29ms max=315.48ms p(90)=47.87ms  p(95)=50.65ms  p(99.9)=64.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149498
     http_req_receiving.............: avg=84.63µs min=27.62µs med=68.76µs max=78.95ms  p(90)=111.62µs p(95)=130.78µs p(99.9)=1.06ms 
     http_req_sending...............: avg=28.5µs  min=5.11µs  med=12.96µs max=125.15ms p(90)=20.6µs   p(95)=24.75µs  p(99.9)=1.02ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.79ms min=18.46ms med=39.18ms max=314.93ms p(90)=47.75ms  p(95)=50.54ms  p(99.9)=64.47ms
     http_reqs......................: 149498  1225.354063/s
     iteration_duration.............: avg=40.15ms min=22.3ms  med=39.51ms max=326.42ms p(90)=48.08ms  p(95)=50.87ms  p(99.9)=65.39ms
     iterations.....................: 149398  1224.534418/s
     success_rate...................: 100.00% ✓ 149398      ✗ 0     
     vus............................: 32      min=0         max=50  
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

     checks.........................: 100.00% ✓ 203907     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 82 MB   669 kB/s
     http_req_blocked...............: avg=4.38µs  min=1.08µs  med=2.72µs  max=3.88ms   p(90)=4.22µs   p(95)=4.88µs   p(99.9)=44.33µs 
     http_req_connecting............: avg=1.41µs  min=0s      med=0s      max=3.83ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.95ms min=21.24ms med=85.88ms max=326.42ms p(90)=107.88ms p(95)=116.96ms p(99.9)=203.24ms
       { expected_response:true }...: avg=87.95ms min=21.24ms med=85.88ms max=326.42ms p(90)=107.88ms p(95)=116.96ms p(99.9)=203.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68069
     http_req_receiving.............: avg=80.73µs min=29.54µs med=71.49µs max=100.06ms p(90)=108.24µs p(95)=121.54µs p(99.9)=653.23µs
     http_req_sending...............: avg=27.59µs min=5.23µs  med=13.5µs  max=118.89ms p(90)=20.13µs  p(95)=22.34µs  p(99.9)=596.36µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.84ms min=21.08ms med=85.79ms max=317.19ms p(90)=107.77ms p(95)=116.83ms p(99.9)=202.81ms
     http_reqs......................: 68069   556.786131/s
     iteration_duration.............: avg=88.29ms min=37.6ms  med=86.13ms max=340.19ms p(90)=108.12ms p(95)=117.23ms p(99.9)=206.15ms
     iterations.....................: 67969   555.968158/s
     success_rate...................: 100.00% ✓ 67969      ✗ 0    
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

     checks.........................: 100.00% ✓ 145467     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   477 kB/s
     http_req_blocked...............: avg=5.68µs   min=1.36µs  med=3.48µs   max=4.16ms   p(90)=4.98µs   p(95)=5.62µs   p(99.9)=445.04µs
     http_req_connecting............: avg=1.94µs   min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=346.57µs
     http_req_duration..............: avg=123.28ms min=20.29ms med=121.19ms max=340.53ms p(90)=154.46ms p(95)=165.1ms  p(99.9)=208.68ms
       { expected_response:true }...: avg=123.28ms min=20.29ms med=121.19ms max=340.53ms p(90)=154.46ms p(95)=165.1ms  p(99.9)=208.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48589
     http_req_receiving.............: avg=94.79µs  min=32.32µs med=80.72µs  max=172.8ms  p(90)=113.56µs p(95)=125.48µs p(99.9)=564.16µs
     http_req_sending...............: avg=30.26µs  min=5.68µs  med=16.38µs  max=164.02ms p(90)=22.39µs  p(95)=24.54µs  p(99.9)=601.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.16ms min=20.12ms med=121.08ms max=340.27ms p(90)=154.34ms p(95)=164.97ms p(99.9)=208.32ms
     http_reqs......................: 48589   397.194163/s
     iteration_duration.............: avg=123.76ms min=49.1ms  med=121.49ms max=353.71ms p(90)=154.75ms p(95)=165.38ms p(99.9)=209.77ms
     iterations.....................: 48489   396.376706/s
     success_rate...................: 100.00% ✓ 48489      ✗ 0    
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

     checks.........................: 100.00% ✓ 93849      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 38 MB   309 kB/s
     http_req_blocked...............: avg=6.59µs   min=1.18µs  med=3.35µs   max=3.57ms   p(90)=4.76µs   p(95)=5.37µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=3.01µs   min=0s      med=0s       max=3.53ms   p(90)=0s       p(95)=0s       p(99.9)=1.62ms  
     http_req_duration..............: avg=191.07ms min=18.04ms med=179.46ms max=654.34ms p(90)=225.67ms p(95)=254.07ms p(99.9)=586.23ms
       { expected_response:true }...: avg=191.07ms min=18.04ms med=179.46ms max=654.34ms p(90)=225.67ms p(95)=254.07ms p(99.9)=586.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31383
     http_req_receiving.............: avg=98.65µs  min=32.28µs med=89.49µs  max=114.81ms p(90)=120.51µs p(95)=133.1µs  p(99.9)=709.12µs
     http_req_sending...............: avg=27.76µs  min=5.3µs   med=17.48µs  max=130.96ms p(90)=22.26µs  p(95)=24.1µs   p(99.9)=436.49µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.95ms min=17.88ms med=179.35ms max=654.22ms p(90)=225.55ms p(95)=253.96ms p(99.9)=586.14ms
     http_reqs......................: 31383   257.034591/s
     iteration_duration.............: avg=191.9ms  min=53.24ms med=179.85ms max=654.59ms p(90)=225.99ms p(95)=255.12ms p(99.9)=586.49ms
     iterations.....................: 31283   256.215566/s
     success_rate...................: 100.00% ✓ 31283      ✗ 0    
     vus............................: 42      min=0        max=50 
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

     checks.........................: 100.00% ✓ 94275      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   309 kB/s
     http_req_blocked...............: avg=6.79µs   min=1.52µs  med=3.74µs   max=3.6ms    p(90)=5.19µs   p(95)=5.83µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=2.76µs   min=0s      med=0s       max=3.56ms   p(90)=0s       p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=190.2ms  min=23.71ms med=195.17ms max=374.69ms p(90)=204.65ms p(95)=209.3ms  p(99.9)=281.2ms 
       { expected_response:true }...: avg=190.2ms  min=23.71ms med=195.17ms max=374.69ms p(90)=204.65ms p(95)=209.3ms  p(99.9)=281.2ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31525
     http_req_receiving.............: avg=93.95µs  min=36.46µs med=88.17µs  max=43.32ms  p(90)=120.38µs p(95)=132.82µs p(99.9)=461.75µs
     http_req_sending...............: avg=30.68µs  min=6.24µs  med=18.19µs  max=64.34ms  p(90)=23.38µs  p(95)=25.4µs   p(99.9)=676.34µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.07ms min=23.57ms med=195.06ms max=373.96ms p(90)=204.53ms p(95)=209.16ms p(99.9)=281.09ms
     http_reqs......................: 31525   256.982729/s
     iteration_duration.............: avg=191.02ms min=50.49ms med=195.46ms max=389.65ms p(90)=204.92ms p(95)=209.57ms p(99.9)=284.31ms
     iterations.....................: 31425   256.167558/s
     success_rate...................: 100.00% ✓ 31425      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 6066      ✗ 0   
     data_received..................: 203 MB  1.6 MB/s
     data_sent......................: 2.5 MB  20 kB/s
     http_req_blocked...............: avg=72.06µs min=1.2µs    med=3.19µs  max=6.8ms    p(90)=4.58µs   p(95)=5.45µs   p(99.9)=6.38ms  
     http_req_connecting............: avg=65.36µs min=0s       med=0s      max=6.61ms   p(90)=0s       p(95)=0s       p(99.9)=6.27ms  
     http_req_duration..............: avg=2.86s   min=42.77ms  med=3s      max=7.48s    p(90)=3.64s    p(95)=3.79s    p(99.9)=5.95s   
       { expected_response:true }...: avg=2.86s   min=42.77ms  med=3s      max=7.48s    p(90)=3.64s    p(95)=3.79s    p(99.9)=5.95s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2122
     http_req_receiving.............: avg=94.91µs min=31.27µs  med=91.39µs max=830.92µs p(90)=131.42µs p(95)=147.23µs p(99.9)=392.82µs
     http_req_sending...............: avg=47.28µs min=5.67µs   med=17.42µs max=17.02ms  p(90)=22.51µs  p(95)=27.11µs  p(99.9)=2.53ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.86s   min=42.61ms  med=3s      max=7.48s    p(90)=3.64s    p(95)=3.79s    p(99.9)=5.95s   
     http_reqs......................: 2122    16.582454/s
     iteration_duration.............: avg=3s      min=730.86ms med=3.02s   max=7.48s    p(90)=3.65s    p(95)=3.79s    p(99.9)=5.98s   
     iterations.....................: 2022    15.801/s
     success_rate...................: 100.00% ✓ 2022      ✗ 0   
     vus............................: 35      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

