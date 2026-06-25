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
| hive-router | v0.0.72 | 1,567 | 1,586 | 1,557 | 0.5% |  |
| fusion-nightly | 16.4.0-p.1 | 1,553 | 1,570 | 1,545 | 0.5% |  |
| fusion | 16.2.3 | 1,544 | 1,565 | 1,538 | 0.5% |  |
| grafbase | 0.53.5 | 1,120 | 1,134 | 1,107 | 0.7% |  |
| cosmo | 0.326.0 | 1,080 | 1,097 | 1,069 | 0.9% |  |
| hive-gateway-router-runtime | 2.9.0 | 523 | 537 | 516 | 1.3% |  |
| apollo-router | v2.15.1 | 373 | 385 | 369 | 1.5% |  |
| hive-gateway | 2.9.0 | 236 | 241 | 235 | 0.9% |  |
| apollo-gateway | 2.14.1 | 231 | 233 | 229 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 573381      ✗ 0     
     data_received..................: 17 GB   137 MB/s
     data_sent......................: 230 MB  1.9 MB/s
     http_req_blocked...............: avg=2.84µs  min=952ns   med=2.11µs  max=4.31ms   p(90)=4.12µs  p(95)=5.1µs    p(99.9)=32.36µs
     http_req_connecting............: avg=197ns   min=0s      med=0s      max=1.84ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.14ms min=13.73ms med=30.87ms max=323.17ms p(90)=37.04ms p(95)=38.95ms  p(99.9)=56.45ms
       { expected_response:true }...: avg=31.14ms min=13.73ms med=30.87ms max=323.17ms p(90)=37.04ms p(95)=38.95ms  p(99.9)=56.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 191227
     http_req_receiving.............: avg=84.48µs min=27.94µs med=53.99µs max=209.8ms  p(90)=107.1µs p(95)=152.43µs p(99.9)=2.08ms 
     http_req_sending...............: avg=33.07µs min=5.18µs  med=9.53µs  max=203.03ms p(90)=20.04µs p(95)=34.11µs  p(99.9)=1.61ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.02ms min=13.68ms med=30.77ms max=322.52ms p(90)=36.93ms p(95)=38.81ms  p(99.9)=55.47ms
     http_reqs......................: 191227  1567.065945/s
     iteration_duration.............: avg=31.38ms min=13.87ms med=31.09ms max=364.22ms p(90)=37.25ms p(95)=39.16ms  p(99.9)=57.05ms
     iterations.....................: 191127  1566.246465/s
     success_rate...................: 100.00% ✓ 191127      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 568116      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 228 MB  1.9 MB/s
     http_req_blocked...............: avg=3.31µs   min=951ns   med=2.25µs   max=4.61ms   p(90)=4.06µs  p(95)=4.95µs   p(99.9)=36.87µs
     http_req_connecting............: avg=567ns    min=0s      med=0s       max=4.1ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.42ms  min=13.73ms med=30.88ms  max=320.28ms p(90)=38.54ms p(95)=41.13ms  p(99.9)=63.15ms
       { expected_response:true }...: avg=31.42ms  min=13.73ms med=30.88ms  max=320.28ms p(90)=38.54ms p(95)=41.13ms  p(99.9)=63.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 189472
     http_req_receiving.............: avg=637.28µs min=50.87µs med=114.78µs max=200.04ms p(90)=1.8ms   p(95)=2.79ms   p(99.9)=12.63ms
     http_req_sending...............: avg=38.09µs  min=5.12µs  med=9.6µs    max=289.09ms p(90)=20.6µs  p(95)=101.62µs p(99.9)=2.19ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.75ms  min=13.66ms med=30.23ms  max=319.61ms p(90)=37.67ms p(95)=40.2ms   p(99.9)=60.68ms
     http_reqs......................: 189472  1553.343958/s
     iteration_duration.............: avg=31.67ms  min=13.88ms med=31.11ms  max=355.99ms p(90)=38.76ms p(95)=41.35ms  p(99.9)=64.02ms
     iterations.....................: 189372  1552.524131/s
     success_rate...................: 100.00% ✓ 189372      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.2.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 564930      ✗ 0     
     data_received..................: 17 GB   135 MB/s
     data_sent......................: 226 MB  1.9 MB/s
     http_req_blocked...............: avg=3.11µs   min=1µs     med=2.16µs   max=4.04ms   p(90)=3.96µs  p(95)=4.84µs   p(99.9)=33.9µs 
     http_req_connecting............: avg=487ns    min=0s      med=0s       max=4.01ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.62ms  min=13.89ms med=31.02ms  max=348.72ms p(90)=38.9ms  p(95)=41.54ms  p(99.9)=63.91ms
       { expected_response:true }...: avg=31.62ms  min=13.89ms med=31.02ms  max=348.72ms p(90)=38.9ms  p(95)=41.54ms  p(99.9)=63.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 188410
     http_req_receiving.............: avg=587.85µs min=50.48µs med=109.48µs max=32.9ms   p(90)=1.63ms  p(95)=2.59ms   p(99.9)=14.83ms
     http_req_sending...............: avg=36.68µs  min=5.17µs  med=9.38µs   max=108.72ms p(90)=20.04µs p(95)=105.06µs p(99.9)=2.23ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.99ms  min=13.8ms  med=30.43ms  max=347.76ms p(90)=38.08ms p(95)=40.64ms  p(99.9)=60.85ms
     http_reqs......................: 188410  1544.171988/s
     iteration_duration.............: avg=31.85ms  min=14.1ms  med=31.24ms  max=357.05ms p(90)=39.12ms p(95)=41.75ms  p(99.9)=64.41ms
     iterations.....................: 188310  1543.352407/s
     success_rate...................: 100.00% ✓ 188310      ✗ 0     
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

     checks.........................: 100.00% ✓ 409965      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 164 MB  1.3 MB/s
     http_req_blocked...............: avg=3.71µs  min=971ns   med=2.21µs  max=8.93ms   p(90)=4.76µs   p(95)=5.95µs   p(99.9)=44.1µs 
     http_req_connecting............: avg=744ns   min=0s      med=0s      max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.62ms min=17.1ms  med=43.21ms max=350.27ms p(90)=53.01ms  p(95)=56.25ms  p(99.9)=80.69ms
       { expected_response:true }...: avg=43.62ms min=17.1ms  med=43.21ms max=350.27ms p(90)=53.01ms  p(95)=56.25ms  p(99.9)=80.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136755
     http_req_receiving.............: avg=94.91µs min=28.86µs med=59.14µs max=25.48ms  p(90)=131.45µs p(95)=205.25µs p(99.9)=3.08ms 
     http_req_sending...............: avg=40.43µs min=5.37µs  med=9.9µs   max=161.37ms p(90)=24.2µs   p(95)=110.91µs p(99.9)=2.15ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.48ms min=16.99ms med=43.09ms max=349.56ms p(90)=52.86ms  p(95)=56.11ms  p(99.9)=79.53ms
     http_reqs......................: 136755  1120.649142/s
     iteration_duration.............: avg=43.9ms  min=17.64ms med=43.46ms max=377.33ms p(90)=53.24ms  p(95)=56.48ms  p(99.9)=81.38ms
     iterations.....................: 136655  1119.829684/s
     success_rate...................: 100.00% ✓ 136655      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 395223      ✗ 0     
     data_received..................: 12 GB   95 MB/s
     data_sent......................: 158 MB  1.3 MB/s
     http_req_blocked...............: avg=3.77µs  min=1.06µs  med=2.48µs  max=16.58ms  p(90)=4.2µs    p(95)=4.97µs   p(99.9)=36.36µs
     http_req_connecting............: avg=750ns   min=0s      med=0s      max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=45.29ms min=18.09ms med=44.7ms  max=351.66ms p(90)=55.18ms  p(95)=58.48ms  p(99.9)=75.57ms
       { expected_response:true }...: avg=45.29ms min=18.09ms med=44.7ms  max=351.66ms p(90)=55.18ms  p(95)=58.48ms  p(99.9)=75.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131841
     http_req_receiving.............: avg=90.08µs min=29.42µs med=69.06µs max=91.79ms  p(90)=116.12µs p(95)=141.72µs p(99.9)=1.65ms 
     http_req_sending...............: avg=27.04µs min=5.32µs  med=11.15µs max=84.6ms   p(90)=18.81µs  p(95)=23.33µs  p(99.9)=1.13ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=45.17ms min=17.94ms med=44.59ms max=343.43ms p(90)=55.05ms  p(95)=58.36ms  p(99.9)=74.79ms
     http_reqs......................: 131841  1080.280554/s
     iteration_duration.............: avg=45.54ms min=20.73ms med=44.91ms max=363.46ms p(90)=55.38ms  p(95)=58.68ms  p(99.9)=76.04ms
     iterations.....................: 131741  1079.461173/s
     success_rate...................: 100.00% ✓ 131741      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 191919     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   629 kB/s
     http_req_blocked...............: avg=5.11µs  min=1.15µs  med=3.12µs  max=4.3ms    p(90)=4.77µs   p(95)=5.44µs   p(99.9)=46.83µs 
     http_req_connecting............: avg=1.71µs  min=0s      med=0s      max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.43ms min=19.68ms med=91.96ms max=358.88ms p(90)=109.15ms p(95)=117.5ms  p(99.9)=222.24ms
       { expected_response:true }...: avg=93.43ms min=19.68ms med=91.96ms max=358.88ms p(90)=109.15ms p(95)=117.5ms  p(99.9)=222.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64073
     http_req_receiving.............: avg=92.23µs min=31.72µs med=80.63µs max=124.41ms p(90)=117.17µs p(95)=131.48µs p(99.9)=936.5µs 
     http_req_sending...............: avg=25.32µs min=5.72µs  med=14.4µs  max=89.62ms  p(90)=21.19µs  p(95)=23.67µs  p(99.9)=716.99µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.31ms min=19.29ms med=91.86ms max=358.24ms p(90)=109.04ms p(95)=117.39ms p(99.9)=221.49ms
     http_reqs......................: 64073   523.505462/s
     iteration_duration.............: avg=93.79ms min=39.69ms med=92.21ms max=370.82ms p(90)=109.4ms  p(95)=117.78ms p(99.9)=223.31ms
     iterations.....................: 63973   522.688416/s
     success_rate...................: 100.00% ✓ 63973      ✗ 0    
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

     checks.........................: 100.00% ✓ 136896     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   448 kB/s
     http_req_blocked...............: avg=6.08µs   min=1.1µs   med=3.48µs   max=4.47ms   p(90)=5.01µs   p(95)=5.6µs    p(99.9)=949.94µs
     http_req_connecting............: avg=2.42µs   min=0s      med=0s       max=4.42ms   p(90)=0s       p(95)=0s       p(99.9)=924µs   
     http_req_duration..............: avg=131ms    min=21.25ms med=129.13ms max=395.56ms p(90)=163.34ms p(95)=174.1ms  p(99.9)=221.37ms
       { expected_response:true }...: avg=131ms    min=21.25ms med=129.13ms max=395.56ms p(90)=163.34ms p(95)=174.1ms  p(99.9)=221.37ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45732
     http_req_receiving.............: avg=96.92µs  min=30.03µs med=87µs     max=94.52ms  p(90)=120.66µs p(95)=133.68µs p(99.9)=701.92µs
     http_req_sending...............: avg=27.28µs  min=5.65µs  med=16.2µs   max=103.09ms p(90)=22.06µs  p(95)=24.09µs  p(99.9)=588.92µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=130.87ms min=21.09ms med=129.01ms max=395.27ms p(90)=163.22ms p(95)=173.96ms p(99.9)=221.3ms 
     http_reqs......................: 45732   373.406862/s
     iteration_duration.............: avg=131.52ms min=32.37ms med=129.42ms max=405.09ms p(90)=163.65ms p(95)=174.41ms p(99.9)=230.75ms
     iterations.....................: 45632   372.590351/s
     success_rate...................: 100.00% ✓ 45632      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86508      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   284 kB/s
     http_req_blocked...............: avg=5.8µs    min=1.3µs   med=3.72µs   max=2.58ms   p(90)=5.26µs   p(95)=5.9µs    p(99.9)=872.06µs
     http_req_connecting............: avg=1.81µs   min=0s      med=0s       max=2.55ms   p(90)=0s       p(95)=0s       p(99.9)=735.06µs
     http_req_duration..............: avg=207.24ms min=19.14ms med=191.38ms max=682.96ms p(90)=248.55ms p(95)=288.62ms p(99.9)=639.68ms
       { expected_response:true }...: avg=207.24ms min=19.14ms med=191.38ms max=682.96ms p(90)=248.55ms p(95)=288.62ms p(99.9)=639.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28936
     http_req_receiving.............: avg=110.92µs min=35.16µs med=99.28µs  max=79.94ms  p(90)=132.88µs p(95)=146.93µs p(99.9)=780.99µs
     http_req_sending...............: avg=34.14µs  min=6.27µs  med=18.09µs  max=101.01ms p(90)=23.47µs  p(95)=25.5µs   p(99.9)=657.1µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.1ms  min=19ms    med=191.23ms max=682.82ms p(90)=248.4ms  p(95)=288.46ms p(99.9)=639.58ms
     http_reqs......................: 28936   236.623395/s
     iteration_duration.............: avg=208.19ms min=51.15ms med=191.84ms max=683.2ms  p(90)=248.95ms p(95)=289.89ms p(99.9)=640.07ms
     iterations.....................: 28836   235.805648/s
     success_rate...................: 100.00% ✓ 28836      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 84912      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   277 kB/s
     http_req_blocked...............: avg=6.73µs   min=1.24µs  med=3.48µs   max=4.01ms   p(90)=4.9µs    p(95)=5.49µs   p(99.9)=1.22ms  
     http_req_connecting............: avg=3.03µs   min=0s      med=0s       max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=1.19ms  
     http_req_duration..............: avg=211.17ms min=24.06ms med=194.61ms max=415.17ms p(90)=309.21ms p(95)=314.72ms p(99.9)=399.28ms
       { expected_response:true }...: avg=211.17ms min=24.06ms med=194.61ms max=415.17ms p(90)=309.21ms p(95)=314.72ms p(99.9)=399.28ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28404
     http_req_receiving.............: avg=101.52µs min=32.86µs med=92.3µs   max=103.57ms p(90)=126.05µs p(95)=139.77µs p(99.9)=584.15µs
     http_req_sending...............: avg=33.79µs  min=6.13µs  med=16.66µs  max=149.35ms p(90)=22.18µs  p(95)=24.11µs  p(99.9)=933.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.03ms min=23.88ms med=193.73ms max=415.04ms p(90)=309.09ms p(95)=314.62ms p(99.9)=399.15ms
     http_reqs......................: 28404   231.069527/s
     iteration_duration.............: avg=212.13ms min=51.57ms med=204.26ms max=432.96ms p(90)=309.51ms p(95)=315.03ms p(99.9)=401.16ms
     iterations.....................: 28304   230.256017/s
     success_rate...................: 100.00% ✓ 28304      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

