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
| fusion-nightly | 16.7.0-p.2 | 1,881 | 1,943 | 1,873 | 1.2% |  |
| fusion | 16.6.4 | 1,879 | 1,928 | 1,868 | 1.1% |  |
| fusion-nightly-net11 | 16.7.0-p.2 | 1,870 | 1,922 | 1,857 | 1.1% |  |
| hive-router | v0.0.84 | 1,810 | 1,880 | 1,794 | 1.7% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 1,794 | 1,850 | 1,786 | 1.2% |  |
| grafbase | 0.53.5 | 1,278 | 1,312 | 1,273 | 1.1% |  |
| cosmo | 0.334.0 | 1,218 | 1,261 | 1,213 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 564 | 585 | 564 | 1.3% |  |
| apollo-router | v2.16.1 | 399 | 416 | 397 | 1.7% |  |
| hive-gateway | 2.10.8 | 262 | 269 | 260 | 1.4% |  |
| apollo-gateway | 2.14.3 | 256 | 260 | 255 | 0.6% |  |
| feddi | 5ff8b6165878 | 15 | 16 | 15 | 3.5% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687849      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=3.37µs   min=1µs     med=2.51µs  max=4.39ms   p(90)=4.19µs   p(95)=4.93µs  p(99.9)=38.21µs
     http_req_connecting............: avg=462ns    min=0s      med=0s      max=4.36ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.93ms  min=17.03ms med=25.33ms max=299.88ms p(90)=30.36ms  p(95)=32.2ms  p(99.9)=50.31ms
       { expected_response:true }...: avg=25.93ms  min=17.03ms med=25.33ms max=299.88ms p(90)=30.36ms  p(95)=32.2ms  p(99.9)=50.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229383
     http_req_receiving.............: avg=300.91µs min=49.61µs med=93.83µs max=188.64ms p(90)=742.77µs p(95)=1.27ms  p(99.9)=7.75ms 
     http_req_sending...............: avg=34.27µs  min=4.58µs  med=9.66µs  max=107.6ms  p(90)=19.61µs  p(95)=44.1µs  p(99.9)=1.81ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.6ms   min=16.88ms med=25.01ms max=299.17ms p(90)=29.96ms  p(95)=31.77ms p(99.9)=48.7ms 
     http_reqs......................: 229383  1881.132872/s
     iteration_duration.............: avg=26.15ms  min=17.29ms med=25.54ms max=311.72ms p(90)=30.57ms  p(95)=32.41ms p(99.9)=50.78ms
     iterations.....................: 229283  1880.312788/s
     success_rate...................: 100.00% ✓ 229283      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687195      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.74µs   min=862ns   med=1.95µs  max=3.86ms   p(90)=3.49µs   p(95)=4.22µs  p(99.9)=29.84µs
     http_req_connecting............: avg=379ns    min=0s      med=0s      max=3.83ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.97ms  min=17.21ms med=25.39ms max=299.22ms p(90)=30.34ms  p(95)=32.11ms p(99.9)=48.89ms
       { expected_response:true }...: avg=25.97ms  min=17.21ms med=25.39ms max=299.22ms p(90)=30.34ms  p(95)=32.11ms p(99.9)=48.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229165
     http_req_receiving.............: avg=318.19µs min=50.73µs med=96.14µs max=96.6ms   p(90)=805.21µs p(95)=1.28ms  p(99.9)=8.55ms 
     http_req_sending...............: avg=29.53µs  min=4.46µs  med=8.5µs   max=193.84ms p(90)=17.66µs  p(95)=27.22µs p(99.9)=1.5ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.62ms  min=17.05ms med=25.06ms max=287.07ms p(90)=29.93ms  p(95)=31.65ms p(99.9)=47.09ms
     http_reqs......................: 229165  1879.460683/s
     iteration_duration.............: avg=26.18ms  min=17.44ms med=25.59ms max=316.88ms p(90)=30.54ms  p(95)=32.31ms p(99.9)=49.26ms
     iterations.....................: 229065  1878.640549/s
     success_rate...................: 100.00% ✓ 229065      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 683850      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.4µs    min=962ns   med=2.55µs  max=10.46ms  p(90)=4.24µs   p(95)=4.98µs  p(99.9)=34.24µs
     http_req_connecting............: avg=419ns    min=0s      med=0s      max=3.64ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.08ms  min=17.27ms med=25.49ms max=293.52ms p(90)=30.48ms  p(95)=32.38ms p(99.9)=50.62ms
       { expected_response:true }...: avg=26.08ms  min=17.27ms med=25.49ms max=293.52ms p(90)=30.48ms  p(95)=32.38ms p(99.9)=50.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228050
     http_req_receiving.............: avg=264.03µs min=50.87µs med=91.36µs max=149.44ms p(90)=593.53µs p(95)=1.14ms  p(99.9)=7.16ms 
     http_req_sending...............: avg=35.63µs  min=4.67µs  med=9.65µs  max=187.74ms p(90)=19.5µs   p(95)=35.15µs p(99.9)=1.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.78ms  min=17.18ms med=25.21ms max=283.07ms p(90)=30.14ms  p(95)=31.98ms p(99.9)=49.33ms
     http_reqs......................: 228050  1870.614319/s
     iteration_duration.............: avg=26.31ms  min=17.47ms med=25.7ms  max=318.12ms p(90)=30.68ms  p(95)=32.59ms p(99.9)=50.91ms
     iterations.....................: 227950  1869.794054/s
     success_rate...................: 100.00% ✓ 227950      ✗ 0     
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

     checks.........................: 100.00% ✓ 662169      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 265 MB  2.2 MB/s
     http_req_blocked...............: avg=3.39µs  min=972ns   med=2.58µs  max=4.99ms   p(90)=4.15µs  p(95)=4.85µs   p(99.9)=36.06µs
     http_req_connecting............: avg=427ns   min=0s      med=0s      max=3.49ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.95ms min=18.37ms med=26.51ms max=298.14ms p(90)=30.79ms p(95)=32.27ms  p(99.9)=49.41ms
       { expected_response:true }...: avg=26.95ms min=18.37ms med=26.51ms max=298.14ms p(90)=30.79ms p(95)=32.27ms  p(99.9)=49.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 220823
     http_req_receiving.............: avg=79.55µs min=26.11µs med=53.76µs max=215.04ms p(90)=96.42µs p(95)=121.78µs p(99.9)=2.07ms 
     http_req_sending...............: avg=30.47µs min=4.8µs   med=10.48µs max=62.85ms  p(90)=18.41µs p(95)=25µs     p(99.9)=1.41ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.84ms min=18.26ms med=26.42ms max=297.73ms p(90)=30.67ms p(95)=32.14ms  p(99.9)=47.71ms
     http_reqs......................: 220823  1810.789385/s
     iteration_duration.............: avg=27.17ms min=18.52ms med=26.72ms max=308.67ms p(90)=31ms    p(95)=32.48ms  p(99.9)=49.92ms
     iterations.....................: 220723  1809.969367/s
     success_rate...................: 100.00% ✓ 220723      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 656433      ✗ 0     
     data_received..................: 19 GB   157 MB/s
     data_sent......................: 263 MB  2.2 MB/s
     http_req_blocked...............: avg=3.5µs    min=1.04µs  med=2.67µs   max=4.13ms   p(90)=4.34µs   p(95)=5.11µs  p(99.9)=35.79µs
     http_req_connecting............: avg=450ns    min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.18ms  min=17.7ms  med=26.57ms  max=301.54ms p(90)=31.86ms  p(95)=33.81ms p(99.9)=51.36ms
       { expected_response:true }...: avg=27.18ms  min=17.7ms  med=26.57ms  max=301.54ms p(90)=31.86ms  p(95)=33.81ms p(99.9)=51.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 218911
     http_req_receiving.............: avg=336.64µs min=52.08µs med=104.05µs max=255.62ms p(90)=842.88µs p(95)=1.35ms  p(99.9)=8.45ms 
     http_req_sending...............: avg=33.68µs  min=4.79µs  med=10.07µs  max=122.95ms p(90)=19.66µs  p(95)=48.4µs  p(99.9)=1.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.81ms  min=17.54ms med=26.21ms  max=301.36ms p(90)=31.42ms  p(95)=33.33ms p(99.9)=50.28ms
     http_reqs......................: 218911  1794.763385/s
     iteration_duration.............: avg=27.41ms  min=17.91ms med=26.79ms  max=326.25ms p(90)=32.07ms  p(95)=34.02ms p(99.9)=51.7ms 
     iterations.....................: 218811  1793.943525/s
     success_rate...................: 100.00% ✓ 218811      ✗ 0     
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

     checks.........................: 100.00% ✓ 467496      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 187 MB  1.5 MB/s
     http_req_blocked...............: avg=3.33µs   min=882ns   med=2.19µs  max=4.13ms   p(90)=4.51µs   p(95)=5.46µs   p(99.9)=38.36µs
     http_req_connecting............: avg=586ns    min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.25ms  min=18.25ms med=37.99ms max=320.06ms p(90)=45ms     p(95)=47.05ms  p(99.9)=65.04ms
       { expected_response:true }...: avg=38.25ms  min=18.25ms med=37.99ms max=320.06ms p(90)=45ms     p(95)=47.05ms  p(99.9)=65.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155932
     http_req_receiving.............: avg=119.35µs min=27.47µs med=55.22µs max=268.75ms p(90)=122.41µs p(95)=166.63µs p(99.9)=2.36ms 
     http_req_sending...............: avg=32.28µs  min=4.54µs  med=9.33µs  max=111.28ms p(90)=23.65µs  p(95)=49.25µs  p(99.9)=1.8ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.1ms   min=18.06ms med=37.88ms max=171.76ms p(90)=44.88ms  p(95)=46.92ms  p(99.9)=61.29ms
     http_reqs......................: 155932  1278.183472/s
     iteration_duration.............: avg=38.5ms   min=21.09ms med=38.21ms max=332.3ms  p(90)=45.22ms  p(95)=47.26ms  p(99.9)=65.59ms
     iterations.....................: 155832  1277.363767/s
     success_rate...................: 100.00% ✓ 155832      ✗ 0     
     vus............................: 25      min=0         max=50  
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

     checks.........................: 100.00% ✓ 445701      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.18µs  min=962ns   med=2.25µs  max=3.5ms    p(90)=3.87µs   p(95)=4.57µs   p(99.9)=32.64µs 
     http_req_connecting............: avg=593ns   min=0s      med=0s      max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.15ms min=18.55ms med=39.53ms max=302.9ms  p(90)=48.25ms  p(95)=51.09ms  p(99.9)=66.66ms 
       { expected_response:true }...: avg=40.15ms min=18.55ms med=39.53ms max=302.9ms  p(90)=48.25ms  p(95)=51.09ms  p(99.9)=66.66ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 148667
     http_req_receiving.............: avg=76.38µs min=25.68µs med=63.25µs max=75.63ms  p(90)=104.59µs p(95)=121.64µs p(99.9)=801.56µs
     http_req_sending...............: avg=25.56µs min=4.57µs  med=10.79µs max=154.42ms p(90)=18.74µs  p(95)=22.45µs  p(99.9)=914.78µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.05ms min=18.4ms  med=39.43ms max=302.37ms p(90)=48.15ms  p(95)=50.98ms  p(99.9)=66.2ms  
     http_reqs......................: 148667  1218.724757/s
     iteration_duration.............: avg=40.37ms min=22.28ms med=39.73ms max=311.59ms p(90)=48.45ms  p(95)=51.3ms   p(99.9)=66.99ms 
     iterations.....................: 148567  1217.904989/s
     success_rate...................: 100.00% ✓ 148567      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 206787     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 83 MB   678 kB/s
     http_req_blocked...............: avg=5.27µs  min=1.23µs  med=3.49µs  max=4.64ms   p(90)=5.12µs   p(95)=5.82µs   p(99.9)=50.4µs  
     http_req_connecting............: avg=1.48µs  min=0s      med=0s      max=4.6ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.7ms  min=21.39ms med=85.5ms  max=353.02ms p(90)=102.36ms p(95)=110.57ms p(99.9)=197.9ms 
       { expected_response:true }...: avg=86.7ms  min=21.39ms med=85.5ms  max=353.02ms p(90)=102.36ms p(95)=110.57ms p(99.9)=197.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 69029
     http_req_receiving.............: avg=92.88µs min=31.18µs med=80.36µs max=196.41ms p(90)=116.67µs p(95)=130.49µs p(99.9)=666.23µs
     http_req_sending...............: avg=25.11µs min=5.91µs  med=16.1µs  max=150.59ms p(90)=22.87µs  p(95)=25.23µs  p(99.9)=672.86µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.58ms min=21.25ms med=85.39ms max=352.28ms p(90)=102.25ms p(95)=110.47ms p(99.9)=197.24ms
     http_reqs......................: 69029   564.583975/s
     iteration_duration.............: avg=87.05ms min=32.7ms  med=85.78ms max=361.23ms p(90)=102.61ms p(95)=110.87ms p(99.9)=199.28ms
     iterations.....................: 68929   563.766081/s
     success_rate...................: 100.00% ✓ 68929      ✗ 0    
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

     checks.........................: 100.00% ✓ 146259     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   479 kB/s
     http_req_blocked...............: avg=5.83µs   min=1.15µs  med=3.5µs    max=3.96ms   p(90)=5µs      p(95)=5.6µs    p(99.9)=234.28µs
     http_req_connecting............: avg=2.08µs   min=0s      med=0s       max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=112.73µs
     http_req_duration..............: avg=122.62ms min=20.99ms med=120.58ms max=341.98ms p(90)=153.26ms p(95)=163.45ms p(99.9)=208.1ms 
       { expected_response:true }...: avg=122.62ms min=20.99ms med=120.58ms max=341.98ms p(90)=153.26ms p(95)=163.45ms p(99.9)=208.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 48853
     http_req_receiving.............: avg=92.75µs  min=31.57µs med=83.16µs  max=153.8ms  p(90)=115.74µs p(95)=128.28µs p(99.9)=542.49µs
     http_req_sending...............: avg=25.76µs  min=5.54µs  med=17.12µs  max=101.38ms p(90)=22.86µs  p(95)=24.89µs  p(99.9)=640.63µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.5ms  min=20.84ms med=120.47ms max=341.22ms p(90)=153.13ms p(95)=163.33ms p(99.9)=207.95ms
     http_reqs......................: 48853   399.302283/s
     iteration_duration.............: avg=123.1ms  min=40.68ms med=120.9ms  max=358.89ms p(90)=153.56ms p(95)=163.79ms p(99.9)=210.4ms 
     iterations.....................: 48753   398.484929/s
     success_rate...................: 100.00% ✓ 48753      ✗ 0    
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

     checks.........................: 100.00% ✓ 95820      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   315 kB/s
     http_req_blocked...............: avg=6.15µs   min=1.12µs  med=3.32µs   max=3.36ms   p(90)=4.81µs   p(95)=5.43µs   p(99.9)=1.22ms  
     http_req_connecting............: avg=2.58µs   min=0s      med=0s       max=3.32ms   p(90)=0s       p(95)=0s       p(99.9)=1.21ms  
     http_req_duration..............: avg=187.13ms min=17.56ms med=175.33ms max=646.74ms p(90)=219.84ms p(95)=252.43ms p(99.9)=562.73ms
       { expected_response:true }...: avg=187.13ms min=17.56ms med=175.33ms max=646.74ms p(90)=219.84ms p(95)=252.43ms p(99.9)=562.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32040
     http_req_receiving.............: avg=99.62µs  min=32.31µs med=92.85µs  max=53.95ms  p(90)=124.36µs p(95)=137.56µs p(99.9)=719.05µs
     http_req_sending...............: avg=38.42µs  min=4.92µs  med=17.94µs  max=192.6ms  p(90)=22.76µs  p(95)=24.68µs  p(99.9)=509.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.99ms min=17.47ms med=175.21ms max=646.62ms p(90)=219.68ms p(95)=251.85ms p(99.9)=562.58ms
     http_reqs......................: 32040   262.338502/s
     iteration_duration.............: avg=187.96ms min=31.1ms  med=175.74ms max=647.04ms p(90)=220.21ms p(95)=253.99ms p(99.9)=563.06ms
     iterations.....................: 31940   261.519718/s
     success_rate...................: 100.00% ✓ 31940      ✗ 0    
     vus............................: 40      min=0        max=50 
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

     checks.........................: 100.00% ✓ 94038      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   308 kB/s
     http_req_blocked...............: avg=6.47µs   min=1.31µs  med=3.73µs   max=3.68ms   p(90)=5.22µs   p(95)=5.83µs   p(99.9)=859µs   
     http_req_connecting............: avg=2.42µs   min=0s      med=0s       max=3.64ms   p(90)=0s       p(95)=0s       p(99.9)=831.18µs
     http_req_duration..............: avg=190.68ms min=23.39ms med=184.09ms max=345.36ms p(90)=213.29ms p(95)=218.57ms p(99.9)=289.26ms
       { expected_response:true }...: avg=190.68ms min=23.39ms med=184.09ms max=345.36ms p(90)=213.29ms p(95)=218.57ms p(99.9)=289.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31446
     http_req_receiving.............: avg=96.04µs  min=35.13µs med=89.08µs  max=33.57ms  p(90)=121.97µs p(95)=134.63µs p(99.9)=633.89µs
     http_req_sending...............: avg=26.3µs   min=5.27µs  med=18.46µs  max=47.06ms  p(90)=23.5µs   p(95)=25.48µs  p(99.9)=690.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.55ms min=23.28ms med=183.98ms max=344.42ms p(90)=213.19ms p(95)=218.45ms p(99.9)=288.63ms
     http_reqs......................: 31446   256.362808/s
     iteration_duration.............: avg=191.5ms  min=86.77ms med=184.39ms max=363.95ms p(90)=213.59ms p(95)=218.87ms p(99.9)=291.53ms
     iterations.....................: 31346   255.54756/s
     success_rate...................: 100.00% ✓ 31346      ✗ 0    
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

     checks.........................: 100.00% ✓ 5682      ✗ 0   
     data_received..................: 191 MB  1.5 MB/s
     data_sent......................: 2.4 MB  19 kB/s
     http_req_blocked...............: avg=128.29µs min=1.55µs   med=3.62µs  max=8.59ms   p(90)=5.18µs   p(95)=6.41µs   p(99.9)=7.96ms  
     http_req_connecting............: avg=121.61µs min=0s       med=0s      max=8.52ms   p(90)=0s       p(95)=0s       p(99.9)=7.77ms  
     http_req_duration..............: avg=3.03s    min=38.45ms  med=3.14s   max=5.03s    p(90)=3.86s    p(95)=4.09s    p(99.9)=4.89s   
       { expected_response:true }...: avg=3.03s    min=38.45ms  med=3.14s   max=5.03s    p(90)=3.86s    p(95)=4.09s    p(99.9)=4.89s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 1994
     http_req_receiving.............: avg=99.64µs  min=33.27µs  med=93.29µs max=673.79µs p(90)=139.08µs p(95)=159.73µs p(99.9)=311.01µs
     http_req_sending...............: avg=43.92µs  min=6.11µs   med=18.68µs max=11.93ms  p(90)=24.66µs  p(95)=28.81µs  p(99.9)=3.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=3.03s    min=38.25ms  med=3.14s   max=5.03s    p(90)=3.86s    p(95)=4.09s    p(99.9)=4.89s   
     http_reqs......................: 1994    15.682694/s
     iteration_duration.............: avg=3.19s    min=868.18ms med=3.19s   max=5.03s    p(90)=3.88s    p(95)=4.1s     p(99.9)=4.9s    
     iterations.....................: 1894    14.896199/s
     success_rate...................: 100.00% ✓ 1894      ✗ 0   
     vus............................: 11      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

