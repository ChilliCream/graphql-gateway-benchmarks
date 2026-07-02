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
| hive-router | v0.0.74 | 1,814 | 1,858 | 1,804 | 1.0% |  |
| fusion | 16.3.0 | 1,811 | 1,841 | 1,803 | 0.7% |  |
| fusion-nightly | 16.4.0-p.12 | 1,766 | 1,793 | 1,759 | 0.6% |  |
| grafbase | 0.53.5 | 1,249 | 1,259 | 1,239 | 0.5% |  |
| cosmo | 0.326.1 | 1,112 | 1,139 | 1,109 | 0.9% |  |
| hive-gateway-router-runtime | 2.10.0 | 528 | 546 | 524 | 1.4% |  |
| apollo-router | v2.15.1 | 385 | 396 | 381 | 1.4% |  |
| hive-gateway | 2.10.0 | 240 | 244 | 240 | 0.6% |  |
| apollo-gateway | 2.14.2 | 238 | 238 | 237 | 0.2% |  |
| feddi | 77271dc84a06 | 19 | 20 | 19 | 2.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 663372      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 266 MB  2.2 MB/s
     http_req_blocked...............: avg=3.71µs  min=1.17µs  med=2.71µs  max=8.99ms   p(90)=4.21µs  p(95)=4.85µs   p(99.9)=37.5µs 
     http_req_connecting............: avg=551ns   min=0s      med=0s      max=4.61ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.89ms min=17.88ms med=26.38ms max=329.12ms p(90)=30.81ms p(95)=32.4ms   p(99.9)=50.92ms
       { expected_response:true }...: avg=26.89ms min=17.88ms med=26.38ms max=329.12ms p(90)=30.81ms p(95)=32.4ms   p(99.9)=50.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 221224
     http_req_receiving.............: avg=82.66µs min=24.78µs med=50.44µs max=257.9ms  p(90)=94.96µs p(95)=128.78µs p(99.9)=3.54ms 
     http_req_sending...............: avg=36.1µs  min=5.34µs  med=10.9µs  max=106.95ms p(90)=19.22µs p(95)=49.07µs  p(99.9)=1.8ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.77ms min=17.83ms med=26.28ms max=328.57ms p(90)=30.68ms p(95)=32.23ms  p(99.9)=49.2ms 
     http_reqs......................: 221224  1814.186481/s
     iteration_duration.............: avg=27.12ms min=18.11ms med=26.59ms max=364.21ms p(90)=31.03ms p(95)=32.62ms  p(99.9)=51.54ms
     iterations.....................: 221124  1813.366413/s
     success_rate...................: 100.00% ✓ 221124      ✗ 0     
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

     checks.........................: 100.00% ✓ 662433      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 265 MB  2.2 MB/s
     http_req_blocked...............: avg=3.43µs   min=1.15µs  med=2.55µs   max=4.74ms   p(90)=3.87µs   p(95)=4.44µs  p(99.9)=35.84µs
     http_req_connecting............: avg=523ns    min=0s      med=0s       max=4.69ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.93ms  min=16.78ms med=26.28ms  max=351.77ms p(90)=31.48ms  p(95)=33.45ms p(99.9)=53.57ms
       { expected_response:true }...: avg=26.93ms  min=16.78ms med=26.28ms  max=351.77ms p(90)=31.48ms  p(95)=33.45ms p(99.9)=53.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 220911
     http_req_receiving.............: avg=364.21µs min=54.45µs med=103.82µs max=237.62ms p(90)=885.69µs p(95)=1.38ms  p(99.9)=9.34ms 
     http_req_sending...............: avg=37.9µs   min=5.31µs  med=10.16µs  max=218.24ms p(90)=18.1µs   p(95)=67.97µs p(99.9)=1.78ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.53ms  min=16.62ms med=25.9ms   max=336.92ms p(90)=31.02ms  p(95)=32.96ms p(99.9)=51.89ms
     http_reqs......................: 220911  1811.87983/s
     iteration_duration.............: avg=27.16ms  min=18.03ms med=26.49ms  max=365.17ms p(90)=31.7ms   p(95)=33.68ms p(99.9)=54.01ms
     iterations.....................: 220811  1811.059645/s
     success_rate...................: 100.00% ✓ 220811      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 646026      ✗ 0     
     data_received..................: 19 GB   155 MB/s
     data_sent......................: 259 MB  2.1 MB/s
     http_req_blocked...............: avg=3.09µs   min=1.07µs  med=2.05µs   max=11.46ms  p(90)=3.41µs  p(95)=3.95µs  p(99.9)=29.77µs
     http_req_connecting............: avg=613ns    min=0s      med=0s       max=4.9ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.63ms  min=17.96ms med=27.11ms  max=337.29ms p(90)=31.97ms p(95)=33.81ms p(99.9)=50.76ms
       { expected_response:true }...: avg=27.63ms  min=17.96ms med=27.11ms  max=337.29ms p(90)=31.97ms p(95)=33.81ms p(99.9)=50.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 215442
     http_req_receiving.............: avg=436.89µs min=52.63µs med=105.39µs max=189.94ms p(90)=1.18ms  p(95)=1.74ms  p(99.9)=8.84ms 
     http_req_sending...............: avg=33.31µs  min=4.88µs  med=8.77µs   max=224.47ms p(90)=17.04µs p(95)=32.43µs p(99.9)=1.65ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.16ms  min=17.65ms med=26.66ms  max=336.9ms  p(90)=31.39ms p(95)=33.16ms p(99.9)=49.34ms
     http_reqs......................: 215442  1766.999532/s
     iteration_duration.............: avg=27.85ms  min=18.19ms med=27.32ms  max=366.64ms p(90)=32.19ms p(95)=34.03ms p(99.9)=51.21ms
     iterations.....................: 215342  1766.179358/s
     success_rate...................: 100.00% ✓ 215342      ✗ 0     
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

     checks.........................: 100.00% ✓ 457104      ✗ 0     
     data_received..................: 13 GB   110 MB/s
     data_sent......................: 183 MB  1.5 MB/s
     http_req_blocked...............: avg=4.09µs  min=1.13µs  med=2.74µs  max=4.31ms   p(90)=4.54µs   p(95)=5.34µs   p(99.9)=41.6µs 
     http_req_connecting............: avg=833ns   min=0s      med=0s      max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.11ms min=18.15ms med=38.84ms max=319.19ms p(90)=46.37ms  p(95)=48.56ms  p(99.9)=68.13ms
       { expected_response:true }...: avg=39.11ms min=18.15ms med=38.84ms max=319.19ms p(90)=46.37ms  p(95)=48.56ms  p(99.9)=68.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152468
     http_req_receiving.............: avg=85.93µs min=28.19µs med=54.1µs  max=70.76ms  p(90)=113.02µs p(95)=163.47µs p(99.9)=2.73ms 
     http_req_sending...............: avg=38.09µs min=5.31µs  med=10.75µs max=187.22ms p(90)=22.58µs  p(95)=92.01µs  p(99.9)=1.97ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.98ms min=18.03ms med=38.73ms max=318.37ms p(90)=46.23ms  p(95)=48.42ms  p(99.9)=67.32ms
     http_reqs......................: 152468  1249.919899/s
     iteration_duration.............: avg=39.37ms min=20.26ms med=39.08ms max=359.31ms p(90)=46.6ms   p(95)=48.79ms  p(99.9)=68.62ms
     iterations.....................: 152368  1249.100107/s
     success_rate...................: 100.00% ✓ 152368      ✗ 0     
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

     checks.........................: 100.00% ✓ 406887      ✗ 0     
     data_received..................: 12 GB   97 MB/s
     data_sent......................: 163 MB  1.3 MB/s
     http_req_blocked...............: avg=3.64µs  min=1.27µs  med=2.89µs  max=3.48ms   p(90)=4.33µs   p(95)=4.99µs   p(99.9)=38.59µs
     http_req_connecting............: avg=433ns   min=0s      med=0s      max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.98ms min=18.61ms med=43.33ms max=362.59ms p(90)=53.65ms  p(95)=56.79ms  p(99.9)=73.5ms 
       { expected_response:true }...: avg=43.98ms min=18.61ms med=43.33ms max=362.59ms p(90)=53.65ms  p(95)=56.79ms  p(99.9)=73.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 135729
     http_req_receiving.............: avg=86.96µs min=28.33µs med=70.42µs max=206.92ms p(90)=106.96µs p(95)=123.01µs p(99.9)=1.39ms 
     http_req_sending...............: avg=27.89µs min=5.72µs  med=13.08µs max=218.08ms p(90)=18.96µs  p(95)=23.2µs   p(99.9)=1.08ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.87ms min=18.46ms med=43.22ms max=319.99ms p(90)=53.54ms  p(95)=56.67ms  p(99.9)=73.01ms
     http_reqs......................: 135729  1112.386293/s
     iteration_duration.............: avg=44.23ms min=22.64ms med=43.55ms max=376.56ms p(90)=53.87ms  p(95)=57ms     p(99.9)=73.9ms 
     iterations.....................: 135629  1111.566728/s
     success_rate...................: 100.00% ✓ 135629      ✗ 0     
     vus............................: 44      min=0         max=50  
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

     checks.........................: 100.00% ✓ 193350     ✗ 0    
     data_received..................: 5.7 GB  46 MB/s
     data_sent......................: 78 MB   634 kB/s
     http_req_blocked...............: avg=4.74µs  min=1.12µs  med=2.71µs  max=4.68ms   p(90)=4.11µs   p(95)=4.65µs   p(99.9)=41µs    
     http_req_connecting............: avg=1.76µs  min=0s      med=0s      max=4.64ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.76ms min=20.64ms med=89.72ms max=378.88ms p(90)=117.13ms p(95)=126.54ms p(99.9)=207.57ms
       { expected_response:true }...: avg=92.76ms min=20.64ms med=89.72ms max=378.88ms p(90)=117.13ms p(95)=126.54ms p(99.9)=207.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64550
     http_req_receiving.............: avg=85.97µs min=29.19µs med=73.04µs max=143.87ms p(90)=102.09µs p(95)=113.07µs p(99.9)=1.07ms  
     http_req_sending...............: avg=22.21µs min=5.45µs  med=14.26µs max=61.21ms  p(90)=18.95µs  p(95)=20.85µs  p(99.9)=649.53µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.65ms min=20.51ms med=89.62ms max=378.78ms p(90)=117.02ms p(95)=126.44ms p(99.9)=207.05ms
     http_reqs......................: 64550   528.085222/s
     iteration_duration.............: avg=93.1ms  min=31.03ms med=89.96ms max=397.95ms p(90)=117.36ms p(95)=126.79ms p(99.9)=209.71ms
     iterations.....................: 64450   527.267119/s
     success_rate...................: 100.00% ✓ 64450      ✗ 0    
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

     checks.........................: 100.00% ✓ 141243     ✗ 0    
     data_received..................: 4.1 GB  34 MB/s
     data_sent......................: 57 MB   463 kB/s
     http_req_blocked...............: avg=5.32µs   min=1.24µs  med=3.05µs   max=4.4ms    p(90)=4.25µs   p(95)=4.74µs   p(99.9)=151.26µs
     http_req_connecting............: avg=2.09µs   min=0s      med=0s       max=4.37ms   p(90)=0s       p(95)=0s       p(99.9)=91.71µs 
     http_req_duration..............: avg=126.99ms min=21.09ms med=124.78ms max=368.22ms p(90)=159.52ms p(95)=170.32ms p(99.9)=216.48ms
       { expected_response:true }...: avg=126.99ms min=21.09ms med=124.78ms max=368.22ms p(90)=159.52ms p(95)=170.32ms p(99.9)=216.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47181
     http_req_receiving.............: avg=89.88µs  min=29.68µs med=78.29µs  max=158.26ms p(90)=105.68µs p(95)=115.54µs p(99.9)=863.83µs
     http_req_sending...............: avg=24.81µs  min=5.67µs  med=15.85µs  max=100.19ms p(90)=19.74µs  p(95)=21.56µs  p(99.9)=616.18µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=126.88ms min=20.96ms med=124.67ms max=358.54ms p(90)=159.43ms p(95)=170.22ms p(99.9)=216.06ms
     http_reqs......................: 47181   385.592478/s
     iteration_duration.............: avg=127.48ms min=41.07ms med=125.06ms max=384.77ms p(90)=159.78ms p(95)=170.6ms  p(99.9)=219.14ms
     iterations.....................: 47081   384.775216/s
     success_rate...................: 100.00% ✓ 47081      ✗ 0    
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

     checks.........................: 100.00% ✓ 87921      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   289 kB/s
     http_req_blocked...............: avg=7.04µs   min=1.18µs  med=2.86µs   max=4.63ms   p(90)=4.07µs   p(95)=4.58µs   p(99.9)=1.91ms  
     http_req_connecting............: avg=3.95µs   min=0s      med=0s       max=4.56ms   p(90)=0s       p(95)=0s       p(99.9)=1.87ms  
     http_req_duration..............: avg=204ms    min=18.49ms med=191.2ms  max=657.38ms p(90)=243.01ms p(95)=279.58ms p(99.9)=606ms   
       { expected_response:true }...: avg=204ms    min=18.49ms med=191.2ms  max=657.38ms p(90)=243.01ms p(95)=279.58ms p(99.9)=606ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 29407
     http_req_receiving.............: avg=124.34µs min=32.22µs med=81.93µs  max=230.31ms p(90)=108.21µs p(95)=117.07µs p(99.9)=2.61ms  
     http_req_sending...............: avg=28.89µs  min=5.96µs  med=16.2µs   max=95.66ms  p(90)=19.79µs  p(95)=21.32µs  p(99.9)=480.11µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.85ms min=18.32ms med=191.08ms max=657.28ms p(90)=242.78ms p(95)=278.91ms p(99.9)=605.93ms
     http_reqs......................: 29407   240.611292/s
     iteration_duration.............: avg=204.9ms  min=51.1ms  med=191.61ms max=657.6ms  p(90)=243.42ms p(95)=281.47ms p(99.9)=606.26ms
     iterations.....................: 29307   239.793081/s
     success_rate...................: 100.00% ✓ 29307      ✗ 0    
     vus............................: 48      min=0        max=50 
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

     checks.........................: 100.00% ✓ 87498      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=6.96µs   min=1.55µs  med=3.45µs   max=4.37ms   p(90)=4.72µs   p(95)=5.26µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=3.24µs   min=0s      med=0s       max=4.34ms   p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=204.96ms min=23.5ms  med=216.86ms max=413.08ms p(90)=261.56ms p(95)=266.69ms p(99.9)=326.4ms 
       { expected_response:true }...: avg=204.96ms min=23.5ms  med=216.86ms max=413.08ms p(90)=261.56ms p(95)=266.69ms p(99.9)=326.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29266
     http_req_receiving.............: avg=97.52µs  min=34.64µs med=84.99µs  max=154ms    p(90)=112.86µs p(95)=122.48µs p(99.9)=1.22ms  
     http_req_sending...............: avg=22.94µs  min=6.4µs   med=17.6µs   max=23.27ms  p(90)=21.84µs  p(95)=23.8µs   p(99.9)=624.07µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.84ms min=23.41ms med=216.72ms max=396.88ms p(90)=261.44ms p(95)=266.58ms p(99.9)=326.28ms
     http_reqs......................: 29266   238.487148/s
     iteration_duration.............: avg=205.85ms min=63.45ms med=217.78ms max=437.44ms p(90)=261.85ms p(95)=266.96ms p(99.9)=328.25ms
     iterations.....................: 29166   237.672253/s
     success_rate...................: 100.00% ✓ 29166      ✗ 0    
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

     checks.........................: 100.00% ✓ 7311      ✗ 0   
     data_received..................: 243 MB  1.9 MB/s
     data_sent......................: 3.0 MB  24 kB/s
     http_req_blocked...............: avg=100.93µs min=1.51µs   med=3.52µs  max=11.17ms p(90)=4.98µs   p(95)=5.95µs  p(99.9)=10.26ms
     http_req_connecting............: avg=93.34µs  min=0s       med=0s      max=11.13ms p(90)=0s       p(95)=0s      p(99.9)=10.23ms
     http_req_duration..............: avg=2.38s    min=39.19ms  med=2.48s   max=7.92s   p(90)=3.11s    p(95)=3.29s   p(99.9)=6.49s  
       { expected_response:true }...: avg=2.38s    min=39.19ms  med=2.48s   max=7.92s   p(90)=3.11s    p(95)=3.29s   p(99.9)=6.49s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2537
     http_req_receiving.............: avg=105.92µs min=31.18µs  med=90.08µs max=13.22ms p(90)=123.01µs p(95)=135.1µs p(99.9)=4.76ms 
     http_req_sending...............: avg=60.27µs  min=6.17µs   med=18.33µs max=20.56ms p(90)=23.2µs   p(95)=27.41µs p(99.9)=3.24ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=2.38s    min=39.1ms   med=2.48s   max=7.92s   p(90)=3.11s    p(95)=3.29s   p(99.9)=6.49s  
     http_reqs......................: 2537    19.943985/s
     iteration_duration.............: avg=2.48s    min=741.11ms med=2.51s   max=7.93s   p(90)=3.12s    p(95)=3.3s    p(99.9)=6.59s  
     iterations.....................: 2437    19.15786/s
     success_rate...................: 100.00% ✓ 2437      ✗ 0   
     vus............................: 22      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-002, os=Linux 7.0.0-27-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=124 GB

