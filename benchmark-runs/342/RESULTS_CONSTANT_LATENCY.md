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
| fusion-nightly-net11 | 16.7.0-p.4 | 1,878 | 1,935 | 1,869 | 1.2% |  |
| fusion | 16.6.4 | 1,875 | 1,925 | 1,864 | 1.1% |  |
| fusion-nightly | 16.7.0-p.4 | 1,871 | 1,942 | 1,862 | 1.4% |  |
| hive-router | v0.0.84 | 1,813 | 1,891 | 1,806 | 1.7% |  |
| fusion-nightly-fed | 16.7.0-p.4 | 1,808 | 1,854 | 1,790 | 1.2% |  |
| cosmo | 0.334.0 | 1,162 | 1,207 | 1,151 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 570 | 588 | 567 | 1.2% |  |
| apollo-router | v2.16.1 | 432 | 449 | 428 | 1.5% |  |
| hive-gateway | 2.10.8 | 265 | 271 | 265 | 0.8% |  |
| apollo-gateway | 2.14.3 | 262 | 263 | 260 | 0.5% |  |
| feddi | 5ff8b6165878 | 17 | 17 | 16 | 3.1% |  |
| grafbase | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 686601      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.35µs  min=1.04µs  med=2.55µs  max=4.07ms   p(90)=4.12µs   p(95)=4.87µs  p(99.9)=34.8µs 
     http_req_connecting............: avg=412ns   min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.98ms min=17.17ms med=25.36ms max=298.67ms p(90)=30.38ms  p(95)=32.31ms p(99.9)=50.19ms
       { expected_response:true }...: avg=25.98ms min=17.17ms med=25.36ms max=298.67ms p(90)=30.38ms  p(95)=32.31ms p(99.9)=50.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228967
     http_req_receiving.............: avg=279.7µs min=51.61µs med=91.99µs max=129.83ms p(90)=672.47µs p(95)=1.2ms   p(99.9)=7.77ms 
     http_req_sending...............: avg=33.76µs min=4.75µs  med=9.38µs  max=132.56ms p(90)=17.98µs  p(95)=32.39µs p(99.9)=1.72ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.67ms min=17.07ms med=25.07ms max=298.01ms p(90)=30.02ms  p(95)=31.9ms  p(99.9)=48.91ms
     http_reqs......................: 228967  1878.002601/s
     iteration_duration.............: avg=26.2ms  min=17.37ms med=25.57ms max=323.73ms p(90)=30.59ms  p(95)=32.53ms p(99.9)=50.82ms
     iterations.....................: 228867  1877.182395/s
     success_rate...................: 100.00% ✓ 228867      ✗ 0     
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

     checks.........................: 100.00% ✓ 685905      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.86µs   min=862ns   med=1.98µs  max=9.65ms   p(90)=3.45µs   p(95)=4.19µs  p(99.9)=29.73µs
     http_req_connecting............: avg=423ns    min=0s      med=0s      max=3.92ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.02ms  min=17.16ms med=25.43ms max=308.32ms p(90)=30.45ms  p(95)=32.27ms p(99.9)=48.62ms
       { expected_response:true }...: avg=26.02ms  min=17.16ms med=25.43ms max=308.32ms p(90)=30.45ms  p(95)=32.27ms p(99.9)=48.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228735
     http_req_receiving.............: avg=317.35µs min=51.26µs med=96.01µs max=161.85ms p(90)=799.38µs p(95)=1.28ms  p(99.9)=8ms    
     http_req_sending...............: avg=30.51µs  min=4.68µs  med=8.46µs  max=163.7ms  p(90)=17.56µs  p(95)=27.09µs p(99.9)=1.49ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.67ms  min=17.03ms med=25.1ms  max=307.74ms p(90)=30.03ms  p(95)=31.81ms p(99.9)=47.13ms
     http_reqs......................: 228735  1875.807721/s
     iteration_duration.............: avg=26.23ms  min=17.42ms med=25.63ms max=322.63ms p(90)=30.65ms  p(95)=32.47ms p(99.9)=48.95ms
     iterations.....................: 228635  1874.987642/s
     success_rate...................: 100.00% ✓ 228635      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 684438      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.35µs   min=992ns   med=2.54µs  max=3.46ms   p(90)=4.24µs   p(95)=4.99µs  p(99.9)=37.18µs
     http_req_connecting............: avg=377ns    min=0s      med=0s      max=3.42ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.06ms  min=17.32ms med=25.44ms max=303.16ms p(90)=30.56ms  p(95)=32.44ms p(99.9)=49.63ms
       { expected_response:true }...: avg=26.06ms  min=17.32ms med=25.44ms max=303.16ms p(90)=30.56ms  p(95)=32.44ms p(99.9)=49.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228246
     http_req_receiving.............: avg=310.67µs min=51.33µs med=96.77µs max=164.58ms p(90)=768.04µs p(95)=1.33ms  p(99.9)=8.56ms 
     http_req_sending...............: avg=34.86µs  min=4.73µs  med=9.92µs  max=26.44ms  p(90)=20.07µs  p(95)=58.07µs p(99.9)=2.03ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.72ms  min=16.32ms med=25.12ms max=293.72ms p(90)=30.13ms  p(95)=32ms    p(99.9)=48.33ms
     http_reqs......................: 228246  1871.843182/s
     iteration_duration.............: avg=26.29ms  min=17.53ms med=25.65ms max=313.39ms p(90)=30.78ms  p(95)=32.65ms p(99.9)=50.2ms 
     iterations.....................: 228146  1871.023083/s
     success_rate...................: 100.00% ✓ 228146      ✗ 0     
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

     checks.........................: 100.00% ✓ 663087      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 266 MB  2.2 MB/s
     http_req_blocked...............: avg=3.04µs   min=962ns   med=2.5µs   max=3.77ms   p(90)=4.13µs  p(95)=4.82µs   p(99.9)=34.79µs
     http_req_connecting............: avg=170ns    min=0s      med=0s      max=1.9ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.92ms  min=17.74ms med=26.5ms  max=322.65ms p(90)=30.72ms p(95)=32.15ms  p(99.9)=48.27ms
       { expected_response:true }...: avg=26.92ms  min=17.74ms med=26.5ms  max=322.65ms p(90)=30.72ms p(95)=32.15ms  p(99.9)=48.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 221129
     http_req_receiving.............: avg=100.06µs min=26.12µs med=53.51µs max=249.04ms p(90)=94.17µs p(95)=119.43µs p(99.9)=2.44ms 
     http_req_sending...............: avg=29.32µs  min=4.64µs  med=9.99µs  max=71.25ms  p(90)=17.83µs p(95)=24.82µs  p(99.9)=1.31ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.79ms  min=17.69ms med=26.41ms max=119.05ms p(90)=30.61ms p(95)=32.01ms  p(99.9)=46.48ms
     http_reqs......................: 221129  1813.296691/s
     iteration_duration.............: avg=27.13ms  min=17.94ms med=26.7ms  max=330.43ms p(90)=30.93ms p(95)=32.35ms  p(99.9)=48.82ms
     iterations.....................: 221029  1812.476674/s
     success_rate...................: 100.00% ✓ 221029      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 661302      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 265 MB  2.2 MB/s
     http_req_blocked...............: avg=2.9µs    min=902ns   med=2.05µs  max=3.57ms   p(90)=3.78µs  p(95)=4.53µs  p(99.9)=34.76µs
     http_req_connecting............: avg=419ns    min=0s      med=0s      max=3.5ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.98ms  min=17.62ms med=26.41ms max=286.59ms p(90)=31.57ms p(95)=33.41ms p(99.9)=50.41ms
       { expected_response:true }...: avg=26.98ms  min=17.62ms med=26.41ms max=286.59ms p(90)=31.57ms p(95)=33.41ms p(99.9)=50.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 220534
     http_req_receiving.............: avg=292.97µs min=50.7µs  med=92.61µs max=215.28ms p(90)=726.8µs p(95)=1.23ms  p(99.9)=7.88ms 
     http_req_sending...............: avg=32.38µs  min=4.69µs  med=8.79µs  max=206.15ms p(90)=19.59µs p(95)=30.43µs p(99.9)=1.58ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.66ms  min=17.5ms  med=26.1ms  max=285.91ms p(90)=31.16ms p(95)=32.98ms p(99.9)=49.02ms
     http_reqs......................: 220534  1808.219269/s
     iteration_duration.............: avg=27.2ms   min=17.86ms med=26.62ms max=308.5ms  p(90)=31.77ms p(95)=33.62ms p(99.9)=50.83ms
     iterations.....................: 220434  1807.399341/s
     success_rate...................: 100.00% ✓ 220434      ✗ 0     
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

     checks.........................: 100.00% ✓ 425181      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.67µs  min=972ns   med=2.62µs  max=4.14ms   p(90)=4.19µs   p(95)=4.87µs   p(99.9)=39.08µs 
     http_req_connecting............: avg=740ns   min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.09ms min=18.69ms med=41.45ms max=298.15ms p(90)=50.92ms  p(95)=53.97ms  p(99.9)=69.57ms 
       { expected_response:true }...: avg=42.09ms min=18.69ms med=41.45ms max=298.15ms p(90)=50.92ms  p(95)=53.97ms  p(99.9)=69.57ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 141827
     http_req_receiving.............: avg=84.47µs min=27.22µs med=67.06µs max=154.26ms p(90)=108.32µs p(95)=127.25µs p(99.9)=811.47µs
     http_req_sending...............: avg=23.53µs min=4.69µs  med=11.76µs max=128.27ms p(90)=18.76µs  p(95)=22.59µs  p(99.9)=868.45µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.98ms min=18.54ms med=41.35ms max=297.65ms p(90)=50.81ms  p(95)=53.85ms  p(99.9)=69.2ms  
     http_reqs......................: 141827  1162.483101/s
     iteration_duration.............: avg=42.32ms min=22.95ms med=41.66ms max=315.34ms p(90)=51.13ms  p(95)=54.17ms  p(99.9)=69.92ms 
     iterations.....................: 141727  1161.663452/s
     success_rate...................: 100.00% ✓ 141727      ✗ 0     
     vus............................: 34      min=0         max=50  
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

     checks.........................: 100.00% ✓ 208812     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   685 kB/s
     http_req_blocked...............: avg=5.02µs   min=1.15µs  med=3.33µs  max=4.14ms   p(90)=5.01µs   p(95)=5.71µs   p(99.9)=48.05µs 
     http_req_connecting............: avg=1.4µs    min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.85ms  min=21.14ms med=84.25ms max=335.33ms p(90)=104.75ms p(95)=114.23ms p(99.9)=195.67ms
       { expected_response:true }...: avg=85.85ms  min=21.14ms med=84.25ms max=335.33ms p(90)=104.75ms p(95)=114.23ms p(99.9)=195.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69704
     http_req_receiving.............: avg=133.77µs min=32.5µs  med=80.73µs max=243.26ms p(90)=118.46µs p(95)=132.8µs  p(99.9)=802.25µs
     http_req_sending...............: avg=26.22µs  min=5.48µs  med=15.83µs max=151.62ms p(90)=22.9µs   p(95)=25.37µs  p(99.9)=620.43µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.69ms  min=21.03ms med=84.15ms max=288.62ms p(90)=104.61ms p(95)=113.99ms p(99.9)=192.87ms
     http_reqs......................: 69704   570.23277/s
     iteration_duration.............: avg=86.2ms   min=34ms    med=84.52ms max=345.09ms p(90)=105.01ms p(95)=114.53ms p(99.9)=197.51ms
     iterations.....................: 69604   569.414692/s
     success_rate...................: 100.00% ✓ 69604      ✗ 0    
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

     checks.........................: 100.00% ✓ 158376     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 64 MB   519 kB/s
     http_req_blocked...............: avg=5.55µs   min=1.08µs  med=3.56µs   max=4.18ms   p(90)=5.13µs   p(95)=5.75µs   p(99.9)=96.74µs 
     http_req_connecting............: avg=1.76µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=113.22ms min=21.43ms med=111.39ms max=339.81ms p(90)=141ms    p(95)=150.05ms p(99.9)=191.35ms
       { expected_response:true }...: avg=113.22ms min=21.43ms med=111.39ms max=339.81ms p(90)=141ms    p(95)=150.05ms p(99.9)=191.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52892
     http_req_receiving.............: avg=89.96µs  min=30.33µs med=85.93µs  max=20.6ms   p(90)=117.94µs p(95)=130.66µs p(99.9)=595.88µs
     http_req_sending...............: avg=25.16µs  min=4.91µs  med=17.77µs  max=85.99ms  p(90)=23.21µs  p(95)=25.17µs  p(99.9)=573.96µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=113.11ms min=21.25ms med=111.28ms max=332.06ms p(90)=140.88ms p(95)=149.93ms p(99.9)=191.27ms
     http_reqs......................: 52892   432.336194/s
     iteration_duration.............: avg=113.67ms min=34.4ms  med=111.69ms max=348.3ms  p(90)=141.29ms p(95)=150.36ms p(99.9)=193.52ms
     iterations.....................: 52792   431.518799/s
     success_rate...................: 100.00% ✓ 52792      ✗ 0    
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

     checks.........................: 100.00% ✓ 97032      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   319 kB/s
     http_req_blocked...............: avg=6.47µs   min=1.16µs  med=3.33µs   max=3.66ms   p(90)=4.78µs   p(95)=5.38µs   p(99.9)=1.59ms  
     http_req_connecting............: avg=2.91µs   min=0s      med=0s       max=3.62ms   p(90)=0s       p(95)=0s       p(99.9)=1.57ms  
     http_req_duration..............: avg=184.79ms min=17.36ms med=171.12ms max=655.27ms p(90)=224.02ms p(95)=256.12ms p(99.9)=555.5ms 
       { expected_response:true }...: avg=184.79ms min=17.36ms med=171.12ms max=655.27ms p(90)=224.02ms p(95)=256.12ms p(99.9)=555.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32444
     http_req_receiving.............: avg=100.18µs min=29.36µs med=90.41µs  max=191.85ms p(90)=121.61µs p(95)=134.84µs p(99.9)=694.06µs
     http_req_sending...............: avg=25.55µs  min=5.42µs  med=18.39µs  max=75.58ms  p(90)=23.23µs  p(95)=25.1µs   p(99.9)=406.37µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.66ms min=17.21ms med=171ms    max=655.19ms p(90)=223.91ms p(95)=255.97ms p(99.9)=555.4ms 
     http_reqs......................: 32444   265.658977/s
     iteration_duration.............: avg=185.58ms min=44.1ms  med=171.55ms max=655.45ms p(90)=224.37ms p(95)=257.07ms p(99.9)=555.78ms
     iterations.....................: 32344   264.840154/s
     success_rate...................: 100.00% ✓ 32344      ✗ 0    
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

     checks.........................: 100.00% ✓ 96375      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   316 kB/s
     http_req_blocked...............: avg=6.85µs   min=1.46µs  med=3.62µs   max=4.04ms   p(90)=5.08µs   p(95)=5.7µs    p(99.9)=1.39ms  
     http_req_connecting............: avg=2.97µs   min=0s      med=0s       max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=1.36ms  
     http_req_duration..............: avg=186.05ms min=23.26ms med=184.44ms max=364.15ms p(90)=200.28ms p(95)=205.61ms p(99.9)=280.28ms
       { expected_response:true }...: avg=186.05ms min=23.26ms med=184.44ms max=364.15ms p(90)=200.28ms p(95)=205.61ms p(99.9)=280.28ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32225
     http_req_receiving.............: avg=100.08µs min=35.71µs med=89.88µs  max=95.19ms  p(90)=122.15µs p(95)=135.43µs p(99.9)=471.4µs 
     http_req_sending...............: avg=31.66µs  min=5.97µs  med=18.21µs  max=190.19ms p(90)=23.21µs  p(95)=25.13µs  p(99.9)=500.51µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.92ms min=23.11ms med=184.32ms max=363.62ms p(90)=200.14ms p(95)=205.47ms p(99.9)=278.97ms
     http_reqs......................: 32225   262.791/s
     iteration_duration.............: avg=186.86ms min=56.31ms med=184.84ms max=396.42ms p(90)=200.57ms p(95)=205.9ms  p(99.9)=281.61ms
     iterations.....................: 32125   261.975512/s
     success_rate...................: 100.00% ✓ 32125      ✗ 0    
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

     checks.........................: 100.00% ✓ 6243      ✗ 0   
     data_received..................: 209 MB  1.6 MB/s
     data_sent......................: 2.6 MB  21 kB/s
     http_req_blocked...............: avg=18.63µs  min=1.29µs   med=3.15µs  max=2.86ms p(90)=4.49µs   p(95)=5.37µs  p(99.9)=2.31ms
     http_req_connecting............: avg=12.23µs  min=0s       med=0s      max=2.81ms p(90)=0s       p(95)=0s      p(99.9)=2.19ms
     http_req_duration..............: avg=2.77s    min=43.28ms  med=2.88s   max=13.86s p(90)=3.56s    p(95)=3.73s   p(99.9)=11.23s
       { expected_response:true }...: avg=2.77s    min=43.28ms  med=2.88s   max=13.86s p(90)=3.56s    p(95)=3.73s   p(99.9)=11.23s
     http_req_failed................: 0.00%   ✓ 0         ✗ 2181
     http_req_receiving.............: avg=105.65µs min=32.99µs  med=91.75µs max=9.71ms p(90)=131.17µs p(95)=145.7µs p(99.9)=4.43ms
     http_req_sending...............: avg=28.22µs  min=5.99µs   med=17.4µs  max=2.22ms p(90)=22.31µs  p(95)=25.57µs p(99.9)=1.45ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s     p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=2.77s    min=43.17ms  med=2.88s   max=13.86s p(90)=3.56s    p(95)=3.73s   p(99.9)=11.23s
     http_reqs......................: 2181    17.118089/s
     iteration_duration.............: avg=2.9s     min=623.66ms med=2.9s    max=13.86s p(90)=3.57s    p(95)=3.76s   p(99.9)=11.25s
     iterations.....................: 2081    16.333216/s
     success_rate...................: 100.00% ✓ 2081      ✗ 0   
     vus............................: 16      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

