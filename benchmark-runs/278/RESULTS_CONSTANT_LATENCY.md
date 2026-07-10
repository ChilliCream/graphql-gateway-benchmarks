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
| fusion-nightly | 16.5.0-p.10 | 1,860 | 1,905 | 1,854 | 0.9% |  |
| hive-router | v0.0.78 | 1,856 | 1,926 | 1,842 | 1.5% |  |
| fusion | 16.4.0 | 1,850 | 1,890 | 1,836 | 0.9% |  |
| fusion-nightly-net11 | 16.5.0-p.10 | 1,836 | 1,880 | 1,830 | 1.0% |  |
| fusion-nightly-fed | 16.5.0-p.10 | 1,747 | 1,783 | 1,726 | 1.0% |  |
| grafbase | 0.53.5 | 1,330 | 1,351 | 1,319 | 0.8% |  |
| cosmo | 0.329.0 | 1,157 | 1,205 | 1,150 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.2 | 572 | 588 | 566 | 1.2% |  |
| apollo-router | v2.16.0 | 431 | 450 | 412 | 2.7% |  |
| apollo-gateway | 2.14.2 | 264 | 267 | 262 | 0.7% |  |
| hive-gateway | 2.10.2 | 262 | 269 | 260 | 1.2% |  |
| feddi | 77271dc84a06 | 18 | 18 | 17 | 1.9% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 680373      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=2.85µs   min=881ns   med=1.99µs  max=3.81ms   p(90)=3.69µs   p(95)=4.43µs  p(99.9)=33.54µs
     http_req_connecting............: avg=419ns    min=0s      med=0s      max=3.77ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.23ms  min=16.81ms med=25.67ms max=303.53ms p(90)=30.6ms   p(95)=32.42ms p(99.9)=50.09ms
       { expected_response:true }...: avg=26.23ms  min=16.81ms med=25.67ms max=303.53ms p(90)=30.6ms   p(95)=32.42ms p(99.9)=50.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226891
     http_req_receiving.............: avg=320.46µs min=50.11µs med=95.34µs max=207.42ms p(90)=825.96µs p(95)=1.33ms  p(99.9)=7.63ms 
     http_req_sending...............: avg=31.13µs  min=4.37µs  med=8.66µs  max=148.84ms p(90)=19.52µs  p(95)=32.3µs  p(99.9)=1.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.88ms  min=16.7ms  med=25.34ms max=303.16ms p(90)=30.18ms  p(95)=31.97ms p(99.9)=48.02ms
     http_reqs......................: 226891  1860.71418/s
     iteration_duration.............: avg=26.44ms  min=17.66ms med=25.88ms max=321.01ms p(90)=30.8ms   p(95)=32.62ms p(99.9)=50.42ms
     iterations.....................: 226791  1859.894089/s
     success_rate...................: 100.00% ✓ 226791      ✗ 0     
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

     checks.........................: 100.00% ✓ 678894      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=2.92µs  min=891ns   med=2.06µs  max=3.82ms   p(90)=3.75µs  p(95)=4.47µs   p(99.9)=29.65µs
     http_req_connecting............: avg=463ns   min=0s      med=0s      max=3.78ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.29ms min=18.16ms med=25.85ms max=292.59ms p(90)=29.98ms p(95)=31.38ms  p(99.9)=47.24ms
       { expected_response:true }...: avg=26.29ms min=18.16ms med=25.85ms max=292.59ms p(90)=29.98ms p(95)=31.38ms  p(99.9)=47.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226398
     http_req_receiving.............: avg=72.34µs min=24.03µs med=47.65µs max=120.91ms p(90)=91.1µs  p(95)=116.69µs p(99.9)=1.87ms 
     http_req_sending...............: avg=32.46µs min=4.4µs   med=8.98µs  max=241.27ms p(90)=17.74µs p(95)=24.71µs  p(99.9)=1.42ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.19ms min=18.03ms med=25.76ms max=292.29ms p(90)=29.87ms p(95)=31.26ms  p(99.9)=45.77ms
     http_reqs......................: 226398  1856.430738/s
     iteration_duration.............: avg=26.5ms  min=18.3ms  med=26.05ms max=311.74ms p(90)=30.18ms p(95)=31.58ms  p(99.9)=47.68ms
     iterations.....................: 226298  1855.610753/s
     success_rate...................: 100.00% ✓ 226298      ✗ 0     
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

     checks.........................: 100.00% ✓ 676815      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=2.87µs  min=881ns   med=1.99µs  max=8.9ms    p(90)=3.64µs   p(95)=4.38µs  p(99.9)=32.41µs
     http_req_connecting............: avg=397ns   min=0s      med=0s      max=3.9ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.37ms min=17.51ms med=25.77ms max=305.09ms p(90)=30.79ms  p(95)=32.67ms p(99.9)=49.77ms
       { expected_response:true }...: avg=26.37ms min=17.51ms med=25.77ms max=305.09ms p(90)=30.79ms  p(95)=32.67ms p(99.9)=49.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 225705
     http_req_receiving.............: avg=318.1µs min=50.26µs med=95.63µs max=205.2ms  p(90)=805.78µs p(95)=1.28ms  p(99.9)=8.47ms 
     http_req_sending...............: avg=32.48µs min=4.61µs  med=8.46µs  max=271.4ms  p(90)=18.64µs  p(95)=28.96µs p(99.9)=1.63ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.02ms min=17.41ms med=25.44ms max=304.89ms p(90)=30.39ms  p(95)=32.23ms p(99.9)=48.08ms
     http_reqs......................: 225705  1850.783178/s
     iteration_duration.............: avg=26.58ms min=17.67ms med=25.98ms max=323.82ms p(90)=31ms     p(95)=32.87ms p(99.9)=50.16ms
     iterations.....................: 225605  1849.963177/s
     success_rate...................: 100.00% ✓ 225605      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 671424     ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=2.89µs   min=881ns   med=1.96µs  max=9.28ms   p(90)=3.73µs   p(95)=4.49µs  p(99.9)=30.02µs
     http_req_connecting............: avg=401ns    min=0s      med=0s      max=3.92ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.58ms  min=17.4ms  med=25.99ms max=298.02ms p(90)=31.01ms  p(95)=32.89ms p(99.9)=50.36ms
       { expected_response:true }...: avg=26.58ms  min=17.4ms  med=25.99ms max=298.02ms p(90)=31.01ms  p(95)=32.89ms p(99.9)=50.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 223908
     http_req_receiving.............: avg=349.49µs min=49.39µs med=92.49µs max=244.51ms p(90)=906.77µs p(95)=1.45ms  p(99.9)=9.05ms 
     http_req_sending...............: avg=30.57µs  min=4.44µs  med=8.11µs  max=65.81ms  p(90)=18.2µs   p(95)=29.86µs p(99.9)=1.7ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.2ms   min=16.82ms med=25.65ms max=273.71ms p(90)=30.55ms  p(95)=32.37ms p(99.9)=48.8ms 
     http_reqs......................: 223908  1836.47165/s
     iteration_duration.............: avg=26.8ms   min=17.71ms med=26.2ms  max=307.15ms p(90)=31.21ms  p(95)=33.09ms p(99.9)=50.81ms
     iterations.....................: 223808  1835.65146/s
     success_rate...................: 100.00% ✓ 223808     ✗ 0     
     vus............................: 50      min=0        max=50  
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 639078      ✗ 0     
     data_received..................: 19 GB   153 MB/s
     data_sent......................: 256 MB  2.1 MB/s
     http_req_blocked...............: avg=3.58µs   min=1.03µs  med=2.77µs   max=3.87ms   p(90)=4.52µs   p(95)=5.3µs   p(99.9)=39.1µs 
     http_req_connecting............: avg=423ns    min=0s      med=0s       max=3.82ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.92ms  min=17.66ms med=27.3ms   max=304.73ms p(90)=32.76ms  p(95)=34.75ms p(99.9)=52.22ms
       { expected_response:true }...: avg=27.92ms  min=17.66ms med=27.3ms   max=304.73ms p(90)=32.76ms  p(95)=34.75ms p(99.9)=52.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 213126
     http_req_receiving.............: avg=344.91µs min=50.8µs  med=104.64µs max=108.94ms p(90)=883.64µs p(95)=1.41ms  p(99.9)=8.81ms 
     http_req_sending...............: avg=33.55µs  min=4.96µs  med=10.46µs  max=131.93ms p(90)=19.79µs  p(95)=42.96µs p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.54ms  min=17.46ms med=26.94ms  max=294.24ms p(90)=32.31ms  p(95)=34.27ms p(99.9)=51.41ms
     http_reqs......................: 213126  1747.120282/s
     iteration_duration.............: avg=28.15ms  min=17.79ms med=27.52ms  max=315.99ms p(90)=32.97ms  p(95)=34.97ms p(99.9)=52.66ms
     iterations.....................: 213026  1746.300523/s
     success_rate...................: 100.00% ✓ 213026      ✗ 0     
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

     checks.........................: 100.00% ✓ 486726      ✗ 0     
     data_received..................: 14 GB   117 MB/s
     data_sent......................: 195 MB  1.6 MB/s
     http_req_blocked...............: avg=3.41µs  min=871ns   med=2.26µs  max=4.09ms   p(90)=4.66µs   p(95)=5.63µs   p(99.9)=41.07µs
     http_req_connecting............: avg=572ns   min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=36.71ms min=18.2ms  med=36.39ms max=313.16ms p(90)=43.09ms  p(95)=45.08ms  p(99.9)=62.83ms
       { expected_response:true }...: avg=36.71ms min=18.2ms  med=36.39ms max=313.16ms p(90)=43.09ms  p(95)=45.08ms  p(99.9)=62.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 162342
     http_req_receiving.............: avg=86.8µs  min=26.97µs med=55.7µs  max=145.86ms p(90)=125.64µs p(95)=171.38µs p(99.9)=2.04ms 
     http_req_sending...............: avg=33.01µs min=4.71µs  med=9.48µs  max=208.6ms  p(90)=24.32µs  p(95)=57.74µs  p(99.9)=1.8ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=36.59ms min=18.06ms med=36.29ms max=312.56ms p(90)=42.97ms  p(95)=44.95ms  p(99.9)=61.49ms
     http_reqs......................: 162342  1330.894044/s
     iteration_duration.............: avg=36.97ms min=21.4ms  med=36.63ms max=321.55ms p(90)=43.31ms  p(95)=45.31ms  p(99.9)=63.25ms
     iterations.....................: 162242  1330.074236/s
     success_rate...................: 100.00% ✓ 162242      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 423252      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.45µs  min=1.11µs  med=2.83µs  max=2.41ms   p(90)=4.38µs   p(95)=5.1µs    p(99.9)=39.05µs 
     http_req_connecting............: avg=312ns   min=0s      med=0s      max=2.37ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.27ms min=18.84ms med=41.68ms max=321.49ms p(90)=51.08ms  p(95)=54.01ms  p(99.9)=68.62ms 
       { expected_response:true }...: avg=42.27ms min=18.84ms med=41.68ms max=321.49ms p(90)=51.08ms  p(95)=54.01ms  p(99.9)=68.62ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 141184
     http_req_receiving.............: avg=84.3µs  min=28.73µs med=69.13µs max=189.94ms p(90)=110.87µs p(95)=129.38µs p(99.9)=788.83µs
     http_req_sending...............: avg=23.69µs min=5.11µs  med=12.07µs max=115.2ms  p(90)=18.76µs  p(95)=22.78µs  p(99.9)=884.69µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=42.16ms min=18.65ms med=41.58ms max=321.2ms  p(90)=50.97ms  p(95)=53.9ms   p(99.9)=68.51ms 
     http_reqs......................: 141184  1157.172399/s
     iteration_duration.............: avg=42.52ms min=20.25ms med=41.9ms  max=328.1ms  p(90)=51.29ms  p(95)=54.23ms  p(99.9)=69.07ms 
     iterations.....................: 141084  1156.352779/s
     success_rate...................: 100.00% ✓ 141084      ✗ 0     
     vus............................: 31      min=0         max=50  
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

     checks.........................: 100.00% ✓ 209493     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   687 kB/s
     http_req_blocked...............: avg=4.11µs  min=1.01µs  med=2.9µs   max=3.14ms   p(90)=4.53µs   p(95)=5.17µs   p(99.9)=51.89µs 
     http_req_connecting............: avg=957ns   min=0s      med=0s      max=3.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.58ms min=21.23ms med=82.24ms max=329.57ms p(90)=111.44ms p(95)=121.52ms p(99.9)=206.18ms
       { expected_response:true }...: avg=85.58ms min=21.23ms med=82.24ms max=329.57ms p(90)=111.44ms p(95)=121.52ms p(99.9)=206.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69931
     http_req_receiving.............: avg=84.9µs  min=29.77µs med=76.92µs max=71.72ms  p(90)=113.86µs p(95)=127.61µs p(99.9)=613.21µs
     http_req_sending...............: avg=24.74µs min=5.01µs  med=14.23µs max=124.9ms  p(90)=21.38µs  p(95)=23.7µs   p(99.9)=590.29µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.47ms min=21.09ms med=82.13ms max=316.94ms p(90)=111.34ms p(95)=121.4ms  p(99.9)=205.59ms
     http_reqs......................: 69931   572.154834/s
     iteration_duration.............: avg=85.92ms min=32.85ms med=82.5ms  max=336.43ms p(90)=111.7ms  p(95)=121.8ms  p(99.9)=208.42ms
     iterations.....................: 69831   571.336663/s
     success_rate...................: 100.00% ✓ 69831      ✗ 0    
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

     checks.........................: 100.00% ✓ 158136     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   518 kB/s
     http_req_blocked...............: avg=5.14µs   min=962ns   med=3.28µs   max=3.42ms   p(90)=4.84µs   p(95)=5.45µs   p(99.9)=110.77µs
     http_req_connecting............: avg=1.6µs    min=0s      med=0s       max=3.38ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=113.42ms min=21.42ms med=111.52ms max=330.94ms p(90)=141.24ms p(95)=150.43ms p(99.9)=191.08ms
       { expected_response:true }...: avg=113.42ms min=21.42ms med=111.52ms max=330.94ms p(90)=141.24ms p(95)=150.43ms p(99.9)=191.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52812
     http_req_receiving.............: avg=88.44µs  min=28.67µs med=84µs     max=64.88ms  p(90)=116.36µs p(95)=129.32µs p(99.9)=586.66µs
     http_req_sending...............: avg=31.78µs  min=5.48µs  med=17.21µs  max=160.27ms p(90)=22.57µs  p(95)=24.53µs  p(99.9)=563.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=113.3ms  min=21.29ms med=111.41ms max=330.39ms p(90)=141.14ms p(95)=150.3ms  p(99.9)=189.58ms
     http_reqs......................: 52812   431.584027/s
     iteration_duration.............: avg=113.87ms min=32.58ms med=111.83ms max=365.49ms p(90)=141.54ms p(95)=150.72ms p(99.9)=195.42ms
     iterations.....................: 52712   430.766819/s
     success_rate...................: 100.00% ✓ 52712      ✗ 0    
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

     checks.........................: 100.00% ✓ 97167      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   318 kB/s
     http_req_blocked...............: avg=7.34µs   min=1.42µs  med=3.78µs   max=3.85ms   p(90)=5.36µs   p(95)=5.98µs   p(99.9)=1.85ms  
     http_req_connecting............: avg=3.21µs   min=0s      med=0s       max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=184.5ms  min=23.12ms med=185.05ms max=383.62ms p(90)=195.57ms p(95)=200.5ms  p(99.9)=267.36ms
       { expected_response:true }...: avg=184.5ms  min=23.12ms med=185.05ms max=383.62ms p(90)=195.57ms p(95)=200.5ms  p(99.9)=267.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32489
     http_req_receiving.............: avg=106.71µs min=36.82µs med=91.92µs  max=168.19ms p(90)=124.55µs p(95)=138.03µs p(99.9)=600.8µs 
     http_req_sending...............: avg=25.47µs  min=6.25µs  med=19.18µs  max=28.14ms  p(90)=24.26µs  p(95)=26.29µs  p(99.9)=498.74µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.37ms min=22.94ms med=184.93ms max=383.15ms p(90)=195.46ms p(95)=200.37ms p(99.9)=266.95ms
     http_reqs......................: 32489   264.90717/s
     iteration_duration.............: avg=185.34ms min=48.94ms med=185.39ms max=398.39ms p(90)=195.88ms p(95)=200.8ms  p(99.9)=276.63ms
     iterations.....................: 32389   264.091795/s
     success_rate...................: 100.00% ✓ 32389      ✗ 0    
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

     checks.........................: 100.00% ✓ 96030      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   316 kB/s
     http_req_blocked...............: avg=6.76µs   min=1.19µs  med=3.78µs   max=3.45ms   p(90)=5.37µs   p(95)=6.01µs   p(99.9)=1.33ms  
     http_req_connecting............: avg=2.68µs   min=0s      med=0s       max=3.41ms   p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=186.71ms min=18.34ms med=175.73ms max=602.32ms p(90)=222.06ms p(95)=252.83ms p(99.9)=541.07ms
       { expected_response:true }...: avg=186.71ms min=18.34ms med=175.73ms max=602.32ms p(90)=222.06ms p(95)=252.83ms p(99.9)=541.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32110
     http_req_receiving.............: avg=103.73µs min=35.86µs med=94.76µs  max=102.07ms p(90)=127.11µs p(95)=140.5µs  p(99.9)=868.57µs
     http_req_sending...............: avg=42.21µs  min=5.75µs  med=19.51µs  max=127.7ms  p(90)=24.39µs  p(95)=26.47µs  p(99.9)=613.34µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.56ms min=18.19ms med=175.61ms max=602.24ms p(90)=221.93ms p(95)=252.62ms p(99.9)=540.94ms
     http_reqs......................: 32110   262.919114/s
     iteration_duration.............: avg=187.53ms min=43.72ms med=176.17ms max=602.53ms p(90)=222.48ms p(95)=254.33ms p(99.9)=541.65ms
     iterations.....................: 32010   262.100306/s
     success_rate...................: 100.00% ✓ 32010      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 6561      ✗ 0   
     data_received..................: 219 MB  1.7 MB/s
     data_sent......................: 2.7 MB  22 kB/s
     http_req_blocked...............: avg=21.25µs min=1.27µs   med=3.07µs  max=2.64ms  p(90)=4.51µs   p(95)=5.34µs   p(99.9)=2.28ms  
     http_req_connecting............: avg=17.4µs  min=0s       med=0s      max=2.6ms   p(90)=0s       p(95)=0s       p(99.9)=2.25ms  
     http_req_duration..............: avg=2.63s   min=40.32ms  med=2.74s   max=11.48s  p(90)=3.44s    p(95)=3.65s    p(99.9)=10.22s  
       { expected_response:true }...: avg=2.63s   min=40.32ms  med=2.74s   max=11.48s  p(90)=3.44s    p(95)=3.65s    p(99.9)=10.22s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2287
     http_req_receiving.............: avg=93.57µs min=35.99µs  med=90.22µs max=698.3µs p(90)=131.91µs p(95)=146.04µs p(99.9)=450.19µs
     http_req_sending...............: avg=48.84µs min=5.79µs   med=17.53µs max=31.22ms p(90)=23µs     p(95)=26.69µs  p(99.9)=3.03ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.63s   min=40.14ms  med=2.74s   max=11.48s  p(90)=3.44s    p(95)=3.65s    p(99.9)=10.22s  
     http_reqs......................: 2287    18.033489/s
     iteration_duration.............: avg=2.75s   min=734.23ms med=2.76s   max=11.49s  p(90)=3.46s    p(95)=3.67s    p(99.9)=10.23s  
     iterations.....................: 2187    17.244967/s
     success_rate...................: 100.00% ✓ 2187      ✗ 0   
     vus............................: 20      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

