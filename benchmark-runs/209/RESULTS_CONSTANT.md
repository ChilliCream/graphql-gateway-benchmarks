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
| hive-router | v0.0.49 | 3,073 | 3,248 | 2,996 | 2.5% |  |
| grafbase | 0.53.3 | 2,090 | 2,117 | 2,041 | 1.2% |  |
| cosmo | 0.307.0 | 1,271 | 1,291 | 1,263 | 0.7% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 542 | 552 | 538 | 0.8% |  |
| apollo-router | v2.13.1 | 402 | 417 | 396 | 1.8% |  |
| apollo-gateway | 2.13.3 | 239 | 241 | 238 | 0.4% |  |
| hive-gateway | 2.5.25 | 236 | 239 | 233 | 0.8% |  |
| hotchocolate | — | — | — | — | — | benchmark run failed |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,517 | 2,626 | 2,492 | 1.7% |  |
| hotchocolate | 16.1.0-p.14 | 2,009 | 2,044 | 1,846 | 2.8% |  |
| grafbase | 0.53.3 | 1,526 | 1,565 | 1,512 | 1.3% |  |
| cosmo | 0.307.0 | 1,200 | 1,223 | 1,197 | 0.8% | non-compatible response (4 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 526 | 537 | 520 | 1.0% |  |
| apollo-router | v2.13.1 | 403 | 410 | 399 | 1.0% |  |
| hive-gateway | 2.5.25 | 233 | 238 | 231 | 0.9% |  |
| apollo-gateway | 2.13.3 | 231 | 234 | 229 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1108116     ✗ 0     
     data_received..................: 32 GB   270 MB/s
     data_sent......................: 444 MB  3.7 MB/s
     http_req_blocked...............: avg=3.14µs   min=981ns   med=1.98µs  max=24.83ms  p(90)=3.1µs   p(95)=3.74µs   p(99.9)=31.72µs
     http_req_connecting............: avg=574ns    min=0s      med=0s      max=12.46ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16ms     min=1.6ms   med=14.94ms max=303.37ms p(90)=23.73ms p(95)=28.14ms  p(99.9)=51.93ms
       { expected_response:true }...: avg=16ms     min=1.6ms   med=14.94ms max=303.37ms p(90)=23.73ms p(95)=28.14ms  p(99.9)=51.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 369472
     http_req_receiving.............: avg=145.98µs min=26.81µs med=47.36µs max=150.88ms p(90)=94.65µs p(95)=278.27µs p(99.9)=17.13ms
     http_req_sending...............: avg=63.06µs  min=4.74µs  med=8.77µs  max=123.5ms  p(90)=14.72µs p(95)=119.18µs p(99.9)=15.09ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.79ms  min=1.53ms  med=14.79ms max=297.68ms p(90)=23.4ms  p(95)=27.63ms  p(99.9)=49.47ms
     http_reqs......................: 369472  3073.859982/s
     iteration_duration.............: avg=16.23ms  min=2.01ms  med=15.14ms max=332.53ms p(90)=23.97ms p(95)=28.43ms  p(99.9)=53.84ms
     iterations.....................: 369372  3073.028022/s
     success_rate...................: 100.00% ✓ 369372      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 753759      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 302 MB  2.5 MB/s
     http_req_blocked...............: avg=3.03µs   min=1.02µs  med=2.22µs  max=5.37ms   p(90)=3.66µs  p(95)=4.42µs   p(99.9)=39.17µs
     http_req_connecting............: avg=306ns    min=0s      med=0s      max=3.46ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.63ms  min=1.89ms  med=23.43ms max=298.7ms  p(90)=28.26ms p(95)=30.34ms  p(99.9)=51.92ms
       { expected_response:true }...: avg=23.63ms  min=1.89ms  med=23.43ms max=298.7ms  p(90)=28.26ms p(95)=30.34ms  p(99.9)=51.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 251353
     http_req_receiving.............: avg=120.58µs min=29.43µs med=57.68µs max=214.77ms p(90)=99.4µs  p(95)=183.17µs p(99.9)=7.68ms 
     http_req_sending...............: avg=43.69µs  min=5.3µs   med=9.98µs  max=236.52ms p(90)=17.14µs p(95)=113.36µs p(99.9)=2.6ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.47ms  min=1.78ms  med=23.31ms max=85.35ms  p(90)=28.1ms  p(95)=30.11ms  p(99.9)=50.24ms
     http_reqs......................: 251353  2090.382257/s
     iteration_duration.............: avg=23.87ms  min=3.5ms   med=23.63ms max=365.27ms p(90)=28.48ms p(95)=30.57ms  p(99.9)=52.71ms
     iterations.....................: 251253  2089.550605/s
     success_rate...................: 100.00% ✓ 251253      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 458331      ✗ 0     
     data_received..................: 13 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=2.83µs  min=1.02µs  med=2.27µs  max=1.97ms   p(90)=3.64µs  p(95)=4.26µs   p(99.9)=33.57µs
     http_req_connecting............: avg=246ns   min=0s      med=0s      max=1.94ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.03ms min=2.14ms  med=38.51ms max=309.29ms p(90)=55.11ms p(95)=60.19ms  p(99.9)=84.7ms 
       { expected_response:true }...: avg=39.03ms min=2.14ms  med=38.51ms max=309.29ms p(90)=55.11ms p(95)=60.19ms  p(99.9)=84.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 152877
     http_req_receiving.............: avg=79.4µs  min=29.57µs med=59.38µs max=128.33ms p(90)=94.39µs p(95)=111.57µs p(99.9)=2.03ms 
     http_req_sending...............: avg=27.3µs  min=5.2µs   med=10.3µs  max=146.61ms p(90)=15.47µs p(95)=19.49µs  p(99.9)=1.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.92ms min=2ms     med=38.41ms max=308.96ms p(90)=55.01ms p(95)=60.07ms  p(99.9)=84.39ms
     http_reqs......................: 152877  1271.103128/s
     iteration_duration.............: avg=39.26ms min=4.34ms  med=38.72ms max=345.44ms p(90)=55.31ms p(95)=60.4ms   p(99.9)=85.16ms
     iterations.....................: 152777  1270.271674/s
     success_rate...................: 100.00% ✓ 152777      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 195891     ✗ 0    
     data_received..................: 5.7 GB  48 MB/s
     data_sent......................: 79 MB   652 kB/s
     http_req_blocked...............: avg=4.68µs   min=1.14µs  med=2.66µs  max=4.58ms   p(90)=4.16µs   p(95)=4.77µs   p(99.9)=54.21µs 
     http_req_connecting............: avg=1.65µs   min=0s      med=0s      max=4.53ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=91.56ms  min=4.08ms  med=89.07ms max=385.57ms p(90)=112.37ms p(95)=125.35ms p(99.9)=219.34ms
       { expected_response:true }...: avg=91.56ms  min=4.08ms  med=89.07ms max=385.57ms p(90)=112.37ms p(95)=125.35ms p(99.9)=219.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65397
     http_req_receiving.............: avg=182.32µs min=30.13µs med=72.74µs max=309.13ms p(90)=105.99µs p(95)=118.32µs p(99.9)=1.34ms  
     http_req_sending...............: avg=18.3µs   min=5.41µs  med=12.33µs max=41.73ms  p(90)=18.24µs  p(95)=20.6µs   p(99.9)=605.11µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.35ms  min=4.03ms  med=88.95ms max=251.09ms p(90)=112.2ms  p(95)=125.07ms p(99.9)=216.22ms
     http_reqs......................: 65397   542.492303/s
     iteration_duration.............: avg=91.91ms  min=12.01ms med=89.31ms max=398.8ms  p(90)=112.61ms p(95)=125.66ms p(99.9)=220.41ms
     iterations.....................: 65297   541.662766/s
     success_rate...................: 100.00% ✓ 65297      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 145263     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 58 MB   483 kB/s
     http_req_blocked...............: avg=4.29µs   min=1.19µs  med=3.04µs   max=2.72ms   p(90)=4.41µs   p(95)=4.96µs   p(99.9)=128.74µs
     http_req_connecting............: avg=1µs      min=0s      med=0s       max=2.68ms   p(90)=0s       p(95)=0s       p(99.9)=69.41µs 
     http_req_duration..............: avg=123.46ms min=5.34ms  med=123.17ms max=363.49ms p(90)=149.31ms p(95)=157.03ms p(99.9)=195.58ms
       { expected_response:true }...: avg=123.46ms min=5.34ms  med=123.17ms max=363.49ms p(90)=149.31ms p(95)=157.03ms p(99.9)=195.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48521
     http_req_receiving.............: avg=93.06µs  min=30.98µs med=78.26µs  max=172.05ms p(90)=110.11µs p(95)=121.75µs p(99.9)=973.4µs 
     http_req_sending...............: avg=29.91µs  min=5.89µs  med=14µs     max=137.32ms p(90)=19.88µs  p(95)=21.82µs  p(99.9)=766.74µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.33ms min=5.28ms  med=123.06ms max=328.55ms p(90)=149.19ms p(95)=156.91ms p(99.9)=194.69ms
     http_reqs......................: 48521   402.006423/s
     iteration_duration.............: avg=123.95ms min=40.84ms med=123.45ms max=378.39ms p(90)=149.56ms p(95)=157.28ms p(99.9)=197.54ms
     iterations.....................: 48421   401.177902/s
     success_rate...................: 100.00% ✓ 48421      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86859      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=7.47µs   min=1.26µs  med=3.15µs   max=4.97ms   p(90)=4.36µs   p(95)=4.88µs   p(99.9)=2.02ms  
     http_req_connecting............: avg=4.01µs   min=0s      med=0s       max=4.93ms   p(90)=0s       p(95)=0s       p(99.9)=1.79ms  
     http_req_duration..............: avg=206.4ms  min=8.35ms  med=207.2ms  max=433.37ms p(90)=228.49ms p(95)=239.19ms p(99.9)=303.51ms
       { expected_response:true }...: avg=206.4ms  min=8.35ms  med=207.2ms  max=433.37ms p(90)=228.49ms p(95)=239.19ms p(99.9)=303.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29053
     http_req_receiving.............: avg=98.34µs  min=33.95µs med=87.13µs  max=96.13ms  p(90)=119.07µs p(95)=130.15µs p(99.9)=504.01µs
     http_req_sending...............: avg=27.38µs  min=5.73µs  med=15.41µs  max=89.29ms  p(90)=20.76µs  p(95)=22.55µs  p(99.9)=620.77µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.27ms min=8.26ms  med=207.11ms max=432.98ms p(90)=228.38ms p(95)=239.06ms p(99.9)=303.36ms
     http_reqs......................: 29053   239.944171/s
     iteration_duration.............: avg=207.39ms min=30.58ms med=207.54ms max=458.34ms p(90)=228.78ms p(95)=239.63ms p(99.9)=313.71ms
     iterations.....................: 28953   239.118286/s
     success_rate...................: 100.00% ✓ 28953      ✗ 0    
     vus............................: 38      min=38       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 85515      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   284 kB/s
     http_req_blocked...............: avg=7.11µs   min=1.28µs  med=3.38µs   max=4.13ms   p(90)=4.8µs    p(95)=5.43µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=3.49µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=1.78ms  
     http_req_duration..............: avg=209.61ms min=6.52ms  med=190.46ms max=686.66ms p(90)=240.73ms p(95)=457.14ms p(99.9)=610.56ms
       { expected_response:true }...: avg=209.61ms min=6.52ms  med=190.46ms max=686.66ms p(90)=240.73ms p(95)=457.14ms p(99.9)=610.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28605
     http_req_receiving.............: avg=100.41µs min=35.99µs med=92.02µs  max=92.16ms  p(90)=124.53µs p(95)=136.73µs p(99.9)=478.41µs
     http_req_sending...............: avg=23.38µs  min=6.19µs  med=16.54µs  max=33.36ms  p(90)=21.95µs  p(95)=23.94µs  p(99.9)=592.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.49ms min=6.39ms  med=190.35ms max=686.57ms p(90)=240.58ms p(95)=457.06ms p(99.9)=610.44ms
     http_reqs......................: 28605   236.569094/s
     iteration_duration.............: avg=210.61ms min=55.9ms  med=190.83ms max=686.84ms p(90)=241.18ms p(95)=457.84ms p(99.9)=610.94ms
     iterations.....................: 28505   235.742074/s
     success_rate...................: 100.00% ✓ 28505      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 907800      ✗ 0     
     data_received..................: 27 GB   220 MB/s
     data_sent......................: 364 MB  3.0 MB/s
     http_req_blocked...............: avg=3.15µs   min=1µs     med=2.23µs  max=11.52ms  p(90)=3.76µs   p(95)=4.64µs   p(99.9)=33.69µs
     http_req_connecting............: avg=367ns    min=0s      med=0s      max=4.46ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.58ms  min=1.66ms  med=18.99ms max=337.85ms p(90)=27.14ms  p(95)=30.4ms   p(99.9)=52.8ms 
       { expected_response:true }...: avg=19.58ms  min=1.66ms  med=18.99ms max=337.85ms p(90)=27.14ms  p(95)=30.4ms   p(99.9)=52.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 302700
     http_req_receiving.............: avg=121.24µs min=27.78µs med=53.36µs max=208.51ms p(90)=106.43µs p(95)=272.32µs p(99.9)=10.28ms
     http_req_sending...............: avg=53.47µs  min=5.37µs  med=9.76µs  max=246.95ms p(90)=18.98µs  p(95)=127.09µs p(99.9)=5.4ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.41ms  min=1.58ms  med=18.84ms max=329.36ms p(90)=26.94ms  p(95)=30.07ms  p(99.9)=51.66ms
     http_reqs......................: 302700  2517.874802/s
     iteration_duration.............: avg=19.81ms  min=2.94ms  med=19.2ms  max=370.49ms p(90)=27.37ms  p(95)=30.64ms  p(99.9)=53.47ms
     iterations.....................: 302600  2517.042997/s
     success_rate...................: 100.00% ✓ 302600      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 724443      ✗ 0     
     data_received..................: 21 GB   176 MB/s
     data_sent......................: 290 MB  2.4 MB/s
     http_req_blocked...............: avg=3.32µs   min=1.05µs  med=2.48µs   max=13.59ms  p(90)=4.02µs  p(95)=4.8µs    p(99.9)=36.83µs 
     http_req_connecting............: avg=346ns    min=0s      med=0s       max=3.63ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.59ms  min=1.9ms   med=17.02ms  max=849.88ms p(90)=51.73ms p(95)=68.8ms   p(99.9)=174.99ms
       { expected_response:true }...: avg=24.59ms  min=1.9ms   med=17.02ms  max=849.88ms p(90)=51.73ms p(95)=68.8ms   p(99.9)=174.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 241581
     http_req_receiving.............: avg=685.28µs min=50.61µs med=106.74µs max=317.19ms p(90)=1.11ms  p(95)=1.8ms    p(99.9)=58.29ms 
     http_req_sending...............: avg=44.7µs   min=5.28µs  med=10.11µs  max=252.72ms p(90)=18.49µs p(95)=115.68µs p(99.9)=2.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.86ms  min=1.79ms  med=16.47ms  max=849.8ms  p(90)=50.46ms p(95)=67.31ms  p(99.9)=168.92ms
     http_reqs......................: 241581  2009.162199/s
     iteration_duration.............: avg=24.83ms  min=2.34ms  med=17.24ms  max=850.08ms p(90)=52ms    p(95)=69.05ms  p(99.9)=176.28ms
     iterations.....................: 241481  2008.330527/s
     success_rate...................: 100.00% ✓ 241481      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 550788      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 221 MB  1.8 MB/s
     http_req_blocked...............: avg=3.53µs   min=952ns   med=2.32µs  max=4.59ms   p(90)=4.61µs   p(95)=5.8µs    p(99.9)=41.7µs 
     http_req_connecting............: avg=623ns    min=0s      med=0s      max=4.53ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.41ms  min=2.4ms   med=31.57ms max=340.77ms p(90)=42.77ms  p(95)=47.33ms  p(99.9)=85.59ms
       { expected_response:true }...: avg=32.41ms  min=2.4ms   med=31.57ms max=340.77ms p(90)=42.77ms  p(95)=47.33ms  p(99.9)=85.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183696
     http_req_receiving.............: avg=111.62µs min=29.75µs med=62.83µs max=102.8ms  p(90)=136.83µs p(95)=288.32µs p(99.9)=4.66ms 
     http_req_sending...............: avg=48µs     min=5.43µs  med=10.43µs max=261.44ms p(90)=24.48µs  p(95)=136.35µs p(99.9)=3.42ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.25ms  min=2.26ms  med=31.44ms max=303.47ms p(90)=42.6ms   p(95)=47.09ms  p(99.9)=84.97ms
     http_reqs......................: 183696  1526.840114/s
     iteration_duration.............: avg=32.67ms  min=3.52ms  med=31.81ms max=349.87ms p(90)=43.02ms  p(95)=47.56ms  p(99.9)=86.56ms
     iterations.....................: 183596  1526.008936/s
     success_rate...................: 100.00% ✓ 183596      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 432744      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 173 MB  1.4 MB/s
     http_req_blocked...............: avg=3.37µs  min=992ns   med=2.28µs  max=4.27ms   p(90)=3.83µs   p(95)=4.51µs   p(99.9)=34.03µs
     http_req_connecting............: avg=721ns   min=0s      med=0s      max=4.22ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.34ms min=2.27ms  med=40.81ms max=309.16ms p(90)=58.1ms   p(95)=63.43ms  p(99.9)=89.28ms
       { expected_response:true }...: avg=41.34ms min=2.27ms  med=40.81ms max=309.16ms p(90)=58.1ms   p(95)=63.43ms  p(99.9)=89.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144348
     http_req_receiving.............: avg=83.23µs min=29.05µs med=64.32µs max=44.72ms  p(90)=103.56µs p(95)=123.26µs p(99.9)=1.7ms  
     http_req_sending...............: avg=25.92µs min=5.38µs  med=10.89µs max=45.63ms  p(90)=17.62µs  p(95)=21.42µs  p(99.9)=1.27ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.23ms min=2.16ms  med=40.7ms  max=301.27ms p(90)=57.99ms  p(95)=63.31ms  p(99.9)=89.07ms
     http_reqs......................: 144348  1200.074163/s
     iteration_duration.............: avg=41.58ms min=4ms     med=41.01ms max=357.95ms p(90)=58.31ms  p(95)=63.64ms  p(99.9)=90.14ms
     iterations.....................: 144248  1199.242787/s
     success_rate...................: 100.00% ✓ 144248      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 190191     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 76 MB   632 kB/s
     http_req_blocked...............: avg=4.94µs  min=1.18µs  med=3.11µs  max=3.99ms   p(90)=4.72µs   p(95)=5.35µs   p(99.9)=53.91µs 
     http_req_connecting............: avg=1.56µs  min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.26ms min=4.28ms  med=90.47ms max=369.42ms p(90)=116.33ms p(95)=131.3ms  p(99.9)=232.53ms
       { expected_response:true }...: avg=94.26ms min=4.28ms  med=90.47ms max=369.42ms p(90)=116.33ms p(95)=131.3ms  p(99.9)=232.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63497
     http_req_receiving.............: avg=97.03µs min=31.76µs med=81.25µs max=219.16ms p(90)=116.76µs p(95)=130.31µs p(99.9)=965.68µs
     http_req_sending...............: avg=35.35µs min=5.97µs  med=14.26µs max=218.52ms p(90)=21.08µs  p(95)=23.36µs  p(99.9)=684.74µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.13ms min=4.19ms  med=90.35ms max=354.14ms p(90)=116.2ms  p(95)=131.16ms p(99.9)=231.16ms
     http_reqs......................: 63497   526.62884/s
     iteration_duration.............: avg=94.65ms min=20.65ms med=90.73ms max=379.16ms p(90)=116.59ms p(95)=131.64ms p(99.9)=234.48ms
     iterations.....................: 63397   525.799464/s
     success_rate...................: 100.00% ✓ 63397      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 145872     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   485 kB/s
     http_req_blocked...............: avg=5.37µs   min=1.2µs   med=3.56µs   max=4.42ms   p(90)=5.06µs   p(95)=5.65µs   p(99.9)=133.3µs 
     http_req_connecting............: avg=1.51µs   min=0s      med=0s       max=3.71ms   p(90)=0s       p(95)=0s       p(99.9)=95.85µs 
     http_req_duration..............: avg=122.9ms  min=5.95ms  med=120.37ms max=337.91ms p(90)=163.1ms  p(95)=175.77ms p(99.9)=226.42ms
       { expected_response:true }...: avg=122.9ms  min=5.95ms  med=120.37ms max=337.91ms p(90)=163.1ms  p(95)=175.77ms p(99.9)=226.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48724
     http_req_receiving.............: avg=93.42µs  min=31.38µs med=88.3µs   max=32.93ms  p(90)=119.84µs p(95)=132.05µs p(99.9)=645.93µs
     http_req_sending...............: avg=24.18µs  min=5.65µs  med=17.16µs  max=67.45ms  p(90)=22.26µs  p(95)=24.09µs  p(99.9)=612.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.78ms min=5.86ms  med=120.26ms max=337.43ms p(90)=162.98ms p(95)=175.61ms p(99.9)=226.34ms
     http_reqs......................: 48724   403.562239/s
     iteration_duration.............: avg=123.42ms min=33.36ms med=120.69ms max=360.76ms p(90)=163.41ms p(95)=176.05ms p(99.9)=228.23ms
     iterations.....................: 48624   402.733977/s
     success_rate...................: 100.00% ✓ 48624      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 84300      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   280 kB/s
     http_req_blocked...............: avg=7.38µs   min=1.34µs  med=3.45µs   max=4.32ms   p(90)=4.85µs   p(95)=5.42µs   p(99.9)=1.76ms  
     http_req_connecting............: avg=3.72µs   min=0s      med=0s       max=4.28ms   p(90)=0s       p(95)=0s       p(99.9)=1.73ms  
     http_req_duration..............: avg=212.61ms min=6.48ms  med=195.22ms max=723.85ms p(90)=239.38ms p(95)=463.36ms p(99.9)=603.83ms
       { expected_response:true }...: avg=212.61ms min=6.48ms  med=195.22ms max=723.85ms p(90)=239.38ms p(95)=463.36ms p(99.9)=603.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28200
     http_req_receiving.............: avg=99.68µs  min=35.5µs  med=94.32µs  max=34.98ms  p(90)=125.2µs  p(95)=138.08µs p(99.9)=498.22µs
     http_req_sending...............: avg=39.93µs  min=6.29µs  med=17.2µs   max=128.73ms p(90)=22.17µs  p(95)=23.87µs  p(99.9)=794.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=212.47ms min=6.38ms  med=195.1ms  max=723.75ms p(90)=239.22ms p(95)=463.24ms p(99.9)=603.71ms
     http_reqs......................: 28200   233.226373/s
     iteration_duration.............: avg=213.65ms min=54.62ms med=195.57ms max=724.05ms p(90)=239.79ms p(95)=464.31ms p(99.9)=604.13ms
     iterations.....................: 28100   232.399329/s
     success_rate...................: 100.00% ✓ 28100      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 83970      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   279 kB/s
     http_req_blocked...............: avg=7.27µs   min=1.32µs  med=3.32µs   max=4.63ms   p(90)=4.63µs   p(95)=5.19µs   p(99.9)=1.87ms  
     http_req_connecting............: avg=3.67µs   min=0s      med=0s       max=4.59ms   p(90)=0s       p(95)=0s       p(99.9)=1.78ms  
     http_req_duration..............: avg=213.48ms min=8.63ms  med=210.4ms  max=440.07ms p(90)=228.41ms p(95)=242.53ms p(99.9)=300.71ms
       { expected_response:true }...: avg=213.48ms min=8.63ms  med=210.4ms  max=440.07ms p(90)=228.41ms p(95)=242.53ms p(99.9)=300.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28090
     http_req_receiving.............: avg=110.29µs min=34.45µs med=91.78µs  max=148.05ms p(90)=123.23µs p(95)=135.93µs p(99.9)=635.49µs
     http_req_sending...............: avg=38.27µs  min=6.18µs  med=16.27µs  max=135.2ms  p(90)=21.38µs  p(95)=23.19µs  p(99.9)=661.26µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=213.33ms min=8.52ms  med=210.28ms max=439.61ms p(90)=228.28ms p(95)=242.4ms  p(99.9)=300.34ms
     http_reqs......................: 28090   231.945546/s
     iteration_duration.............: avg=214.52ms min=64.32ms med=210.72ms max=451.33ms p(90)=228.71ms p(95)=243.1ms  p(99.9)=305.8ms 
     iterations.....................: 27990   231.119823/s
     success_rate...................: 100.00% ✓ 27990      ✗ 0    
     vus............................: 42      min=42       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

