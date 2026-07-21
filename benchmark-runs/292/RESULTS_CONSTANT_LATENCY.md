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
| fusion-nightly | 16.5.1-p.2 | 1,863 | 1,907 | 1,849 | 1.0% |  |
| fusion | 16.5.0 | 1,860 | 1,906 | 1,856 | 0.9% |  |
| hive-router | v0.0.83 | 1,858 | 1,919 | 1,833 | 1.6% |  |
| fusion-nightly-net11 | 16.5.1-p.2 | 1,848 | 1,898 | 1,842 | 1.1% |  |
| fusion-nightly-fed | 16.5.1-p.2 | 1,765 | 1,795 | 1,737 | 0.9% |  |
| grafbase | 0.53.5 | 1,281 | 1,316 | 1,277 | 1.0% |  |
| cosmo | 0.331.1 | 1,171 | 1,224 | 1,163 | 1.9% |  |
| hive-gateway-router-runtime | 2.10.4 | 562 | 579 | 558 | 1.2% |  |
| apollo-router | v2.16.0 | 395 | 413 | 393 | 1.9% |  |
| hive-gateway | 2.10.4 | 260 | 268 | 259 | 1.2% |  |
| apollo-gateway | 2.14.2 | 258 | 263 | 258 | 0.7% |  |
| feddi | 5ff8b6165878 | 18 | 19 | 18 | 1.9% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 681390      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=3.42µs   min=851ns   med=2µs     max=135.44ms p(90)=3.65µs   p(95)=4.38µs  p(99.9)=29.65µs
     http_req_connecting............: avg=390ns    min=0s      med=0s      max=3.31ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.19ms  min=17.29ms med=25.59ms max=302.33ms p(90)=30.64ms  p(95)=32.47ms p(99.9)=50.13ms
       { expected_response:true }...: avg=26.19ms  min=17.29ms med=25.59ms max=302.33ms p(90)=30.64ms  p(95)=32.47ms p(99.9)=50.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227230
     http_req_receiving.............: avg=325.23µs min=49.19µs med=94.07µs max=261.78ms p(90)=781.39µs p(95)=1.28ms  p(99.9)=8.41ms 
     http_req_sending...............: avg=32.9µs   min=4.47µs  med=8.48µs  max=119.88ms p(90)=18.84µs  p(95)=29.14µs p(99.9)=1.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.83ms  min=17.02ms med=25.27ms max=281.58ms p(90)=30.24ms  p(95)=32.04ms p(99.9)=47.89ms
     http_reqs......................: 227230  1863.678266/s
     iteration_duration.............: avg=26.4ms   min=17.48ms med=25.79ms max=312.04ms p(90)=30.84ms  p(95)=32.68ms p(99.9)=50.54ms
     iterations.....................: 227130  1862.858094/s
     success_rate...................: 100.00% ✓ 227130      ✗ 0     
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

     checks.........................: 100.00% ✓ 680493      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=3.34µs   min=932ns   med=2.51µs   max=8.17ms   p(90)=4.21µs   p(95)=4.93µs  p(99.9)=35.65µs
     http_req_connecting............: avg=428ns    min=0s      med=0s       max=3.33ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.22ms  min=16.93ms med=25.63ms  max=316.69ms p(90)=30.65ms  p(95)=32.49ms p(99.9)=48.58ms
       { expected_response:true }...: avg=26.22ms  min=16.93ms med=25.63ms  max=316.69ms p(90)=30.65ms  p(95)=32.49ms p(99.9)=48.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226931
     http_req_receiving.............: avg=324.05µs min=51.4µs  med=100.57µs max=148.19ms p(90)=815.79µs p(95)=1.3ms   p(99.9)=8.46ms 
     http_req_sending...............: avg=34.82µs  min=4.77µs  med=9.74µs   max=146.55ms p(90)=19.57µs  p(95)=39.15µs p(99.9)=1.7ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.86ms  min=16.8ms  med=25.29ms  max=292ms    p(90)=30.22ms  p(95)=32.02ms p(99.9)=46.94ms
     http_reqs......................: 226931  1860.995993/s
     iteration_duration.............: avg=26.44ms  min=17.51ms med=25.84ms  max=340.6ms  p(90)=30.86ms  p(95)=32.7ms  p(99.9)=48.98ms
     iterations.....................: 226831  1860.175921/s
     success_rate...................: 100.00% ✓ 226831      ✗ 0     
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

     checks.........................: 100.00% ✓ 679608      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=2.84µs  min=852ns   med=2.01µs  max=5.33ms   p(90)=3.65µs  p(95)=4.36µs   p(99.9)=29.59µs
     http_req_connecting............: avg=418ns   min=0s      med=0s      max=3.98ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.27ms min=17.71ms med=25.83ms max=305.58ms p(90)=29.96ms p(95)=31.39ms  p(99.9)=48ms   
       { expected_response:true }...: avg=26.27ms min=17.71ms med=25.83ms max=305.58ms p(90)=29.96ms p(95)=31.39ms  p(99.9)=48ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 226636
     http_req_receiving.............: avg=72.63µs min=24.27µs med=47.04µs max=195.42ms p(90)=90.95µs p(95)=117.57µs p(99.9)=2.14ms 
     http_req_sending...............: avg=29.67µs min=4.38µs  med=8.79µs  max=170.7ms  p(90)=17.84µs p(95)=24.77µs  p(99.9)=1.38ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.17ms min=17.64ms med=25.74ms max=305.36ms p(90)=29.86ms p(95)=31.27ms  p(99.9)=46.33ms
     http_reqs......................: 226636  1858.466668/s
     iteration_duration.............: avg=26.47ms min=18.04ms med=26.03ms max=317.09ms p(90)=30.16ms p(95)=31.59ms  p(99.9)=48.39ms
     iterations.....................: 226536  1857.646645/s
     success_rate...................: 100.00% ✓ 226536      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 675651      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=3.14µs   min=891ns   med=2.28µs  max=5.6ms    p(90)=3.95µs   p(95)=4.67µs  p(99.9)=34.38µs
     http_req_connecting............: avg=438ns    min=0s      med=0s      max=4.22ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.41ms  min=17.7ms  med=25.86ms max=312.67ms p(90)=30.72ms  p(95)=32.51ms p(99.9)=49.68ms
       { expected_response:true }...: avg=26.41ms  min=17.7ms  med=25.86ms max=312.67ms p(90)=30.72ms  p(95)=32.51ms p(99.9)=49.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 225317
     http_req_receiving.............: avg=338.72µs min=50.07µs med=96.21µs max=276.71ms p(90)=898.48µs p(95)=1.43ms  p(99.9)=8.45ms 
     http_req_sending...............: avg=30.61µs  min=4.41µs  med=8.76µs  max=89.85ms  p(90)=18.09µs  p(95)=33.07µs p(99.9)=1.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.04ms  min=17.51ms med=25.52ms max=296.71ms p(90)=30.29ms  p(95)=32.03ms p(99.9)=48.17ms
     http_reqs......................: 225317  1848.178946/s
     iteration_duration.............: avg=26.63ms  min=17.89ms med=26.07ms max=331.13ms p(90)=30.92ms  p(95)=32.71ms p(99.9)=50.07ms
     iterations.....................: 225217  1847.358688/s
     success_rate...................: 100.00% ✓ 225217      ✗ 0     
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

     checks.........................: 100.00% ✓ 645909      ✗ 0     
     data_received..................: 19 GB   155 MB/s
     data_sent......................: 259 MB  2.1 MB/s
     http_req_blocked...............: avg=3.46µs   min=992ns   med=2.63µs   max=3.58ms   p(90)=4.37µs   p(95)=5.11µs  p(99.9)=33.94µs
     http_req_connecting............: avg=438ns    min=0s      med=0s       max=3.54ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.63ms  min=17.43ms med=27.02ms  max=299.78ms p(90)=32.39ms  p(95)=34.31ms p(99.9)=52.23ms
       { expected_response:true }...: avg=27.63ms  min=17.43ms med=27.02ms  max=299.78ms p(90)=32.39ms  p(95)=34.31ms p(99.9)=52.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 215403
     http_req_receiving.............: avg=324.26µs min=49.52µs med=102.21µs max=54.02ms  p(90)=816.75µs p(95)=1.33ms  p(99.9)=8.71ms 
     http_req_sending...............: avg=32.81µs  min=4.78µs  med=10.33µs  max=72.82ms  p(90)=20.67µs  p(95)=31.24µs p(99.9)=1.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.27ms  min=17.34ms med=26.67ms  max=299.44ms p(90)=31.98ms  p(95)=33.85ms p(99.9)=51.16ms
     http_reqs......................: 215403  1765.968123/s
     iteration_duration.............: avg=27.85ms  min=17.65ms med=27.24ms  max=326.55ms p(90)=32.6ms   p(95)=34.52ms p(99.9)=52.59ms
     iterations.....................: 215303  1765.148279/s
     success_rate...................: 100.00% ✓ 215303      ✗ 0     
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

     checks.........................: 100.00% ✓ 468795      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 188 MB  1.5 MB/s
     http_req_blocked...............: avg=4.19µs   min=992ns   med=2.99µs  max=5.76ms   p(90)=5.3µs    p(95)=6.28µs   p(99.9)=48.49µs
     http_req_connecting............: avg=656ns    min=0s      med=0s      max=4.29ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.11ms  min=18.04ms med=37.85ms max=322.71ms p(90)=44.85ms  p(95)=46.92ms  p(99.9)=63.8ms 
       { expected_response:true }...: avg=38.11ms  min=18.04ms med=37.85ms max=322.71ms p(90)=44.85ms  p(95)=46.92ms  p(99.9)=63.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 156365
     http_req_receiving.............: avg=116.78µs min=27.45µs med=61.6µs  max=248.14ms p(90)=130.74µs p(95)=182.04µs p(99.9)=3.01ms 
     http_req_sending...............: avg=35.81µs  min=4.97µs  med=11.44µs max=71.11ms  p(90)=25.35µs  p(95)=67.16µs  p(99.9)=1.92ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.96ms  min=17.94ms med=37.74ms max=291.05ms p(90)=44.71ms  p(95)=46.76ms  p(99.9)=61.72ms
     http_reqs......................: 156365  1281.785656/s
     iteration_duration.............: avg=38.38ms  min=20.61ms med=38.1ms  max=330.61ms p(90)=45.08ms  p(95)=47.14ms  p(99.9)=64.48ms
     iterations.....................: 156265  1280.965916/s
     success_rate...................: 100.00% ✓ 156265      ✗ 0     
     vus............................: 7       min=0         max=50  
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

     checks.........................: 100.00% ✓ 428511      ✗ 0     
     data_received..................: 13 GB   103 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.86µs   min=1.15µs  med=2.87µs  max=3.42ms   p(90)=4.52µs   p(95)=5.24µs   p(99.9)=38.68µs 
     http_req_connecting............: avg=659ns    min=0s      med=0s      max=3.38ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.75ms  min=18.14ms med=41.1ms  max=319.39ms p(90)=50.49ms  p(95)=53.48ms  p(99.9)=69.19ms 
       { expected_response:true }...: avg=41.75ms  min=18.14ms med=41.1ms  max=319.39ms p(90)=50.49ms  p(95)=53.48ms  p(99.9)=69.19ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142937
     http_req_receiving.............: avg=114.37µs min=27.68µs med=71.46µs max=190.63ms p(90)=114.09µs p(95)=133.94µs p(99.9)=1.11ms  
     http_req_sending...............: avg=24.13µs  min=5.02µs  med=12.32µs max=29.69ms  p(90)=19.19µs  p(95)=23.16µs  p(99.9)=983.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.61ms  min=17.99ms med=40.99ms max=128.5ms  p(90)=50.39ms  p(95)=53.37ms  p(99.9)=68.84ms 
     http_reqs......................: 142937  1171.696742/s
     iteration_duration.............: avg=42ms     min=21.15ms med=41.32ms max=342.51ms p(90)=50.71ms  p(95)=53.69ms  p(99.9)=69.61ms 
     iterations.....................: 142837  1170.877013/s
     success_rate...................: 100.00% ✓ 142837      ✗ 0     
     vus............................: 1       min=0         max=50  
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

     checks.........................: 100.00% ✓ 205854     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 83 MB   675 kB/s
     http_req_blocked...............: avg=4.57µs  min=992ns   med=2.97µs  max=3.34ms   p(90)=4.59µs   p(95)=5.24µs   p(99.9)=47.67µs 
     http_req_connecting............: avg=1.35µs  min=0s      med=0s      max=3.31ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.09ms min=20.57ms med=85.59ms max=323.26ms p(90)=103.56ms p(95)=112.48ms p(99.9)=197.23ms
       { expected_response:true }...: avg=87.09ms min=20.57ms med=85.59ms max=323.26ms p(90)=103.56ms p(95)=112.48ms p(99.9)=197.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68718
     http_req_receiving.............: avg=81.67µs min=27.86µs med=75.24µs max=7.2ms    p(90)=111.33µs p(95)=124.51µs p(99.9)=616.74µs
     http_req_sending...............: avg=25.35µs min=4.87µs  med=14.06µs max=172.44ms p(90)=20.84µs  p(95)=23.07µs  p(99.9)=622.38µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.98ms min=20.42ms med=85.49ms max=322.77ms p(90)=103.45ms p(95)=112.37ms p(99.9)=196.7ms 
     http_reqs......................: 68718   562.140013/s
     iteration_duration.............: avg=87.44ms min=35.04ms med=85.85ms max=341.45ms p(90)=103.81ms p(95)=112.77ms p(99.9)=199.32ms
     iterations.....................: 68618   561.321974/s
     success_rate...................: 100.00% ✓ 68618      ✗ 0    
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

     checks.........................: 100.00% ✓ 144933     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   475 kB/s
     http_req_blocked...............: avg=5.33µs   min=992ns   med=3.25µs   max=4.09ms   p(90)=4.68µs   p(95)=5.3µs    p(99.9)=219.39µs
     http_req_connecting............: avg=1.85µs   min=0s      med=0s       max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=193.76µs
     http_req_duration..............: avg=123.75ms min=21.28ms med=121.81ms max=353.66ms p(90)=154.76ms p(95)=165.56ms p(99.9)=214.28ms
       { expected_response:true }...: avg=123.75ms min=21.28ms med=121.81ms max=353.66ms p(90)=154.76ms p(95)=165.56ms p(99.9)=214.28ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48411
     http_req_receiving.............: avg=87.55µs  min=29.49µs med=82.01µs  max=69.84ms  p(90)=114.59µs p(95)=126.65µs p(99.9)=495.02µs
     http_req_sending...............: avg=29.22µs  min=5.42µs  med=16.67µs  max=114.2ms  p(90)=22.31µs  p(95)=24.38µs  p(99.9)=545.03µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.63ms min=21.14ms med=121.71ms max=352.19ms p(90)=154.64ms p(95)=165.41ms p(99.9)=213.6ms 
     http_reqs......................: 48411   395.742749/s
     iteration_duration.............: avg=124.23ms min=49.79ms med=122.12ms max=361.27ms p(90)=155.07ms p(95)=165.89ms p(99.9)=216.07ms
     iterations.....................: 48311   394.925284/s
     success_rate...................: 100.00% ✓ 48311      ✗ 0    
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

     checks.........................: 100.00% ✓ 95172      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=7.23µs   min=1.41µs  med=3.86µs   max=4.2ms    p(90)=5.41µs   p(95)=6.08µs   p(99.9)=1.45ms  
     http_req_connecting............: avg=3.05µs   min=0s      med=0s       max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=1.42ms  
     http_req_duration..............: avg=188.41ms min=17.9ms  med=177.27ms max=656.86ms p(90)=220.94ms p(95)=250.19ms p(99.9)=568.25ms
       { expected_response:true }...: avg=188.41ms min=17.9ms  med=177.27ms max=656.86ms p(90)=220.94ms p(95)=250.19ms p(99.9)=568.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31824
     http_req_receiving.............: avg=101.98µs min=33.08µs med=93.78µs  max=49.74ms  p(90)=125.98µs p(95)=138.96µs p(99.9)=803.72µs
     http_req_sending...............: avg=32.35µs  min=7.07µs  med=19.34µs  max=90.65ms  p(90)=24.38µs  p(95)=26.44µs  p(99.9)=563.08µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.27ms min=17.74ms med=177.15ms max=656.75ms p(90)=220.84ms p(95)=250.06ms p(99.9)=568.12ms
     http_reqs......................: 31824   260.432371/s
     iteration_duration.............: avg=189.24ms min=41.66ms med=177.69ms max=657.13ms p(90)=221.34ms p(95)=251.49ms p(99.9)=568.51ms
     iterations.....................: 31724   259.614019/s
     success_rate...................: 100.00% ✓ 31724      ✗ 0    
     vus............................: 39      min=0        max=50 
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

     checks.........................: 100.00% ✓ 94932      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   311 kB/s
     http_req_blocked...............: avg=6.7µs    min=1.48µs  med=3.58µs   max=3.61ms   p(90)=5µs      p(95)=5.58µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=2.81µs   min=0s      med=0s       max=3.57ms   p(90)=0s       p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=188.87ms min=23.69ms med=189.49ms max=409.74ms p(90)=200.49ms p(95)=204.72ms p(99.9)=279.43ms
       { expected_response:true }...: avg=188.87ms min=23.69ms med=189.49ms max=409.74ms p(90)=200.49ms p(95)=204.72ms p(99.9)=279.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31744
     http_req_receiving.............: avg=100.46µs min=37.93µs med=90.27µs  max=151.65ms p(90)=121.99µs p(95)=134.51µs p(99.9)=596.4µs 
     http_req_sending...............: avg=31.75µs  min=6.16µs  med=18.06µs  max=103.44ms p(90)=22.77µs  p(95)=24.72µs  p(99.9)=647.34µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.74ms min=23.48ms med=189.37ms max=404.07ms p(90)=200.37ms p(95)=204.61ms p(99.9)=279.01ms
     http_reqs......................: 31744   258.806561/s
     iteration_duration.............: avg=189.72ms min=57.31ms med=189.94ms max=415.82ms p(90)=200.79ms p(95)=205.02ms p(99.9)=283.15ms
     iterations.....................: 31644   257.991268/s
     success_rate...................: 100.00% ✓ 31644      ✗ 0    
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

     checks.........................: 100.00% ✓ 6903      ✗ 0   
     data_received..................: 230 MB  1.8 MB/s
     data_sent......................: 2.9 MB  23 kB/s
     http_req_blocked...............: avg=116.73µs min=1.56µs   med=3.62µs  max=7.99ms  p(90)=5.31µs  p(95)=6.26µs   p(99.9)=7.57ms  
     http_req_connecting............: avg=110.76µs min=0s       med=0s      max=7.94ms  p(90)=0s      p(95)=0s       p(99.9)=7.3ms   
     http_req_duration..............: avg=2.52s    min=36.34ms  med=2.61s   max=4.38s   p(90)=3.32s   p(95)=3.52s    p(99.9)=4.29s   
       { expected_response:true }...: avg=2.52s    min=36.34ms  med=2.61s   max=4.38s   p(90)=3.32s   p(95)=3.52s    p(99.9)=4.29s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2401
     http_req_receiving.............: avg=96.22µs  min=35.2µs   med=91.18µs max=1.25ms  p(90)=133.8µs p(95)=149.81µs p(99.9)=421.47µs
     http_req_sending...............: avg=71.78µs  min=6.86µs   med=18.57µs max=18.18ms p(90)=24.29µs p(95)=27.96µs  p(99.9)=6.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.52s    min=36.24ms  med=2.61s   max=4.38s   p(90)=3.32s   p(95)=3.52s    p(99.9)=4.29s   
     http_reqs......................: 2401    18.909341/s
     iteration_duration.............: avg=2.63s    min=637.46ms med=2.63s   max=4.38s   p(90)=3.34s   p(95)=3.52s    p(99.9)=4.29s   
     iterations.....................: 2301    18.12178/s
     success_rate...................: 100.00% ✓ 2301      ✗ 0   
     vus............................: 36      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

