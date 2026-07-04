## Overview for: `burst-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario is a burst stress test with peaks up to **500 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.74 | 2,745 | 2,850 | 2,702 | 1.7% |  |
| fusion-nightly | 16.4.0-p.14 | 2,042 | 2,091 | 2,029 | 1.1% |  |
| fusion | 16.3.0 | 1,987 | 2,051 | 1,973 | 1.3% |  |
| grafbase | 0.53.5 | 1,798 | 1,864 | 1,755 | 1.7% |  |
| cosmo | 0.326.1 | 1,069 | 1,100 | 1,066 | 1.1% |  |
| hive-gateway-router-runtime | 2.10.0 | 509 | 513 | 503 | 0.6% |  |
| apollo-router | v2.15.1 | 368 | 368 | 362 | 1.2% | non-compatible response (146 across 7/9 runs) |
| hive-gateway | 2.10.0 | 224 | 228 | 222 | 0.9% |  |
| apollo-gateway | 2.14.2 | 216 | 218 | 215 | 0.5% |  |
| feddi | 77271dc84a06 | 15 | 15 | 15 | 0.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.74 | 2,245 | 2,381 | 2,230 | 2.3% |  |
| fusion-nightly | 16.4.0-p.14 | 2,031 | 2,078 | 2,018 | 0.9% |  |
| fusion | 16.3.0 | 1,908 | 2,020 | 1,894 | 2.1% |  |
| grafbase | 0.53.5 | 1,397 | 1,446 | 1,391 | 1.3% |  |
| cosmo | 0.326.1 | 1,052 | 1,078 | 1,045 | 1.1% |  |
| hive-gateway-router-runtime | 2.10.0 | 480 | 489 | 474 | 1.0% |  |
| apollo-router | v2.15.1 | 352 | 359 | 344 | 1.2% |  |
| hive-gateway | 2.10.0 | 214 | 218 | 211 | 1.0% |  |
| apollo-gateway | 2.14.2 | 200 | 203 | 200 | 0.5% |  |
| feddi | 77271dc84a06 | 2 | 2 | 2 | 0.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 506628      ✗ 0     
     data_received..................: 15 GB   241 MB/s
     data_sent......................: 204 MB  3.3 MB/s
     http_req_blocked...............: avg=29.29µs  min=1.01µs med=2.33µs  max=66.69ms  p(90)=3.85µs   p(95)=5.11µs   p(99.9)=7.84ms  
     http_req_connecting............: avg=25.85µs  min=0s     med=0s      max=66.63ms  p(90)=0s       p(95)=0s       p(99.9)=7.35ms  
     http_req_duration..............: avg=83.58ms  min=1.66ms med=76.71ms max=319.99ms p(90)=162.35ms p(95)=179.82ms p(99.9)=247.7ms 
       { expected_response:true }...: avg=83.58ms  min=1.66ms med=76.71ms max=319.99ms p(90)=162.35ms p(95)=179.82ms p(99.9)=247.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 169876
     http_req_receiving.............: avg=223.99µs min=28.1µs med=53.14µs max=83.4ms   p(90)=160.73µs p(95)=357.85µs p(99.9)=34.62ms 
     http_req_sending...............: avg=85.67µs  min=5.22µs med=9.67µs  max=161.62ms p(90)=19.5µs   p(95)=121.13µs p(99.9)=13.01ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.27ms  min=1.61ms med=76.48ms max=297.43ms p(90)=161.95ms p(95)=179.02ms p(99.9)=242.36ms
     http_reqs......................: 169876  2745.223772/s
     iteration_duration.............: avg=84.41ms  min=2.46ms med=77.58ms max=368.09ms p(90)=162.91ms p(95)=180.72ms p(99.9)=252.51ms
     iterations.....................: 168876  2729.063609/s
     success_rate...................: 100.00% ✓ 168876      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 380127      ✗ 0     
     data_received..................: 11 GB   179 MB/s
     data_sent......................: 153 MB  2.5 MB/s
     http_req_blocked...............: avg=12.44µs  min=1.01µs  med=2.27µs   max=44.52ms  p(90)=3.72µs   p(95)=4.76µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=9.49µs   min=0s      med=0s       max=44.35ms  p(90)=0s       p(95)=0s       p(99.9)=1.33ms  
     http_req_duration..............: avg=111.4ms  min=2.25ms  med=106.5ms  max=534.3ms  p(90)=211.31ms p(95)=230.28ms p(99.9)=325.8ms 
       { expected_response:true }...: avg=111.4ms  min=2.25ms  med=106.5ms  max=534.3ms  p(90)=211.31ms p(95)=230.28ms p(99.9)=325.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 127709
     http_req_receiving.............: avg=982.58µs min=55.42µs med=125.54µs max=146.36ms p(90)=1.74ms   p(95)=3.26ms   p(99.9)=38.12ms 
     http_req_sending...............: avg=58.32µs  min=5.22µs  med=9.53µs   max=237.64ms p(90)=18.59µs  p(95)=107.29µs p(99.9)=7.44ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.36ms min=2.16ms  med=105.42ms max=532.54ms p(90)=210.09ms p(95)=228.84ms p(99.9)=321.82ms
     http_reqs......................: 127709  2042.205862/s
     iteration_duration.............: avg=112.55ms min=4.47ms  med=107.78ms max=534.47ms p(90)=211.83ms p(95)=230.83ms p(99.9)=333.22ms
     iterations.....................: 126709  2026.214774/s
     success_rate...................: 100.00% ✓ 126709      ✗ 0     
     vus............................: 82      min=0         max=492 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 370686      ✗ 0     
     data_received..................: 11 GB   174 MB/s
     data_sent......................: 150 MB  2.4 MB/s
     http_req_blocked...............: avg=16.13µs  min=1.15µs  med=2.75µs   max=121.45ms p(90)=4.33µs   p(95)=5.44µs   p(99.9)=1.86ms  
     http_req_connecting............: avg=12.64µs  min=0s      med=0s       max=121.37ms p(90)=0s       p(95)=0s       p(99.9)=1.81ms  
     http_req_duration..............: avg=114.28ms min=2.37ms  med=98.76ms  max=2.3s     p(90)=218.44ms p(95)=255.29ms p(99.9)=1.02s   
       { expected_response:true }...: avg=114.28ms min=2.37ms  med=98.76ms  max=2.3s     p(90)=218.44ms p(95)=255.29ms p(99.9)=1.02s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 124562
     http_req_receiving.............: avg=2.98ms   min=56.38µs med=125.09µs max=1.06s    p(90)=3.49ms   p(95)=9.67ms   p(99.9)=428.57ms
     http_req_sending...............: avg=65.45µs  min=5.41µs  med=10.58µs  max=105.18ms p(90)=19.76µs  p(95)=111.73µs p(99.9)=8.5ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.23ms min=2.26ms  med=96.82ms  max=2.24s    p(90)=214.35ms p(95)=247.2ms  p(99.9)=891.55ms
     http_reqs......................: 124562  1987.407176/s
     iteration_duration.............: avg=115.51ms min=4.53ms  med=100.33ms max=2.3s     p(90)=219.27ms p(95)=256.24ms p(99.9)=1.02s   
     iterations.....................: 123562  1971.452012/s
     success_rate...................: 100.00% ✓ 123562      ✗ 0     
     vus............................: 92      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 333102      ✗ 0     
     data_received..................: 9.8 GB  158 MB/s
     data_sent......................: 135 MB  2.2 MB/s
     http_req_blocked...............: avg=9.87µs   min=1.06µs med=2.66µs   max=31.76ms  p(90)=4.49µs   p(95)=6.02µs   p(99.9)=834.91µs
     http_req_connecting............: avg=6.28µs   min=0s     med=0s       max=29.71ms  p(90)=0s       p(95)=0s       p(99.9)=761.7µs 
     http_req_duration..............: avg=127.07ms min=1.85ms med=117.81ms max=462.68ms p(90)=249.8ms  p(95)=276.84ms p(99.9)=374.11ms
       { expected_response:true }...: avg=127.07ms min=1.85ms med=117.81ms max=462.68ms p(90)=249.8ms  p(95)=276.84ms p(99.9)=374.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 112034
     http_req_receiving.............: avg=100.75µs min=30.1µs med=62.17µs  max=275.93ms p(90)=109.78µs p(95)=235.41µs p(99.9)=4.73ms  
     http_req_sending...............: avg=58.37µs  min=5.62µs med=11.8µs   max=262.02ms p(90)=20.69µs  p(95)=99.71µs  p(99.9)=7.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=126.91ms min=1.8ms  med=117.64ms max=462.58ms p(90)=249.62ms p(95)=276.66ms p(99.9)=373.99ms
     http_reqs......................: 112034  1798.572876/s
     iteration_duration.............: avg=128.5ms  min=8.65ms med=119.59ms max=462.83ms p(90)=250.57ms p(95)=277.57ms p(99.9)=376.33ms
     iterations.....................: 111034  1782.519063/s
     success_rate...................: 100.00% ✓ 111034      ✗ 0     
     vus............................: 71      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 197484      ✗ 0    
     data_received..................: 5.9 GB  94 MB/s
     data_sent......................: 80 MB   1.3 MB/s
     http_req_blocked...............: avg=6.99µs   min=1.13µs  med=2.71µs   max=24.5ms   p(90)=4.33µs   p(95)=5.2µs    p(99.9)=558.71µs
     http_req_connecting............: avg=3.57µs   min=0s      med=0s       max=24.42ms  p(90)=0s       p(95)=0s       p(99.9)=484.06µs
     http_req_duration..............: avg=213.65ms min=2.05ms  med=214.58ms max=608.53ms p(90)=395.02ms p(95)=422.93ms p(99.9)=521.98ms
       { expected_response:true }...: avg=213.65ms min=2.05ms  med=214.58ms max=608.53ms p(90)=395.02ms p(95)=422.93ms p(99.9)=521.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 66828
     http_req_receiving.............: avg=81.35µs  min=29.54µs med=63.75µs  max=103.36ms p(90)=99.6µs   p(95)=114.72µs p(99.9)=1.44ms  
     http_req_sending...............: avg=31.69µs  min=5.78µs  med=11.66µs  max=69.46ms  p(90)=17.47µs  p(95)=21.78µs  p(99.9)=3.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=213.54ms min=1.99ms  med=214.46ms max=608.44ms p(90)=394.92ms p(95)=422.82ms p(99.9)=521.85ms
     http_reqs......................: 66828   1069.082303/s
     iteration_duration.............: avg=217.15ms min=4.32ms  med=218.65ms max=608.73ms p(90)=396.18ms p(95)=423.8ms  p(99.9)=522.36ms
     iterations.....................: 65828   1053.084783/s
     success_rate...................: 100.00% ✓ 65828       ✗ 0    
     vus............................: 81      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95868      ✗ 0    
     data_received..................: 2.9 GB  45 MB/s
     data_sent......................: 40 MB   611 kB/s
     http_req_blocked...............: avg=7.94µs   min=1.24µs  med=3.13µs   max=4.08ms p(90)=5.03µs   p(95)=6.16µs   p(99.9)=928.54µs
     http_req_connecting............: avg=3.53µs   min=0s      med=0s       max=4.02ms p(90)=0s       p(95)=0s       p(99.9)=782.04µs
     http_req_duration..............: avg=435.44ms min=4.04ms  med=407.48ms max=1.62s  p(90)=856.35ms p(95)=924.3ms  p(99.9)=1.35s   
       { expected_response:true }...: avg=435.44ms min=4.04ms  med=407.48ms max=1.62s  p(90)=856.35ms p(95)=924.3ms  p(99.9)=1.35s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32956
     http_req_receiving.............: avg=85.83µs  min=32.65µs med=75.07µs  max=5.96ms p(90)=114.89µs p(95)=131.09µs p(99.9)=1.01ms  
     http_req_sending...............: avg=27.78µs  min=6.08µs  med=15.32µs  max=51.2ms p(90)=22.25µs  p(95)=26.42µs  p(99.9)=2.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=435.33ms min=3.92ms  med=407.39ms max=1.62s  p(90)=856.19ms p(95)=924.23ms p(99.9)=1.35s   
     http_reqs......................: 32956   509.148508/s
     iteration_duration.............: avg=449.34ms min=31.7ms  med=423.3ms  max=1.64s  p(90)=859.86ms p(95)=927.23ms p(99.9)=1.36s   
     iterations.....................: 31956   493.699166/s
     success_rate...................: 100.00% ✓ 31956      ✗ 0    
     vus............................: 92      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 70020      ✗ 0    
     data_received..................: 2.1 GB  32 MB/s
     data_sent......................: 29 MB   443 kB/s
     http_req_blocked...............: avg=12.19µs  min=1.21µs  med=3.52µs   max=7.15ms   p(90)=5.31µs   p(95)=6.44µs   p(99.9)=2.25ms
     http_req_connecting............: avg=7.37µs   min=0s      med=0s       max=7.08ms   p(90)=0s       p(95)=0s       p(99.9)=2.2ms 
     http_req_duration..............: avg=591.41ms min=5.32ms  med=460.5ms  max=29.54s   p(90)=682.99ms p(95)=748.5ms  p(99.9)=28.05s
       { expected_response:true }...: avg=591.41ms min=5.32ms  med=460.5ms  max=29.54s   p(90)=682.99ms p(95)=748.5ms  p(99.9)=28.05s
     http_req_failed................: 0.00%   ✓ 0          ✗ 24340
     http_req_receiving.............: avg=103.33µs min=33.49µs med=81.12µs  max=248.9ms  p(90)=117.68µs p(95)=132.44µs p(99.9)=1.15ms
     http_req_sending...............: avg=38.87µs  min=5.63µs  med=16.53µs  max=161.19ms p(90)=22.75µs  p(95)=27.11µs  p(99.9)=2.63ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=591.27ms min=5.22ms  med=460.39ms max=29.54s   p(90)=682.81ms p(95)=748.36ms p(99.9)=28.05s
     http_reqs......................: 24340   368.629315/s
     iteration_duration.............: avg=617.03ms min=24.9ms  med=475.2ms  max=29.54s   p(90)=687.13ms p(95)=754.14ms p(99.9)=28.07s
     iterations.....................: 23340   353.484314/s
     success_rate...................: 100.00% ✓ 23340      ✗ 0    
     vus............................: 59      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42930      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   270 kB/s
     http_req_blocked...............: avg=16.27µs  min=1.47µs  med=3.64µs   max=4.1ms   p(90)=5.52µs   p(95)=7.44µs   p(99.9)=2.88ms  
     http_req_connecting............: avg=10.52µs  min=0s      med=0s       max=4.07ms  p(90)=0s       p(95)=0s       p(99.9)=2.85ms  
     http_req_duration..............: avg=952.47ms min=6.36ms  med=855.32ms max=5.49s   p(90)=1.88s    p(95)=2.17s    p(99.9)=5.01s   
       { expected_response:true }...: avg=952.47ms min=6.36ms  med=855.32ms max=5.49s   p(90)=1.88s    p(95)=2.17s    p(99.9)=5.01s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15310
     http_req_receiving.............: avg=95.93µs  min=39.94µs med=89.76µs  max=4.26ms  p(90)=126.31µs p(95)=141.64µs p(99.9)=507.51µs
     http_req_sending...............: avg=31.44µs  min=6.73µs  med=17.58µs  max=18.44ms p(90)=23.95µs  p(95)=29.55µs  p(99.9)=2.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=952.34ms min=6.27ms  med=855.2ms  max=5.49s   p(90)=1.88s    p(95)=2.17s    p(99.9)=5.01s   
     http_reqs......................: 15310   224.617956/s
     iteration_duration.............: avg=1.01s    min=69.55ms med=932.42ms max=5.5s    p(90)=1.9s     p(95)=2.19s    p(99.9)=5.02s   
     iterations.....................: 14310   209.946633/s
     success_rate...................: 100.00% ✓ 14310      ✗ 0    
     vus............................: 64      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42135      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   260 kB/s
     http_req_blocked...............: avg=11.63µs  min=1.3µs   med=3.1µs    max=3.23ms  p(90)=4.95µs   p(95)=7.03µs   p(99.9)=1.09ms
     http_req_connecting............: avg=6.5µs    min=0s      med=0s       max=2.31ms  p(90)=0s       p(95)=0s       p(99.9)=1.04ms
     http_req_duration..............: avg=968.34ms min=8.54ms  med=865.9ms  max=3.9s    p(90)=1.97s    p(95)=2.1s     p(99.9)=3.38s 
       { expected_response:true }...: avg=968.34ms min=8.54ms  med=865.9ms  max=3.9s    p(90)=1.97s    p(95)=2.1s     p(99.9)=3.38s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15045
     http_req_receiving.............: avg=98.47µs  min=33.51µs med=88.59µs  max=44.66ms p(90)=124.21µs p(95)=138.34µs p(99.9)=1.17ms
     http_req_sending...............: avg=29.36µs  min=6.18µs  med=17.08µs  max=40.79ms p(90)=22.89µs  p(95)=28.95µs  p(99.9)=2.59ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=968.21ms min=8.46ms  med=865.81ms max=3.9s    p(90)=1.97s    p(95)=2.1s     p(99.9)=3.38s 
     http_reqs......................: 15045   216.694586/s
     iteration_duration.............: avg=1.03s    min=42.19ms med=960.91ms max=3.91s   p(90)=2s       p(95)=2.11s    p(99.9)=3.39s 
     iterations.....................: 14045   202.29149/s
     success_rate...................: 100.00% ✓ 14045      ✗ 0    
     vus............................: 79      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (rust subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
data_received..................: 88 MB  1.5 MB/s
     data_sent......................: 1.1 MB 19 kB/s
     http_req_blocked...............: avg=4.22µs  min=2.51µs  med=3.6µs    max=212.99µs p(90)=4.88µs  p(95)=5.64µs   p(99.9)=71.15µs 
     http_req_connecting............: avg=114ns   min=0s      med=0s       max=105.51µs p(90)=0s      p(95)=0s       p(99.9)=8.12µs  
     http_req_duration..............: avg=64.81ms min=26.5ms  med=41.6ms   max=22.11s   p(90)=49.55ms p(95)=51.17ms  p(99.9)=1.76s   
       { expected_response:true }...: avg=64.81ms min=26.5ms  med=41.6ms   max=22.11s   p(90)=49.55ms p(95)=51.17ms  p(99.9)=1.76s   
     http_req_failed................: 0.00%  ✓ 0         ✗ 924  
     http_req_receiving.............: avg=116.4µs min=71.66µs med=111.28µs max=429.08µs p(90)=154.6µs p(95)=175.05µs p(99.9)=361.47µs
     http_req_sending...............: avg=19.65µs min=12.55µs med=18.54µs  max=321.08µs p(90)=21.27µs p(95)=22.95µs  p(99.9)=213.34µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=64.67ms min=26.35ms med=41.48ms  max=22.11s   p(90)=49.45ms p(95)=51.05ms  p(99.9)=1.76s   
     http_reqs......................: 924    15.399935/s
     vus............................: 0      min=0       max=0  
     vus_max........................: 500    min=500     max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 417126      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=34.93µs  min=1.23µs  med=3.39µs  max=84.5ms   p(90)=5.59µs   p(95)=7.1µs    p(99.9)=11.26ms 
     http_req_connecting............: avg=30.41µs  min=0s      med=0s      max=78.42ms  p(90)=0s       p(95)=0s       p(99.9)=11.16ms 
     http_req_duration..............: avg=101.49ms min=1.8ms   med=95.52ms max=378.19ms p(90)=196.36ms p(95)=217.27ms p(99.9)=291.87ms
       { expected_response:true }...: avg=101.49ms min=1.8ms   med=95.52ms max=378.19ms p(90)=196.36ms p(95)=217.27ms p(99.9)=291.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140042
     http_req_receiving.............: avg=205.44µs min=29.45µs med=63.62µs max=81.25ms  p(90)=189.36µs p(95)=431.44µs p(99.9)=27.39ms 
     http_req_sending...............: avg=104.64µs min=5.77µs  med=13.28µs max=148.43ms p(90)=26.68µs  p(95)=154.59µs p(99.9)=15.48ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.18ms min=1.74ms  med=95.22ms max=366.13ms p(90)=195.95ms p(95)=216.78ms p(99.9)=287.89ms
     http_reqs......................: 140042  2245.260867/s
     iteration_duration.............: avg=102.57ms min=5.32ms  med=96.64ms max=400.15ms p(90)=197.07ms p(95)=217.98ms p(99.9)=293.48ms
     iterations.....................: 139042  2229.228099/s
     success_rate...................: 100.00% ✓ 139042      ✗ 0     
     vus............................: 75      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 375759      ✗ 0     
     data_received..................: 11 GB   178 MB/s
     data_sent......................: 152 MB  2.4 MB/s
     http_req_blocked...............: avg=17.68µs  min=1.18µs  med=3.04µs   max=52.67ms  p(90)=4.79µs   p(95)=6.13µs   p(99.9)=1.69ms  
     http_req_connecting............: avg=13.87µs  min=0s      med=0s       max=52.48ms  p(90)=0s       p(95)=0s       p(99.9)=1.65ms  
     http_req_duration..............: avg=112.7ms  min=1.74ms  med=107.39ms max=462.39ms p(90)=216.82ms p(95)=235.51ms p(99.9)=312.48ms
       { expected_response:true }...: avg=112.7ms  min=1.74ms  med=107.39ms max=462.39ms p(90)=216.82ms p(95)=235.51ms p(99.9)=312.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 126253
     http_req_receiving.............: avg=1.04ms   min=56.99µs med=129.41µs max=172.12ms p(90)=1.82ms   p(95)=3.41ms   p(99.9)=40.32ms 
     http_req_sending...............: avg=76.3µs   min=5.58µs  med=11.66µs  max=185.53ms p(90)=22.71µs  p(95)=129.59µs p(99.9)=10.15ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.58ms min=1.66ms  med=106.36ms max=452.41ms p(90)=215.43ms p(95)=234.01ms p(99.9)=310.2ms 
     http_reqs......................: 126253  2031.885138/s
     iteration_duration.............: avg=113.88ms min=3.72ms  med=108.9ms  max=462.58ms p(90)=217.38ms p(95)=236.02ms p(99.9)=313.66ms
     iterations.....................: 125253  2015.791381/s
     success_rate...................: 100.00% ✓ 125253      ✗ 0     
     vus............................: 64      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 353673      ✗ 0     
     data_received..................: 10 GB   167 MB/s
     data_sent......................: 143 MB  2.3 MB/s
     http_req_blocked...............: avg=23.06µs  min=1.02µs  med=2.51µs   max=75.02ms  p(90)=4.06µs   p(95)=5.22µs   p(99.9)=2.62ms  
     http_req_connecting............: avg=19.3µs   min=0s      med=0s       max=74.84ms  p(90)=0s       p(95)=0s       p(99.9)=2.06ms  
     http_req_duration..............: avg=119.75ms min=1.86ms  med=104ms    max=1.92s    p(90)=218.87ms p(95)=255.84ms p(99.9)=1.21s   
       { expected_response:true }...: avg=119.75ms min=1.86ms  med=104ms    max=1.92s    p(90)=218.87ms p(95)=255.84ms p(99.9)=1.21s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 118891
     http_req_receiving.............: avg=2.9ms    min=55.87µs med=130.61µs max=1.02s    p(90)=3.56ms   p(95)=10.27ms  p(99.9)=247.45ms
     http_req_sending...............: avg=62.16µs  min=5.4µs   med=10.07µs  max=116.44ms p(90)=18.86µs  p(95)=89.34µs  p(99.9)=8.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.78ms min=1.78ms  med=102.01ms max=1.89s    p(90)=214.22ms p(95)=248.92ms p(99.9)=1.16s   
     http_reqs......................: 118891  1908.58968/s
     iteration_duration.............: avg=121.08ms min=4.01ms  med=105.53ms max=1.92s    p(90)=219.65ms p(95)=257.1ms  p(99.9)=1.21s   
     iterations.....................: 117891  1892.536407/s
     success_rate...................: 100.00% ✓ 117891      ✗ 0     
     vus............................: 74      min=0         max=495 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 261039      ✗ 0    
     data_received..................: 7.7 GB  122 MB/s
     data_sent......................: 106 MB  1.7 MB/s
     http_req_blocked...............: avg=15.24µs  min=1.21µs  med=3.68µs   max=45.52ms  p(90)=6.13µs   p(95)=7.79µs   p(99.9)=1.46ms  
     http_req_connecting............: avg=10.51µs  min=0s      med=0s       max=45.43ms  p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=161.92ms min=2.5ms   med=147.09ms max=659.44ms p(90)=319.39ms p(95)=364.62ms p(99.9)=535.91ms
       { expected_response:true }...: avg=161.92ms min=2.5ms   med=147.09ms max=659.44ms p(90)=319.39ms p(95)=364.62ms p(99.9)=535.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 88013
     http_req_receiving.............: avg=126.25µs min=32.83µs med=72.92µs  max=39.02ms  p(90)=138.14µs p(95)=275.58µs p(99.9)=7.5ms   
     http_req_sending...............: avg=68.4µs   min=5.72µs  med=14.36µs  max=185.29ms p(90)=26.81µs  p(95)=105.7µs  p(99.9)=8.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=161.72ms min=2.41ms  med=146.92ms max=659.31ms p(90)=319.16ms p(95)=364.44ms p(99.9)=535.78ms
     http_reqs......................: 88013   1397.059104/s
     iteration_duration.............: avg=164.09ms min=10.33ms med=149.96ms max=659.8ms  p(90)=320.65ms p(95)=365.63ms p(99.9)=536.67ms
     iterations.....................: 87013   1381.185778/s
     success_rate...................: 100.00% ✓ 87013       ✗ 0    
     vus............................: 57      min=0         max=498
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 195282      ✗ 0    
     data_received..................: 5.8 GB  92 MB/s
     data_sent......................: 79 MB   1.3 MB/s
     http_req_blocked...............: avg=6.79µs   min=1.17µs  med=2.91µs   max=9.14ms   p(90)=4.82µs   p(95)=5.92µs   p(99.9)=566.6µs 
     http_req_connecting............: avg=3.12µs   min=0s      med=0s       max=9.08ms   p(90)=0s       p(95)=0s       p(99.9)=513.84µs
     http_req_duration..............: avg=215.95ms min=2.26ms  med=217.79ms max=577.46ms p(90)=397.11ms p(95)=427.59ms p(99.9)=515.07ms
       { expected_response:true }...: avg=215.95ms min=2.26ms  med=217.79ms max=577.46ms p(90)=397.11ms p(95)=427.59ms p(99.9)=515.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 66094
     http_req_receiving.............: avg=85.72µs  min=28.31µs med=71.27µs  max=29.41ms  p(90)=112.37µs p(95)=128.86µs p(99.9)=1.47ms  
     http_req_sending...............: avg=33.42µs  min=5.41µs  med=13.21µs  max=179.09ms p(90)=20.87µs  p(95)=25.24µs  p(99.9)=3.57ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=215.83ms min=2.2ms   med=217.66ms max=577.39ms p(90)=397.02ms p(95)=427.44ms p(99.9)=514.93ms
     http_reqs......................: 66094   1052.963769/s
     iteration_duration.............: avg=219.56ms min=5.05ms  med=221.67ms max=577.68ms p(90)=398.36ms p(95)=428.52ms p(99.9)=515.33ms
     iterations.....................: 65094   1037.032462/s
     success_rate...................: 100.00% ✓ 65094       ✗ 0    
     vus............................: 94      min=0         max=500
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 91179      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 38 MB   577 kB/s
     http_req_blocked...............: avg=10.61µs  min=1.25µs  med=3.56µs   max=10.64ms  p(90)=5.41µs   p(95)=6.59µs   p(99.9)=1.45ms
     http_req_connecting............: avg=5.86µs   min=0s      med=0s       max=10.58ms  p(90)=0s       p(95)=0s       p(99.9)=1.34ms
     http_req_duration..............: avg=457.77ms min=4.4ms   med=422.2ms  max=2.11s    p(90)=913.74ms p(95)=984.39ms p(99.9)=1.47s 
       { expected_response:true }...: avg=457.77ms min=4.4ms   med=422.2ms  max=2.11s    p(90)=913.74ms p(95)=984.39ms p(99.9)=1.47s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31393
     http_req_receiving.............: avg=106.03µs min=34.51µs med=82.87µs  max=248.55ms p(90)=121.2µs  p(95)=136.62µs p(99.9)=1.09ms
     http_req_sending...............: avg=33.75µs  min=5.93µs  med=16.85µs  max=73.11ms  p(90)=23.28µs  p(95)=27.19µs  p(99.9)=2.89ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=457.63ms min=4.33ms  med=422.05ms max=2.11s    p(90)=913.6ms  p(95)=984.3ms  p(99.9)=1.47s 
     http_reqs......................: 31393   480.254164/s
     iteration_duration.............: avg=473.08ms min=19.51ms med=440.49ms max=2.12s    p(90)=918.33ms p(95)=987.76ms p(99.9)=1.48s 
     iterations.....................: 30393   464.956035/s
     success_rate...................: 100.00% ✓ 30393      ✗ 0    
     vus............................: 76      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 67422      ✗ 0    
     data_received..................: 2.1 GB  31 MB/s
     data_sent......................: 28 MB   424 kB/s
     http_req_blocked...............: avg=10.91µs  min=1.15µs  med=3.39µs   max=6.93ms   p(90)=5.35µs   p(95)=6.57µs   p(99.9)=1.58ms
     http_req_connecting............: avg=6.01µs   min=0s      med=0s       max=6.71ms   p(90)=0s       p(95)=0s       p(99.9)=1.52ms
     http_req_duration..............: avg=614.66ms min=5.67ms  med=578.95ms max=4.79s    p(90)=1.22s    p(95)=1.41s    p(99.9)=2.92s 
       { expected_response:true }...: avg=614.66ms min=5.67ms  med=578.95ms max=4.79s    p(90)=1.22s    p(95)=1.41s    p(99.9)=2.92s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 23474
     http_req_receiving.............: avg=98.8µs   min=32.03µs med=86.09µs  max=47.59ms  p(90)=121.53µs p(95)=135.99µs p(99.9)=1.37ms
     http_req_sending...............: avg=50.83µs  min=5.91µs  med=18.02µs  max=195.32ms p(90)=24.23µs  p(95)=29.35µs  p(99.9)=3.88ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=614.51ms min=5.58ms  med=578.84ms max=4.79s    p(90)=1.22s    p(95)=1.41s    p(99.9)=2.92s 
     http_reqs......................: 23474   352.882658/s
     iteration_duration.............: avg=642.22ms min=46.29ms med=610.33ms max=4.79s    p(90)=1.23s    p(95)=1.42s    p(99.9)=2.95s 
     iterations.....................: 22474   337.849742/s
     success_rate...................: 100.00% ✓ 22474      ✗ 0    
     vus............................: 82      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 41157      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   258 kB/s
     http_req_blocked...............: avg=14.18µs  min=1.23µs  med=3.39µs   max=9.07ms  p(90)=5.34µs   p(95)=7.56µs   p(99.9)=1.86ms
     http_req_connecting............: avg=8.89µs   min=0s      med=0s       max=9.01ms  p(90)=0s       p(95)=0s       p(99.9)=1.83ms
     http_req_duration..............: avg=991.39ms min=6.72ms  med=880.06ms max=6.06s   p(90)=1.96s    p(95)=2.19s    p(99.9)=5.53s 
       { expected_response:true }...: avg=991.39ms min=6.72ms  med=880.06ms max=6.06s   p(90)=1.96s    p(95)=2.19s    p(99.9)=5.53s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14719
     http_req_receiving.............: avg=104.49µs min=34.78µs med=95µs     max=61.53ms p(90)=131.97µs p(95)=147.11µs p(99.9)=1.05ms
     http_req_sending...............: avg=38.3µs   min=6.12µs  med=18.21µs  max=84.37ms p(90)=24.48µs  p(95)=31.37µs  p(99.9)=3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=991.25ms min=6.63ms  med=879.92ms max=6.06s   p(90)=1.96s    p(95)=2.19s    p(99.9)=5.53s 
     http_reqs......................: 14719   214.969421/s
     iteration_duration.............: avg=1.06s    min=26.23ms med=967.03ms max=6.07s   p(90)=1.99s    p(95)=2.21s    p(99.9)=5.55s 
     iterations.....................: 13719   200.364528/s
     success_rate...................: 100.00% ✓ 13719      ✗ 0    
     vus............................: 77      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 39198      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   240 kB/s
     http_req_blocked...............: avg=16.83µs min=1.28µs  med=3.32µs   max=14.94ms p(90)=5.14µs   p(95)=8.17µs   p(99.9)=2.79ms  
     http_req_connecting............: avg=11.24µs min=0s      med=0s       max=14.88ms p(90)=0s       p(95)=0s       p(99.9)=2.63ms  
     http_req_duration..............: avg=1.03s   min=9.27ms  med=942.64ms max=4.49s   p(90)=2.09s    p(95)=2.23s    p(99.9)=4.14s   
       { expected_response:true }...: avg=1.03s   min=9.27ms  med=942.64ms max=4.49s   p(90)=2.09s    p(95)=2.23s    p(99.9)=4.14s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14066
     http_req_receiving.............: avg=96.58µs min=35.73µs med=90.76µs  max=2.04ms  p(90)=129.21µs p(95)=144.47µs p(99.9)=912.28µs
     http_req_sending...............: avg=28.21µs min=6.33µs  med=17.68µs  max=9.26ms  p(90)=23.98µs  p(95)=30.84µs  p(99.9)=2.14ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.03s   min=9.14ms  med=942.53ms max=4.49s   p(90)=2.09s    p(95)=2.23s    p(99.9)=4.14s   
     http_reqs......................: 14066   200.358849/s
     iteration_duration.............: avg=1.11s   min=42.51ms med=1.03s    max=4.5s    p(90)=2.12s    p(95)=2.23s    p(99.9)=4.16s   
     iterations.....................: 13066   186.114654/s
     success_rate...................: 100.00% ✓ 13066      ✗ 0    
     vus............................: 65      min=0        max=500
     vus_max........................: 500     min=500      max=500
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
data_received..................: 12 MB  207 kB/s
     data_sent......................: 156 kB 2.6 kB/s
     http_req_blocked...............: avg=5.07µs   min=2.65µs   med=3.36µs   max=195.58µs p(90)=4.5µs    p(95)=5.07µs   p(99.9)=171.42µs
     http_req_connecting............: avg=796ns    min=0s       med=0s       max=102.77µs p(90)=0s       p(95)=0s       p(99.9)=89.61µs 
     http_req_duration..............: avg=464.99ms min=28.08ms  med=45.58ms  max=49.91s   p(90)=55.73ms  p(95)=64.8ms   p(99.9)=44.05s  
       { expected_response:true }...: avg=464.99ms min=28.08ms  med=45.58ms  max=49.91s   p(90)=55.73ms  p(95)=64.8ms   p(99.9)=44.05s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 129  
     http_req_receiving.............: avg=144.89µs min=114.25µs med=132.41µs max=661.79µs p(90)=172.57µs p(95)=183.83µs p(99.9)=613.02µs
     http_req_sending...............: avg=19.58µs  min=14.85µs  med=18.7µs   max=54.88µs  p(90)=21.65µs  p(95)=23.73µs  p(99.9)=52.83µs 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=464.82ms min=27.92ms  med=45.31ms  max=49.91s   p(90)=55.57ms  p(95)=64.66ms  p(99.9)=44.05s  
     http_reqs......................: 129    2.149969/s
     vus............................: 0      min=0      max=0  
     vus_max........................: 500    min=500    max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 7.0.0-27-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=120 GB

