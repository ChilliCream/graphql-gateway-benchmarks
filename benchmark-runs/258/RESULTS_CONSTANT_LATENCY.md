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
| hive-router | v0.0.74 | 1,822 | 1,864 | 1,816 | 0.9% |  |
| fusion | 16.3.0 | 1,768 | 1,806 | 1,765 | 0.8% |  |
| fusion-nightly | 16.4.0-p.14 | 1,730 | 1,771 | 1,724 | 0.9% |  |
| grafbase | 0.53.5 | 1,248 | 1,272 | 1,247 | 0.7% |  |
| cosmo | 0.326.1 | 1,164 | 1,183 | 1,161 | 0.6% |  |
| hive-gateway-router-runtime | 2.10.0 | 522 | 535 | 519 | 1.0% |  |
| apollo-router | v2.15.1 | 380 | 393 | 377 | 1.6% |  |
| hive-gateway | 2.10.0 | 233 | 237 | 233 | 0.6% |  |
| apollo-gateway | 2.14.2 | 231 | 233 | 230 | 0.4% |  |
| feddi | 77271dc84a06 | 15 | 16 | 14 | 4.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 666330      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 267 MB  2.2 MB/s
     http_req_blocked...............: avg=2.99µs  min=1.03µs  med=2.24µs  max=5.15ms   p(90)=3.79µs  p(95)=4.4µs    p(99.9)=33.52µs
     http_req_connecting............: avg=345ns   min=0s      med=0s      max=5.1ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.78ms min=17.9ms  med=26.32ms max=352.37ms p(90)=30.57ms p(95)=32.05ms  p(99.9)=50.36ms
       { expected_response:true }...: avg=26.78ms min=17.9ms  med=26.32ms max=352.37ms p(90)=30.57ms p(95)=32.05ms  p(99.9)=50.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 222210
     http_req_receiving.............: avg=75.56µs min=26.8µs  med=48.76µs max=125.82ms p(90)=90.47µs p(95)=117.61µs p(99.9)=2.8ms  
     http_req_sending...............: avg=34.05µs min=5.13µs  med=9.64µs  max=141.36ms p(90)=18.63µs p(95)=30.61µs  p(99.9)=1.65ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.67ms min=17.81ms med=26.23ms max=352.06ms p(90)=30.46ms p(95)=31.92ms  p(99.9)=49.29ms
     http_reqs......................: 222210  1822.178624/s
     iteration_duration.............: avg=27ms    min=18.57ms med=26.53ms max=361.92ms p(90)=30.78ms p(95)=32.26ms  p(99.9)=50.82ms
     iterations.....................: 222110  1821.358599/s
     success_rate...................: 100.00% ✓ 222110      ✗ 0     
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

     checks.........................: 100.00% ✓ 646485      ✗ 0     
     data_received..................: 19 GB   155 MB/s
     data_sent......................: 259 MB  2.1 MB/s
     http_req_blocked...............: avg=3.42µs   min=1.07µs  med=2.68µs   max=6.69ms   p(90)=4.28µs   p(95)=4.98µs  p(99.9)=37.12µs
     http_req_connecting............: avg=290ns    min=0s      med=0s       max=2.83ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.6ms   min=17.85ms med=26.92ms  max=346.85ms p(90)=32.35ms  p(95)=34.47ms p(99.9)=55.25ms
       { expected_response:true }...: avg=27.6ms   min=17.85ms med=26.92ms  max=346.85ms p(90)=32.35ms  p(95)=34.47ms p(99.9)=55.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 215595
     http_req_receiving.............: avg=377.02µs min=53.97µs med=109.03µs max=307.71ms p(90)=919.58µs p(95)=1.43ms  p(99.9)=9.83ms 
     http_req_sending...............: avg=41.13µs  min=5.25µs  med=10.66µs  max=146.02ms p(90)=20.33µs  p(95)=85.33µs p(99.9)=2.06ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.18ms  min=17.76ms med=26.53ms  max=346.37ms p(90)=31.85ms  p(95)=33.92ms p(99.9)=53.57ms
     http_reqs......................: 215595  1768.180495/s
     iteration_duration.............: avg=27.83ms  min=18.04ms med=27.14ms  max=364.57ms p(90)=32.58ms  p(95)=34.71ms p(99.9)=55.92ms
     iterations.....................: 215495  1767.360356/s
     success_rate...................: 100.00% ✓ 215495      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 632844      ✗ 0     
     data_received..................: 19 GB   152 MB/s
     data_sent......................: 254 MB  2.1 MB/s
     http_req_blocked...............: avg=3.75µs   min=1.13µs  med=2.8µs    max=6.37ms   p(90)=4.41µs  p(95)=5.11µs  p(99.9)=40.14µs
     http_req_connecting............: avg=516ns    min=0s      med=0s       max=4.25ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=28.19ms  min=17.96ms med=27.54ms  max=358.43ms p(90)=33.02ms p(95)=35.04ms p(99.9)=55.2ms 
       { expected_response:true }...: avg=28.19ms  min=17.96ms med=27.54ms  max=358.43ms p(90)=33.02ms p(95)=35.04ms p(99.9)=55.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 211048
     http_req_receiving.............: avg=452.15µs min=55.2µs  med=116.55µs max=318.62ms p(90)=1.07ms  p(95)=1.61ms  p(99.9)=10.4ms 
     http_req_sending...............: avg=37.67µs  min=5.39µs  med=10.87µs  max=26.24ms  p(90)=20.53µs p(95)=66.06µs p(99.9)=1.92ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.7ms   min=17.86ms med=27.1ms   max=144.38ms p(90)=32.48ms p(95)=34.48ms p(99.9)=52.69ms
     http_reqs......................: 211048  1730.648707/s
     iteration_duration.............: avg=28.43ms  min=18.21ms med=27.76ms  max=378.27ms p(90)=33.25ms p(95)=35.27ms p(99.9)=55.73ms
     iterations.....................: 210948  1729.82868/s
     success_rate...................: 100.00% ✓ 210948      ✗ 0     
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

     checks.........................: 100.00% ✓ 456597      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 183 MB  1.5 MB/s
     http_req_blocked...............: avg=4.29µs  min=1.09µs  med=2.74µs  max=31.32ms  p(90)=4.56µs   p(95)=5.35µs   p(99.9)=41.7µs 
     http_req_connecting............: avg=806ns   min=0s      med=0s      max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.16ms min=18.29ms med=38.87ms max=368.64ms p(90)=46.28ms  p(95)=48.57ms  p(99.9)=66.13ms
       { expected_response:true }...: avg=39.16ms min=18.29ms med=38.87ms max=368.64ms p(90)=46.28ms  p(95)=48.57ms  p(99.9)=66.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152299
     http_req_receiving.............: avg=86.69µs min=28.18µs med=54.74µs max=110.35ms p(90)=114.05µs p(95)=165.35µs p(99.9)=2.57ms 
     http_req_sending...............: avg=36.39µs min=4.87µs  med=10.47µs max=200.69ms p(90)=22.37µs  p(95)=95.12µs  p(99.9)=2.54ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.03ms min=18.12ms med=38.76ms max=350.64ms p(90)=46.16ms  p(95)=48.42ms  p(99.9)=64.61ms
     http_reqs......................: 152299  1248.562031/s
     iteration_duration.............: avg=39.41ms min=21.63ms med=39.11ms max=379.55ms p(90)=46.51ms  p(95)=48.8ms   p(99.9)=66.56ms
     iterations.....................: 152199  1247.742221/s
     success_rate...................: 100.00% ✓ 152199      ✗ 0     
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

     checks.........................: 100.00% ✓ 425661      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.7µs   min=1.2µs   med=2.87µs  max=3.47ms   p(90)=4.33µs   p(95)=4.98µs   p(99.9)=35.31µs
     http_req_connecting............: avg=513ns   min=0s      med=0s      max=3.44ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.03ms min=18.33ms med=41.39ms max=344.06ms p(90)=51.05ms  p(95)=54.04ms  p(99.9)=70.08ms
       { expected_response:true }...: avg=42.03ms min=18.33ms med=41.39ms max=344.06ms p(90)=51.05ms  p(95)=54.04ms  p(99.9)=70.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141987
     http_req_receiving.............: avg=84.93µs min=27.24µs med=65.63µs max=219.21ms p(90)=101.87µs p(95)=118.98µs p(99.9)=1.68ms 
     http_req_sending...............: avg=29µs    min=5.58µs  med=12.83µs max=130.66ms p(90)=18.87µs  p(95)=23.29µs  p(99.9)=1.15ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.91ms min=18.23ms med=41.28ms max=289.96ms p(90)=50.93ms  p(95)=53.92ms  p(99.9)=69.69ms
     http_reqs......................: 141987  1164.037744/s
     iteration_duration.............: avg=42.28ms min=23.7ms  med=41.6ms  max=366.02ms p(90)=51.26ms  p(95)=54.26ms  p(99.9)=70.6ms 
     iterations.....................: 141887  1163.217925/s
     success_rate...................: 100.00% ✓ 141887      ✗ 0     
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

     checks.........................: 100.00% ✓ 191319     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   628 kB/s
     http_req_blocked...............: avg=4.89µs  min=1.4µs   med=3.1µs   max=3.93ms   p(90)=4.43µs   p(95)=5.02µs   p(99.9)=47.64µs 
     http_req_connecting............: avg=1.5µs   min=0s      med=0s      max=3.88ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.73ms min=20.32ms med=90.68ms max=377.9ms  p(90)=118.3ms  p(95)=127.08ms p(99.9)=218.31ms
       { expected_response:true }...: avg=93.73ms min=20.32ms med=90.68ms max=377.9ms  p(90)=118.3ms  p(95)=127.08ms p(99.9)=218.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63873
     http_req_receiving.............: avg=84.47µs min=31.26µs med=72.2µs  max=179.69ms p(90)=101.87µs p(95)=113.43µs p(99.9)=971.32µs
     http_req_sending...............: avg=31.37µs min=6.09µs  med=14.92µs max=145.25ms p(90)=19.81µs  p(95)=22.04µs  p(99.9)=841.02µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.62ms min=20.2ms  med=90.58ms max=352.78ms p(90)=118.18ms p(95)=126.93ms p(99.9)=217.57ms
     http_reqs......................: 63873   522.636674/s
     iteration_duration.............: avg=94.09ms min=31ms    med=90.92ms max=385.45ms p(90)=118.55ms p(95)=127.33ms p(99.9)=222.4ms 
     iterations.....................: 63773   521.81843/s
     success_rate...................: 100.00% ✓ 63773      ✗ 0    
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

     checks.........................: 100.00% ✓ 139374     ✗ 0    
     data_received..................: 4.1 GB  33 MB/s
     data_sent......................: 56 MB   457 kB/s
     http_req_blocked...............: avg=10.22µs  min=1.22µs  med=3.2µs    max=11.14ms  p(90)=4.62µs   p(95)=5.21µs   p(99.9)=2.36ms  
     http_req_connecting............: avg=6.63µs   min=0s      med=0s       max=11.09ms  p(90)=0s       p(95)=0s       p(99.9)=2.31ms  
     http_req_duration..............: avg=128.68ms min=21.42ms med=126.36ms max=386.08ms p(90)=161.68ms p(95)=172.54ms p(99.9)=224.55ms
       { expected_response:true }...: avg=128.68ms min=21.42ms med=126.36ms max=386.08ms p(90)=161.68ms p(95)=172.54ms p(99.9)=224.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46558
     http_req_receiving.............: avg=92.27µs  min=29.85µs med=84.63µs  max=162.89ms p(90)=115.15µs p(95)=126.28µs p(99.9)=959.26µs
     http_req_sending...............: avg=33.26µs  min=5.96µs  med=17.41µs  max=163.19ms p(90)=22.49µs  p(95)=24.67µs  p(99.9)=737.65µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=128.55ms min=21.31ms med=126.24ms max=384.93ms p(90)=161.56ms p(95)=172.43ms p(99.9)=223.21ms
     http_reqs......................: 46558   380.503468/s
     iteration_duration.............: avg=129.17ms min=29.1ms  med=126.64ms max=402.05ms p(90)=161.95ms p(95)=172.85ms p(99.9)=226.29ms
     iterations.....................: 46458   379.6862/s
     success_rate...................: 100.00% ✓ 46458      ✗ 0    
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

     checks.........................: 100.00% ✓ 85116      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   280 kB/s
     http_req_blocked...............: avg=7.82µs   min=1.23µs  med=3.33µs   max=5.2ms    p(90)=4.72µs   p(95)=5.27µs   p(99.9)=1.9ms   
     http_req_connecting............: avg=4.17µs   min=0s      med=0s       max=5.16ms   p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=210.63ms min=18.05ms med=195.55ms max=687.64ms p(90)=258.17ms p(95)=303.08ms p(99.9)=626.35ms
       { expected_response:true }...: avg=210.63ms min=18.05ms med=195.55ms max=687.64ms p(90)=258.17ms p(95)=303.08ms p(99.9)=626.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28472
     http_req_receiving.............: avg=103.56µs min=34.45µs med=92.18µs  max=109.53ms p(90)=122.69µs p(95)=134.47µs p(99.9)=1.49ms  
     http_req_sending...............: avg=34.64µs  min=6.06µs  med=17.96µs  max=131.91ms p(90)=22.41µs  p(95)=24.64µs  p(99.9)=737.7µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.49ms min=17.95ms med=195.41ms max=687.49ms p(90)=258.06ms p(95)=302.85ms p(99.9)=626.14ms
     http_reqs......................: 28472   233.064415/s
     iteration_duration.............: avg=211.58ms min=50.13ms med=195.95ms max=687.87ms p(90)=258.74ms p(95)=305.5ms  p(99.9)=626.65ms
     iterations.....................: 28372   232.245841/s
     success_rate...................: 100.00% ✓ 28372      ✗ 0    
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

     checks.........................: 100.00% ✓ 85014      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   278 kB/s
     http_req_blocked...............: avg=5.02µs   min=1.26µs  med=3.18µs   max=2.16ms   p(90)=4.58µs   p(95)=5.14µs   p(99.9)=694.66µs
     http_req_connecting............: avg=1.55µs   min=0s      med=0s       max=2.13ms   p(90)=0s       p(95)=0s       p(99.9)=661.33µs
     http_req_duration..............: avg=210.88ms min=23.46ms med=211.27ms max=398.25ms p(90)=224.93ms p(95)=229.71ms p(99.9)=301.17ms
       { expected_response:true }...: avg=210.88ms min=23.46ms med=211.27ms max=398.25ms p(90)=224.93ms p(95)=229.71ms p(99.9)=301.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28438
     http_req_receiving.............: avg=102.47µs min=35.06µs med=92.39µs  max=125.56ms p(90)=122.41µs p(95)=134.26µs p(99.9)=1.16ms  
     http_req_sending...............: avg=26.3µs   min=6.07µs  med=18.06µs  max=58.71ms  p(90)=22.49µs  p(95)=24.73µs  p(99.9)=526.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.75ms min=23.31ms med=211.15ms max=398.08ms p(90)=224.8ms  p(95)=229.6ms  p(99.9)=300.41ms
     http_reqs......................: 28438   231.781417/s
     iteration_duration.............: avg=211.83ms min=51.2ms  med=211.6ms  max=413.86ms p(90)=225.2ms  p(95)=230ms    p(99.9)=303.93ms
     iterations.....................: 28338   230.966376/s
     success_rate...................: 100.00% ✓ 28338      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
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
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 5550      ✗ 0   
     data_received..................: 187 MB  1.5 MB/s
     data_sent......................: 2.3 MB  18 kB/s
     http_req_blocked...............: avg=126.23µs min=1.31µs   med=2.87µs  max=7.88ms  p(90)=4.27µs   p(95)=5.52µs   p(99.9)=7.61ms 
     http_req_connecting............: avg=117.39µs min=0s       med=0s      max=7.85ms  p(90)=0s       p(95)=0s       p(99.9)=7.59ms 
     http_req_duration..............: avg=3.1s     min=44.81ms  med=3.26s   max=5.19s   p(90)=4s       p(95)=4.19s    p(99.9)=4.84s  
       { expected_response:true }...: avg=3.1s     min=44.81ms  med=3.26s   max=5.19s   p(90)=4s       p(95)=4.19s    p(99.9)=4.84s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 1950
     http_req_receiving.............: avg=89.22µs  min=34.24µs  med=81.89µs max=5.81ms  p(90)=121.46µs p(95)=133.96µs p(99.9)=1.15ms 
     http_req_sending...............: avg=166.84µs min=6.28µs   med=16.06µs max=70.19ms p(90)=20.89µs  p(95)=27.22µs  p(99.9)=15.72ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=3.1s     min=44.71ms  med=3.26s   max=5.19s   p(90)=4s       p(95)=4.19s    p(99.9)=4.84s  
     http_reqs......................: 1950    15.265497/s
     iteration_duration.............: avg=3.26s    min=658.94ms med=3.29s   max=5.19s   p(90)=4.03s    p(95)=4.2s     p(99.9)=4.85s  
     iterations.....................: 1850    14.482651/s
     success_rate...................: 100.00% ✓ 1850      ✗ 0   
     vus............................: 26      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-002, os=Linux 7.0.0-27-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=124 GB (observed in 45 run metadata entries)
- Benchmark hardware #2: host=bench-001, os=Linux 7.0.0-27-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=120 GB (observed in 45 run metadata entries)

