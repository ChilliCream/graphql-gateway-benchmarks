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
| fusion-nightly | 16.4.0-p.9 | 1,555 | 1,577 | 1,549 | 0.7% |  |
| hive-router | v0.0.74 | 1,555 | 1,580 | 1,549 | 0.7% |  |
| fusion | 16.3.0 | 1,541 | 1,565 | 1,534 | 0.6% |  |
| grafbase | 0.53.5 | 1,111 | 1,140 | 1,101 | 1.1% |  |
| cosmo | 0.326.1 | 1,103 | 1,121 | 1,097 | 0.7% |  |
| hive-gateway-router-runtime | 2.10.0 | 528 | 540 | 522 | 1.0% |  |
| apollo-router | v2.15.1 | 375 | 388 | 370 | 1.8% |  |
| hive-gateway | 2.10.0 | 237 | 243 | 234 | 1.2% |  |
| apollo-gateway | 2.14.2 | 231 | 234 | 229 | 0.7% |  |
| feddi | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 569112      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 228 MB  1.9 MB/s
     http_req_blocked...............: avg=3.11µs   min=982ns   med=2.08µs   max=9.08ms   p(90)=3.81µs  p(95)=4.68µs   p(99.9)=29.29µs
     http_req_connecting............: avg=464ns    min=0s      med=0s       max=3.9ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.38ms  min=13.89ms med=30.81ms  max=339.33ms p(90)=38.56ms p(95)=41.13ms  p(99.9)=59.77ms
       { expected_response:true }...: avg=31.38ms  min=13.89ms med=30.81ms  max=339.33ms p(90)=38.56ms p(95)=41.13ms  p(99.9)=59.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 189804
     http_req_receiving.............: avg=645.35µs min=51.52µs med=114.05µs max=279.96ms p(90)=1.82ms  p(95)=2.8ms    p(99.9)=13.2ms 
     http_req_sending...............: avg=40.22µs  min=5.1µs   med=9.06µs   max=288.18ms p(90)=19.6µs  p(95)=105.88µs p(99.9)=2.12ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.69ms  min=13.81ms med=30.17ms  max=334.16ms p(90)=37.67ms p(95)=40.16ms  p(99.9)=58.2ms 
     http_reqs......................: 189804  1555.64196/s
     iteration_duration.............: avg=31.62ms  min=14.07ms med=31.03ms  max=347.76ms p(90)=38.77ms p(95)=41.35ms  p(99.9)=60.17ms
     iterations.....................: 189704  1554.822356/s
     success_rate...................: 100.00% ✓ 189704      ✗ 0     
     vus............................: 17      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 569073      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 228 MB  1.9 MB/s
     http_req_blocked...............: avg=3.56µs  min=1µs     med=2.48µs  max=5.73ms   p(90)=4.35µs   p(95)=5.27µs   p(99.9)=41.01µs
     http_req_connecting............: avg=554ns   min=0s      med=0s      max=4.67ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.37ms min=14.41ms med=31.06ms max=329.15ms p(90)=37.39ms  p(95)=39.39ms  p(99.9)=57.49ms
       { expected_response:true }...: avg=31.37ms min=14.41ms med=31.06ms max=329.15ms p(90)=37.39ms  p(95)=39.39ms  p(99.9)=57.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 189791
     http_req_receiving.............: avg=86.91µs min=27.02µs med=56.12µs max=73.89ms  p(90)=108.56µs p(95)=154.59µs p(99.9)=2.3ms  
     http_req_sending...............: avg=37.73µs min=5.14µs  med=10.12µs max=152.2ms  p(90)=19.96µs  p(95)=54.73µs  p(99.9)=1.94ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.25ms min=14.34ms med=30.95ms max=328.45ms p(90)=37.26ms  p(95)=39.25ms  p(99.9)=56.39ms
     http_reqs......................: 189791  1555.340786/s
     iteration_duration.............: avg=31.62ms min=14.71ms med=31.28ms max=361.56ms p(90)=37.6ms   p(95)=39.61ms  p(99.9)=58.03ms
     iterations.....................: 189691  1554.521285/s
     success_rate...................: 100.00% ✓ 189691      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 563994      ✗ 0     
     data_received..................: 17 GB   135 MB/s
     data_sent......................: 226 MB  1.9 MB/s
     http_req_blocked...............: avg=3.26µs   min=1µs     med=2.23µs  max=7.78ms   p(90)=3.96µs  p(95)=4.81µs   p(99.9)=36.3µs 
     http_req_connecting............: avg=484ns    min=0s      med=0s      max=4.08ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.67ms  min=13.93ms med=31.04ms max=331.35ms p(90)=38.95ms p(95)=41.76ms  p(99.9)=63.99ms
       { expected_response:true }...: avg=31.67ms  min=13.93ms med=31.04ms max=331.35ms p(90)=38.95ms p(95)=41.76ms  p(99.9)=63.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 188098
     http_req_receiving.............: avg=597.16µs min=50.92µs med=110.1µs max=111.96ms p(90)=1.63ms  p(95)=2.58ms   p(99.9)=17.23ms
     http_req_sending...............: avg=36.66µs  min=5.1µs   med=9.34µs  max=68.17ms  p(90)=19.63µs p(95)=105.88µs p(99.9)=2.13ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.03ms  min=13.81ms med=30.44ms max=330.37ms p(90)=38.13ms p(95)=40.81ms  p(99.9)=61.43ms
     http_reqs......................: 188098  1541.480598/s
     iteration_duration.............: avg=31.9ms   min=14.59ms med=31.26ms max=347.48ms p(90)=39.17ms p(95)=41.99ms  p(99.9)=64.3ms 
     iterations.....................: 187998  1540.661089/s
     success_rate...................: 100.00% ✓ 187998      ✗ 0     
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

     checks.........................: 100.00% ✓ 406596      ✗ 0     
     data_received..................: 12 GB   97 MB/s
     data_sent......................: 163 MB  1.3 MB/s
     http_req_blocked...............: avg=3.6µs   min=992ns   med=2.21µs  max=4.8ms    p(90)=4.57µs   p(95)=5.74µs   p(99.9)=46.62µs
     http_req_connecting............: avg=767ns   min=0s      med=0s      max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.98ms min=17.34ms med=43.54ms max=320.23ms p(90)=53.41ms  p(95)=56.67ms  p(99.9)=92.01ms
       { expected_response:true }...: avg=43.98ms min=17.34ms med=43.54ms max=320.23ms p(90)=53.41ms  p(95)=56.67ms  p(99.9)=92.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135632
     http_req_receiving.............: avg=96.89µs min=28.97µs med=59.62µs max=170.76ms p(90)=131.29µs p(95)=196.49µs p(99.9)=2.99ms 
     http_req_sending...............: avg=36.26µs min=5.19µs  med=9.78µs  max=180.54ms p(90)=23.06µs  p(95)=105.06µs p(99.9)=1.99ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.85ms min=17.21ms med=43.42ms max=319.65ms p(90)=53.28ms  p(95)=56.51ms  p(99.9)=91.11ms
     http_reqs......................: 135632  1111.503427/s
     iteration_duration.............: avg=44.26ms min=18.25ms med=43.78ms max=363.95ms p(90)=53.64ms  p(95)=56.91ms  p(99.9)=93.15ms
     iterations.....................: 135532  1110.683928/s
     success_rate...................: 100.00% ✓ 135532      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 403698      ✗ 0     
     data_received..................: 12 GB   97 MB/s
     data_sent......................: 162 MB  1.3 MB/s
     http_req_blocked...............: avg=3.58µs  min=1.02µs  med=2.42µs  max=4.13ms   p(90)=4.14µs   p(95)=4.91µs   p(99.9)=37.46µs
     http_req_connecting............: avg=766ns   min=0s      med=0s      max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.34ms min=15.67ms med=43.72ms max=338ms    p(90)=53.84ms  p(95)=57.17ms  p(99.9)=75.63ms
       { expected_response:true }...: avg=44.34ms min=15.67ms med=43.72ms max=338ms    p(90)=53.84ms  p(95)=57.17ms  p(99.9)=75.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134666
     http_req_receiving.............: avg=90.36µs min=29.87µs med=67.9µs  max=169.88ms p(90)=114.03µs p(95)=139.27µs p(99.9)=1.54ms 
     http_req_sending...............: avg=26.96µs min=4.86µs  med=10.94µs max=148.24ms p(90)=18.5µs   p(95)=22.89µs  p(99.9)=1.12ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=44.22ms min=15.6ms  med=43.61ms max=337.3ms  p(90)=53.72ms  p(95)=57.04ms  p(99.9)=75.25ms
     http_reqs......................: 134666  1103.428742/s
     iteration_duration.............: avg=44.58ms min=19.89ms med=43.93ms max=370.41ms p(90)=54.04ms  p(95)=57.38ms  p(99.9)=76.01ms
     iterations.....................: 134566  1102.609361/s
     success_rate...................: 100.00% ✓ 134566      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 193929     ✗ 0    
     data_received..................: 5.7 GB  46 MB/s
     data_sent......................: 78 MB   635 kB/s
     http_req_blocked...............: avg=4.91µs  min=1.11µs  med=3.13µs  max=3.92ms   p(90)=4.74µs   p(95)=5.41µs   p(99.9)=51.1µs  
     http_req_connecting............: avg=1.48µs  min=0s      med=0s      max=3.88ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.45ms min=20.62ms med=90.92ms max=356.29ms p(90)=114.25ms p(95)=123.28ms p(99.9)=229ms   
       { expected_response:true }...: avg=92.45ms min=20.62ms med=90.92ms max=356.29ms p(90)=114.25ms p(95)=123.28ms p(99.9)=229ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 64743
     http_req_receiving.............: avg=92.22µs min=31.48µs med=80.13µs max=107.85ms p(90)=116.91µs p(95)=131.21µs p(99.9)=977.54µs
     http_req_sending...............: avg=21.38µs min=5.76µs  med=14.24µs max=32.33ms  p(90)=20.84µs  p(95)=23.35µs  p(99.9)=733.82µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.34ms min=20.5ms  med=90.81ms max=334.53ms p(90)=114.15ms p(95)=123.16ms p(99.9)=228.86ms
     http_reqs......................: 64743   528.954444/s
     iteration_duration.............: avg=92.83ms min=27.43ms med=91.18ms max=372.86ms p(90)=114.49ms p(95)=123.58ms p(99.9)=231.21ms
     iterations.....................: 64643   528.137437/s
     success_rate...................: 100.00% ✓ 64643      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 137649     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   451 kB/s
     http_req_blocked...............: avg=5.66µs   min=1.16µs  med=3.2µs    max=4.14ms   p(90)=4.7µs    p(95)=5.31µs   p(99.9)=358.85µs
     http_req_connecting............: avg=2.24µs   min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=306.07µs
     http_req_duration..............: avg=130.29ms min=21.71ms med=128.26ms max=387.09ms p(90)=162.95ms p(95)=173.49ms p(99.9)=222.92ms
       { expected_response:true }...: avg=130.29ms min=21.71ms med=128.26ms max=387.09ms p(90)=162.95ms p(95)=173.49ms p(99.9)=222.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45983
     http_req_receiving.............: avg=94.09µs  min=31.89µs med=85.14µs  max=152.79ms p(90)=117.99µs p(95)=130.4µs  p(99.9)=756.29µs
     http_req_sending...............: avg=27.88µs  min=5.29µs  med=15.03µs  max=129.03ms p(90)=20.67µs  p(95)=22.76µs  p(99.9)=584.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=130.16ms min=21.62ms med=128.15ms max=367.76ms p(90)=162.82ms p(95)=173.35ms p(99.9)=222.36ms
     http_reqs......................: 45983   375.44399/s
     iteration_duration.............: avg=130.8ms  min=54.63ms med=128.56ms max=400.27ms p(90)=163.27ms p(95)=173.78ms p(99.9)=231.61ms
     iterations.....................: 45883   374.627506/s
     success_rate...................: 100.00% ✓ 45883      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 86877      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=5.72µs   min=1.3µs   med=3.71µs   max=2.8ms    p(90)=5.26µs   p(95)=5.89µs   p(99.9)=703.11µs
     http_req_connecting............: avg=1.65µs   min=0s      med=0s       max=2.48ms   p(90)=0s       p(95)=0s       p(99.9)=600.46µs
     http_req_duration..............: avg=206.41ms min=19.43ms med=191.54ms max=774.17ms p(90)=241.84ms p(95)=281.46ms p(99.9)=637.19ms
       { expected_response:true }...: avg=206.41ms min=19.43ms med=191.54ms max=774.17ms p(90)=241.84ms p(95)=281.46ms p(99.9)=637.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29059
     http_req_receiving.............: avg=105.44µs min=37.58µs med=100.47µs max=10.27ms  p(90)=134.44µs p(95)=148.42µs p(99.9)=558.24µs
     http_req_sending...............: avg=26.48µs  min=6.15µs  med=18.36µs  max=50.9ms   p(90)=23.68µs  p(95)=25.65µs  p(99.9)=571.66µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.28ms min=19.23ms med=191.4ms  max=774.03ms p(90)=241.71ms p(95)=281.36ms p(99.9)=637.05ms
     http_reqs......................: 29059   237.360566/s
     iteration_duration.............: avg=207.38ms min=61.66ms med=191.99ms max=774.45ms p(90)=242.31ms p(95)=283.29ms p(99.9)=637.5ms 
     iterations.....................: 28959   236.543743/s
     success_rate...................: 100.00% ✓ 28959      ✗ 0    
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

     checks.........................: 100.00% ✓ 85134      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   278 kB/s
     http_req_blocked...............: avg=7.16µs   min=1.21µs  med=3.35µs   max=4.13ms   p(90)=4.76µs   p(95)=5.33µs   p(99.9)=1.88ms  
     http_req_connecting............: avg=3.61µs   min=0s      med=0s       max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=1.85ms  
     http_req_duration..............: avg=210.63ms min=20.75ms med=243.2ms  max=437.31ms p(90)=277.02ms p(95)=283.4ms  p(99.9)=367.15ms
       { expected_response:true }...: avg=210.63ms min=20.75ms med=243.2ms  max=437.31ms p(90)=277.02ms p(95)=283.4ms  p(99.9)=367.15ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28478
     http_req_receiving.............: avg=175.27µs min=34.66µs med=93.12µs  max=112.56ms p(90)=126.54µs p(95)=139.4µs  p(99.9)=18.19ms 
     http_req_sending...............: avg=28.05µs  min=6.06µs  med=17.08µs  max=82.85ms  p(90)=22.36µs  p(95)=24.34µs  p(99.9)=557.79µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.42ms min=20.59ms med=243.06ms max=377.82ms p(90)=276.88ms p(95)=283.29ms p(99.9)=363.73ms
     http_reqs......................: 28478   231.759295/s
     iteration_duration.............: avg=211.57ms min=38.17ms med=243.57ms max=447.41ms p(90)=277.31ms p(95)=283.73ms p(99.9)=370.83ms
     iterations.....................: 28378   230.945477/s
     success_rate...................: 100.00% ✓ 28378      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-185-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

