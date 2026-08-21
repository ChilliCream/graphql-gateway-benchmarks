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
| fusion-nightly | 16.6.2-p.4 | 1,897 | 1,937 | 1,884 | 0.9% |  |
| fusion | 16.6.1 | 1,887 | 1,929 | 1,881 | 1.0% |  |
| fusion-nightly-net11 | 16.6.2-p.4 | 1,877 | 1,926 | 1,872 | 1.0% |  |
| hive-router | v0.0.84 | 1,856 | 1,911 | 1,841 | 1.3% |  |
| fusion-nightly-fed | 16.6.2-p.4 | 1,795 | 1,853 | 1,790 | 1.2% |  |
| grafbase | 0.53.5 | 1,312 | 1,337 | 1,306 | 0.8% |  |
| cosmo | 0.334.0 | 1,160 | 1,208 | 1,154 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 569 | 590 | 567 | 1.3% |  |
| apollo-router | v2.16.1 | 429 | 448 | 428 | 1.8% |  |
| apollo-gateway | 2.14.3 | 263 | 268 | 260 | 0.9% |  |
| hive-gateway | 2.10.8 | 256 | 264 | 254 | 1.3% |  |
| feddi | 5ff8b6165878 | 13 | 13 | 13 | 0.0% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 693903     ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=2.83µs   min=842ns   med=1.96µs  max=7.39ms   p(90)=3.6µs    p(95)=4.32µs  p(99.9)=31.07µs
     http_req_connecting............: avg=404ns    min=0s      med=0s      max=4.02ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.71ms  min=17.64ms med=25.14ms max=288.88ms p(90)=30.03ms  p(95)=31.79ms p(99.9)=48.64ms
       { expected_response:true }...: avg=25.71ms  min=17.64ms med=25.14ms max=288.88ms p(90)=30.03ms  p(95)=31.79ms p(99.9)=48.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 231401
     http_req_receiving.............: avg=296.92µs min=48.42µs med=91.15µs max=174.89ms p(90)=749.52µs p(95)=1.26ms  p(99.9)=7.66ms 
     http_req_sending...............: avg=30.34µs  min=4.5µs   med=8.27µs  max=141.8ms  p(90)=18.57µs  p(95)=31.7µs  p(99.9)=1.47ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.39ms  min=17.3ms  med=24.83ms max=287.78ms p(90)=29.62ms  p(95)=31.35ms p(99.9)=47.38ms
     http_reqs......................: 231401  1897.83527/s
     iteration_duration.............: avg=25.93ms  min=17.79ms med=25.34ms max=319.15ms p(90)=30.23ms  p(95)=31.99ms p(99.9)=49.03ms
     iterations.....................: 231301  1897.01512/s
     success_rate...................: 100.00% ✓ 231301     ✗ 0     
     vus............................: 50      min=0        max=50  
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 690138      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=2.87µs   min=901ns   med=2.04µs  max=3.71ms   p(90)=3.79µs   p(95)=4.53µs  p(99.9)=28.61µs
     http_req_connecting............: avg=385ns    min=0s      med=0s      max=3.18ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.86ms  min=17.17ms med=25.26ms max=305.99ms p(90)=30.22ms  p(95)=32.04ms p(99.9)=49.71ms
       { expected_response:true }...: avg=25.86ms  min=17.17ms med=25.26ms max=305.99ms p(90)=30.22ms  p(95)=32.04ms p(99.9)=49.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230146
     http_req_receiving.............: avg=318.05µs min=49.86µs med=94.07µs max=233.25ms p(90)=771.83µs p(95)=1.25ms  p(99.9)=8.48ms 
     http_req_sending...............: avg=29.22µs  min=4.82µs  med=8.64µs  max=43.87ms  p(90)=18.51µs  p(95)=29.02µs p(99.9)=1.5ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.51ms  min=17.09ms med=24.95ms max=275.83ms p(90)=29.81ms  p(95)=31.6ms  p(99.9)=48.32ms
     http_reqs......................: 230146  1887.414375/s
     iteration_duration.............: avg=26.07ms  min=17.35ms med=25.47ms max=323.08ms p(90)=30.42ms  p(95)=32.23ms p(99.9)=50.12ms
     iterations.....................: 230046  1886.594281/s
     success_rate...................: 100.00% ✓ 230046      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 686340      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.6µs    min=882ns   med=1.99µs  max=3.27ms   p(90)=3.71µs   p(95)=4.41µs  p(99.9)=28.41µs
     http_req_connecting............: avg=174ns    min=0s      med=0s      max=2.55ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26ms     min=17.36ms med=25.44ms max=310.77ms p(90)=30.3ms   p(95)=32.09ms p(99.9)=48.49ms
       { expected_response:true }...: avg=26ms     min=17.36ms med=25.44ms max=310.77ms p(90)=30.3ms   p(95)=32.09ms p(99.9)=48.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228880
     http_req_receiving.............: avg=259.36µs min=48.66µs med=86.41µs max=143.36ms p(90)=606.18µs p(95)=1.12ms  p(99.9)=6.84ms 
     http_req_sending...............: avg=32.39µs  min=4.62µs  med=8.49µs  max=129.51ms p(90)=18.57µs  p(95)=32.07µs p(99.9)=1.68ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.7ms   min=17.27ms med=25.16ms max=310.39ms p(90)=29.96ms  p(95)=31.71ms p(99.9)=46.84ms
     http_reqs......................: 228880  1877.411965/s
     iteration_duration.............: avg=26.21ms  min=17.51ms med=25.64ms max=323.9ms  p(90)=30.5ms   p(95)=32.29ms p(99.9)=48.83ms
     iterations.....................: 228780  1876.591704/s
     success_rate...................: 100.00% ✓ 228780      ✗ 0     
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

     checks.........................: 100.00% ✓ 678708      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=2.9µs   min=922ns   med=2.09µs  max=3.87ms   p(90)=3.84µs  p(95)=4.57µs   p(99.9)=31.77µs
     http_req_connecting............: avg=392ns   min=0s      med=0s      max=3.84ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.3ms  min=18.29ms med=25.85ms max=293.2ms  p(90)=30.01ms p(95)=31.41ms  p(99.9)=46.59ms
       { expected_response:true }...: avg=26.3ms  min=18.29ms med=25.85ms max=293.2ms  p(90)=30.01ms p(95)=31.41ms  p(99.9)=46.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226336
     http_req_receiving.............: avg=72.09µs min=24.56µs med=47.53µs max=152.36ms p(90)=91.4µs  p(95)=116.71µs p(99.9)=1.87ms 
     http_req_sending...............: avg=30.09µs min=4.41µs  med=9.07µs  max=185.38ms p(90)=18.56µs p(95)=24.99µs  p(99.9)=1.39ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.19ms min=18.24ms med=25.76ms max=278.48ms p(90)=29.9ms  p(95)=31.29ms  p(99.9)=45.17ms
     http_reqs......................: 226336  1856.019702/s
     iteration_duration.............: avg=26.51ms min=18.45ms med=26.05ms max=301.09ms p(90)=30.21ms p(95)=31.61ms  p(99.9)=47.03ms
     iterations.....................: 226236  1855.199673/s
     success_rate...................: 100.00% ✓ 226236      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 656577      ✗ 0     
     data_received..................: 19 GB   157 MB/s
     data_sent......................: 263 MB  2.2 MB/s
     http_req_blocked...............: avg=3.4µs    min=1.01µs  med=2.63µs   max=3.45ms   p(90)=4.3µs    p(95)=5.08µs  p(99.9)=37.11µs
     http_req_connecting............: avg=387ns    min=0s      med=0s       max=3.41ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.17ms  min=17.86ms med=26.56ms  max=307.26ms p(90)=31.89ms  p(95)=33.82ms p(99.9)=50.75ms
       { expected_response:true }...: avg=27.17ms  min=17.86ms med=26.56ms  max=307.26ms p(90)=31.89ms  p(95)=33.82ms p(99.9)=50.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 218959
     http_req_receiving.............: avg=338.76µs min=51.98µs med=103.92µs max=123.76ms p(90)=857.69µs p(95)=1.37ms  p(99.9)=8.77ms 
     http_req_sending...............: avg=34.63µs  min=5.06µs  med=10.17µs  max=93.45ms  p(90)=19.94µs  p(95)=53.6µs  p(99.9)=1.68ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.8ms   min=17.7ms  med=26.21ms  max=280.6ms  p(90)=31.45ms  p(95)=33.34ms p(99.9)=49.34ms
     http_reqs......................: 218959  1795.072777/s
     iteration_duration.............: avg=27.4ms   min=18.1ms  med=26.78ms  max=330.03ms p(90)=32.1ms   p(95)=34.04ms p(99.9)=51.08ms
     iterations.....................: 218859  1794.252956/s
     success_rate...................: 100.00% ✓ 218859      ✗ 0     
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

     checks.........................: 100.00% ✓ 480150      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=3.42µs  min=862ns   med=2.16µs  max=4.14ms   p(90)=4.5µs    p(95)=5.47µs   p(99.9)=37.26µs
     http_req_connecting............: avg=686ns   min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.23ms min=17.89ms med=36.96ms max=308.32ms p(90)=43.77ms  p(95)=45.79ms  p(99.9)=60.47ms
       { expected_response:true }...: avg=37.23ms min=17.89ms med=36.96ms max=308.32ms p(90)=43.77ms  p(95)=45.79ms  p(99.9)=60.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160150
     http_req_receiving.............: avg=84.47µs min=27.11µs med=55.16µs max=179.84ms p(90)=123.46µs p(95)=166.73µs p(99.9)=1.77ms 
     http_req_sending...............: avg=33.02µs min=4.49µs  med=9.2µs   max=198.86ms p(90)=23.64µs  p(95)=43.49µs  p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.11ms min=17.77ms med=36.85ms max=307.72ms p(90)=43.66ms  p(95)=45.67ms  p(99.9)=59.32ms
     http_reqs......................: 160150  1312.993758/s
     iteration_duration.............: avg=37.48ms min=21.21ms med=37.19ms max=318.78ms p(90)=43.99ms  p(95)=46.01ms  p(99.9)=61.19ms
     iterations.....................: 160050  1312.173905/s
     success_rate...................: 100.00% ✓ 160050      ✗ 0     
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

     checks.........................: 100.00% ✓ 424449      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=2.96µs  min=921ns   med=2.12µs  max=3.34ms   p(90)=3.54µs   p(95)=4.21µs   p(99.9)=34.98µs 
     http_req_connecting............: avg=516ns   min=0s      med=0s      max=3.32ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.17ms min=18.31ms med=41.53ms max=311.36ms p(90)=50.98ms  p(95)=54.04ms  p(99.9)=69.6ms  
       { expected_response:true }...: avg=42.17ms min=18.31ms med=41.53ms max=311.36ms p(90)=50.98ms  p(95)=54.04ms  p(99.9)=69.6ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 141583
     http_req_receiving.............: avg=78.94µs min=25.91µs med=63.03µs max=179.79ms p(90)=103.91µs p(95)=122.78µs p(99.9)=762.84µs
     http_req_sending...............: avg=22.06µs min=4.89µs  med=10.6µs  max=58.57ms  p(90)=17.34µs  p(95)=21.04µs  p(99.9)=881.13µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=42.07ms min=18.2ms  med=41.43ms max=296.48ms p(90)=50.89ms  p(95)=53.94ms  p(99.9)=69.04ms 
     http_reqs......................: 141583  1160.582653/s
     iteration_duration.............: avg=42.4ms  min=22.82ms med=41.74ms max=327.23ms p(90)=51.18ms  p(95)=54.24ms  p(99.9)=69.95ms 
     iterations.....................: 141483  1159.762934/s
     success_rate...................: 100.00% ✓ 141483      ✗ 0     
     vus............................: 12      min=0         max=50  
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

     checks.........................: 100.00% ✓ 208473     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   684 kB/s
     http_req_blocked...............: avg=5.14µs  min=1.27µs  med=3.36µs  max=4.01ms   p(90)=5µs      p(95)=5.7µs    p(99.9)=64.39µs 
     http_req_connecting............: avg=1.45µs  min=0s      med=0s      max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.98ms min=20.8ms  med=84.43ms max=319.59ms p(90)=107.42ms p(95)=116.5ms  p(99.9)=203.57ms
       { expected_response:true }...: avg=85.98ms min=20.8ms  med=84.43ms max=319.59ms p(90)=107.42ms p(95)=116.5ms  p(99.9)=203.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69591
     http_req_receiving.............: avg=90.18µs min=33.34µs med=80.01µs max=195.98ms p(90)=116.83µs p(95)=131.31µs p(99.9)=649.7µs 
     http_req_sending...............: avg=24.09µs min=5.88µs  med=15.95µs max=65.34ms  p(90)=23.03µs  p(95)=25.56µs  p(99.9)=656.83µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.87ms min=20.62ms med=84.32ms max=319.45ms p(90)=107.29ms p(95)=116.37ms p(99.9)=203.43ms
     http_reqs......................: 69591   569.228888/s
     iteration_duration.............: avg=86.34ms min=26.95ms med=84.72ms max=351.52ms p(90)=107.69ms p(95)=116.77ms p(99.9)=205.91ms
     iterations.....................: 69491   568.410925/s
     success_rate...................: 100.00% ✓ 69491      ✗ 0    
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

     checks.........................: 100.00% ✓ 157158     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   515 kB/s
     http_req_blocked...............: avg=5.43µs   min=1.13µs  med=3.56µs   max=3.77ms   p(90)=5.14µs   p(95)=5.75µs   p(99.9)=84µs    
     http_req_connecting............: avg=1.65µs   min=0s      med=0s       max=3.74ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.09ms min=21.25ms med=112.33ms max=331.85ms p(90)=141.96ms p(95)=151.22ms p(99.9)=191.7ms 
       { expected_response:true }...: avg=114.09ms min=21.25ms med=112.33ms max=331.85ms p(90)=141.96ms p(95)=151.22ms p(99.9)=191.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 52486
     http_req_receiving.............: avg=88.45µs  min=29.95µs med=85.2µs   max=5.62ms   p(90)=117.79µs p(95)=130.61µs p(99.9)=560.09µs
     http_req_sending...............: avg=24.1µs   min=5.32µs  med=17.52µs  max=47.91ms  p(90)=23.02µs  p(95)=24.99µs  p(99.9)=613.76µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=113.98ms min=21.15ms med=112.22ms max=331.37ms p(90)=141.83ms p(95)=151.1ms  p(99.9)=191.12ms
     http_reqs......................: 52486   429.028604/s
     iteration_duration.............: avg=114.55ms min=37.34ms med=112.63ms max=344.37ms p(90)=142.24ms p(95)=151.5ms  p(99.9)=193.25ms
     iterations.....................: 52386   428.211188/s
     success_rate...................: 100.00% ✓ 52386      ✗ 0    
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

     checks.........................: 100.00% ✓ 96804      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   317 kB/s
     http_req_blocked...............: avg=5.39µs   min=1.45µs  med=3.64µs   max=2.79ms   p(90)=5.14µs   p(95)=5.77µs   p(99.9)=600.18µs
     http_req_connecting............: avg=1.48µs   min=0s      med=0s       max=2.73ms   p(90)=0s       p(95)=0s       p(99.9)=566.07µs
     http_req_duration..............: avg=185.23ms min=23.27ms med=180.44ms max=345.35ms p(90)=238.02ms p(95)=243.9ms  p(99.9)=314.66ms
       { expected_response:true }...: avg=185.23ms min=23.27ms med=180.44ms max=345.35ms p(90)=238.02ms p(95)=243.9ms  p(99.9)=314.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32368
     http_req_receiving.............: avg=96.89µs  min=33.63µs med=89.43µs  max=32.04ms  p(90)=122µs    p(95)=134.88µs p(99.9)=579.24µs
     http_req_sending...............: avg=27.96µs  min=6.04µs  med=18.29µs  max=71.63ms  p(90)=23.66µs  p(95)=25.64µs  p(99.9)=473.28µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.1ms  min=23.18ms med=180ms    max=345.23ms p(90)=237.9ms  p(95)=243.8ms  p(99.9)=314.28ms
     http_reqs......................: 32368   263.889706/s
     iteration_duration.............: avg=186.03ms min=55.54ms med=183.89ms max=362.61ms p(90)=238.33ms p(95)=244.22ms p(99.9)=315.84ms
     iterations.....................: 32268   263.074426/s
     success_rate...................: 100.00% ✓ 32268      ✗ 0    
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

     checks.........................: 100.00% ✓ 93834      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 38 MB   308 kB/s
     http_req_blocked...............: avg=5.42µs   min=1.16µs  med=3.07µs   max=3.12ms   p(90)=4.43µs   p(95)=4.98µs   p(99.9)=963.77µs
     http_req_connecting............: avg=2.04µs   min=0s      med=0s       max=2.73ms   p(90)=0s       p(95)=0s       p(99.9)=922.8µs 
     http_req_duration..............: avg=191.17ms min=18.21ms med=178.29ms max=640.61ms p(90)=234.86ms p(95)=268.8ms  p(99.9)=575.11ms
       { expected_response:true }...: avg=191.17ms min=18.21ms med=178.29ms max=640.61ms p(90)=234.86ms p(95)=268.8ms  p(99.9)=575.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31378
     http_req_receiving.............: avg=92.69µs  min=32.07µs med=88.49µs  max=42.6ms   p(90)=119.15µs p(95)=131.42µs p(99.9)=547.28µs
     http_req_sending...............: avg=22.18µs  min=5.28µs  med=17.23µs  max=48.41ms  p(90)=21.79µs  p(95)=23.54µs  p(99.9)=755.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.06ms min=18.09ms med=178.17ms max=640.53ms p(90)=234.74ms p(95)=268.68ms p(99.9)=575.03ms
     http_reqs......................: 31378   256.851226/s
     iteration_duration.............: avg=191.98ms min=60.27ms med=178.72ms max=640.79ms p(90)=235.15ms p(95)=270.17ms p(99.9)=575.36ms
     iterations.....................: 31278   256.032655/s
     success_rate...................: 100.00% ✓ 31278      ✗ 0    
     vus............................: 43      min=0        max=50 
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

     checks.........................: 100.00% ✓ 4731      ✗ 0   
     data_received..................: 161 MB  1.2 MB/s
     data_sent......................: 2.0 MB  16 kB/s
     http_req_blocked...............: avg=139.36µs min=1.22µs  med=3.04µs  max=9.62ms   p(90)=4.49µs   p(95)=5.67µs   p(99.9)=8.71ms  
     http_req_connecting............: avg=133.35µs min=0s      med=0s      max=9.57ms   p(90)=0s       p(95)=0s       p(99.9)=8.68ms  
     http_req_duration..............: avg=3.62s    min=56.08ms med=3.8s    max=5.45s    p(90)=4.54s    p(95)=4.74s    p(99.9)=5.45s   
       { expected_response:true }...: avg=3.62s    min=56.08ms med=3.8s    max=5.45s    p(90)=4.54s    p(95)=4.74s    p(99.9)=5.45s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 1677
     http_req_receiving.............: avg=91.66µs  min=34.64µs med=87.94µs max=673.49µs p(90)=129.89µs p(95)=144.71µs p(99.9)=322.82µs
     http_req_sending...............: avg=83.95µs  min=5.85µs  med=17.22µs max=6.4ms    p(90)=22.06µs  p(95)=29.4µs   p(99.9)=4.6ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=3.62s    min=55.93ms med=3.8s    max=5.45s    p(90)=4.54s    p(95)=4.74s    p(99.9)=5.45s   
     http_reqs......................: 1677    13.05806/s
     iteration_duration.............: avg=3.85s    min=1.7s    med=3.84s   max=5.45s    p(90)=4.55s    p(95)=4.75s    p(99.9)=5.45s   
     iterations.....................: 1577    12.279404/s
     success_rate...................: 100.00% ✓ 1577      ✗ 0   
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

