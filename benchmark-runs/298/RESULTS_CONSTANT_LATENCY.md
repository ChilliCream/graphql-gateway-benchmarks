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
| fusion-nightly-net11 | 16.6.0-p.3 | 1,870 | 1,915 | 1,856 | 1.1% |  |
| fusion | 16.5.1 | 1,866 | 1,912 | 1,856 | 1.0% |  |
| fusion-nightly | 16.6.0-p.3 | 1,866 | 1,915 | 1,858 | 1.0% |  |
| hive-router | v0.0.83 | 1,828 | 1,882 | 1,817 | 1.2% |  |
| fusion-nightly-fed | 16.6.0-p.3 | 1,753 | 1,785 | 1,744 | 0.7% |  |
| grafbase | 0.53.5 | 1,272 | 1,314 | 1,264 | 1.4% |  |
| cosmo | 0.331.1 | 1,231 | 1,276 | 1,227 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.4 | 564 | 579 | 561 | 1.1% |  |
| apollo-router | v2.16.0 | 401 | 428 | 396 | 2.7% |  |
| apollo-gateway | 2.14.2 | 260 | 264 | 257 | 0.8% |  |
| hive-gateway | 2.10.4 | 258 | 263 | 255 | 0.9% |  |
| feddi | 5ff8b6165878 | 18 | 18 | 17 | 1.9% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 683730      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.69µs   min=872ns   med=2.01µs  max=9.76ms   p(90)=3.57µs  p(95)=4.31µs  p(99.9)=28.99µs
     http_req_connecting............: avg=1.23µs   min=0s      med=0s      max=9.71ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.1ms   min=17.1ms  med=25.54ms max=282.6ms  p(90)=30.36ms p(95)=32.15ms p(99.9)=48.2ms 
       { expected_response:true }...: avg=26.1ms   min=17.1ms  med=25.54ms max=282.6ms  p(90)=30.36ms p(95)=32.15ms p(99.9)=48.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 228010
     http_req_receiving.............: avg=323.09µs min=50.56µs med=94.21µs max=69.41ms  p(90)=857.4µs p(95)=1.37ms  p(99.9)=7.82ms 
     http_req_sending...............: avg=30.43µs  min=4.48µs  med=8.32µs  max=178.5ms  p(90)=17.84µs p(95)=29.04µs p(99.9)=1.51ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.74ms  min=17.02ms med=25.2ms  max=280.39ms p(90)=29.92ms p(95)=31.67ms p(99.9)=46.49ms
     http_reqs......................: 228010  1870.081975/s
     iteration_duration.............: avg=26.31ms  min=17.26ms med=25.75ms max=323.32ms p(90)=30.56ms p(95)=32.35ms p(99.9)=48.59ms
     iterations.....................: 227910  1869.261799/s
     success_rate...................: 100.00% ✓ 227910      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 682542      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=2.77µs   min=891ns   med=1.97µs  max=6.11ms   p(90)=3.56µs   p(95)=4.27µs  p(99.9)=33.78µs
     http_req_connecting............: avg=326ns    min=0s      med=0s      max=3.82ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.15ms  min=17.54ms med=25.56ms max=289.79ms p(90)=30.58ms  p(95)=32.43ms p(99.9)=48.06ms
       { expected_response:true }...: avg=26.15ms  min=17.54ms med=25.56ms max=289.79ms p(90)=30.58ms  p(95)=32.43ms p(99.9)=48.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227614
     http_req_receiving.............: avg=310.33µs min=50.26µs med=94.89µs max=165.87ms p(90)=788.89µs p(95)=1.26ms  p(99.9)=7.76ms 
     http_req_sending...............: avg=30.02µs  min=4.44µs  med=8.21µs  max=164.65ms p(90)=17.52µs  p(95)=26.84µs p(99.9)=1.48ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.81ms  min=17.3ms  med=25.24ms max=288.35ms p(90)=30.17ms  p(95)=31.98ms p(99.9)=46.51ms
     http_reqs......................: 227614  1866.766217/s
     iteration_duration.............: avg=26.36ms  min=17.71ms med=25.77ms max=308.3ms  p(90)=30.78ms  p(95)=32.64ms p(99.9)=48.63ms
     iterations.....................: 227514  1865.946071/s
     success_rate...................: 100.00% ✓ 227514      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 682287      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=2.79µs   min=901ns   med=1.95µs  max=6.56ms   p(90)=3.53µs   p(95)=4.27µs  p(99.9)=29.79µs
     http_req_connecting............: avg=417ns    min=0s      med=0s      max=3.88ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.16ms  min=16.9ms  med=25.58ms max=304.97ms p(90)=30.6ms   p(95)=32.43ms p(99.9)=49.06ms
       { expected_response:true }...: avg=26.16ms  min=16.9ms  med=25.58ms max=304.97ms p(90)=30.6ms   p(95)=32.43ms p(99.9)=49.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227529
     http_req_receiving.............: avg=310.63µs min=49.63µs med=93.8µs  max=104.43ms p(90)=786.37µs p(95)=1.27ms  p(99.9)=8.01ms 
     http_req_sending...............: avg=31.11µs  min=4.65µs  med=8.46µs  max=153.57ms p(90)=18.65µs  p(95)=30.17µs p(99.9)=1.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.82ms  min=16.69ms med=25.25ms max=304.81ms p(90)=30.2ms   p(95)=31.99ms p(99.9)=47.9ms 
     http_reqs......................: 227529  1866.091476/s
     iteration_duration.............: avg=26.37ms  min=17.08ms med=25.78ms max=320.68ms p(90)=30.8ms   p(95)=32.63ms p(99.9)=49.49ms
     iterations.....................: 227429  1865.27132/s
     success_rate...................: 100.00% ✓ 227429      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 668397      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 268 MB  2.2 MB/s
     http_req_blocked...............: avg=2.83µs  min=892ns   med=2.04µs  max=3.6ms    p(90)=3.59µs  p(95)=4.27µs   p(99.9)=26.07µs
     http_req_connecting............: avg=422ns   min=0s      med=0s      max=3.56ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.71ms min=18.11ms med=26.3ms  max=305.59ms p(90)=30.42ms p(95)=31.83ms  p(99.9)=47.15ms
       { expected_response:true }...: avg=26.71ms min=18.11ms med=26.3ms  max=305.59ms p(90)=30.42ms p(95)=31.83ms  p(99.9)=47.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 222899
     http_req_receiving.............: avg=97.4µs  min=25.51µs med=49.46µs max=262.16ms p(90)=90.22µs p(95)=113.97µs p(99.9)=2.36ms 
     http_req_sending...............: avg=26.39µs min=4.4µs   med=8.98µs  max=25.93ms  p(90)=17.68µs p(95)=23.75µs  p(99.9)=1.28ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.59ms min=18.05ms med=26.22ms max=175.87ms p(90)=30.32ms p(95)=31.71ms  p(99.9)=43.97ms
     http_reqs......................: 222899  1828.034041/s
     iteration_duration.............: avg=26.92ms min=18.29ms med=26.5ms  max=311.54ms p(90)=30.62ms p(95)=32.03ms  p(99.9)=47.47ms
     iterations.....................: 222799  1827.213923/s
     success_rate...................: 100.00% ✓ 222799      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 641487      ✗ 0     
     data_received..................: 19 GB   154 MB/s
     data_sent......................: 257 MB  2.1 MB/s
     http_req_blocked...............: avg=3.04µs   min=872ns   med=2.08µs  max=19.67ms  p(90)=3.86µs   p(95)=4.6µs   p(99.9)=34.05µs
     http_req_connecting............: avg=533ns    min=0s      med=0s      max=19.54ms  p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.82ms  min=17.95ms med=27.26ms max=318.95ms p(90)=32.63ms  p(95)=34.47ms p(99.9)=50.8ms 
       { expected_response:true }...: avg=27.82ms  min=17.95ms med=27.26ms max=318.95ms p(90)=32.63ms  p(95)=34.47ms p(99.9)=50.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 213929
     http_req_receiving.............: avg=322.21µs min=50.31µs med=95.29µs max=227.55ms p(90)=821.62µs p(95)=1.36ms  p(99.9)=8.13ms 
     http_req_sending...............: avg=30.67µs  min=4.54µs  med=8.84µs  max=151.97ms p(90)=19.7µs   p(95)=29.09µs p(99.9)=1.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.47ms  min=17.87ms med=26.92ms max=318.4ms  p(90)=32.2ms   p(95)=34.01ms p(99.9)=49.06ms
     http_reqs......................: 213929  1753.735131/s
     iteration_duration.............: avg=28.05ms  min=18.15ms med=27.47ms max=325.91ms p(90)=32.83ms  p(95)=34.67ms p(99.9)=51.37ms
     iterations.....................: 213829  1752.915357/s
     success_rate...................: 100.00% ✓ 213829      ✗ 0     
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

     checks.........................: 100.00% ✓ 465396      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 187 MB  1.5 MB/s
     http_req_blocked...............: avg=4.18µs  min=1.01µs  med=3.02µs  max=4.05ms   p(90)=5.39µs   p(95)=6.39µs   p(99.9)=45.37µs
     http_req_connecting............: avg=621ns   min=0s      med=0s      max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.39ms min=18.25ms med=38.12ms max=317.54ms p(90)=45.13ms  p(95)=47.32ms  p(99.9)=64.65ms
       { expected_response:true }...: avg=38.39ms min=18.25ms med=38.12ms max=317.54ms p(90)=45.13ms  p(95)=47.32ms  p(99.9)=64.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155232
     http_req_receiving.............: avg=95.98µs min=27.14µs med=63.48µs max=159.61ms p(90)=134.77µs p(95)=187.26µs p(99.9)=2.13ms 
     http_req_sending...............: avg=38.94µs min=4.72µs  med=11.67µs max=170.38ms p(90)=26.5µs   p(95)=80.8µs   p(99.9)=2.11ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.26ms min=18.15ms med=38ms    max=304.23ms p(90)=45.01ms  p(95)=47.17ms  p(99.9)=64.28ms
     http_reqs......................: 155232  1272.425741/s
     iteration_duration.............: avg=38.66ms min=19.87ms med=38.37ms max=327.12ms p(90)=45.36ms  p(95)=47.55ms  p(99.9)=65.24ms
     iterations.....................: 155132  1271.606048/s
     success_rate...................: 100.00% ✓ 155132      ✗ 0     
     vus............................: 20      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 450576      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 181 MB  1.5 MB/s
     http_req_blocked...............: avg=3.5µs   min=951ns   med=2.46µs  max=3.49ms   p(90)=4.17µs   p(95)=4.88µs   p(99.9)=36.49µs 
     http_req_connecting............: avg=691ns   min=0s      med=0s      max=3.37ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.71ms min=18.93ms med=39.08ms max=297.51ms p(90)=47.64ms  p(95)=50.37ms  p(99.9)=65.45ms 
       { expected_response:true }...: avg=39.71ms min=18.93ms med=39.08ms max=297.51ms p(90)=47.64ms  p(95)=50.37ms  p(99.9)=65.45ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 150292
     http_req_receiving.............: avg=80.33µs min=26.33µs med=63.8µs  max=211.31ms p(90)=105.48µs p(95)=123.69µs p(99.9)=970.61µs
     http_req_sending...............: avg=26µs    min=4.66µs  med=11.18µs max=132.1ms  p(90)=19.41µs  p(95)=23.34µs  p(99.9)=1.03ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.6ms  min=18.78ms med=38.98ms max=296.88ms p(90)=47.54ms  p(95)=50.26ms  p(99.9)=65.17ms 
     http_reqs......................: 150292  1231.824499/s
     iteration_duration.............: avg=39.94ms min=22.07ms med=39.29ms max=323.31ms p(90)=47.85ms  p(95)=50.57ms  p(99.9)=65.7ms  
     iterations.....................: 150192  1231.004878/s
     success_rate...................: 100.00% ✓ 150192      ✗ 0     
     vus............................: 40      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 206706     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 83 MB   678 kB/s
     http_req_blocked...............: avg=4.57µs  min=1.04µs  med=2.85µs  max=3.77ms   p(90)=4.44µs   p(95)=5.09µs   p(99.9)=47.83µs 
     http_req_connecting............: avg=1.47µs  min=0s      med=0s      max=3.73ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.73ms min=20.58ms med=84.36ms max=323.21ms p(90)=106.72ms p(95)=116.22ms p(99.9)=203.61ms
       { expected_response:true }...: avg=86.73ms min=20.58ms med=84.36ms max=323.21ms p(90)=106.72ms p(95)=116.22ms p(99.9)=203.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69002
     http_req_receiving.............: avg=83.5µs  min=27.95µs med=75.19µs max=120.83ms p(90)=111.79µs p(95)=125.35µs p(99.9)=666.14µs
     http_req_sending...............: avg=22.56µs min=5.24µs  med=14.48µs max=96.14ms  p(90)=21.28µs  p(95)=23.43µs  p(99.9)=592.11µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.62ms min=20.43ms med=84.26ms max=322.76ms p(90)=106.63ms p(95)=116.1ms  p(99.9)=203.49ms
     http_reqs......................: 69002   564.501047/s
     iteration_duration.............: avg=87.08ms min=35.29ms med=84.61ms max=342.11ms p(90)=106.97ms p(95)=116.5ms  p(99.9)=208.05ms
     iterations.....................: 68902   563.682953/s
     success_rate...................: 100.00% ✓ 68902      ✗ 0    
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

     checks.........................: 100.00% ✓ 146997     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   482 kB/s
     http_req_blocked...............: avg=5.74µs   min=1.44µs  med=3.49µs   max=3.6ms    p(90)=4.97µs   p(95)=5.6µs    p(99.9)=169.03µs
     http_req_connecting............: avg=1.94µs   min=0s      med=0s       max=3.55ms   p(90)=0s       p(95)=0s       p(99.9)=91.99µs 
     http_req_duration..............: avg=121.99ms min=21.62ms med=120.09ms max=337.48ms p(90)=152.72ms p(95)=162.82ms p(99.9)=206.35ms
       { expected_response:true }...: avg=121.99ms min=21.62ms med=120.09ms max=337.48ms p(90)=152.72ms p(95)=162.82ms p(99.9)=206.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49099
     http_req_receiving.............: avg=95.97µs  min=32.78µs med=86.23µs  max=121.8ms  p(90)=118.73µs p(95)=131.82µs p(99.9)=580.86µs
     http_req_sending...............: avg=29.49µs  min=6.14µs  med=18µs     max=95.02ms  p(90)=23.56µs  p(95)=25.59µs  p(99.9)=610.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.86ms min=21.48ms med=119.98ms max=336.86ms p(90)=152.61ms p(95)=162.71ms p(99.9)=205.68ms
     http_reqs......................: 49099   401.244754/s
     iteration_duration.............: avg=122.48ms min=49.37ms med=120.42ms max=366.98ms p(90)=153.03ms p(95)=163.11ms p(99.9)=209.59ms
     iterations.....................: 48999   400.427538/s
     success_rate...................: 100.00% ✓ 48999      ✗ 0    
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

     checks.........................: 100.00% ✓ 95511      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=5.53µs   min=1.41µs  med=3.74µs   max=2.98ms   p(90)=5.27µs   p(95)=5.87µs   p(99.9)=441.15µs
     http_req_connecting............: avg=1.5µs    min=0s      med=0s       max=2.94ms   p(90)=0s       p(95)=0s       p(99.9)=411.3µs 
     http_req_duration..............: avg=187.73ms min=22.59ms med=183.96ms max=360.74ms p(90)=227.9ms  p(95)=233.55ms p(99.9)=297.86ms
       { expected_response:true }...: avg=187.73ms min=22.59ms med=183.96ms max=360.74ms p(90)=227.9ms  p(95)=233.55ms p(99.9)=297.86ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31937
     http_req_receiving.............: avg=98.71µs  min=37.19µs med=91.63µs  max=40.66ms  p(90)=123.8µs  p(95)=137.14µs p(99.9)=567.41µs
     http_req_sending...............: avg=28.91µs  min=6.78µs  med=18.56µs  max=75.64ms  p(90)=23.56µs  p(95)=25.58µs  p(99.9)=539.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.6ms  min=22.44ms med=183.84ms max=360.61ms p(90)=227.78ms p(95)=233.44ms p(99.9)=297.31ms
     http_reqs......................: 31937   260.295799/s
     iteration_duration.............: avg=188.56ms min=56.57ms med=187.37ms max=378.16ms p(90)=228.21ms p(95)=233.88ms p(99.9)=300.33ms
     iterations.....................: 31837   259.48077/s
     success_rate...................: 100.00% ✓ 31837      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94380      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=6.08µs   min=1.06µs  med=3.12µs   max=3.51ms   p(90)=4.52µs   p(95)=5.08µs   p(99.9)=1.33ms  
     http_req_connecting............: avg=2.74µs   min=0s      med=0s       max=3.48ms   p(90)=0s       p(95)=0s       p(99.9)=1.31ms  
     http_req_duration..............: avg=190.08ms min=18.28ms med=177.94ms max=642.51ms p(90)=227.94ms p(95)=266.87ms p(99.9)=578.65ms
       { expected_response:true }...: avg=190.08ms min=18.28ms med=177.94ms max=642.51ms p(90)=227.94ms p(95)=266.87ms p(99.9)=578.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31560
     http_req_receiving.............: avg=98.43µs  min=31.2µs  med=91.19µs  max=62.55ms  p(90)=122.44µs p(95)=135.55µs p(99.9)=885.49µs
     http_req_sending...............: avg=24.52µs  min=5.49µs  med=18.06µs  max=38.98ms  p(90)=22.83µs  p(95)=24.75µs  p(99.9)=631.41µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.96ms min=18.18ms med=177.83ms max=642.4ms  p(90)=227.83ms p(95)=266.52ms p(99.9)=578.55ms
     http_reqs......................: 31560   258.155946/s
     iteration_duration.............: avg=190.92ms min=53.67ms med=178.38ms max=642.78ms p(90)=228.34ms p(95)=268.45ms p(99.9)=578.99ms
     iterations.....................: 31460   257.337961/s
     success_rate...................: 100.00% ✓ 31460      ✗ 0    
     vus............................: 40      min=0        max=50 
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

     checks.........................: 100.00% ✓ 6771      ✗ 0   
     data_received..................: 226 MB  1.8 MB/s
     data_sent......................: 2.8 MB  22 kB/s
     http_req_blocked...............: avg=44.17µs min=1.42µs   med=3.55µs  max=4.06ms  p(90)=5.06µs  p(95)=6.03µs   p(99.9)=3.8ms   
     http_req_connecting............: avg=39.97µs min=0s       med=0s      max=4.02ms  p(90)=0s      p(95)=0s       p(99.9)=3.77ms  
     http_req_duration..............: avg=2.57s   min=37.8ms   med=2.66s   max=4.38s   p(90)=3.29s   p(95)=3.5s     p(99.9)=4.32s   
       { expected_response:true }...: avg=2.57s   min=37.8ms   med=2.66s   max=4.38s   p(90)=3.29s   p(95)=3.5s     p(99.9)=4.32s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2357
     http_req_receiving.............: avg=97.32µs min=29.48µs  med=91.11µs max=3.27ms  p(90)=137.9µs p(95)=156.01µs p(99.9)=350.13µs
     http_req_sending...............: avg=40.79µs min=5.8µs    med=18µs    max=12.53ms p(90)=23.42µs p(95)=28.24µs  p(99.9)=3.01ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.57s   min=37.68ms  med=2.66s   max=4.38s   p(90)=3.29s   p(95)=3.5s     p(99.9)=4.32s   
     http_reqs......................: 2357    18.494666/s
     iteration_duration.............: avg=2.68s   min=747.69ms med=2.69s   max=4.38s   p(90)=3.31s   p(95)=3.51s    p(99.9)=4.33s   
     iterations.....................: 2257    17.709996/s
     success_rate...................: 100.00% ✓ 2257      ✗ 0   
     vus............................: 25      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

