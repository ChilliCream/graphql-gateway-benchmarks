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
| hive-router | v0.0.65 | 1,586 | 1,615 | 1,577 | 0.8% |  |
| fusion | 16.1.4 | 1,450 | 1,465 | 1,433 | 0.8% |  |
| fusion-nightly | 16.2.0-p.1 | 1,437 | 1,458 | 1,431 | 0.6% |  |
| grafbase | 0.53.5 | 1,139 | 1,154 | 1,129 | 0.8% |  |
| cosmo | 0.321.1 | 1,121 | 1,126 | 1,117 | 0.4% | non-compatible response (5 across 4/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 523 | 536 | 514 | 1.2% |  |
| apollo-router | v2.15.0 | 374 | 385 | 368 | 1.5% |  |
| hive-gateway | 2.8.2 | 241 | 246 | 238 | 1.2% |  |
| apollo-gateway | 2.14.1 | 235 | 236 | 231 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 580236      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=3.2µs   min=972ns   med=2.11µs  max=4.32ms   p(90)=4.03µs   p(95)=5µs      p(99.9)=32.63µs
     http_req_connecting............: avg=588ns   min=0s      med=0s      max=4.28ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.77ms min=14.22ms med=30.55ms max=323.38ms p(90)=36.4ms   p(95)=38.29ms  p(99.9)=56.67ms
       { expected_response:true }...: avg=30.77ms min=14.22ms med=30.55ms max=323.38ms p(90)=36.4ms   p(95)=38.29ms  p(99.9)=56.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193512
     http_req_receiving.............: avg=85.15µs min=27.23µs med=51.76µs max=143.01ms p(90)=105.72µs p(95)=158.06µs p(99.9)=2.79ms 
     http_req_sending...............: avg=34.76µs min=5.04µs  med=9.24µs  max=108.08ms p(90)=19.99µs  p(95)=86.14µs  p(99.9)=1.81ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.65ms min=14.17ms med=30.44ms max=312.8ms  p(90)=36.27ms  p(95)=38.14ms  p(99.9)=55.08ms
     http_reqs......................: 193512  1586.109944/s
     iteration_duration.............: avg=31.01ms min=14.4ms  med=30.77ms max=345.91ms p(90)=36.61ms  p(95)=38.5ms   p(99.9)=57.01ms
     iterations.....................: 193412  1585.2903/s
     success_rate...................: 100.00% ✓ 193412      ✗ 0     
     vus............................: 39      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.1.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 530787      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 213 MB  1.7 MB/s
     http_req_blocked...............: avg=3.17µs   min=972ns   med=2.15µs   max=3.95ms   p(90)=3.94µs  p(95)=4.86µs   p(99.9)=29.46µs
     http_req_connecting............: avg=553ns    min=0s      med=0s       max=3.9ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.67ms  min=13.92ms med=32.71ms  max=333.75ms p(90)=41.47ms p(95)=44.71ms  p(99.9)=97.07ms
       { expected_response:true }...: avg=33.67ms  min=13.92ms med=32.71ms  max=333.75ms p(90)=41.47ms p(95)=44.71ms  p(99.9)=97.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177029
     http_req_receiving.............: avg=772.95µs min=50.53µs med=116.18µs max=136.03ms p(90)=2.22ms  p(95)=3.32ms   p(99.9)=14.73ms
     http_req_sending...............: avg=35.92µs  min=5.04µs  med=9.12µs   max=157.26ms p(90)=20.05µs p(95)=101.05µs p(99.9)=2.35ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.86ms  min=13.81ms med=31.9ms   max=333.07ms p(90)=40.39ms p(95)=43.54ms  p(99.9)=96.26ms
     http_reqs......................: 177029  1450.687241/s
     iteration_duration.............: avg=33.9ms   min=14.19ms med=32.94ms  max=348.19ms p(90)=41.68ms p(95)=44.93ms  p(99.9)=97.48ms
     iterations.....................: 176929  1449.867778/s
     success_rate...................: 100.00% ✓ 176929      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.2.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 525966      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 211 MB  1.7 MB/s
     http_req_blocked...............: avg=3.09µs   min=1µs     med=2.05µs   max=4ms      p(90)=3.85µs  p(95)=4.77µs   p(99.9)=31.95µs
     http_req_connecting............: avg=547ns    min=0s      med=0s       max=3.97ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.97ms  min=14.11ms med=32.76ms  max=484.72ms p(90)=41.6ms  p(95)=45.18ms  p(99.9)=86.79ms
       { expected_response:true }...: avg=33.97ms  min=14.11ms med=32.76ms  max=484.72ms p(90)=41.6ms  p(95)=45.18ms  p(99.9)=86.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175422
     http_req_receiving.............: avg=726.97µs min=49.45µs med=108.28µs max=197.75ms p(90)=2.17ms  p(95)=3.27ms   p(99.9)=14.56ms
     http_req_sending...............: avg=36.26µs  min=5.17µs  med=8.88µs   max=241.9ms  p(90)=19.72µs p(95)=102.07µs p(99.9)=2.5ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.21ms  min=14.02ms med=32.01ms  max=484.64ms p(90)=40.58ms p(95)=44.15ms  p(99.9)=85.51ms
     http_reqs......................: 175422  1437.930046/s
     iteration_duration.............: avg=34.21ms  min=14.34ms med=32.98ms  max=484.91ms p(90)=41.83ms p(95)=45.4ms   p(99.9)=88.16ms
     iterations.....................: 175322  1437.110348/s
     success_rate...................: 100.00% ✓ 175322      ✗ 0     
     vus............................: 17      min=0         max=50  
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

     checks.........................: 100.00% ✓ 416754      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.65µs   min=942ns   med=2.24µs  max=5.44ms   p(90)=4.58µs   p(95)=5.69µs   p(99.9)=42.96µs
     http_req_connecting............: avg=700ns    min=0s      med=0s      max=3.82ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.91ms  min=16.84ms med=42.46ms max=330.16ms p(90)=52.31ms  p(95)=55.52ms  p(99.9)=82.28ms
       { expected_response:true }...: avg=42.91ms  min=16.84ms med=42.46ms max=330.16ms p(90)=52.31ms  p(95)=55.52ms  p(99.9)=82.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139018
     http_req_receiving.............: avg=118.85µs min=28.95µs med=58.06µs max=192.05ms p(90)=129.97µs p(95)=205.37µs p(99.9)=3.61ms 
     http_req_sending...............: avg=37.52µs  min=5.01µs  med=9.66µs  max=239.47ms p(90)=23.28µs  p(95)=109.36µs p(99.9)=1.97ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.76ms  min=16.76ms med=42.34ms max=189.41ms p(90)=52.19ms  p(95)=55.36ms  p(99.9)=81.25ms
     http_reqs......................: 139018  1139.318232/s
     iteration_duration.............: avg=43.18ms  min=17.04ms med=42.7ms  max=354.14ms p(90)=52.54ms  p(95)=55.76ms  p(99.9)=83.11ms
     iterations.....................: 138918  1138.498685/s
     success_rate...................: 100.00% ✓ 138918      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 410217      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 164 MB  1.3 MB/s
     http_req_blocked...............: avg=3.42µs  min=1.04µs  med=2.54µs  max=5.15ms   p(90)=4.29µs  p(95)=5.07µs   p(99.9)=37.59µs
     http_req_connecting............: avg=455ns   min=0s      med=0s      max=3.12ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.64ms min=17.8ms  med=43.06ms max=340.39ms p(90)=53.04ms p(95)=56.22ms  p(99.9)=75.55ms
       { expected_response:true }...: avg=43.64ms min=17.8ms  med=43.06ms max=340.39ms p(90)=53.04ms p(95)=56.22ms  p(99.9)=75.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136839
     http_req_receiving.............: avg=85.59µs min=29.2µs  med=64.05µs max=98.94ms  p(90)=110.1µs p(95)=135.92µs p(99.9)=1.9ms  
     http_req_sending...............: avg=27.66µs min=5.15µs  med=10.77µs max=137.8ms  p(90)=18.52µs p(95)=23.15µs  p(99.9)=1.19ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.52ms min=17.64ms med=42.96ms max=335.62ms p(90)=52.91ms p(95)=56.1ms   p(99.9)=74.97ms
     http_reqs......................: 136839  1121.325882/s
     iteration_duration.............: avg=43.87ms min=19.81ms med=43.27ms max=356.69ms p(90)=53.24ms p(95)=56.43ms  p(99.9)=75.91ms
     iterations.....................: 136739  1120.506433/s
     success_rate...................: 100.00% ✓ 136739      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 192036     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   629 kB/s
     http_req_blocked...............: avg=4.8µs   min=1.18µs  med=2.88µs  max=4.12ms   p(90)=4.48µs   p(95)=5.14µs   p(99.9)=51.02µs 
     http_req_connecting............: avg=1.65µs  min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.37ms min=19.03ms med=91.32ms max=357.28ms p(90)=110.33ms p(95)=118.4ms  p(99.9)=225.79ms
       { expected_response:true }...: avg=93.37ms min=19.03ms med=91.32ms max=357.28ms p(90)=110.33ms p(95)=118.4ms  p(99.9)=225.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64112
     http_req_receiving.............: avg=85.98µs min=31.7µs  med=75.89µs max=111.12ms p(90)=112.44µs p(95)=126.19µs p(99.9)=908.29µs
     http_req_sending...............: avg=26.9µs  min=5.59µs  med=13.14µs max=143.79ms p(90)=19.71µs  p(95)=22.14µs  p(99.9)=685.65µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.26ms min=18.88ms med=91.22ms max=356.82ms p(90)=110.24ms p(95)=118.28ms p(99.9)=225.43ms
     http_reqs......................: 64112   523.523278/s
     iteration_duration.............: avg=93.74ms min=30.57ms med=91.56ms max=365.18ms p(90)=110.56ms p(95)=118.67ms p(99.9)=229.83ms
     iterations.....................: 64012   522.706702/s
     success_rate...................: 100.00% ✓ 64012      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 137121     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   449 kB/s
     http_req_blocked...............: avg=4.93µs   min=1.25µs  med=3.37µs   max=3.24ms   p(90)=4.91µs   p(95)=5.53µs   p(99.9)=171.98µs
     http_req_connecting............: avg=1.35µs   min=0s      med=0s       max=3.21ms   p(90)=0s       p(95)=0s       p(99.9)=108.16µs
     http_req_duration..............: avg=130.8ms  min=20.44ms med=128.7ms  max=363ms    p(90)=163.75ms p(95)=174.24ms p(99.9)=224.35ms
       { expected_response:true }...: avg=130.8ms  min=20.44ms med=128.7ms  max=363ms    p(90)=163.75ms p(95)=174.24ms p(99.9)=224.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45807
     http_req_receiving.............: avg=101.24µs min=31.58µs med=85.25µs  max=136.85ms p(90)=119.03µs p(95)=131.86µs p(99.9)=939.37µs
     http_req_sending...............: avg=30.3µs   min=5.62µs  med=15.53µs  max=189.08ms p(90)=21.33µs  p(95)=23.48µs  p(99.9)=764.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=130.67ms min=20.26ms med=128.59ms max=362.04ms p(90)=163.63ms p(95)=174.12ms p(99.9)=222.59ms
     http_reqs......................: 45807   374.040364/s
     iteration_duration.............: avg=131.31ms min=42.72ms med=129.01ms max=379.37ms p(90)=164.03ms p(95)=174.54ms p(99.9)=229.61ms
     iterations.....................: 45707   373.223806/s
     success_rate...................: 100.00% ✓ 45707      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 88251      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=7.47µs   min=1.25µs  med=3.67µs   max=4.55ms   p(90)=5.32µs   p(95)=5.99µs   p(99.9)=1.63ms  
     http_req_connecting............: avg=3.49µs   min=0s      med=0s       max=4.5ms    p(90)=0s       p(95)=0s       p(99.9)=1.53ms  
     http_req_duration..............: avg=203.13ms min=18.79ms med=187.69ms max=678.24ms p(90)=241.49ms p(95)=281.31ms p(99.9)=629.4ms 
       { expected_response:true }...: avg=203.13ms min=18.79ms med=187.69ms max=678.24ms p(90)=241.49ms p(95)=281.31ms p(99.9)=629.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29517
     http_req_receiving.............: avg=150.54µs min=35.97µs med=100.08µs max=193.9ms  p(90)=133.61µs p(95)=147.8µs  p(99.9)=6.21ms  
     http_req_sending...............: avg=42.75µs  min=6.38µs  med=18.32µs  max=143.34ms p(90)=23.7µs   p(95)=25.54µs  p(99.9)=681.26µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.93ms min=18.63ms med=187.54ms max=678.06ms p(90)=241.29ms p(95)=281ms    p(99.9)=629.19ms
     http_reqs......................: 29517   241.549239/s
     iteration_duration.............: avg=204.08ms min=28.72ms med=188.11ms max=678.52ms p(90)=241.95ms p(95)=283.47ms p(99.9)=629.69ms
     iterations.....................: 29417   240.730899/s
     success_rate...................: 100.00% ✓ 29417      ✗ 0    
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

     checks.........................: 100.00% ✓ 86382      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   282 kB/s
     http_req_blocked...............: avg=7.08µs   min=1.31µs  med=3.36µs   max=4.12ms   p(90)=4.73µs   p(95)=5.33µs   p(99.9)=1.84ms  
     http_req_connecting............: avg=3.49µs   min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=207.58ms min=24.01ms med=198.43ms max=410.51ms p(90)=288.95ms p(95)=295.12ms p(99.9)=374.97ms
       { expected_response:true }...: avg=207.58ms min=24.01ms med=198.43ms max=410.51ms p(90)=288.95ms p(95)=295.12ms p(99.9)=374.97ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28894
     http_req_receiving.............: avg=96.91µs  min=34.68µs med=91.34µs  max=23.19ms  p(90)=125.27µs p(95)=138.83µs p(99.9)=640.86µs
     http_req_sending...............: avg=32.93µs  min=6.16µs  med=16.46µs  max=127.84ms p(90)=22.13µs  p(95)=24.24µs  p(99.9)=636µs   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.45ms min=23.83ms med=198.32ms max=409.89ms p(90)=288.82ms p(95)=295.01ms p(99.9)=374.87ms
     http_reqs......................: 28894   235.124629/s
     iteration_duration.............: avg=208.51ms min=66.44ms med=198.72ms max=447.43ms p(90)=289.26ms p(95)=295.39ms p(99.9)=378.76ms
     iterations.....................: 28794   234.310881/s
     success_rate...................: 100.00% ✓ 28794      ✗ 0    
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

