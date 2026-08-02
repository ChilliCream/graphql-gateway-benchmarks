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
| fusion-nightly | 16.6.0-p.13 | 1,886 | 1,937 | 1,882 | 1.0% |  |
| fusion | 16.5.1 | 1,866 | 1,915 | 1,850 | 1.1% |  |
| fusion-nightly-net11 | 16.6.0-p.13 | 1,861 | 1,914 | 1,857 | 1.1% |  |
| hive-router | v0.0.84 | 1,830 | 1,901 | 1,820 | 1.5% |  |
| fusion-nightly-fed | 16.6.0-p.13 | 1,748 | 1,798 | 1,741 | 1.2% |  |
| grafbase | 0.53.5 | 1,291 | 1,327 | 1,284 | 1.1% |  |
| cosmo | 0.334.0 | 1,165 | 1,217 | 1,159 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 576 | 593 | 574 | 1.1% |  |
| apollo-router | v2.16.1 | 435 | 451 | 432 | 1.5% |  |
| apollo-gateway | 2.14.3 | 261 | 265 | 256 | 1.1% |  |
| hive-gateway | 2.10.8 | 254 | 261 | 252 | 1.2% |  |
| feddi | 5ff8b6165878 | 16 | 16 | 15 | 3.3% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 689637      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=3.95µs   min=1.02µs  med=2.74µs  max=7.73ms   p(90)=4.54µs   p(95)=5.3µs   p(99.9)=38.63µs
     http_req_connecting............: avg=777ns    min=0s      med=0s      max=7.7ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.86ms  min=17.16ms med=25.22ms max=304.04ms p(90)=30.3ms   p(95)=32.22ms p(99.9)=51.64ms
       { expected_response:true }...: avg=25.86ms  min=17.16ms med=25.22ms max=304.04ms p(90)=30.3ms   p(95)=32.22ms p(99.9)=51.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229979
     http_req_receiving.............: avg=306.77µs min=51.14µs med=95.27µs max=86.74ms  p(90)=754.11µs p(95)=1.29ms  p(99.9)=8.76ms 
     http_req_sending...............: avg=39.28µs  min=4.83µs  med=10.22µs max=210.3ms  p(90)=20.25µs  p(95)=58.41µs p(99.9)=2.28ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.52ms  min=17.04ms med=24.9ms  max=303.29ms p(90)=29.9ms   p(95)=31.78ms p(99.9)=50.21ms
     http_reqs......................: 229979  1886.18611/s
     iteration_duration.............: avg=26.09ms  min=17.38ms med=25.44ms max=315.79ms p(90)=30.51ms  p(95)=32.44ms p(99.9)=51.94ms
     iterations.....................: 229879  1885.365955/s
     success_rate...................: 100.00% ✓ 229879      ✗ 0     
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

     checks.........................: 100.00% ✓ 682326      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=3.08µs   min=942ns   med=2.29µs  max=3.56ms   p(90)=3.9µs    p(95)=4.58µs  p(99.9)=31.63µs
     http_req_connecting............: avg=420ns    min=0s      med=0s      max=3.52ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.15ms  min=17.26ms med=25.57ms max=301.14ms p(90)=30.52ms  p(95)=32.33ms p(99.9)=50.88ms
       { expected_response:true }...: avg=26.15ms  min=17.26ms med=25.57ms max=301.14ms p(90)=30.52ms  p(95)=32.33ms p(99.9)=50.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227542
     http_req_receiving.............: avg=325.86µs min=51.76µs med=99.42µs max=149.99ms p(90)=835.73µs p(95)=1.32ms  p(99.9)=7.88ms 
     http_req_sending...............: avg=32.54µs  min=4.7µs   med=9.23µs  max=149.8ms  p(90)=18.79µs  p(95)=31.56µs p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.79ms  min=17.11ms med=25.23ms max=300.86ms p(90)=30.09ms  p(95)=31.89ms p(99.9)=48.73ms
     http_reqs......................: 227542  1866.224038/s
     iteration_duration.............: avg=26.37ms  min=17.56ms med=25.78ms max=318.22ms p(90)=30.72ms  p(95)=32.54ms p(99.9)=51.35ms
     iterations.....................: 227442  1865.403871/s
     success_rate...................: 100.00% ✓ 227442      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 680565      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=2.83µs   min=832ns   med=1.96µs  max=3.9ms    p(90)=3.68µs   p(95)=4.44µs  p(99.9)=31.97µs
     http_req_connecting............: avg=434ns    min=0s      med=0s      max=3.87ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.22ms  min=17.22ms med=25.65ms max=307ms    p(90)=30.54ms  p(95)=32.31ms p(99.9)=51.28ms
       { expected_response:true }...: avg=26.22ms  min=17.22ms med=25.65ms max=307ms    p(90)=30.54ms  p(95)=32.31ms p(99.9)=51.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226955
     http_req_receiving.............: avg=329.04µs min=49.4µs  med=91.48µs max=124.63ms p(90)=872.25µs p(95)=1.44ms  p(99.9)=8.5ms  
     http_req_sending...............: avg=30.48µs  min=4.48µs  med=8.33µs  max=137.16ms p(90)=18.54µs  p(95)=29.67µs p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.87ms  min=17.12ms med=25.32ms max=306.74ms p(90)=30.09ms  p(95)=31.82ms p(99.9)=49.39ms
     http_reqs......................: 226955  1861.343123/s
     iteration_duration.............: avg=26.44ms  min=17.39ms med=25.85ms max=317.73ms p(90)=30.74ms  p(95)=32.51ms p(99.9)=51.69ms
     iterations.....................: 226855  1860.522986/s
     success_rate...................: 100.00% ✓ 226855      ✗ 0     
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

     checks.........................: 100.00% ✓ 669237      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 268 MB  2.2 MB/s
     http_req_blocked...............: avg=3.36µs  min=972ns   med=2.58µs  max=3.46ms   p(90)=4.15µs  p(95)=4.86µs   p(99.9)=35.07µs
     http_req_connecting............: avg=422ns   min=0s      med=0s      max=3.42ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.66ms min=17.86ms med=26.21ms max=298.26ms p(90)=30.44ms p(95)=31.91ms  p(99.9)=48.17ms
       { expected_response:true }...: avg=26.66ms min=17.86ms med=26.21ms max=298.26ms p(90)=30.44ms p(95)=31.91ms  p(99.9)=48.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223179
     http_req_receiving.............: avg=78.61µs min=25.94µs med=53.65µs max=111.9ms  p(90)=95.83µs p(95)=121.63µs p(99.9)=2.17ms 
     http_req_sending...............: avg=31.95µs min=4.82µs  med=10.45µs max=168.67ms p(90)=17.96µs p(95)=24.8µs   p(99.9)=1.48ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.55ms min=17.77ms med=26.12ms max=297.77ms p(90)=30.32ms p(95)=31.76ms  p(99.9)=46.73ms
     http_reqs......................: 223179  1830.512834/s
     iteration_duration.............: avg=26.88ms min=18.34ms med=26.42ms max=312.52ms p(90)=30.65ms p(95)=32.11ms  p(99.9)=48.53ms
     iterations.....................: 223079  1829.692635/s
     success_rate...................: 100.00% ✓ 223079      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 639513      ✗ 0     
     data_received..................: 19 GB   153 MB/s
     data_sent......................: 256 MB  2.1 MB/s
     http_req_blocked...............: avg=3.47µs   min=912ns   med=2.59µs  max=4.18ms   p(90)=4.33µs   p(95)=5.09µs  p(99.9)=36.72µs
     http_req_connecting............: avg=468ns    min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.9ms   min=18.02ms med=27.32ms max=303.83ms p(90)=32.76ms  p(95)=34.66ms p(99.9)=52.37ms
       { expected_response:true }...: avg=27.9ms   min=18.02ms med=27.32ms max=303.83ms p(90)=32.76ms  p(95)=34.66ms p(99.9)=52.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 213271
     http_req_receiving.............: avg=327.74µs min=49.57µs med=99.5µs  max=149.5ms  p(90)=826.97µs p(95)=1.4ms   p(99.9)=8.6ms  
     http_req_sending...............: avg=35.01µs  min=4.51µs  med=10.19µs max=113.4ms  p(90)=20.64µs  p(95)=56.93µs p(99.9)=1.8ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.54ms  min=17.86ms med=26.98ms max=303.19ms p(90)=32.33ms  p(95)=34.19ms p(99.9)=50.47ms
     http_reqs......................: 213271  1748.311399/s
     iteration_duration.............: avg=28.13ms  min=18.25ms med=27.54ms max=313.44ms p(90)=32.97ms  p(95)=34.87ms p(99.9)=52.9ms 
     iterations.....................: 213171  1747.491639/s
     success_rate...................: 100.00% ✓ 213171      ✗ 0     
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

     checks.........................: 100.00% ✓ 472161      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 189 MB  1.6 MB/s
     http_req_blocked...............: avg=3.42µs  min=851ns   med=2.22µs  max=4.66ms   p(90)=4.67µs   p(95)=5.67µs   p(99.9)=43.34µs
     http_req_connecting............: avg=577ns   min=0s      med=0s      max=3.55ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.86ms min=18.09ms med=37.57ms max=334.06ms p(90)=44.51ms  p(95)=46.64ms  p(99.9)=60.14ms
       { expected_response:true }...: avg=37.86ms min=18.09ms med=37.57ms max=334.06ms p(90)=44.51ms  p(95)=46.64ms  p(99.9)=60.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157487
     http_req_receiving.............: avg=119.9µs min=28.53µs med=55.48µs max=271.43ms p(90)=123.72µs p(95)=168.56µs p(99.9)=2.69ms 
     http_req_sending...............: avg=31.81µs min=4.49µs  med=9.24µs  max=50.59ms  p(90)=23.76µs  p(95)=46.7µs   p(99.9)=1.75ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.71ms min=18ms    med=37.47ms max=128.5ms  p(90)=44.4ms   p(95)=46.52ms  p(99.9)=58.96ms
     http_reqs......................: 157487  1291.170627/s
     iteration_duration.............: avg=38.11ms min=21.86ms med=37.8ms  max=349.36ms p(90)=44.73ms  p(95)=46.86ms  p(99.9)=60.48ms
     iterations.....................: 157387  1290.350768/s
     success_rate...................: 100.00% ✓ 157387      ✗ 0     
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

     checks.........................: 100.00% ✓ 426246      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=4µs     min=971ns   med=2.85µs  max=8.05ms   p(90)=4.61µs   p(95)=5.36µs   p(99.9)=37.78µs 
     http_req_connecting............: avg=711ns   min=0s      med=0s      max=5.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.98ms min=18.88ms med=41.34ms max=296.79ms p(90)=50.69ms  p(95)=53.71ms  p(99.9)=69.63ms 
       { expected_response:true }...: avg=41.98ms min=18.88ms med=41.34ms max=296.79ms p(90)=50.69ms  p(95)=53.71ms  p(99.9)=69.63ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142182
     http_req_receiving.............: avg=84.32µs min=28.42µs med=69.35µs max=163.46ms p(90)=113.63µs p(95)=133.15µs p(99.9)=985.87µs
     http_req_sending...............: avg=26.79µs min=4.55µs  med=12.21µs max=123.71ms p(90)=19.6µs   p(95)=23.57µs  p(99.9)=1.08ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.87ms min=18.68ms med=41.24ms max=296.61ms p(90)=50.58ms  p(95)=53.59ms  p(99.9)=69.11ms 
     http_reqs......................: 142182  1165.308873/s
     iteration_duration.............: avg=42.22ms min=23.34ms med=41.56ms max=306.73ms p(90)=50.9ms   p(95)=53.91ms  p(99.9)=70.05ms 
     iterations.....................: 142082  1164.489284/s
     success_rate...................: 100.00% ✓ 142082      ✗ 0     
     vus............................: 48      min=0         max=50  
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

     checks.........................: 100.00% ✓ 210942     ✗ 0    
     data_received..................: 6.2 GB  50 MB/s
     data_sent......................: 85 MB   692 kB/s
     http_req_blocked...............: avg=5.11µs  min=1.24µs  med=3.41µs  max=4.08ms   p(90)=5.08µs   p(95)=5.78µs   p(99.9)=56.41µs 
     http_req_connecting............: avg=1.39µs  min=0s      med=0s      max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.98ms min=21.2ms  med=84.68ms max=299.06ms p(90)=110.68ms p(95)=119.89ms p(99.9)=204.47ms
       { expected_response:true }...: avg=84.98ms min=21.2ms  med=84.68ms max=299.06ms p(90)=110.68ms p(95)=119.89ms p(99.9)=204.47ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70414
     http_req_receiving.............: avg=85.78µs min=29.86µs med=77.33µs max=34.33ms  p(90)=115.35µs p(95)=130.14µs p(99.9)=709.58µs
     http_req_sending...............: avg=25.21µs min=5.44µs  med=15.52µs max=105.91ms p(90)=22.5µs   p(95)=24.96µs  p(99.9)=664.03µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.87ms min=21.06ms med=84.57ms max=298.54ms p(90)=110.57ms p(95)=119.75ms p(99.9)=204.32ms
     http_reqs......................: 70414   576.036178/s
     iteration_duration.............: avg=85.34ms min=29.26ms med=84.95ms max=314.97ms p(90)=110.95ms p(95)=120.15ms p(99.9)=207.73ms
     iterations.....................: 70314   575.218107/s
     success_rate...................: 100.00% ✓ 70314      ✗ 0    
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

     checks.........................: 100.00% ✓ 159558     ✗ 0    
     data_received..................: 4.7 GB  38 MB/s
     data_sent......................: 64 MB   523 kB/s
     http_req_blocked...............: avg=6.03µs   min=1.45µs  med=3.7µs    max=3.61ms   p(90)=5.27µs   p(95)=5.9µs    p(99.9)=109.38µs
     http_req_connecting............: avg=2.04µs   min=0s      med=0s       max=3.57ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.37ms min=20.34ms med=110.54ms max=333.22ms p(90)=140.14ms p(95)=149.06ms p(99.9)=191.47ms
       { expected_response:true }...: avg=112.37ms min=20.34ms med=110.54ms max=333.22ms p(90)=140.14ms p(95)=149.06ms p(99.9)=191.47ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53286
     http_req_receiving.............: avg=92.94µs  min=33.6µs  med=86.77µs  max=82.04ms  p(90)=119.12µs p(95)=132.23µs p(99.9)=565.5µs 
     http_req_sending...............: avg=28.8µs   min=5.89µs  med=18.52µs  max=110.41ms p(90)=24.04µs  p(95)=26.16µs  p(99.9)=598.77µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.25ms min=20.25ms med=110.42ms max=332.61ms p(90)=140.02ms p(95)=148.93ms p(99.9)=190.55ms
     http_reqs......................: 53286   435.663085/s
     iteration_duration.............: avg=112.83ms min=41.72ms med=110.86ms max=366.97ms p(90)=140.45ms p(95)=149.35ms p(99.9)=194.27ms
     iterations.....................: 53186   434.845491/s
     success_rate...................: 100.00% ✓ 53186      ✗ 0    
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

     checks.........................: 100.00% ✓ 95880      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   314 kB/s
     http_req_blocked...............: avg=6.72µs   min=1.5µs   med=3.68µs   max=3.65ms   p(90)=5.18µs   p(95)=5.78µs   p(99.9)=1.31ms  
     http_req_connecting............: avg=2.73µs   min=0s      med=0s       max=3.6ms    p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=187.03ms min=23.59ms med=210.03ms max=378.7ms  p(90)=232.77ms p(95)=238.41ms p(99.9)=313.21ms
       { expected_response:true }...: avg=187.03ms min=23.59ms med=210.03ms max=378.7ms  p(90)=232.77ms p(95)=238.41ms p(99.9)=313.21ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32060
     http_req_receiving.............: avg=98.09µs  min=35.03µs med=92.89µs  max=10.66ms  p(90)=126µs    p(95)=140.65µs p(99.9)=531.21µs
     http_req_sending...............: avg=24.55µs  min=6.26µs  med=18.82µs  max=29.22ms  p(90)=23.8µs   p(95)=25.78µs  p(99.9)=522.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.9ms  min=23.49ms med=209.91ms max=373.57ms p(90)=232.66ms p(95)=238.29ms p(99.9)=313.08ms
     http_reqs......................: 32060   261.32957/s
     iteration_duration.............: avg=187.84ms min=59.48ms med=210.41ms max=385.74ms p(90)=233.08ms p(95)=238.74ms p(99.9)=314.26ms
     iterations.....................: 31960   260.514443/s
     success_rate...................: 100.00% ✓ 31960      ✗ 0    
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

     checks.........................: 100.00% ✓ 92817      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   305 kB/s
     http_req_blocked...............: avg=7.44µs   min=1.46µs  med=3.73µs   max=4.67ms   p(90)=5.19µs   p(95)=5.82µs   p(99.9)=1.82ms  
     http_req_connecting............: avg=3.34µs   min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=193.18ms min=17.95ms med=183.25ms max=646.5ms  p(90)=246.03ms p(95)=281.2ms  p(99.9)=612.52ms
       { expected_response:true }...: avg=193.18ms min=17.95ms med=183.25ms max=646.5ms  p(90)=246.03ms p(95)=281.2ms  p(99.9)=612.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31039
     http_req_receiving.............: avg=98.8µs   min=37.13µs med=91.69µs  max=17.47ms  p(90)=123.33µs p(95)=135.63µs p(99.9)=944.92µs
     http_req_sending...............: avg=27.13µs  min=6.65µs  med=18.28µs  max=88.13ms  p(90)=23.24µs  p(95)=25.2µs   p(99.9)=713.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.06ms min=17.81ms med=183.12ms max=646.38ms p(90)=245.89ms p(95)=281.03ms p(99.9)=612.44ms
     http_reqs......................: 31039   254.152593/s
     iteration_duration.............: avg=194.04ms min=46.73ms med=183.74ms max=646.76ms p(90)=246.4ms  p(95)=282.31ms p(99.9)=612.9ms 
     iterations.....................: 30939   253.333776/s
     success_rate...................: 100.00% ✓ 30939      ✗ 0    
     vus............................: 49      min=0        max=50 
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

     checks.........................: 100.00% ✓ 5937      ✗ 0   
     data_received..................: 199 MB  1.6 MB/s
     data_sent......................: 2.5 MB  19 kB/s
     http_req_blocked...............: avg=47.7µs   min=1.53µs  med=3.45µs  max=3.94ms p(90)=5.06µs   p(95)=6.02µs  p(99.9)=3.63ms  
     http_req_connecting............: avg=43.18µs  min=0s      med=0s      max=3.9ms  p(90)=0s       p(95)=0s      p(99.9)=3.61ms  
     http_req_duration..............: avg=2.93s    min=45.9ms  med=3.06s   max=5.07s  p(90)=3.63s    p(95)=3.77s   p(99.9)=4.58s   
       { expected_response:true }...: avg=2.93s    min=45.9ms  med=3.06s   max=5.07s  p(90)=3.63s    p(95)=3.77s   p(99.9)=4.58s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2079
     http_req_receiving.............: avg=104.82µs min=35.9µs  med=93.46µs max=8.21ms p(90)=139.06µs p(95)=155.9µs p(99.9)=676.21µs
     http_req_sending...............: avg=43.28µs  min=7.22µs  med=18.17µs max=11.7ms p(90)=23.43µs  p(95)=28.55µs p(99.9)=3.82ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s     p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=2.93s    min=45.7ms  med=3.06s   max=5.07s  p(90)=3.63s    p(95)=3.77s   p(99.9)=4.58s   
     http_reqs......................: 2079    16.210064/s
     iteration_duration.............: avg=3.08s    min=751.3ms med=3.09s   max=5.07s  p(90)=3.64s    p(95)=3.78s   p(99.9)=4.59s   
     iterations.....................: 1979    15.430359/s
     success_rate...................: 100.00% ✓ 1979      ✗ 0   
     vus............................: 29      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

