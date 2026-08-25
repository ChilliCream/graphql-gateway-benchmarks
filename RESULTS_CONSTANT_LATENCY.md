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
| fusion-nightly | 16.6.2-p.7 | 1,900 | 1,943 | 1,892 | 0.9% |  |
| fusion | 16.6.1 | 1,894 | 1,935 | 1,889 | 0.9% |  |
| fusion-nightly-net11 | 16.6.2-p.7 | 1,873 | 1,922 | 1,862 | 1.2% |  |
| hive-router | v0.0.84 | 1,848 | 1,909 | 1,830 | 1.4% |  |
| fusion-nightly-fed | 16.6.2-p.7 | 1,806 | 1,852 | 1,789 | 1.0% |  |
| grafbase | 0.53.5 | 1,277 | 1,312 | 1,270 | 1.1% |  |
| cosmo | 0.334.0 | 1,219 | 1,261 | 1,214 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 549 | 573 | 547 | 1.6% |  |
| apollo-router | v2.16.1 | 434 | 453 | 433 | 1.8% |  |
| apollo-gateway | 2.14.3 | 267 | 271 | 267 | 0.6% |  |
| hive-gateway | 2.10.8 | 253 | 261 | 252 | 1.2% |  |
| feddi | 5ff8b6165878 | 18 | 19 | 18 | 2.4% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 694833      ✗ 0     
     data_received..................: 20 GB   167 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=3.37µs   min=932ns   med=2.05µs  max=8.18ms   p(90)=3.79µs   p(95)=4.52µs  p(99.9)=29.16µs
     http_req_connecting............: avg=865ns    min=0s      med=0s      max=8.15ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.67ms  min=17.25ms med=25.1ms  max=282.83ms p(90)=29.96ms  p(95)=31.75ms p(99.9)=48.56ms
       { expected_response:true }...: avg=25.67ms  min=17.25ms med=25.1ms  max=282.83ms p(90)=29.96ms  p(95)=31.75ms p(99.9)=48.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 231711
     http_req_receiving.............: avg=292.57µs min=50.66µs med=93.67µs max=144.59ms p(90)=731.75µs p(95)=1.22ms  p(99.9)=7.94ms 
     http_req_sending...............: avg=31.68µs  min=4.53µs  med=8.72µs  max=110.97ms p(90)=18.92µs  p(95)=32.12µs p(99.9)=1.71ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.35ms  min=17.15ms med=24.79ms max=280.91ms p(90)=29.57ms  p(95)=31.33ms p(99.9)=46.93ms
     http_reqs......................: 231711  1900.500918/s
     iteration_duration.............: avg=25.89ms  min=17.46ms med=25.3ms  max=314.64ms p(90)=30.16ms  p(95)=31.95ms p(99.9)=48.99ms
     iterations.....................: 231611  1899.680714/s
     success_rate...................: 100.00% ✓ 231611      ✗ 0     
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

     checks.........................: 100.00% ✓ 692508      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=2.93µs   min=922ns   med=2.02µs  max=10.39ms  p(90)=3.68µs   p(95)=4.41µs  p(99.9)=32.98µs
     http_req_connecting............: avg=407ns    min=0s      med=0s      max=3.64ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.76ms  min=17.16ms med=25.18ms max=301.32ms p(90)=30.09ms  p(95)=31.87ms p(99.9)=48.75ms
       { expected_response:true }...: avg=25.76ms  min=17.16ms med=25.18ms max=301.32ms p(90)=30.09ms  p(95)=31.87ms p(99.9)=48.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230936
     http_req_receiving.............: avg=300.81µs min=49.75µs med=91.92µs max=149.01ms p(90)=750.96µs p(95)=1.24ms  p(99.9)=8.17ms 
     http_req_sending...............: avg=30.89µs  min=4.58µs  med=8.58µs  max=134.76ms p(90)=18.25µs  p(95)=32.11µs p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.43ms  min=17.05ms med=24.87ms max=300.73ms p(90)=29.68ms  p(95)=31.42ms p(99.9)=47.05ms
     http_reqs......................: 230936  1894.297979/s
     iteration_duration.............: avg=25.98ms  min=17.35ms med=25.39ms max=320.08ms p(90)=30.29ms  p(95)=32.07ms p(99.9)=49.2ms 
     iterations.....................: 230836  1893.477709/s
     success_rate...................: 100.00% ✓ 230836      ✗ 0     
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

     checks.........................: 100.00% ✓ 685056      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.27µs   min=1µs     med=2.44µs  max=5.39ms   p(90)=3.95µs   p(95)=4.65µs  p(99.9)=36.33µs
     http_req_connecting............: avg=436ns    min=0s      med=0s      max=3.65ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.04ms  min=17.21ms med=25.48ms max=305.46ms p(90)=30.38ms  p(95)=32.18ms p(99.9)=49.17ms
       { expected_response:true }...: avg=26.04ms  min=17.21ms med=25.48ms max=305.46ms p(90)=30.38ms  p(95)=32.18ms p(99.9)=49.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228452
     http_req_receiving.............: avg=277.13µs min=51.25µs med=94.5µs  max=212.02ms p(90)=669.48µs p(95)=1.17ms  p(99.9)=7.75ms 
     http_req_sending...............: avg=31.56µs  min=4.72µs  med=9.39µs  max=156.22ms p(90)=18.43µs  p(95)=34.67µs p(99.9)=1.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.73ms  min=17.06ms med=25.19ms max=302.83ms p(90)=30.02ms  p(95)=31.79ms p(99.9)=47.98ms
     http_reqs......................: 228452  1873.884955/s
     iteration_duration.............: avg=26.26ms  min=17.39ms med=25.69ms max=317.07ms p(90)=30.58ms  p(95)=32.38ms p(99.9)=49.64ms
     iterations.....................: 228352  1873.064702/s
     success_rate...................: 100.00% ✓ 228352      ✗ 0     
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

     checks.........................: 100.00% ✓ 676032      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=3µs     min=942ns   med=2.28µs  max=3.5ms    p(90)=3.89µs  p(95)=4.58µs   p(99.9)=29.36µs
     http_req_connecting............: avg=384ns   min=0s      med=0s      max=3.46ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.4ms  min=17.85ms med=25.99ms max=292.33ms p(90)=30.1ms  p(95)=31.48ms  p(99.9)=46.46ms
       { expected_response:true }...: avg=26.4ms  min=17.85ms med=25.99ms max=292.33ms p(90)=30.1ms  p(95)=31.48ms  p(99.9)=46.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 225444
     http_req_receiving.............: avg=72.13µs min=25.98µs med=51.2µs  max=119.32ms p(90)=90.12µs p(95)=112.76µs p(99.9)=1.56ms 
     http_req_sending...............: avg=30.28µs min=4.66µs  med=9.49µs  max=207.14ms p(90)=17µs    p(95)=23.56µs  p(99.9)=1.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.3ms  min=17.75ms med=25.9ms  max=290.98ms p(90)=30ms    p(95)=31.37ms  p(99.9)=44.61ms
     http_reqs......................: 225444  1848.956518/s
     iteration_duration.............: avg=26.61ms min=18.89ms med=26.18ms max=309.88ms p(90)=30.3ms  p(95)=31.69ms  p(99.9)=46.94ms
     iterations.....................: 225344  1848.136378/s
     success_rate...................: 100.00% ✓ 225344      ✗ 0     
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

     checks.........................: 100.00% ✓ 660909      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 265 MB  2.2 MB/s
     http_req_blocked...............: avg=2.7µs    min=882ns   med=2.06µs  max=3.28ms   p(90)=3.85µs   p(95)=4.62µs  p(99.9)=31.11µs
     http_req_connecting............: avg=177ns    min=0s      med=0s      max=2.13ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.01ms  min=18.05ms med=26.41ms max=294.54ms p(90)=31.57ms  p(95)=33.48ms p(99.9)=50.45ms
       { expected_response:true }...: avg=27.01ms  min=18.05ms med=26.41ms max=294.54ms p(90)=31.57ms  p(95)=33.48ms p(99.9)=50.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 220403
     http_req_receiving.............: avg=317.34µs min=51.5µs  med=99.55µs max=120.97ms p(90)=791.77µs p(95)=1.27ms  p(99.9)=7.97ms 
     http_req_sending...............: avg=32.18µs  min=4.67µs  med=8.74µs  max=99.52ms  p(90)=18.9µs   p(95)=29.84µs p(99.9)=1.59ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.66ms  min=17.88ms med=26.08ms max=294.05ms p(90)=31.16ms  p(95)=33.02ms p(99.9)=48.78ms
     http_reqs......................: 220403  1806.860396/s
     iteration_duration.............: avg=27.22ms  min=18.35ms med=26.61ms max=303.12ms p(90)=31.77ms  p(95)=33.68ms p(99.9)=50.81ms
     iterations.....................: 220303  1806.040597/s
     success_rate...................: 100.00% ✓ 220303      ✗ 0     
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

     checks.........................: 100.00% ✓ 467283      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 187 MB  1.5 MB/s
     http_req_blocked...............: avg=4.03µs  min=932ns   med=2.94µs  max=3.59ms   p(90)=5.34µs   p(95)=6.34µs   p(99.9)=43.11µs
     http_req_connecting............: avg=580ns   min=0s      med=0s      max=3.55ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.24ms min=17.79ms med=37.92ms max=318.29ms p(90)=45.06ms  p(95)=47.27ms  p(99.9)=63.66ms
       { expected_response:true }...: avg=38.24ms min=17.79ms med=37.92ms max=318.29ms p(90)=45.06ms  p(95)=47.27ms  p(99.9)=63.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155861
     http_req_receiving.............: avg=90.54µs min=28µs    med=61.46µs max=28.77ms  p(90)=130.78µs p(95)=181.13µs p(99.9)=1.83ms 
     http_req_sending...............: avg=36.32µs min=4.66µs  med=11.38µs max=106.84ms p(90)=25.77µs  p(95)=72.99µs  p(99.9)=2.02ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.12ms min=17.64ms med=37.8ms  max=310.82ms p(90)=44.93ms  p(95)=47.13ms  p(99.9)=63.37ms
     http_reqs......................: 155861  1277.619592/s
     iteration_duration.............: avg=38.51ms min=21.69ms med=38.16ms max=329.27ms p(90)=45.29ms  p(95)=47.49ms  p(99.9)=64.55ms
     iterations.....................: 155761  1276.799875/s
     success_rate...................: 100.00% ✓ 155761      ✗ 0     
     vus............................: 37      min=0         max=50  
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

     checks.........................: 100.00% ✓ 445974      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=4.03µs  min=1.07µs  med=3.01µs  max=3.64ms   p(90)=4.72µs   p(95)=5.5µs    p(99.9)=40.43µs 
     http_req_connecting............: avg=683ns   min=0s      med=0s      max=3.62ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.11ms min=18.47ms med=39.51ms max=290.66ms p(90)=48.2ms   p(95)=51.02ms  p(99.9)=66.6ms  
       { expected_response:true }...: avg=40.11ms min=18.47ms med=39.51ms max=290.66ms p(90)=48.2ms   p(95)=51.02ms  p(99.9)=66.6ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 148758
     http_req_receiving.............: avg=81.78µs min=26.04µs med=65.75µs max=129.51ms p(90)=108.65µs p(95)=128.48µs p(99.9)=935.87µs
     http_req_sending...............: avg=27.91µs min=5.05µs  med=13.09µs max=83.13ms  p(90)=20.81µs  p(95)=25.13µs  p(99.9)=1.02ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40ms    min=18.32ms med=39.41ms max=290.24ms p(90)=48.08ms  p(95)=50.9ms   p(99.9)=66.07ms 
     http_reqs......................: 148758  1219.309493/s
     iteration_duration.............: avg=40.35ms min=22.48ms med=39.73ms max=317.22ms p(90)=48.41ms  p(95)=51.24ms  p(99.9)=67.19ms 
     iterations.....................: 148658  1218.489833/s
     success_rate...................: 100.00% ✓ 148658      ✗ 0     
     vus............................: 37      min=0         max=50  
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

     checks.........................: 100.00% ✓ 201123     ✗ 0    
     data_received..................: 5.9 GB  48 MB/s
     data_sent......................: 81 MB   660 kB/s
     http_req_blocked...............: avg=5.06µs  min=1.34µs  med=3.31µs  max=4.32ms   p(90)=4.85µs   p(95)=5.52µs   p(99.9)=50.92µs 
     http_req_connecting............: avg=1.47µs  min=0s      med=0s      max=4.28ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=89.16ms min=20.61ms med=88.01ms max=329.26ms p(90)=111.09ms p(95)=120.19ms p(99.9)=201.87ms
       { expected_response:true }...: avg=89.16ms min=20.61ms med=88.01ms max=329.26ms p(90)=111.09ms p(95)=120.19ms p(99.9)=201.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67141
     http_req_receiving.............: avg=86.22µs min=32.53µs med=78.17µs max=56.7ms   p(90)=112.8µs  p(95)=125.69µs p(99.9)=651.18µs
     http_req_sending...............: avg=25.91µs min=5.51µs  med=15.28µs max=107.78ms p(90)=21.78µs  p(95)=24.07µs  p(99.9)=616.51µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.04ms min=20.46ms med=87.89ms max=318.12ms p(90)=110.97ms p(95)=120.06ms p(99.9)=201.59ms
     http_reqs......................: 67141   549.238996/s
     iteration_duration.............: avg=89.51ms min=36.96ms med=88.29ms max=337.63ms p(90)=111.35ms p(95)=120.47ms p(99.9)=203.41ms
     iterations.....................: 67041   548.420958/s
     success_rate...................: 100.00% ✓ 67041      ✗ 0    
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

     checks.........................: 100.00% ✓ 159285     ✗ 0    
     data_received..................: 4.7 GB  38 MB/s
     data_sent......................: 64 MB   522 kB/s
     http_req_blocked...............: avg=5.04µs   min=1.1µs   med=3.17µs   max=3.49ms   p(90)=4.69µs   p(95)=5.25µs   p(99.9)=104.14µs
     http_req_connecting............: avg=1.64µs   min=0s      med=0s       max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.57ms min=20.37ms med=110.7ms  max=335.37ms p(90)=140.05ms p(95)=149.42ms p(99.9)=190.91ms
       { expected_response:true }...: avg=112.57ms min=20.37ms med=110.7ms  max=335.37ms p(90)=140.05ms p(95)=149.42ms p(99.9)=190.91ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53195
     http_req_receiving.............: avg=86.32µs  min=29.12µs med=82.36µs  max=42.19ms  p(90)=114.49µs p(95)=127.03µs p(99.9)=537.58µs
     http_req_sending...............: avg=24.24µs  min=5.25µs  med=16.36µs  max=133.44ms p(90)=22.14µs  p(95)=24.18µs  p(99.9)=592.99µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.46ms min=20.28ms med=110.6ms  max=326.61ms p(90)=139.94ms p(95)=149.29ms p(99.9)=190.15ms
     http_reqs......................: 53195   434.925104/s
     iteration_duration.............: avg=113.03ms min=30.9ms  med=111.01ms max=346.82ms p(90)=140.36ms p(95)=149.71ms p(99.9)=193.97ms
     iterations.....................: 53095   434.107499/s
     success_rate...................: 100.00% ✓ 53095      ✗ 0    
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

     checks.........................: 100.00% ✓ 97989      ✗ 0    
     data_received..................: 2.9 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=6.74µs   min=1.47µs  med=3.79µs   max=3.56ms   p(90)=5.36µs   p(95)=5.95µs   p(99.9)=1.28ms  
     http_req_connecting............: avg=2.66µs   min=0s      med=0s       max=3.52ms   p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=182.96ms min=22.55ms med=187.87ms max=410.83ms p(90)=196.2ms  p(95)=200.89ms p(99.9)=266.16ms
       { expected_response:true }...: avg=182.96ms min=22.55ms med=187.87ms max=410.83ms p(90)=196.2ms  p(95)=200.89ms p(99.9)=266.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32763
     http_req_receiving.............: avg=98.16µs  min=35.95µs med=91.34µs  max=81.75ms  p(90)=124.08µs p(95)=137.65µs p(99.9)=606.13µs
     http_req_sending...............: avg=32.06µs  min=7.04µs  med=19.13µs  max=109.86ms p(90)=24.31µs  p(95)=26.25µs  p(99.9)=557.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.83ms min=22.41ms med=187.75ms max=410.19ms p(90)=196.08ms p(95)=200.76ms p(99.9)=266.07ms
     http_reqs......................: 32763   267.097518/s
     iteration_duration.............: avg=183.79ms min=49.33ms med=188.17ms max=423.34ms p(90)=196.5ms  p(95)=201.21ms p(99.9)=271.08ms
     iterations.....................: 32663   266.282277/s
     success_rate...................: 100.00% ✓ 32663      ✗ 0    
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

     checks.........................: 100.00% ✓ 92490      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   304 kB/s
     http_req_blocked...............: avg=8.37µs   min=1.32µs  med=3.7µs    max=36.64ms  p(90)=5.17µs   p(95)=5.8µs    p(99.9)=1.57ms  
     http_req_connecting............: avg=3.19µs   min=0s      med=0s       max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=1.53ms  
     http_req_duration..............: avg=193.89ms min=18.12ms med=180.42ms max=657.96ms p(90)=234.69ms p(95)=268.03ms p(99.9)=599.18ms
       { expected_response:true }...: avg=193.89ms min=18.12ms med=180.42ms max=657.96ms p(90)=234.69ms p(95)=268.03ms p(99.9)=599.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30930
     http_req_receiving.............: avg=101.36µs min=38.01µs med=92.38µs  max=82.25ms  p(90)=123.64µs p(95)=136.42µs p(99.9)=567.97µs
     http_req_sending...............: avg=28.07µs  min=6.65µs  med=18.7µs   max=130.94ms p(90)=23.57µs  p(95)=25.5µs   p(99.9)=742.67µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.76ms min=18.04ms med=180.3ms  max=657.87ms p(90)=234.57ms p(95)=267.77ms p(99.9)=599.07ms
     http_reqs......................: 30930   253.156182/s
     iteration_duration.............: avg=194.75ms min=65.64ms med=180.84ms max=658.2ms  p(90)=235.1ms  p(95)=269.49ms p(99.9)=599.61ms
     iterations.....................: 30830   252.337701/s
     success_rate...................: 100.00% ✓ 30830      ✗ 0    
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

     checks.........................: 100.00% ✓ 6810      ✗ 0   
     data_received..................: 227 MB  1.8 MB/s
     data_sent......................: 2.8 MB  22 kB/s
     http_req_blocked...............: avg=38.9µs   min=1.18µs  med=3.19µs  max=6.53ms  p(90)=4.69µs   p(95)=5.59µs   p(99.9)=4.08ms 
     http_req_connecting............: avg=32.45µs  min=0s      med=0s      max=4.09ms  p(90)=0s       p(95)=0s       p(99.9)=3.74ms 
     http_req_duration..............: avg=2.55s    min=41ms    med=2.64s   max=4.73s   p(90)=3.27s    p(95)=3.42s    p(99.9)=4.17s  
       { expected_response:true }...: avg=2.55s    min=41ms    med=2.64s   max=4.73s   p(90)=3.27s    p(95)=3.42s    p(99.9)=4.17s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2370
     http_req_receiving.............: avg=121.47µs min=34.2µs  med=90.91µs max=58.52ms p(90)=132.88µs p(95)=151.88µs p(99.9)=1.21ms 
     http_req_sending...............: avg=94.6µs   min=5.76µs  med=17.91µs max=52.75ms p(90)=23.14µs  p(95)=29.2µs   p(99.9)=18.46ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.55s    min=40.83ms med=2.64s   max=4.73s   p(90)=3.27s    p(95)=3.42s    p(99.9)=4.17s  
     http_reqs......................: 2370    18.65051/s
     iteration_duration.............: avg=2.66s    min=1.01s   med=2.67s   max=4.73s   p(90)=3.29s    p(95)=3.43s    p(99.9)=4.17s  
     iterations.....................: 2270    17.863569/s
     success_rate...................: 100.00% ✓ 2270      ✗ 0   
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

