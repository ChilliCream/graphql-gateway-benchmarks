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
| fusion-nightly-net11 | 16.5.1-p.2 | 1,872 | 1,905 | 1,855 | 0.9% |  |
| fusion-nightly | 16.5.1-p.2 | 1,864 | 1,919 | 1,855 | 1.2% |  |
| fusion | 16.5.0 | 1,863 | 1,909 | 1,855 | 1.0% |  |
| hive-router | v0.0.83 | 1,837 | 1,898 | 1,814 | 1.5% |  |
| fusion-nightly-fed | 16.5.1-p.2 | 1,746 | 1,795 | 1,741 | 1.2% |  |
| grafbase | 0.53.5 | 1,318 | 1,343 | 1,311 | 0.8% |  |
| cosmo | 0.331.1 | 1,172 | 1,221 | 1,167 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.4 | 586 | 594 | 580 | 1.2% |  |
| apollo-router | v2.16.0 | 404 | 424 | 395 | 2.5% |  |
| apollo-gateway | 2.14.2 | 267 | 270 | 266 | 0.5% |  |
| hive-gateway | 2.10.4 | 253 | 261 | 252 | 1.3% |  |
| feddi | 5ff8b6165878 | 21 | 22 | 19 | 4.6% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 684468      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.05µs   min=902ns   med=2.25µs  max=4.32ms   p(90)=3.98µs   p(95)=4.71µs  p(99.9)=31.64µs
     http_req_connecting............: avg=408ns    min=0s      med=0s      max=4.28ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.06ms  min=17.5ms  med=25.5ms  max=301.5ms  p(90)=30.28ms  p(95)=32.09ms p(99.9)=49.56ms
       { expected_response:true }...: avg=26.06ms  min=17.5ms  med=25.5ms  max=301.5ms  p(90)=30.28ms  p(95)=32.09ms p(99.9)=49.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228256
     http_req_receiving.............: avg=318.07µs min=49.65µs med=93.58µs max=61.58ms  p(90)=839.81µs p(95)=1.39ms  p(99.9)=7.85ms 
     http_req_sending...............: avg=32.32µs  min=4.71µs  med=9.09µs  max=161.47ms p(90)=19.36µs  p(95)=39.62µs p(99.9)=1.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.71ms  min=17.24ms med=25.17ms max=301.27ms p(90)=29.85ms  p(95)=31.58ms p(99.9)=48.44ms
     http_reqs......................: 228256  1872.195799/s
     iteration_duration.............: avg=26.28ms  min=17.67ms med=25.71ms max=310.31ms p(90)=30.48ms  p(95)=32.29ms p(99.9)=49.95ms
     iterations.....................: 228156  1871.375581/s
     success_rate...................: 100.00% ✓ 228156      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 681573      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=2.82µs   min=832ns   med=1.99µs  max=6.83ms   p(90)=3.58µs   p(95)=4.33µs  p(99.9)=30.46µs
     http_req_connecting............: avg=381ns    min=0s      med=0s      max=3.04ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.18ms  min=17.42ms med=25.61ms max=295.02ms p(90)=30.57ms  p(95)=32.38ms p(99.9)=49.79ms
       { expected_response:true }...: avg=26.18ms  min=17.42ms med=25.61ms max=295.02ms p(90)=30.57ms  p(95)=32.38ms p(99.9)=49.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227291
     http_req_receiving.............: avg=318.27µs min=50.37µs med=96.53µs max=108.82ms p(90)=793.51µs p(95)=1.26ms  p(99.9)=9.05ms 
     http_req_sending...............: avg=31.31µs  min=4.73µs  med=8.49µs  max=142.94ms p(90)=17.86µs  p(95)=29.02µs p(99.9)=1.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.83ms  min=17.32ms med=25.27ms max=286.89ms p(90)=30.17ms  p(95)=31.91ms p(99.9)=47.98ms
     http_reqs......................: 227291  1864.017737/s
     iteration_duration.............: avg=26.4ms   min=17.66ms med=25.81ms max=307.66ms p(90)=30.77ms  p(95)=32.57ms p(99.9)=50.25ms
     iterations.....................: 227191  1863.197635/s
     success_rate...................: 100.00% ✓ 227191      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 681204      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=3.48µs  min=1.06µs  med=2.67µs   max=5.87ms   p(90)=4.33µs   p(95)=5.07µs  p(99.9)=35.81µs
     http_req_connecting............: avg=409ns   min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.19ms min=17.43ms med=25.57ms  max=312.64ms p(90)=30.66ms  p(95)=32.58ms p(99.9)=50.6ms 
       { expected_response:true }...: avg=26.19ms min=17.43ms med=25.57ms  max=312.64ms p(90)=30.66ms  p(95)=32.58ms p(99.9)=50.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 227168
     http_req_receiving.............: avg=326.4µs min=51.46µs med=100.45µs max=181.69ms p(90)=808.26µs p(95)=1.32ms  p(99.9)=9.06ms 
     http_req_sending...............: avg=35.61µs min=4.96µs  med=10.04µs  max=188.5ms  p(90)=19.18µs  p(95)=47.64µs p(99.9)=1.74ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.83ms min=17.24ms med=25.23ms  max=312.51ms p(90)=30.24ms  p(95)=32.09ms p(99.9)=49.14ms
     http_reqs......................: 227168  1863.34976/s
     iteration_duration.............: avg=26.41ms min=17.71ms med=25.78ms  max=325.03ms p(90)=30.87ms  p(95)=32.79ms p(99.9)=51.17ms
     iterations.....................: 227068  1862.529509/s
     success_rate...................: 100.00% ✓ 227068      ✗ 0     
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

     checks.........................: 100.00% ✓ 672042      ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=2.81µs  min=831ns   med=2.01µs  max=4.49ms   p(90)=3.49µs  p(95)=4.16µs   p(99.9)=31.73µs
     http_req_connecting............: avg=412ns   min=0s      med=0s      max=3.87ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.57ms min=17.94ms med=26.17ms max=291.7ms  p(90)=30.29ms p(95)=31.68ms  p(99.9)=44.76ms
       { expected_response:true }...: avg=26.57ms min=17.94ms med=26.17ms max=291.7ms  p(90)=30.29ms p(95)=31.68ms  p(99.9)=44.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 224114
     http_req_receiving.............: avg=69.91µs min=24.87µs med=50.08µs max=101.69ms p(90)=89.84µs p(95)=111.99µs p(99.9)=1.49ms 
     http_req_sending...............: avg=28.52µs min=4.36µs  med=8.79µs  max=141.54ms p(90)=16.79µs p(95)=22.78µs  p(99.9)=1.24ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.47ms min=17.84ms med=26.08ms max=291.42ms p(90)=30.19ms p(95)=31.56ms  p(99.9)=43.31ms
     http_reqs......................: 224114  1837.996721/s
     iteration_duration.............: avg=26.77ms min=18.91ms med=26.36ms max=319.88ms p(90)=30.48ms p(95)=31.87ms  p(99.9)=45.09ms
     iterations.....................: 224014  1837.176604/s
     success_rate...................: 100.00% ✓ 224014      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 638790      ✗ 0     
     data_received..................: 19 GB   153 MB/s
     data_sent......................: 256 MB  2.1 MB/s
     http_req_blocked...............: avg=2.67µs   min=841ns   med=2.01µs  max=2.03ms   p(90)=3.91µs   p(95)=4.65µs  p(99.9)=34.38µs
     http_req_connecting............: avg=178ns    min=0s      med=0s      max=1.99ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.95ms  min=17.85ms med=27.39ms max=303.95ms p(90)=32.76ms  p(95)=34.63ms p(99.9)=50.55ms
       { expected_response:true }...: avg=27.95ms  min=17.85ms med=27.39ms max=303.95ms p(90)=32.76ms  p(95)=34.63ms p(99.9)=50.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 213030
     http_req_receiving.............: avg=335.51µs min=49.51µs med=96.18µs max=255.03ms p(90)=785.27µs p(95)=1.27ms  p(99.9)=8.63ms 
     http_req_sending...............: avg=30.2µs   min=4.49µs  med=8.69µs  max=197.87ms p(90)=18.74µs  p(95)=27.81µs p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.58ms  min=17.75ms med=27.07ms max=83.46ms  p(90)=32.35ms  p(95)=34.2ms  p(99.9)=48.74ms
     http_reqs......................: 213030  1746.330115/s
     iteration_duration.............: avg=28.17ms  min=18.02ms med=27.6ms  max=321.24ms p(90)=32.96ms  p(95)=34.83ms p(99.9)=50.95ms
     iterations.....................: 212930  1745.510357/s
     success_rate...................: 100.00% ✓ 212930      ✗ 0     
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

     checks.........................: 100.00% ✓ 482328      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 193 MB  1.6 MB/s
     http_req_blocked...............: avg=4.24µs  min=1µs     med=3µs     max=4.29ms   p(90)=5.4µs    p(95)=6.38µs   p(99.9)=47.44µs
     http_req_connecting............: avg=664ns   min=0s      med=0s      max=4.25ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.04ms min=18.46ms med=36.74ms max=310.86ms p(90)=43.62ms  p(95)=45.68ms  p(99.9)=62.05ms
       { expected_response:true }...: avg=37.04ms min=18.46ms med=36.74ms max=310.86ms p(90)=43.62ms  p(95)=45.68ms  p(99.9)=62.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160876
     http_req_receiving.............: avg=93.94µs min=27.89µs med=62.12µs max=152.52ms p(90)=133.23µs p(95)=183.37µs p(99.9)=2.19ms 
     http_req_sending...............: avg=36.66µs min=4.78µs  med=11.42µs max=82.45ms  p(90)=25.8µs   p(95)=81.96µs  p(99.9)=2.12ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=36.91ms min=18.36ms med=36.61ms max=310.06ms p(90)=43.48ms  p(95)=45.54ms  p(99.9)=61.27ms
     http_reqs......................: 160876  1318.79531/s
     iteration_duration.............: avg=37.3ms  min=20.76ms med=36.98ms max=336.52ms p(90)=43.85ms  p(95)=45.91ms  p(99.9)=62.51ms
     iterations.....................: 160776  1317.975551/s
     success_rate...................: 100.00% ✓ 160776      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 428640      ✗ 0     
     data_received..................: 13 GB   103 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.17µs  min=972ns   med=2.14µs  max=3.77ms   p(90)=3.65µs   p(95)=4.3µs    p(99.9)=33.17µs 
     http_req_connecting............: avg=690ns   min=0s      med=0s      max=3.73ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.76ms min=18.77ms med=41.1ms  max=314.88ms p(90)=50.48ms  p(95)=53.49ms  p(99.9)=68.08ms 
       { expected_response:true }...: avg=41.76ms min=18.77ms med=41.1ms  max=314.88ms p(90)=50.48ms  p(95)=53.49ms  p(99.9)=68.08ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142980
     http_req_receiving.............: avg=77.73µs min=26.27µs med=62.54µs max=246.7ms  p(90)=102.08µs p(95)=120.29µs p(99.9)=826.65µs
     http_req_sending...............: avg=21.36µs min=4.89µs  med=10.35µs max=84.04ms  p(90)=17.5µs   p(95)=21.29µs  p(99.9)=878.26µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.66ms min=18.68ms med=41.01ms max=314.72ms p(90)=50.38ms  p(95)=53.39ms  p(99.9)=67.8ms  
     http_reqs......................: 142980  1172.066294/s
     iteration_duration.............: avg=41.98ms min=22.64ms med=41.31ms max=326.58ms p(90)=50.68ms  p(95)=53.68ms  p(99.9)=68.45ms 
     iterations.....................: 142880  1171.246553/s
     success_rate...................: 100.00% ✓ 142880      ✗ 0     
     vus............................: 4       min=0         max=50  
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

     checks.........................: 100.00% ✓ 214545     ✗ 0    
     data_received..................: 6.3 GB  51 MB/s
     data_sent......................: 86 MB   704 kB/s
     http_req_blocked...............: avg=5.14µs  min=1.22µs  med=3.32µs  max=5.04ms   p(90)=4.93µs   p(95)=5.67µs   p(99.9)=44.42µs 
     http_req_connecting............: avg=1.49µs  min=0s      med=0s      max=4.28ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.55ms min=20.95ms med=81.43ms max=323.2ms  p(90)=102.72ms p(95)=111.85ms p(99.9)=192.8ms 
       { expected_response:true }...: avg=83.55ms min=20.95ms med=81.43ms max=323.2ms  p(90)=102.72ms p(95)=111.85ms p(99.9)=192.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 71615
     http_req_receiving.............: avg=93.17µs min=31.85µs med=77.52µs max=199.88ms p(90)=114.53µs p(95)=129.4µs  p(99.9)=713.31µs
     http_req_sending...............: avg=24.06µs min=5.61µs  med=15.78µs max=78.35ms  p(90)=22.27µs  p(95)=24.76µs  p(99.9)=693.52µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.44ms min=20.83ms med=81.33ms max=301.94ms p(90)=102.6ms  p(95)=111.7ms  p(99.9)=192.23ms
     http_reqs......................: 71615   586.046315/s
     iteration_duration.............: avg=83.9ms  min=41.61ms med=81.69ms max=343.43ms p(90)=102.97ms p(95)=112.14ms p(99.9)=194.97ms
     iterations.....................: 71515   585.227986/s
     success_rate...................: 100.00% ✓ 71515      ✗ 0    
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

     checks.........................: 100.00% ✓ 148185     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   486 kB/s
     http_req_blocked...............: avg=5.67µs   min=1.25µs  med=3.55µs   max=3.9ms    p(90)=5.07µs   p(95)=5.68µs   p(99.9)=365.88µs
     http_req_connecting............: avg=1.86µs   min=0s      med=0s       max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=317.73µs
     http_req_duration..............: avg=121.02ms min=20.6ms  med=119.1ms  max=338.76ms p(90)=151.7ms  p(95)=161.52ms p(99.9)=204.38ms
       { expected_response:true }...: avg=121.02ms min=20.6ms  med=119.1ms  max=338.76ms p(90)=151.7ms  p(95)=161.52ms p(99.9)=204.38ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49495
     http_req_receiving.............: avg=90.47µs  min=31.24µs med=83.91µs  max=150.02ms p(90)=115.64µs p(95)=128.35µs p(99.9)=512.29µs
     http_req_sending...............: avg=27.03µs  min=5.65µs  med=17.46µs  max=89.19ms  p(90)=23.11µs  p(95)=25.13µs  p(99.9)=547.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.9ms  min=20.51ms med=118.98ms max=338.64ms p(90)=151.59ms p(95)=161.39ms p(99.9)=204.01ms
     http_reqs......................: 49495   404.612474/s
     iteration_duration.............: avg=121.5ms  min=41.29ms med=119.4ms  max=349.22ms p(90)=152.01ms p(95)=161.86ms p(99.9)=205.31ms
     iterations.....................: 49395   403.794992/s
     success_rate...................: 100.00% ✓ 49395      ✗ 0    
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

     checks.........................: 100.00% ✓ 98154      ✗ 0    
     data_received..................: 2.9 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=6.63µs   min=1.11µs  med=3.32µs   max=4.14ms   p(90)=4.81µs   p(95)=5.44µs   p(99.9)=1.45ms  
     http_req_connecting............: avg=3.05µs   min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=1.42ms  
     http_req_duration..............: avg=182.68ms min=23.51ms med=184.03ms max=401.44ms p(90)=194.35ms p(95)=198.24ms p(99.9)=265.94ms
       { expected_response:true }...: avg=182.68ms min=23.51ms med=184.03ms max=401.44ms p(90)=194.35ms p(95)=198.24ms p(99.9)=265.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32818
     http_req_receiving.............: avg=97.26µs  min=34.73µs med=92.24µs  max=50.57ms  p(90)=123.06µs p(95)=136.19µs p(99.9)=607.46µs
     http_req_sending...............: avg=34.75µs  min=5.44µs  med=18.15µs  max=124.95ms p(90)=23.22µs  p(95)=25.1µs   p(99.9)=542.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.55ms min=23.33ms med=183.91ms max=401.22ms p(90)=194.23ms p(95)=198.13ms p(99.9)=265.84ms
     http_reqs......................: 32818   267.600199/s
     iteration_duration.............: avg=183.48ms min=51.11ms med=184.45ms max=409.63ms p(90)=194.64ms p(95)=198.57ms p(99.9)=274.01ms
     iterations.....................: 32718   266.784792/s
     success_rate...................: 100.00% ✓ 32718      ✗ 0    
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

     checks.........................: 100.00% ✓ 92538      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   304 kB/s
     http_req_blocked...............: avg=5.82µs   min=1.45µs  med=3.68µs   max=3.45ms   p(90)=5.14µs   p(95)=5.74µs   p(99.9)=642.45µs
     http_req_connecting............: avg=1.87µs   min=0s      med=0s       max=3.42ms   p(90)=0s       p(95)=0s       p(99.9)=620.94µs
     http_req_duration..............: avg=193.76ms min=18.55ms med=181.47ms max=637.17ms p(90)=230.17ms p(95)=264.93ms p(99.9)=568.43ms
       { expected_response:true }...: avg=193.76ms min=18.55ms med=181.47ms max=637.17ms p(90)=230.17ms p(95)=264.93ms p(99.9)=568.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30946
     http_req_receiving.............: avg=96.72µs  min=37.29µs med=91.72µs  max=12.01ms  p(90)=123.51µs p(95)=136.48µs p(99.9)=700.18µs
     http_req_sending...............: avg=27.89µs  min=6.07µs  med=18.97µs  max=52.39ms  p(90)=23.97µs  p(95)=25.86µs  p(99.9)=588.53µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.63ms min=18.43ms med=181.34ms max=637.05ms p(90)=230.06ms p(95)=264.82ms p(99.9)=568.31ms
     http_reqs......................: 30946   253.396254/s
     iteration_duration.............: avg=194.61ms min=54.85ms med=181.87ms max=637.46ms p(90)=230.58ms p(95)=265.63ms p(99.9)=568.72ms
     iterations.....................: 30846   252.57742/s
     success_rate...................: 100.00% ✓ 30846      ✗ 0    
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

     checks.........................: 100.00% ✓ 7899      ✗ 0   
     data_received..................: 262 MB  2.1 MB/s
     data_sent......................: 3.3 MB  26 kB/s
     http_req_blocked...............: avg=40µs     min=1.16µs   med=3.42µs  max=3.97ms  p(90)=5.11µs   p(95)=6.12µs   p(99.9)=3.81ms  
     http_req_connecting............: avg=35.54µs  min=0s       med=0s      max=3.93ms  p(90)=0s       p(95)=0s       p(99.9)=3.77ms  
     http_req_duration..............: avg=2.22s    min=36.35ms  med=2.23s   max=4.71s   p(90)=2.92s    p(95)=3.12s    p(99.9)=4.34s   
       { expected_response:true }...: avg=2.22s    min=36.35ms  med=2.23s   max=4.71s   p(90)=2.92s    p(95)=3.12s    p(99.9)=4.34s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2733
     http_req_receiving.............: avg=104.96µs min=29.99µs  med=99µs    max=1.59ms  p(90)=138.01µs p(95)=156.76µs p(99.9)=557.13µs
     http_req_sending...............: avg=124.51µs min=5.81µs   med=19.28µs max=56.66ms p(90)=24.72µs  p(95)=29.43µs  p(99.9)=12.77ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.22s    min=36.24ms  med=2.23s   max=4.65s   p(90)=2.92s    p(95)=3.12s    p(99.9)=4.34s   
     http_reqs......................: 2733    21.565604/s
     iteration_duration.............: avg=2.3s     min=970.55ms med=2.26s   max=4.71s   p(90)=2.93s    p(95)=3.13s    p(99.9)=4.34s   
     iterations.....................: 2633    20.776522/s
     success_rate...................: 100.00% ✓ 2633      ✗ 0   
     vus............................: 39      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

