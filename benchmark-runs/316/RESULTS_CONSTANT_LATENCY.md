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
| fusion-nightly-net11 | 16.6.1-p.1 | 1,885 | 1,930 | 1,877 | 1.0% |  |
| fusion-nightly | 16.6.1-p.1 | 1,873 | 1,928 | 1,867 | 1.1% |  |
| fusion | 16.6.0 | 1,871 | 1,930 | 1,863 | 1.1% |  |
| hive-router | v0.0.84 | 1,857 | 1,918 | 1,851 | 1.2% |  |
| fusion-nightly-fed | 16.6.1-p.1 | 1,819 | 1,865 | 1,811 | 1.0% |  |
| grafbase | 0.53.5 | 1,317 | 1,343 | 1,308 | 0.9% |  |
| hive-gateway-router-runtime | 2.10.8 | 566 | 585 | 563 | 1.5% |  |
| apollo-router | v2.16.1 | 430 | 447 | 429 | 1.4% |  |
| hive-gateway | 2.10.8 | 266 | 273 | 265 | 1.0% |  |
| apollo-gateway | 2.14.3 | 260 | 264 | 259 | 0.6% |  |
| feddi | 5ff8b6165878 | 15 | 16 | 15 | 3.5% |  |
| cosmo | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 689433      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.96µs   min=861ns   med=1.96µs  max=10.13ms  p(90)=3.75µs   p(95)=4.51µs  p(99.9)=32.77µs
     http_req_connecting............: avg=396ns    min=0s      med=0s      max=3.54ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.88ms  min=16.39ms med=25.32ms max=306.57ms p(90)=30.11ms  p(95)=31.91ms p(99.9)=49.37ms
       { expected_response:true }...: avg=25.88ms  min=16.39ms med=25.32ms max=306.57ms p(90)=30.11ms  p(95)=31.91ms p(99.9)=49.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229911
     http_req_receiving.............: avg=257.53µs min=49.94µs med=86.17µs max=183.6ms  p(90)=600.95µs p(95)=1.11ms  p(99.9)=7.07ms 
     http_req_sending...............: avg=30.86µs  min=4.22µs  med=8.24µs  max=116.66ms p(90)=18.65µs  p(95)=33.7µs  p(99.9)=1.51ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.59ms  min=16.3ms  med=25.05ms max=296.99ms p(90)=29.77ms  p(95)=31.53ms p(99.9)=47.93ms
     http_reqs......................: 229911  1885.787524/s
     iteration_duration.............: avg=26.1ms   min=16.58ms med=25.53ms max=313.64ms p(90)=30.3ms   p(95)=32.11ms p(99.9)=49.78ms
     iterations.....................: 229811  1884.967299/s
     success_rate...................: 100.00% ✓ 229811      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 685266      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.87µs   min=862ns   med=2.02µs  max=4.07ms   p(90)=3.72µs   p(95)=4.46µs  p(99.9)=32.09µs
     http_req_connecting............: avg=410ns    min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.04ms  min=17.32ms med=25.45ms max=301.37ms p(90)=30.45ms  p(95)=32.28ms p(99.9)=48.92ms
       { expected_response:true }...: avg=26.04ms  min=17.32ms med=25.45ms max=301.37ms p(90)=30.45ms  p(95)=32.28ms p(99.9)=48.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228522
     http_req_receiving.............: avg=325.34µs min=50.05µs med=96.93µs max=123.27ms p(90)=831.67µs p(95)=1.31ms  p(99.9)=8.12ms 
     http_req_sending...............: avg=30.95µs  min=4.55µs  med=8.59µs  max=66.16ms  p(90)=18.48µs  p(95)=29.21µs p(99.9)=1.51ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.68ms  min=17.21ms med=25.11ms max=300.91ms p(90)=30.02ms  p(95)=31.82ms p(99.9)=47.19ms
     http_reqs......................: 228522  1873.998498/s
     iteration_duration.............: avg=26.25ms  min=17.53ms med=25.66ms max=322.81ms p(90)=30.65ms  p(95)=32.48ms p(99.9)=49.5ms 
     iterations.....................: 228422  1873.178446/s
     success_rate...................: 100.00% ✓ 228422      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 684129      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=2.81µs   min=842ns   med=1.99µs  max=4.02ms   p(90)=3.7µs    p(95)=4.44µs  p(99.9)=27.89µs
     http_req_connecting............: avg=400ns    min=0s      med=0s      max=3.98ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.08ms  min=17.44ms med=25.51ms max=306.35ms p(90)=30.5ms   p(95)=32.3ms  p(99.9)=49.09ms
       { expected_response:true }...: avg=26.08ms  min=17.44ms med=25.51ms max=306.35ms p(90)=30.5ms   p(95)=32.3ms  p(99.9)=49.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228143
     http_req_receiving.............: avg=305.39µs min=49.72µs med=92.15µs max=115.02ms p(90)=777.99µs p(95)=1.28ms  p(99.9)=7.91ms 
     http_req_sending...............: avg=32.25µs  min=4.09µs  med=8.36µs  max=215.56ms p(90)=18.37µs  p(95)=28.86µs p(99.9)=1.61ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.75ms  min=17.29ms med=25.19ms max=305.58ms p(90)=30.1ms   p(95)=31.85ms p(99.9)=47.61ms
     http_reqs......................: 228143  1871.135153/s
     iteration_duration.............: avg=26.3ms   min=17.63ms med=25.71ms max=316.11ms p(90)=30.71ms  p(95)=32.5ms  p(99.9)=49.38ms
     iterations.....................: 228043  1870.314994/s
     success_rate...................: 100.00% ✓ 228043      ✗ 0     
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

     checks.........................: 100.00% ✓ 679197      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=3.56µs  min=982ns   med=2.72µs  max=4.08ms   p(90)=4.4µs   p(95)=5.15µs   p(99.9)=37.01µs
     http_req_connecting............: avg=455ns   min=0s      med=0s      max=3.79ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.26ms min=17.83ms med=25.78ms max=308.56ms p(90)=30ms    p(95)=31.44ms  p(99.9)=49.17ms
       { expected_response:true }...: avg=26.26ms min=17.83ms med=25.78ms max=308.56ms p(90)=30ms    p(95)=31.44ms  p(99.9)=49.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226499
     http_req_receiving.............: avg=81.25µs min=25.51µs med=54.31µs max=203.98ms p(90)=99.99µs p(95)=129.06µs p(99.9)=2.54ms 
     http_req_sending...............: avg=32.8µs  min=4.75µs  med=10.82µs max=115.73ms p(90)=19.8µs  p(95)=28.34µs  p(99.9)=1.55ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.15ms min=17.75ms med=25.68ms max=301.04ms p(90)=29.89ms p(95)=31.31ms  p(99.9)=47.85ms
     http_reqs......................: 226499  1857.275099/s
     iteration_duration.............: avg=26.49ms min=18.05ms med=26ms    max=318.77ms p(90)=30.21ms p(95)=31.66ms  p(99.9)=49.49ms
     iterations.....................: 226399  1856.455107/s
     success_rate...................: 100.00% ✓ 226399      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 665367      ✗ 0     
     data_received..................: 19 GB   160 MB/s
     data_sent......................: 267 MB  2.2 MB/s
     http_req_blocked...............: avg=2.81µs   min=871ns   med=2.02µs  max=3.32ms   p(90)=3.65µs   p(95)=4.43µs  p(99.9)=28.07µs
     http_req_connecting............: avg=375ns    min=0s      med=0s      max=3.27ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.82ms  min=17.53ms med=26.26ms max=298.08ms p(90)=31.35ms  p(95)=33.21ms p(99.9)=50.75ms
       { expected_response:true }...: avg=26.82ms  min=17.53ms med=26.26ms max=298.08ms p(90)=31.35ms  p(95)=33.21ms p(99.9)=50.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 221889
     http_req_receiving.............: avg=298.79µs min=50.7µs  med=95.07µs max=108.62ms p(90)=743.09µs p(95)=1.22ms  p(99.9)=7.28ms 
     http_req_sending...............: avg=32.7µs   min=4.66µs  med=8.66µs  max=177.98ms p(90)=18.77µs  p(95)=30.54µs p(99.9)=1.68ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.49ms  min=17.45ms med=25.94ms max=297.43ms p(90)=30.95ms  p(95)=32.77ms p(99.9)=48.91ms
     http_reqs......................: 221889  1819.274217/s
     iteration_duration.............: avg=27.04ms  min=17.7ms  med=26.46ms max=309.33ms p(90)=31.55ms  p(95)=33.42ms p(99.9)=51.45ms
     iterations.....................: 221789  1818.454314/s
     success_rate...................: 100.00% ✓ 221789      ✗ 0     
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

     checks.........................: 100.00% ✓ 481752      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 193 MB  1.6 MB/s
     http_req_blocked...............: avg=4.21µs  min=1.08µs  med=3.11µs  max=4.79ms   p(90)=5.5µs    p(95)=6.51µs   p(99.9)=48.34µs
     http_req_connecting............: avg=569ns   min=0s      med=0s      max=4.75ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.08ms min=18.12ms med=36.78ms max=318.57ms p(90)=43.63ms  p(95)=45.7ms   p(99.9)=60.71ms
       { expected_response:true }...: avg=37.08ms min=18.12ms med=36.78ms max=318.57ms p(90)=43.63ms  p(95)=45.7ms   p(99.9)=60.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160684
     http_req_receiving.............: avg=93.44µs min=27.18µs med=62.73µs max=106.92ms p(90)=131.52µs p(95)=180.01µs p(99.9)=2.08ms 
     http_req_sending...............: avg=37.01µs min=4.92µs  med=11.86µs max=210.5ms  p(90)=25.58µs  p(95)=65.17µs  p(99.9)=2.13ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=36.95ms min=17.98ms med=36.67ms max=312.67ms p(90)=43.5ms   p(95)=45.56ms  p(99.9)=59.26ms
     http_reqs......................: 160684  1317.208062/s
     iteration_duration.............: avg=37.35ms min=20.78ms med=37.03ms max=327.55ms p(90)=43.87ms  p(95)=45.94ms  p(99.9)=61.27ms
     iterations.....................: 160584  1316.388311/s
     success_rate...................: 100.00% ✓ 160584      ✗ 0     
     vus............................: 8       min=0         max=50  
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

     checks.........................: 100.00% ✓ 207369     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 83 MB   680 kB/s
     http_req_blocked...............: avg=5.11µs  min=1.29µs  med=3.37µs  max=4.2ms    p(90)=5.01µs   p(95)=5.73µs   p(99.9)=51.05µs 
     http_req_connecting............: avg=1.45µs  min=0s      med=0s      max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.45ms min=20.52ms med=84.99ms max=332.06ms p(90)=103.11ms p(95)=112.17ms p(99.9)=197.84ms
       { expected_response:true }...: avg=86.45ms min=20.52ms med=84.99ms max=332.06ms p(90)=103.11ms p(95)=112.17ms p(99.9)=197.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69223
     http_req_receiving.............: avg=92.25µs min=30.13µs med=78.43µs max=102.04ms p(90)=114.14µs p(95)=127.65µs p(99.9)=655.21µs
     http_req_sending...............: avg=30.94µs min=5.86µs  med=15.69µs max=186.65ms p(90)=22.64µs  p(95)=25.09µs  p(99.9)=643µs   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.32ms min=20.42ms med=84.87ms max=321.4ms  p(90)=103ms    p(95)=111.99ms p(99.9)=197.06ms
     http_reqs......................: 69223   566.3279/s
     iteration_duration.............: avg=86.8ms  min=32.54ms med=85.25ms max=341.2ms  p(90)=103.37ms p(95)=112.5ms  p(99.9)=199.97ms
     iterations.....................: 69123   565.509779/s
     success_rate...................: 100.00% ✓ 69123      ✗ 0    
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

     checks.........................: 100.00% ✓ 157572     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   517 kB/s
     http_req_blocked...............: avg=5.45µs   min=1.1µs   med=3.39µs   max=3.67ms   p(90)=4.97µs   p(95)=5.54µs   p(99.9)=121.95µs
     http_req_connecting............: avg=1.82µs   min=0s      med=0s       max=3.63ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=113.8ms  min=20.9ms  med=112.01ms max=358.48ms p(90)=141.74ms p(95)=151.27ms p(99.9)=192.77ms
       { expected_response:true }...: avg=113.8ms  min=20.9ms  med=112.01ms max=358.48ms p(90)=141.74ms p(95)=151.27ms p(99.9)=192.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52624
     http_req_receiving.............: avg=87.16µs  min=28.58µs med=84.29µs  max=12.21ms  p(90)=115.27µs p(95)=128.07µs p(99.9)=535.41µs
     http_req_sending...............: avg=22.13µs  min=5.28µs  med=17.11µs  max=46.78ms  p(90)=22.57µs  p(95)=24.53µs  p(99.9)=486.56µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=113.69ms min=20.74ms med=111.91ms max=358.11ms p(90)=141.65ms p(95)=151.14ms p(99.9)=192.68ms
     http_reqs......................: 52624   430.132137/s
     iteration_duration.............: avg=114.26ms min=40.68ms med=112.32ms max=365.36ms p(90)=142.05ms p(95)=151.57ms p(99.9)=194.26ms
     iterations.....................: 52524   429.314769/s
     success_rate...................: 100.00% ✓ 52524      ✗ 0    
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

     checks.........................: 100.00% ✓ 97545      ✗ 0    
     data_received..................: 2.9 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=5.57µs   min=1.4µs   med=3.86µs   max=2.63ms   p(90)=5.47µs   p(95)=6.11µs   p(99.9)=613.54µs
     http_req_connecting............: avg=1.38µs   min=0s      med=0s       max=2.54ms   p(90)=0s       p(95)=0s       p(99.9)=591.57µs
     http_req_duration..............: avg=183.8ms  min=17.92ms med=169.6ms  max=634.05ms p(90)=230.92ms p(95)=276.83ms p(99.9)=558.62ms
       { expected_response:true }...: avg=183.8ms  min=17.92ms med=169.6ms  max=634.05ms p(90)=230.92ms p(95)=276.83ms p(99.9)=558.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32615
     http_req_receiving.............: avg=99.9µs   min=37.93µs med=94.32µs  max=14.27ms  p(90)=127.21µs p(95)=140.88µs p(99.9)=800.16µs
     http_req_sending...............: avg=32.79µs  min=6.92µs  med=19.78µs  max=71.96ms  p(90)=24.79µs  p(95)=26.77µs  p(99.9)=464.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.67ms min=17.77ms med=169.48ms max=629.95ms p(90)=230.8ms  p(95)=276.73ms p(99.9)=558.49ms
     http_reqs......................: 32615   266.952196/s
     iteration_duration.............: avg=184.62ms min=63.94ms med=170ms    max=634.33ms p(90)=231.45ms p(95)=278.34ms p(99.9)=558.91ms
     iterations.....................: 32515   266.133701/s
     success_rate...................: 100.00% ✓ 32515      ✗ 0    
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

     checks.........................: 100.00% ✓ 95520      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=6.46µs   min=1.29µs  med=3.71µs   max=3.48ms   p(90)=5.25µs   p(95)=5.87µs   p(99.9)=1.09ms  
     http_req_connecting............: avg=2.41µs   min=0s      med=0s       max=3.41ms   p(90)=0s       p(95)=0s       p(99.9)=1.02ms  
     http_req_duration..............: avg=187.7ms  min=23.7ms  med=187.7ms  max=395.3ms  p(90)=208.64ms p(95)=214.6ms  p(99.9)=290.71ms
       { expected_response:true }...: avg=187.7ms  min=23.7ms  med=187.7ms  max=395.3ms  p(90)=208.64ms p(95)=214.6ms  p(99.9)=290.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31940
     http_req_receiving.............: avg=96.62µs  min=32.16µs med=89.73µs  max=55.6ms   p(90)=121.37µs p(95)=134.28µs p(99.9)=591.1µs 
     http_req_sending...............: avg=41.18µs  min=5.61µs  med=18.41µs  max=136.16ms p(90)=23.61µs  p(95)=25.49µs  p(99.9)=1.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.56ms min=23.6ms  med=187.58ms max=395.06ms p(90)=208.52ms p(95)=214.46ms p(99.9)=290.35ms
     http_reqs......................: 31940   260.379437/s
     iteration_duration.............: avg=188.53ms min=44.66ms med=188.07ms max=401.69ms p(90)=208.96ms p(95)=214.91ms p(99.9)=291.74ms
     iterations.....................: 31840   259.564222/s
     success_rate...................: 100.00% ✓ 31840      ✗ 0    
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

     checks.........................: 100.00% ✓ 5727      ✗ 0   
     data_received..................: 192 MB  1.5 MB/s
     data_sent......................: 2.4 MB  19 kB/s
     http_req_blocked...............: avg=129.37µs min=1.41µs  med=3.54µs  max=8.28ms p(90)=5.09µs   p(95)=6.13µs  p(99.9)=8.01ms 
     http_req_connecting............: avg=122.95µs min=0s      med=0s      max=8.13ms p(90)=0s       p(95)=0s      p(99.9)=7.97ms 
     http_req_duration..............: avg=3.01s    min=43.18ms med=3.12s   max=4.95s  p(90)=3.78s    p(95)=3.92s   p(99.9)=4.75s  
       { expected_response:true }...: avg=3.01s    min=43.18ms med=3.12s   max=4.95s  p(90)=3.78s    p(95)=3.92s   p(99.9)=4.75s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2009
     http_req_receiving.............: avg=99.37µs  min=36.52µs med=92.16µs max=3.11ms p(90)=138.64µs p(95)=156.5µs p(99.9)=418.2µs
     http_req_sending...............: avg=91.99µs  min=7.5µs   med=18.19µs max=30.1ms p(90)=23.52µs  p(95)=30µs    p(99.9)=14.97ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s     p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=3.01s    min=43.03ms med=3.12s   max=4.95s  p(90)=3.78s    p(95)=3.92s   p(99.9)=4.75s  
     http_reqs......................: 2009    15.741076/s
     iteration_duration.............: avg=3.17s    min=1.06s   med=3.15s   max=4.95s  p(90)=3.79s    p(95)=3.93s   p(99.9)=4.76s  
     iterations.....................: 1909    14.957548/s
     success_rate...................: 100.00% ✓ 1909      ✗ 0   
     vus............................: 37      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

