## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,878 | 3,077 | 2,807 | 2.8% |  |
| hotchocolate | 16.1.3 | 2,105 | 2,156 | 2,087 | 1.1% |  |
| grafbase | 0.53.5 | 2,038 | 2,105 | 2,017 | 1.5% |  |
| cosmo | 0.321.1 | 1,196 | 1,203 | 1,187 | 0.7% | non-compatible response (9 across 6/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 554 | 568 | 550 | 1.2% |  |
| apollo-router | v2.15.0 | 407 | 419 | 402 | 1.5% |  |
| apollo-gateway | 2.14.1 | 247 | 250 | 245 | 0.7% |  |
| hive-gateway | 2.8.2 | 238 | 242 | 235 | 1.2% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,403 | 2,499 | 2,355 | 1.9% |  |
| hotchocolate | 16.1.3 | 1,931 | 1,986 | 1,894 | 1.4% |  |
| grafbase | 0.53.5 | 1,529 | 1,566 | 1,517 | 1.0% |  |
| cosmo | 0.321.1 | 1,151 | 1,169 | 1,140 | 0.9% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 522 | 537 | 517 | 1.2% |  |
| apollo-router | v2.15.0 | 393 | 402 | 385 | 1.4% |  |
| apollo-gateway | 2.14.1 | 239 | 241 | 236 | 0.8% |  |
| hive-gateway | 2.8.2 | 231 | 235 | 228 | 1.1% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1037691     ✗ 0     
     data_received..................: 30 GB   253 MB/s
     data_sent......................: 416 MB  3.5 MB/s
     http_req_blocked...............: avg=3.24µs   min=1.1µs   med=2.45µs  max=16.45ms  p(90)=3.73µs   p(95)=4.4µs    p(99.9)=38.12µs
     http_req_connecting............: avg=292ns    min=0s      med=0s      max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.1ms   min=1.61ms  med=16.22ms max=393.91ms p(90)=25.16ms  p(95)=28.9ms   p(99.9)=51.43ms
       { expected_response:true }...: avg=17.1ms   min=1.61ms  med=16.22ms max=393.91ms p(90)=25.16ms  p(95)=28.9ms   p(99.9)=51.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 345997
     http_req_receiving.............: avg=150.75µs min=27.81µs med=52.56µs max=356.43ms p(90)=102.78µs p(95)=278.18µs p(99.9)=13.49ms
     http_req_sending...............: avg=57.2µs   min=5.36µs  med=9.49µs  max=40.86ms  p(90)=16.6µs   p(95)=125.52µs p(99.9)=7.79ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.9ms   min=1.55ms  med=16.06ms max=78.85ms  p(90)=24.89ms  p(95)=28.53ms  p(99.9)=49.54ms
     http_reqs......................: 345997  2878.56916/s
     iteration_duration.............: avg=17.33ms  min=2.04ms  med=16.43ms max=406.8ms  p(90)=25.39ms  p(95)=29.17ms  p(99.9)=52.66ms
     iterations.....................: 345897  2877.737197/s
     success_rate...................: 100.00% ✓ 345897      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 759522     ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 304 MB  2.5 MB/s
     http_req_blocked...............: avg=3.08µs  min=1.05µs  med=2.4µs    max=12ms     p(90)=3.55µs   p(95)=4.15µs   p(99.9)=35.67µs 
     http_req_connecting............: avg=240ns   min=0s      med=0s       max=3.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.45ms min=2.42ms  med=14.89ms  max=306.02ms p(90)=52.72ms  p(95)=71.07ms  p(99.9)=171.17ms
       { expected_response:true }...: avg=23.45ms min=2.42ms  med=14.89ms  max=306.02ms p(90)=52.72ms  p(95)=71.07ms  p(99.9)=171.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 253274
     http_req_receiving.............: avg=648.6µs min=50.89µs med=109.62µs max=174.26ms p(90)=974.47µs p(95)=1.52ms   p(99.9)=59.22ms 
     http_req_sending...............: avg=45.62µs min=5.39µs  med=9.6µs    max=186.48ms p(90)=15.92µs  p(95)=110.27µs p(99.9)=3.23ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.76ms min=2.32ms  med=14.37ms  max=305.19ms p(90)=51.44ms  p(95)=69.75ms  p(99.9)=168.38ms
     http_reqs......................: 253274  2105.36454/s
     iteration_duration.............: avg=23.69ms min=3.41ms  med=15.1ms   max=341.27ms p(90)=52.98ms  p(95)=71.32ms  p(99.9)=172.76ms
     iterations.....................: 253174  2104.53328/s
     success_rate...................: 100.00% ✓ 253174     ✗ 0     
     vus............................: 50      min=50       max=50  
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 735210      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 295 MB  2.4 MB/s
     http_req_blocked...............: avg=3.33µs   min=1.1µs   med=2.6µs   max=12.12ms  p(90)=4.06µs   p(95)=4.85µs   p(99.9)=42.26µs
     http_req_connecting............: avg=247ns    min=0s      med=0s      max=3.36ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.23ms  min=2ms     med=24ms    max=352.56ms p(90)=29.21ms  p(95)=31.61ms  p(99.9)=54.14ms
       { expected_response:true }...: avg=24.23ms  min=2ms     med=24ms    max=352.56ms p(90)=29.21ms  p(95)=31.61ms  p(99.9)=54.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 245170
     http_req_receiving.............: avg=120.15µs min=30.02µs med=59.8µs  max=276ms    p(90)=104.22µs p(95)=220.97µs p(99.9)=10.11ms
     http_req_sending...............: avg=47.47µs  min=4.82µs  med=10.3µs  max=110.67ms p(90)=17.55µs  p(95)=122.61µs p(99.9)=4.04ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.06ms  min=1.9ms   med=23.87ms max=296.66ms p(90)=29.02ms  p(95)=31.31ms  p(99.9)=52.61ms
     http_reqs......................: 245170  2038.741722/s
     iteration_duration.............: avg=24.47ms  min=3.8ms   med=24.21ms max=362.13ms p(90)=29.44ms  p(95)=31.87ms  p(99.9)=54.69ms
     iterations.....................: 245070  2037.91016/s
     success_rate...................: 100.00% ✓ 245070      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 431313      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 173 MB  1.4 MB/s
     http_req_blocked...............: avg=3.06µs  min=1.1µs   med=2.39µs  max=2.88ms   p(90)=3.66µs  p(95)=4.24µs  p(99.9)=36.31µs
     http_req_connecting............: avg=330ns   min=0s      med=0s      max=2.4ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=41.49ms min=2.06ms  med=40.93ms max=304.05ms p(90)=58.53ms p(95)=63.84ms p(99.9)=89.64ms
       { expected_response:true }...: avg=41.49ms min=2.06ms  med=40.93ms max=304.05ms p(90)=58.53ms p(95)=63.84ms p(99.9)=89.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143871
     http_req_receiving.............: avg=80.97µs min=29.93µs med=60.44µs max=155.13ms p(90)=95.3µs  p(95)=112.8µs p(99.9)=1.65ms 
     http_req_sending...............: avg=26.66µs min=5.31µs  med=10.22µs max=164.92ms p(90)=15.09µs p(95)=19.11µs p(99.9)=1.26ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=41.38ms min=2.01ms  med=40.83ms max=300.02ms p(90)=58.41ms p(95)=63.73ms p(99.9)=89.29ms
     http_reqs......................: 143871  1196.195311/s
     iteration_duration.............: avg=41.72ms min=3.56ms  med=41.14ms max=325.16ms p(90)=58.74ms p(95)=64.04ms p(99.9)=90.18ms
     iterations.....................: 143771  1195.363875/s
     success_rate...................: 100.00% ✓ 143771      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 200343     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 80 MB   666 kB/s
     http_req_blocked...............: avg=4.43µs  min=1.2µs   med=2.98µs  max=3.45ms   p(90)=4.54µs   p(95)=5.14µs   p(99.9)=48.97µs 
     http_req_connecting............: avg=1.09µs  min=0s      med=0s      max=3.41ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=89.48ms min=4.06ms  med=86.68ms max=363.78ms p(90)=110.78ms p(95)=122.55ms p(99.9)=221.94ms
       { expected_response:true }...: avg=89.48ms min=4.06ms  med=86.68ms max=363.78ms p(90)=110.78ms p(95)=122.55ms p(99.9)=221.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 66881
     http_req_receiving.............: avg=87.14µs min=32.57µs med=77.32µs max=41.06ms  p(90)=112.3µs  p(95)=125.79µs p(99.9)=932.5µs 
     http_req_sending...............: avg=22.68µs min=5.66µs  med=13.18µs max=66.19ms  p(90)=19.38µs  p(95)=21.73µs  p(99.9)=893.29µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.37ms min=3.95ms  med=86.58ms max=358.98ms p(90)=110.66ms p(95)=122.43ms p(99.9)=221.82ms
     http_reqs......................: 66881   554.838787/s
     iteration_duration.............: avg=89.85ms min=22.1ms  med=86.92ms max=372.74ms p(90)=111.05ms p(95)=122.84ms p(99.9)=224.55ms
     iterations.....................: 66781   554.009196/s
     success_rate...................: 100.00% ✓ 66781      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.15.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 147057     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   489 kB/s
     http_req_blocked...............: avg=5.71µs   min=1.16µs  med=3.43µs   max=4.2ms    p(90)=4.82µs   p(95)=5.4µs    p(99.9)=251.3µs 
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=87.52µs 
     http_req_duration..............: avg=121.93ms min=5.2ms   med=121.61ms max=364.12ms p(90)=147.38ms p(95)=154.92ms p(99.9)=191.8ms 
       { expected_response:true }...: avg=121.93ms min=5.2ms   med=121.61ms max=364.12ms p(90)=147.38ms p(95)=154.92ms p(99.9)=191.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 49119
     http_req_receiving.............: avg=88.07µs  min=30.86µs med=82.99µs  max=14.33ms  p(90)=114.83µs p(95)=126.32µs p(99.9)=610.83µs
     http_req_sending...............: avg=26.77µs  min=5.98µs  med=15.11µs  max=186.72ms p(90)=20.5µs   p(95)=22.31µs  p(99.9)=561.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.81ms min=5.09ms  med=121.5ms  max=363.52ms p(90)=147.28ms p(95)=154.81ms p(99.9)=191.01ms
     http_reqs......................: 49119   407.005277/s
     iteration_duration.............: avg=122.43ms min=26.92ms med=121.9ms  max=377.33ms p(90)=147.65ms p(95)=155.22ms p(99.9)=192.88ms
     iterations.....................: 49019   406.176666/s
     success_rate...................: 100.00% ✓ 49019      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 89712      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   298 kB/s
     http_req_blocked...............: avg=7.65µs   min=1.3µs   med=3.67µs   max=4.36ms   p(90)=4.97µs   p(95)=5.54µs   p(99.9)=1.87ms  
     http_req_connecting............: avg=3.65µs   min=0s      med=0s       max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=199.81ms min=8.42ms  med=214.94ms max=391.68ms p(90)=225.64ms p(95)=229.27ms p(99.9)=299.89ms
       { expected_response:true }...: avg=199.81ms min=8.42ms  med=214.94ms max=391.68ms p(90)=225.64ms p(95)=229.27ms p(99.9)=299.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30004
     http_req_receiving.............: avg=96.87µs  min=35.87µs med=91.26µs  max=18.09ms  p(90)=122µs    p(95)=133.72µs p(99.9)=586.94µs
     http_req_sending...............: avg=42.92µs  min=6.01µs  med=16.99µs  max=182.19ms p(90)=21.58µs  p(95)=23.28µs  p(99.9)=586.72µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.67ms min=8.28ms  med=214.8ms  max=391.26ms p(90)=225.53ms p(95)=229.14ms p(99.9)=299.56ms
     http_reqs......................: 30004   247.838697/s
     iteration_duration.............: avg=200.77ms min=43.2ms  med=215.43ms max=436.03ms p(90)=225.95ms p(95)=229.55ms p(99.9)=302.82ms
     iterations.....................: 29904   247.012678/s
     success_rate...................: 100.00% ✓ 29904      ✗ 0    
     vus............................: 33      min=33       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86346      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=7.6µs    min=1.34µs  med=3.79µs   max=4.19ms   p(90)=5.24µs   p(95)=5.91µs   p(99.9)=1.9ms   
     http_req_connecting............: avg=3.63µs   min=0s      med=0s       max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=1.87ms  
     http_req_duration..............: avg=207.54ms min=6.51ms  med=188.8ms  max=679.79ms p(90)=243.74ms p(95)=425.63ms p(99.9)=604.24ms
       { expected_response:true }...: avg=207.54ms min=6.51ms  med=188.8ms  max=679.79ms p(90)=243.74ms p(95)=425.63ms p(99.9)=604.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28882
     http_req_receiving.............: avg=106.72µs min=36.68µs med=97.34µs  max=71.74ms  p(90)=129.58µs p(95)=142.6µs  p(99.9)=633.15µs
     http_req_sending...............: avg=26.5µs   min=6.31µs  med=17.86µs  max=61.11ms  p(90)=22.98µs  p(95)=24.82µs  p(99.9)=551.42µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.4ms  min=6.37ms  med=188.68ms max=679.62ms p(90)=243.58ms p(95)=425.5ms  p(99.9)=604.09ms
     http_reqs......................: 28882   238.862141/s
     iteration_duration.............: avg=208.57ms min=34.99ms med=189.18ms max=680.05ms p(90)=244.29ms p(95)=426.2ms  p(99.9)=604.62ms
     iterations.....................: 28782   238.035114/s
     success_rate...................: 100.00% ✓ 28782      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 866628      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 347 MB  2.9 MB/s
     http_req_blocked...............: avg=3.67µs   min=1.05µs  med=2.62µs  max=15.79ms  p(90)=4.15µs   p(95)=4.96µs   p(99.9)=38.7µs 
     http_req_connecting............: avg=405ns    min=0s      med=0s      max=4.8ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.52ms  min=1.85ms  med=19.93ms max=376.21ms p(90)=28.7ms   p(95)=32.01ms  p(99.9)=54.53ms
       { expected_response:true }...: avg=20.52ms  min=1.85ms  med=19.93ms max=376.21ms p(90)=28.7ms   p(95)=32.01ms  p(99.9)=54.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288976
     http_req_receiving.............: avg=126.36µs min=28.31µs med=55.62µs max=141.37ms p(90)=107.71µs p(95)=272.29µs p(99.9)=10.61ms
     http_req_sending...............: avg=56.85µs  min=5.34µs  med=10.31µs max=70.36ms  p(90)=18.86µs  p(95)=129.76µs p(99.9)=7.25ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.33ms  min=1.74ms  med=19.78ms max=234.47ms p(90)=28.47ms  p(95)=31.67ms  p(99.9)=53.68ms
     http_reqs......................: 288976  2403.447839/s
     iteration_duration.............: avg=20.76ms  min=3.12ms  med=20.15ms max=391.7ms  p(90)=28.93ms  p(95)=32.25ms  p(99.9)=55.26ms
     iterations.....................: 288876  2402.616127/s
     success_rate...................: 100.00% ✓ 288876      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 696645      ✗ 0     
     data_received..................: 20 GB   169 MB/s
     data_sent......................: 279 MB  2.3 MB/s
     http_req_blocked...............: avg=3.58µs   min=1.05µs  med=2.65µs   max=10.44ms  p(90)=4.12µs  p(95)=4.88µs  p(99.9)=39.36µs 
     http_req_connecting............: avg=447ns    min=0s      med=0s       max=4.16ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.58ms  min=2.05ms  med=17.6ms   max=614.32ms p(90)=53.98ms p(95)=70.8ms  p(99.9)=190.48ms
       { expected_response:true }...: avg=25.58ms  min=2.05ms  med=17.6ms   max=614.32ms p(90)=53.98ms p(95)=70.8ms  p(99.9)=190.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 232315
     http_req_receiving.............: avg=684.36µs min=53.01µs med=110.63µs max=239.93ms p(90)=1.16ms  p(95)=1.87ms  p(99.9)=55.16ms 
     http_req_sending...............: avg=44.68µs  min=5.47µs  med=10.35µs  max=131.91ms p(90)=18.65µs p(95)=114.4µs p(99.9)=2.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=24.85ms  min=1.9ms   med=17.03ms  max=614.22ms p(90)=52.75ms p(95)=69.33ms p(99.9)=188.94ms
     http_reqs......................: 232315  1931.77051/s
     iteration_duration.............: avg=25.83ms  min=2.77ms  med=17.83ms  max=614.52ms p(90)=54.21ms p(95)=71.03ms p(99.9)=192.26ms
     iterations.....................: 232215  1930.938979/s
     success_rate...................: 100.00% ✓ 232215      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 551775      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 221 MB  1.8 MB/s
     http_req_blocked...............: avg=3.81µs   min=941ns   med=2.72µs  max=13.48ms  p(90)=5.1µs    p(95)=6.28µs   p(99.9)=44.81µs
     http_req_connecting............: avg=377ns    min=0s      med=0s      max=3.21ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.33ms  min=2.43ms  med=31.57ms max=328.6ms  p(90)=42.79ms  p(95)=47.37ms  p(99.9)=86.99ms
       { expected_response:true }...: avg=32.33ms  min=2.43ms  med=31.57ms max=328.6ms  p(90)=42.79ms  p(95)=47.37ms  p(99.9)=86.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 184025
     http_req_receiving.............: avg=121.48µs min=30.37µs med=63.42µs max=200.06ms p(90)=138.02µs p(95)=292.57µs p(99.9)=6.45ms 
     http_req_sending...............: avg=47.66µs  min=5.38µs  med=10.96µs max=78.87ms  p(90)=24.88µs  p(95)=139.54µs p(99.9)=3.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.16ms  min=2.31ms  med=31.42ms max=327.45ms p(90)=42.59ms  p(95)=47.12ms  p(99.9)=86.54ms
     http_reqs......................: 184025  1529.75835/s
     iteration_duration.............: avg=32.61ms  min=4.32ms  med=31.82ms max=343.7ms  p(90)=43.05ms  p(95)=47.63ms  p(99.9)=87.93ms
     iterations.....................: 183925  1528.927072/s
     success_rate...................: 100.00% ✓ 183925      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 415221      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=5.25µs  min=1.1µs   med=2.81µs  max=11.48ms  p(90)=4.41µs   p(95)=5.1µs    p(99.9)=38.2µs 
     http_req_connecting............: avg=2.05µs  min=0s      med=0s      max=11.27ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.08ms min=2.31ms  med=42.57ms max=306.91ms p(90)=60.25ms  p(95)=65.7ms   p(99.9)=93.05ms
       { expected_response:true }...: avg=43.08ms min=2.31ms  med=42.57ms max=306.91ms p(90)=60.25ms  p(95)=65.7ms   p(99.9)=93.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138507
     http_req_receiving.............: avg=86.66µs min=29.17µs med=69.14µs max=40.07ms  p(90)=108.16µs p(95)=126.87µs p(99.9)=1.8ms  
     http_req_sending...............: avg=28.06µs min=5.55µs  med=11.9µs  max=209.23ms p(90)=18.4µs   p(95)=22.2µs   p(99.9)=1.25ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.97ms min=2.2ms   med=42.47ms max=306.21ms p(90)=60.13ms  p(95)=65.57ms  p(99.9)=92.83ms
     http_reqs......................: 138507  1151.351622/s
     iteration_duration.............: avg=43.34ms min=3.64ms  med=42.79ms max=346.19ms p(90)=60.48ms  p(95)=65.91ms  p(99.9)=93.65ms
     iterations.....................: 138407  1150.520364/s
     success_rate...................: 100.00% ✓ 138407      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 188841     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 76 MB   628 kB/s
     http_req_blocked...............: avg=5.32µs   min=1.25µs  med=3.31µs  max=4.99ms   p(90)=4.87µs   p(95)=5.45µs   p(99.9)=80.77µs 
     http_req_connecting............: avg=1.76µs   min=0s      med=0s      max=4.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.94ms  min=4.23ms  med=92.6ms  max=369.77ms p(90)=116.11ms p(95)=128.19ms p(99.9)=231.23ms
       { expected_response:true }...: avg=94.94ms  min=4.23ms  med=92.6ms  max=369.77ms p(90)=116.11ms p(95)=128.19ms p(99.9)=231.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63047
     http_req_receiving.............: avg=104.25µs min=31.16µs med=82.24µs max=252.44ms p(90)=116.08µs p(95)=129.29µs p(99.9)=1.66ms  
     http_req_sending...............: avg=25.27µs  min=5.73µs  med=14.06µs max=159.45ms p(90)=20.21µs  p(95)=22.35µs  p(99.9)=724.23µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.81ms  min=4.1ms   med=92.49ms max=367.91ms p(90)=115.98ms p(95)=127.99ms p(99.9)=230.56ms
     http_reqs......................: 63047   522.905396/s
     iteration_duration.............: avg=95.34ms  min=12.68ms med=92.86ms max=392.84ms p(90)=116.37ms p(95)=128.51ms p(99.9)=233.87ms
     iterations.....................: 62947   522.076006/s
     success_rate...................: 100.00% ✓ 62947      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 142401     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 57 MB   473 kB/s
     http_req_blocked...............: avg=6.29µs   min=1.25µs  med=3.79µs   max=4.22ms   p(90)=5.28µs   p(95)=5.87µs   p(99.9)=248.81µs
     http_req_connecting............: avg=2.32µs   min=0s      med=0s       max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=221.57µs
     http_req_duration..............: avg=125.91ms min=5.76ms  med=123.63ms max=346.11ms p(90)=166.3ms  p(95)=179.03ms p(99.9)=230.31ms
       { expected_response:true }...: avg=125.91ms min=5.76ms  med=123.63ms max=346.11ms p(90)=166.3ms  p(95)=179.03ms p(99.9)=230.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47567
     http_req_receiving.............: avg=93.51µs  min=32.09µs med=88.18µs  max=3.83ms   p(90)=120.1µs  p(95)=132.91µs p(99.9)=750.44µs
     http_req_sending...............: avg=27.6µs   min=5.99µs  med=16.86µs  max=131.69ms p(90)=22.04µs  p(95)=23.84µs  p(99.9)=643.09µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.79ms min=5.63ms  med=123.52ms max=345.39ms p(90)=166.17ms p(95)=178.86ms p(99.9)=230.2ms 
     http_reqs......................: 47567   393.937888/s
     iteration_duration.............: avg=126.45ms min=19.2ms  med=123.97ms max=365.54ms p(90)=166.63ms p(95)=179.34ms p(99.9)=232.37ms
     iterations.....................: 47467   393.109713/s
     success_rate...................: 100.00% ✓ 47467      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86856      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=7.04µs   min=1.28µs  med=3.48µs   max=3.97ms   p(90)=4.72µs   p(95)=5.24µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=3.43µs   min=0s      med=0s       max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=1.78ms  
     http_req_duration..............: avg=206.35ms min=8.68ms  med=205.08ms max=444.03ms p(90)=220ms    p(95)=225.11ms p(99.9)=303.44ms
       { expected_response:true }...: avg=206.35ms min=8.68ms  med=205.08ms max=444.03ms p(90)=220ms    p(95)=225.11ms p(99.9)=303.44ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29052
     http_req_receiving.............: avg=109.23µs min=32.41µs med=90.43µs  max=145.76ms p(90)=120.82µs p(95)=132.32µs p(99.9)=741.5µs 
     http_req_sending...............: avg=37.31µs  min=5.86µs  med=16.83µs  max=223.22ms p(90)=21.1µs   p(95)=22.81µs  p(99.9)=509.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.21ms min=8.55ms  med=204.97ms max=443.41ms p(90)=219.88ms p(95)=225ms    p(99.9)=302.98ms
     http_reqs......................: 29052   239.948408/s
     iteration_duration.............: avg=207.36ms min=46.73ms med=205.4ms  max=464.53ms p(90)=220.26ms p(95)=225.46ms p(99.9)=326.62ms
     iterations.....................: 28952   239.12248/s
     success_rate...................: 100.00% ✓ 28952      ✗ 0    
     vus............................: 41      min=41       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 83793      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   278 kB/s
     http_req_blocked...............: avg=7.71µs   min=1.29µs  med=3.74µs   max=4.28ms   p(90)=5.15µs   p(95)=5.73µs   p(99.9)=1.96ms  
     http_req_connecting............: avg=3.77µs   min=0s      med=0s       max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=1.94ms  
     http_req_duration..............: avg=213.92ms min=6.79ms  med=198.41ms max=746.02ms p(90)=261.38ms p(95)=328.69ms p(99.9)=641.42ms
       { expected_response:true }...: avg=213.92ms min=6.79ms  med=198.41ms max=746.02ms p(90)=261.38ms p(95)=328.69ms p(99.9)=641.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28031
     http_req_receiving.............: avg=112.86µs min=33.51µs med=96.86µs  max=91.43ms  p(90)=128.58µs p(95)=141.5µs  p(99.9)=791.45µs
     http_req_sending...............: avg=36.92µs  min=6.44µs  med=17.77µs  max=136.88ms p(90)=22.63µs  p(95)=24.35µs  p(99.9)=570.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=213.78ms min=6.69ms  med=198.29ms max=745.88ms p(90)=261.26ms p(95)=328.5ms  p(99.9)=641.3ms 
     http_reqs......................: 28031   231.617565/s
     iteration_duration.............: avg=214.99ms min=55.83ms med=198.89ms max=746.26ms p(90)=261.9ms  p(95)=331.25ms p(99.9)=641.65ms
     iterations.....................: 27931   230.791274/s
     success_rate...................: 100.00% ✓ 27931      ✗ 0    
     vus............................: 9       min=9        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

