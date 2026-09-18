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
| fusion-nightly-net11 | 16.7.0-p.7 | 1,890 | 1,933 | 1,876 | 1.0% |  |
| fusion | 16.6.6 | 1,877 | 1,927 | 1,869 | 1.1% |  |
| fusion-nightly | 16.7.0-p.7 | 1,869 | 1,924 | 1,854 | 1.2% |  |
| hive-router | v0.0.84 | 1,848 | 1,911 | 1,836 | 1.3% |  |
| fusion-nightly-fed | 16.7.0-p.7 | 1,802 | 1,850 | 1,798 | 1.0% |  |
| grafbase | 0.53.5 | 1,309 | 1,327 | 1,300 | 0.7% |  |
| cosmo | 0.334.0 | 1,218 | 1,260 | 1,214 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 568 | 583 | 564 | 1.0% |  |
| apollo-router | v2.16.1 | 435 | 451 | 433 | 1.6% |  |
| apollo-gateway | 2.14.3 | 267 | 269 | 263 | 0.6% |  |
| hive-gateway | 2.10.8 | 257 | 263 | 255 | 1.0% |  |
| feddi | 5ff8b6165878 | 21 | 22 | 20 | 3.2% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 690993      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=2.53µs   min=852ns   med=1.88µs  max=2.77ms   p(90)=3.48µs  p(95)=4.19µs  p(99.9)=30.79µs
     http_req_connecting............: avg=230ns    min=0s      med=0s      max=2.72ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.82ms  min=17.18ms med=25.26ms max=300.05ms p(90)=29.98ms p(95)=31.75ms p(99.9)=49.02ms
       { expected_response:true }...: avg=25.82ms  min=17.18ms med=25.26ms max=300.05ms p(90)=29.98ms p(95)=31.75ms p(99.9)=49.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230431
     http_req_receiving.............: avg=390.22µs min=50.71µs med=90.42µs max=131.75ms p(90)=1.12ms  p(95)=1.83ms  p(99.9)=9.75ms 
     http_req_sending...............: avg=32.5µs   min=4.19µs  med=8.15µs  max=101.86ms p(90)=18.12µs p(95)=30.64µs p(99.9)=2.19ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.4ms   min=17.07ms med=24.87ms max=299.83ms p(90)=29.41ms p(95)=31.11ms p(99.9)=47.62ms
     http_reqs......................: 230431  1890.351482/s
     iteration_duration.............: avg=26.04ms  min=17.4ms  med=25.46ms max=308.83ms p(90)=30.18ms p(95)=31.96ms p(99.9)=49.41ms
     iterations.....................: 230331  1889.531127/s
     success_rate...................: 100.00% ✓ 230331      ✗ 0     
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

     checks.........................: 100.00% ✓ 686397      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.32µs   min=941ns   med=2.54µs  max=4.13ms   p(90)=4.16µs   p(95)=4.89µs  p(99.9)=36.96µs
     http_req_connecting............: avg=418ns    min=0s      med=0s      max=4.09ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.99ms  min=17.36ms med=25.36ms max=311.99ms p(90)=30.43ms  p(95)=32.34ms p(99.9)=51.15ms
       { expected_response:true }...: avg=25.99ms  min=17.36ms med=25.36ms max=311.99ms p(90)=30.43ms  p(95)=32.34ms p(99.9)=51.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228899
     http_req_receiving.............: avg=322.52µs min=50µs    med=99.15µs max=116.63ms p(90)=795.96µs p(95)=1.3ms   p(99.9)=9ms    
     http_req_sending...............: avg=32.17µs  min=4.64µs  med=9.61µs  max=111.44ms p(90)=18.85µs  p(95)=35µs    p(99.9)=1.61ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.64ms  min=17.19ms med=25.02ms max=311.7ms  p(90)=30.01ms  p(95)=31.87ms p(99.9)=49.79ms
     http_reqs......................: 228899  1877.35966/s
     iteration_duration.............: avg=26.21ms  min=17.61ms med=25.56ms max=321.68ms p(90)=30.64ms  p(95)=32.56ms p(99.9)=51.65ms
     iterations.....................: 228799  1876.539491/s
     success_rate...................: 100.00% ✓ 228799      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 683658      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.38µs   min=821ns   med=2.51µs  max=3.96ms   p(90)=4.3µs    p(95)=5.07µs  p(99.9)=34.76µs
     http_req_connecting............: avg=465ns    min=0s      med=0s      max=3.92ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.09ms  min=17.3ms  med=25.48ms max=295.33ms p(90)=30.55ms  p(95)=32.4ms  p(99.9)=51.17ms
       { expected_response:true }...: avg=26.09ms  min=17.3ms  med=25.48ms max=295.33ms p(90)=30.55ms  p(95)=32.4ms  p(99.9)=51.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227986
     http_req_receiving.............: avg=308.76µs min=50.97µs med=96.42µs max=128.48ms p(90)=742.37µs p(95)=1.27ms  p(99.9)=8.98ms 
     http_req_sending...............: avg=33.15µs  min=4.6µs   med=9.6µs   max=105.87ms p(90)=19.84µs  p(95)=44.04µs p(99.9)=1.64ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.75ms  min=17.19ms med=25.16ms max=294.81ms p(90)=30.14ms  p(95)=31.94ms p(99.9)=49.41ms
     http_reqs......................: 227986  1869.711607/s
     iteration_duration.............: avg=26.31ms  min=17.48ms med=25.7ms  max=309.63ms p(90)=30.76ms  p(95)=32.61ms p(99.9)=51.55ms
     iterations.....................: 227886  1868.891508/s
     success_rate...................: 100.00% ✓ 227886      ✗ 0     
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

     checks.........................: 100.00% ✓ 676011      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=3.05µs  min=902ns   med=2.15µs  max=4.09ms   p(90)=3.91µs  p(95)=4.66µs   p(99.9)=30.12µs
     http_req_connecting............: avg=480ns   min=0s      med=0s      max=4.06ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.4ms  min=18.17ms med=25.96ms max=303.73ms p(90)=30.15ms p(95)=31.57ms  p(99.9)=47.47ms
       { expected_response:true }...: avg=26.4ms  min=18.17ms med=25.96ms max=303.73ms p(90)=30.15ms p(95)=31.57ms  p(99.9)=47.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 225437
     http_req_receiving.............: avg=74.92µs min=24.33µs med=49.04µs max=170.54ms p(90)=92.93µs p(95)=120.09µs p(99.9)=1.8ms  
     http_req_sending...............: avg=30.15µs min=4.61µs  med=9.41µs  max=121.09ms p(90)=18.69µs p(95)=26.11µs  p(99.9)=1.41ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.3ms  min=18.03ms med=25.87ms max=303.39ms p(90)=30.04ms p(95)=31.45ms  p(99.9)=46.25ms
     http_reqs......................: 225437  1848.639847/s
     iteration_duration.............: avg=26.61ms min=18.76ms med=26.16ms max=313.19ms p(90)=30.35ms p(95)=31.78ms  p(99.9)=47.84ms
     iterations.....................: 225337  1847.819822/s
     success_rate...................: 100.00% ✓ 225337      ✗ 0     
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

     checks.........................: 100.00% ✓ 659208      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 264 MB  2.2 MB/s
     http_req_blocked...............: avg=3.36µs   min=982ns   med=2.54µs  max=4.08ms   p(90)=4.28µs   p(95)=5.04µs  p(99.9)=36.05µs
     http_req_connecting............: avg=411ns    min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.07ms  min=17.63ms med=26.49ms max=300.67ms p(90)=31.7ms   p(95)=33.56ms p(99.9)=50.62ms
       { expected_response:true }...: avg=27.07ms  min=17.63ms med=26.49ms max=300.67ms p(90)=31.7ms   p(95)=33.56ms p(99.9)=50.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 219836
     http_req_receiving.............: avg=296.36µs min=50.97µs med=96.76µs max=200.31ms p(90)=721.97µs p(95)=1.24ms  p(99.9)=8.05ms 
     http_req_sending...............: avg=33.72µs  min=4.53µs  med=10.09µs max=158.97ms p(90)=20.25µs  p(95)=35.87µs p(99.9)=1.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.74ms  min=17.49ms med=26.18ms max=300.48ms p(90)=31.3ms   p(95)=33.13ms p(99.9)=48.79ms
     http_reqs......................: 219836  1802.581786/s
     iteration_duration.............: avg=27.29ms  min=17.86ms med=26.7ms  max=317.85ms p(90)=31.91ms  p(95)=33.77ms p(99.9)=50.96ms
     iterations.....................: 219736  1801.761819/s
     success_rate...................: 100.00% ✓ 219736      ✗ 0     
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

     checks.........................: 100.00% ✓ 478773      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=3.74µs  min=1.04µs  med=2.97µs  max=2.02ms   p(90)=5.34µs   p(95)=6.35µs   p(99.9)=46.9µs 
     http_req_connecting............: avg=240ns   min=0s      med=0s      max=1.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.32ms min=17.82ms med=37.04ms max=311.81ms p(90)=43.92ms  p(95)=45.99ms  p(99.9)=65.03ms
       { expected_response:true }...: avg=37.32ms min=17.82ms med=37.04ms max=311.81ms p(90)=43.92ms  p(95)=45.99ms  p(99.9)=65.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159691
     http_req_receiving.............: avg=94.47µs min=27.41µs med=61.68µs max=147.9ms  p(90)=131.65µs p(95)=180.72µs p(99.9)=2.75ms 
     http_req_sending...............: avg=41.01µs min=4.52µs  med=11.37µs max=226.85ms p(90)=25.17µs  p(95)=70.47µs  p(99.9)=2.16ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.18ms min=17.74ms med=36.91ms max=301.13ms p(90)=43.78ms  p(95)=45.84ms  p(99.9)=63.85ms
     http_reqs......................: 159691  1309.143215/s
     iteration_duration.............: avg=37.58ms min=21.23ms med=37.29ms max=318.4ms  p(90)=44.15ms  p(95)=46.21ms  p(99.9)=65.53ms
     iterations.....................: 159591  1308.323417/s
     success_rate...................: 100.00% ✓ 159591      ✗ 0     
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

     checks.........................: 100.00% ✓ 445602      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.94µs  min=1.15µs  med=2.95µs  max=3.78ms   p(90)=4.62µs   p(95)=5.35µs  p(99.9)=37.21µs
     http_req_connecting............: avg=669ns   min=0s      med=0s      max=3.74ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=40.14ms min=19.07ms med=39.51ms max=309.51ms p(90)=48.27ms  p(95)=51.11ms p(99.9)=67.25ms
       { expected_response:true }...: avg=40.14ms min=19.07ms med=39.51ms max=309.51ms p(90)=48.27ms  p(95)=51.11ms p(99.9)=67.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148634
     http_req_receiving.............: avg=87.81µs min=27.16µs med=65.52µs max=136.7ms  p(90)=107.85µs p(95)=126.7µs p(99.9)=1.22ms 
     http_req_sending...............: avg=26.49µs min=5.34µs  med=12.54µs max=89.07ms  p(90)=20.24µs  p(95)=24.41µs p(99.9)=1.11ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=40.03ms min=18.93ms med=39.41ms max=297.26ms p(90)=48.16ms  p(95)=50.99ms p(99.9)=66.95ms
     http_reqs......................: 148634  1218.396603/s
     iteration_duration.............: avg=40.38ms min=22.57ms med=39.72ms max=328.43ms p(90)=48.48ms  p(95)=51.32ms p(99.9)=67.67ms
     iterations.....................: 148534  1217.576873/s
     success_rate...................: 100.00% ✓ 148534      ✗ 0     
     vus............................: 18      min=0         max=50  
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

     checks.........................: 100.00% ✓ 208305     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   683 kB/s
     http_req_blocked...............: avg=6.59µs  min=1.02µs  med=2.76µs  max=8.89ms   p(90)=4.29µs   p(95)=4.95µs   p(99.9)=46.83µs 
     http_req_connecting............: avg=3.49µs  min=0s      med=0s      max=8.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.07ms min=20.56ms med=84.53ms max=331.76ms p(90)=102.74ms p(95)=111.82ms p(99.9)=198.68ms
       { expected_response:true }...: avg=86.07ms min=20.56ms med=84.53ms max=331.76ms p(90)=102.74ms p(95)=111.82ms p(99.9)=198.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69535
     http_req_receiving.............: avg=82.8µs  min=28.66µs med=75.42µs max=14.33ms  p(90)=111.82µs p(95)=125.46µs p(99.9)=625.84µs
     http_req_sending...............: avg=19.18µs min=5.15µs  med=13.8µs  max=52.57ms  p(90)=20.44µs  p(95)=22.67µs  p(99.9)=599.37µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.97ms min=20.38ms med=84.43ms max=331.4ms  p(90)=102.64ms p(95)=111.62ms p(99.9)=198.57ms
     http_reqs......................: 69535   568.898538/s
     iteration_duration.............: avg=86.41ms min=34.77ms med=84.78ms max=346.53ms p(90)=102.97ms p(95)=112.12ms p(99.9)=201.1ms 
     iterations.....................: 69435   568.080391/s
     success_rate...................: 100.00% ✓ 69435      ✗ 0    
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

     checks.........................: 100.00% ✓ 159360    ✗ 0    
     data_received..................: 4.7 GB  38 MB/s
     data_sent......................: 64 MB   523 kB/s
     http_req_blocked...............: avg=5.62µs   min=1.41µs  med=3.69µs   max=3.43ms   p(90)=5.29µs   p(95)=5.91µs   p(99.9)=113.41µs
     http_req_connecting............: avg=1.64µs   min=0s      med=0s       max=3.39ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.51ms min=21.3ms  med=110.8ms  max=334.87ms p(90)=139.95ms p(95)=149.05ms p(99.9)=190.32ms
       { expected_response:true }...: avg=112.51ms min=21.3ms  med=110.8ms  max=334.87ms p(90)=139.95ms p(95)=149.05ms p(99.9)=190.32ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 53220
     http_req_receiving.............: avg=93.14µs  min=32.43µs med=86.29µs  max=112.66ms p(90)=118.37µs p(95)=130.8µs  p(99.9)=573.54µs
     http_req_sending...............: avg=25.03µs  min=5.69µs  med=17.9µs   max=65.02ms  p(90)=23.58µs  p(95)=25.67µs  p(99.9)=593.85µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.39ms min=21.04ms med=110.69ms max=334.16ms p(90)=139.83ms p(95)=148.93ms p(99.9)=189.81ms
     http_reqs......................: 53220   435.14807/s
     iteration_duration.............: avg=112.97ms min=45.32ms med=111.11ms max=345.42ms p(90)=140.26ms p(95)=149.35ms p(99.9)=191.74ms
     iterations.....................: 53120   434.33043/s
     success_rate...................: 100.00% ✓ 53120     ✗ 0    
     vus............................: 50      min=0       max=50 
     vus_max........................: 50      min=50      max=50
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

     checks.........................: 100.00% ✓ 98148      ✗ 0    
     data_received..................: 2.9 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=7.48µs   min=1.6µs   med=3.88µs   max=4.08ms   p(90)=5.47µs   p(95)=6.1µs    p(99.9)=1.8ms   
     http_req_connecting............: avg=3.32µs   min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=1.78ms  
     http_req_duration..............: avg=182.67ms min=23.38ms med=201.55ms max=388.46ms p(90)=211.82ms p(95)=215.61ms p(99.9)=290.25ms
       { expected_response:true }...: avg=182.67ms min=23.38ms med=201.55ms max=388.46ms p(90)=211.82ms p(95)=215.61ms p(99.9)=290.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32816
     http_req_receiving.............: avg=101.83µs min=33.9µs  med=90.39µs  max=92.39ms  p(90)=122.5µs  p(95)=135.32µs p(99.9)=560.43µs
     http_req_sending...............: avg=32.48µs  min=6.53µs  med=18.55µs  max=96.62ms  p(90)=23.61µs  p(95)=25.6µs   p(99.9)=481.87µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.54ms min=23.22ms med=201.43ms max=353.31ms p(90)=211.7ms  p(95)=215.48ms p(99.9)=290.03ms
     http_reqs......................: 32816   267.617577/s
     iteration_duration.............: avg=183.47ms min=55.21ms med=201.85ms max=396.47ms p(90)=212.12ms p(95)=215.92ms p(99.9)=291.61ms
     iterations.....................: 32716   266.802067/s
     success_rate...................: 100.00% ✓ 32716      ✗ 0    
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

     checks.........................: 100.00% ✓ 94176      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=6.34µs   min=1.1µs   med=3.1µs    max=3.33ms   p(90)=4.5µs    p(95)=5.08µs   p(99.9)=1.67ms  
     http_req_connecting............: avg=3.03µs   min=0s      med=0s       max=3.29ms   p(90)=0s       p(95)=0s       p(99.9)=1.65ms  
     http_req_duration..............: avg=190.43ms min=18.09ms med=177.69ms max=678.39ms p(90)=228.88ms p(95)=261.24ms p(99.9)=599.4ms 
       { expected_response:true }...: avg=190.43ms min=18.09ms med=177.69ms max=678.39ms p(90)=228.88ms p(95)=261.24ms p(99.9)=599.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31492
     http_req_receiving.............: avg=98.92µs  min=32.65µs med=89.36µs  max=115.55ms p(90)=120.53µs p(95)=132.81µs p(99.9)=593.58µs
     http_req_sending...............: avg=26.4µs   min=5.72µs  med=17.59µs  max=69.05ms  p(90)=22.33µs  p(95)=24.12µs  p(99.9)=522.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.31ms min=18ms    med=177.58ms max=678.29ms p(90)=228.75ms p(95)=260.86ms p(99.9)=599.3ms 
     http_reqs......................: 31492   257.84959/s
     iteration_duration.............: avg=191.26ms min=58.12ms med=178.09ms max=678.63ms p(90)=229.23ms p(95)=262.34ms p(99.9)=599.65ms
     iterations.....................: 31392   257.030812/s
     success_rate...................: 100.00% ✓ 31392      ✗ 0    
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

     checks.........................: 100.00% ✓ 7713      ✗ 0   
     data_received..................: 256 MB  2.0 MB/s
     data_sent......................: 3.2 MB  25 kB/s
     http_req_blocked...............: avg=93.72µs  min=1.2µs    med=3.25µs  max=9.05ms  p(90)=4.77µs   p(95)=5.67µs   p(99.9)=7.86ms  
     http_req_connecting............: avg=87.4µs   min=0s       med=0s      max=8.96ms  p(90)=0s       p(95)=0s       p(99.9)=7.62ms  
     http_req_duration..............: avg=2.26s    min=35.76ms  med=2.27s   max=4.78s   p(90)=3.04s    p(95)=3.37s    p(99.9)=4.59s   
       { expected_response:true }...: avg=2.26s    min=35.76ms  med=2.27s   max=4.78s   p(90)=3.04s    p(95)=3.37s    p(99.9)=4.59s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2671
     http_req_receiving.............: avg=101.88µs min=32.2µs   med=96.79µs max=2.15ms  p(90)=138.84µs p(95)=155.03µs p(99.9)=333.08µs
     http_req_sending...............: avg=69.92µs  min=5.8µs    med=19.04µs max=15.04ms p(90)=24.19µs  p(95)=27.24µs  p(99.9)=4.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.26s    min=35.61ms  med=2.27s   max=4.78s   p(90)=3.04s    p(95)=3.37s    p(99.9)=4.59s   
     http_reqs......................: 2671    21.189508/s
     iteration_duration.............: avg=2.34s    min=487.53ms med=2.29s   max=4.78s   p(90)=3.04s    p(95)=3.38s    p(99.9)=4.6s    
     iterations.....................: 2571    20.39619/s
     success_rate...................: 100.00% ✓ 2571      ✗ 0   
     vus............................: 10      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

