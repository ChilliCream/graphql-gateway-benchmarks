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
| fusion | 16.3.0 | 1,802 | 1,846 | 1,794 | 1.0% |  |
| fusion-nightly | 16.4.0-p.14 | 1,793 | 1,823 | 1,788 | 0.6% |  |
| hive-router | v0.0.74 | 1,765 | 1,812 | 1,754 | 1.0% |  |
| grafbase | 0.53.5 | 1,219 | 1,233 | 1,212 | 0.5% |  |
| cosmo | 0.326.1 | 1,103 | 1,126 | 1,096 | 0.9% |  |
| hive-gateway-router-runtime | 2.10.0 | 525 | 537 | 519 | 1.0% |  |
| apollo-router | v2.15.1 | 362 | 375 | 359 | 1.6% |  |
| hive-gateway | 2.10.0 | 248 | 250 | 247 | 0.4% |  |
| apollo-gateway | 2.14.2 | 226 | 229 | 226 | 0.4% |  |
| feddi | 77271dc84a06 | 17 | 18 | 17 | 2.6% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 659190      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 264 MB  2.2 MB/s
     http_req_blocked...............: avg=3.6µs   min=1.16µs  med=2.62µs   max=4.98ms   p(90)=4µs      p(95)=4.58µs  p(99.9)=35.08µs
     http_req_connecting............: avg=602ns   min=0s      med=0s       max=4.92ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.06ms min=17.53ms med=26.44ms  max=340.12ms p(90)=31.61ms  p(95)=33.56ms p(99.9)=52.21ms
       { expected_response:true }...: avg=27.06ms min=17.53ms med=26.44ms  max=340.12ms p(90)=31.61ms  p(95)=33.56ms p(99.9)=52.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 219830
     http_req_receiving.............: avg=356.3µs min=54.08µs med=102.87µs max=174.24ms p(90)=875.29µs p(95)=1.36ms  p(99.9)=9.52ms 
     http_req_sending...............: avg=34.19µs min=5.2µs   med=10.17µs  max=48.76ms  p(90)=17.88µs  p(95)=40.66µs p(99.9)=1.8ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.67ms min=17.42ms med=26.06ms  max=326.96ms p(90)=31.13ms  p(95)=33.05ms p(99.9)=50.69ms
     http_reqs......................: 219830  1802.729373/s
     iteration_duration.............: avg=27.29ms min=17.74ms med=26.65ms  max=359.32ms p(90)=31.83ms  p(95)=33.78ms p(99.9)=52.66ms
     iterations.....................: 219730  1801.909317/s
     success_rate...................: 100.00% ✓ 219730      ✗ 0     
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

     checks.........................: 100.00% ✓ 655752      ✗ 0     
     data_received..................: 19 GB   157 MB/s
     data_sent......................: 263 MB  2.2 MB/s
     http_req_blocked...............: avg=3.69µs   min=1.07µs  med=2.57µs   max=28.15ms  p(90)=3.99µs  p(95)=4.57µs  p(99.9)=36.34µs
     http_req_connecting............: avg=644ns    min=0s      med=0s       max=28.1ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.21ms  min=17.56ms med=26.55ms  max=357.2ms  p(90)=31.77ms p(95)=33.81ms p(99.9)=53.65ms
       { expected_response:true }...: avg=27.21ms  min=17.56ms med=26.55ms  max=357.2ms  p(90)=31.77ms p(95)=33.81ms p(99.9)=53.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 218684
     http_req_receiving.............: avg=386.85µs min=53.98µs med=100.63µs max=215.18ms p(90)=1ms     p(95)=1.53ms  p(99.9)=10.24ms
     http_req_sending...............: avg=35.6µs   min=5.34µs  med=9.98µs   max=185.92ms p(90)=18.13µs p(95)=72.86µs p(99.9)=1.73ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.78ms  min=17.37ms med=26.16ms  max=356.74ms p(90)=31.26ms p(95)=33.25ms p(99.9)=51.69ms
     http_reqs......................: 218684  1793.772465/s
     iteration_duration.............: avg=27.44ms  min=17.76ms med=26.76ms  max=368.85ms p(90)=31.99ms p(95)=34.04ms p(99.9)=54.16ms
     iterations.....................: 218584  1792.952208/s
     success_rate...................: 100.00% ✓ 218584      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 645531      ✗ 0     
     data_received..................: 19 GB   154 MB/s
     data_sent......................: 259 MB  2.1 MB/s
     http_req_blocked...............: avg=3.74µs  min=1.04µs  med=2.56µs  max=8.37ms   p(90)=4.21µs  p(95)=4.95µs  p(99.9)=36.8µs 
     http_req_connecting............: avg=701ns   min=0s      med=0s      max=6.97ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.63ms min=18.04ms med=27.17ms max=326.15ms p(90)=31.64ms p(95)=33.23ms p(99.9)=50.54ms
       { expected_response:true }...: avg=27.63ms min=18.04ms med=27.17ms max=326.15ms p(90)=31.64ms p(95)=33.23ms p(99.9)=50.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 215277
     http_req_receiving.............: avg=82.5µs  min=27.81µs med=55.1µs  max=34.78ms  p(90)=99.61µs p(95)=129.9µs p(99.9)=2.71ms 
     http_req_sending...............: avg=35.65µs min=5.4µs   med=10.75µs max=146.28ms p(90)=19.55µs p(95)=32.34µs p(99.9)=1.79ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.52ms min=17.91ms med=27.06ms max=325.05ms p(90)=31.52ms p(95)=33.08ms p(99.9)=48.91ms
     http_reqs......................: 215277  1765.118428/s
     iteration_duration.............: avg=27.87ms min=19.06ms med=27.38ms max=371.63ms p(90)=31.86ms p(95)=33.45ms p(99.9)=50.89ms
     iterations.....................: 215177  1764.298499/s
     success_rate...................: 100.00% ✓ 215177      ✗ 0     
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

     checks.........................: 100.00% ✓ 445926      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.8µs   min=1.02µs  med=2.39µs  max=4.37ms   p(90)=4.58µs   p(95)=5.57µs   p(99.9)=46.27µs
     http_req_connecting............: avg=775ns   min=0s      med=0s      max=4.32ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.09ms min=18.13ms med=39.82ms max=337.85ms p(90)=47.45ms  p(95)=49.76ms  p(99.9)=67.68ms
       { expected_response:true }...: avg=40.09ms min=18.13ms med=39.82ms max=337.85ms p(90)=47.45ms  p(95)=49.76ms  p(99.9)=67.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148742
     http_req_receiving.............: avg=93.22µs min=30.39µs med=56.16µs max=218.32ms p(90)=123.36µs p(95)=174.82µs p(99.9)=2.58ms 
     http_req_sending...............: avg=39.28µs min=5.25µs  med=10.09µs max=195.56ms p(90)=24.12µs  p(95)=90.96µs  p(99.9)=2.09ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.96ms min=18ms    med=39.7ms  max=337.36ms p(90)=47.32ms  p(95)=49.61ms  p(99.9)=66.69ms
     http_reqs......................: 148742  1219.337692/s
     iteration_duration.............: avg=40.35ms min=20.39ms med=40.05ms max=372.41ms p(90)=47.68ms  p(95)=50ms     p(99.9)=68.36ms
     iterations.....................: 148642  1218.517925/s
     success_rate...................: 100.00% ✓ 148642      ✗ 0     
     vus............................: 4       min=0         max=50  
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

     checks.........................: 100.00% ✓ 403593      ✗ 0     
     data_received..................: 12 GB   97 MB/s
     data_sent......................: 162 MB  1.3 MB/s
     http_req_blocked...............: avg=3.44µs  min=1.1µs   med=2.6µs   max=2.82ms   p(90)=4.2µs    p(95)=4.92µs   p(99.9)=36.43µs
     http_req_connecting............: avg=482ns   min=0s      med=0s      max=2.8ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.32ms min=18.58ms med=43.65ms max=356.32ms p(90)=54.11ms  p(95)=57.48ms  p(99.9)=75.28ms
       { expected_response:true }...: avg=44.32ms min=18.58ms med=43.65ms max=356.32ms p(90)=54.11ms  p(95)=57.48ms  p(99.9)=75.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134631
     http_req_receiving.............: avg=85.53µs min=28.82µs med=69.69µs max=109.79ms p(90)=111.03µs p(95)=129.71µs p(99.9)=1.3ms  
     http_req_sending...............: avg=29.12µs min=5.46µs  med=12.46µs max=123.62ms p(90)=19.93µs  p(95)=24.39µs  p(99.9)=1.13ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=44.2ms  min=18.48ms med=43.54ms max=355.61ms p(90)=53.99ms  p(95)=57.36ms  p(99.9)=74.97ms
     http_reqs......................: 134631  1103.450175/s
     iteration_duration.............: avg=44.59ms min=22.57ms med=43.89ms max=381.57ms p(90)=54.34ms  p(95)=57.72ms  p(99.9)=75.68ms
     iterations.....................: 134531  1102.630565/s
     success_rate...................: 100.00% ✓ 134531      ✗ 0     
     vus............................: 45      min=0         max=50  
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

     checks.........................: 100.00% ✓ 192267     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   631 kB/s
     http_req_blocked...............: avg=6.17µs  min=1.36µs  med=3.17µs  max=8.47ms   p(90)=4.56µs   p(95)=5.14µs   p(99.9)=59.51µs 
     http_req_connecting............: avg=2.68µs  min=0s      med=0s      max=8.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.27ms min=20.55ms med=91.55ms max=360.24ms p(90)=111.45ms p(95)=120.51ms p(99.9)=208.98ms
       { expected_response:true }...: avg=93.27ms min=20.55ms med=91.55ms max=360.24ms p(90)=111.45ms p(95)=120.51ms p(99.9)=208.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64189
     http_req_receiving.............: avg=86.65µs min=30.48µs med=75.03µs max=109.02ms p(90)=104.82µs p(95)=115.58µs p(99.9)=1.08ms  
     http_req_sending...............: avg=26.1µs  min=5.83µs  med=15.55µs max=98.99ms  p(90)=20.31µs  p(95)=22.47µs  p(99.9)=802.35µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.16ms min=20.42ms med=91.44ms max=358.72ms p(90)=111.33ms p(95)=120.39ms p(99.9)=208.87ms
     http_reqs......................: 64189   525.064271/s
     iteration_duration.............: avg=93.62ms min=32.84ms med=91.79ms max=376.21ms p(90)=111.69ms p(95)=120.79ms p(99.9)=209.64ms
     iterations.....................: 64089   524.246274/s
     success_rate...................: 100.00% ✓ 64089      ✗ 0    
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

     checks.........................: 100.00% ✓ 132675     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 53 MB   435 kB/s
     http_req_blocked...............: avg=4.67µs   min=1.22µs  med=3.26µs   max=2.45ms   p(90)=4.77µs   p(95)=5.38µs   p(99.9)=211.69µs
     http_req_connecting............: avg=1.17µs   min=0s      med=0s       max=2.43ms   p(90)=0s       p(95)=0s       p(99.9)=182.86µs
     http_req_duration..............: avg=135.2ms  min=21.47ms med=132.81ms max=382.25ms p(90)=170.23ms p(95)=181.8ms  p(99.9)=232.36ms
       { expected_response:true }...: avg=135.2ms  min=21.47ms med=132.81ms max=382.25ms p(90)=170.23ms p(95)=181.8ms  p(99.9)=232.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44325
     http_req_receiving.............: avg=99.16µs  min=31.75µs med=82.62µs  max=187.86ms p(90)=114.89µs p(95)=126.1µs  p(99.9)=1.3ms   
     http_req_sending...............: avg=25.25µs  min=5.93µs  med=16.4µs   max=157.41ms p(90)=22.02µs  p(95)=24.3µs   p(99.9)=552.9µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=135.08ms min=21.31ms med=132.7ms  max=375.92ms p(90)=170.12ms p(95)=181.66ms p(99.9)=231.15ms
     http_reqs......................: 44325   362.168275/s
     iteration_duration.............: avg=135.72ms min=60.72ms med=133.12ms max=391.99ms p(90)=170.5ms  p(95)=182.09ms p(99.9)=239.71ms
     iterations.....................: 44225   361.3512/s
     success_rate...................: 100.00% ✓ 44225      ✗ 0    
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

     checks.........................: 100.00% ✓ 90861      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   299 kB/s
     http_req_blocked...............: avg=7.56µs   min=1.39µs  med=3.45µs   max=4.38ms   p(90)=4.8µs    p(95)=5.37µs   p(99.9)=1.92ms  
     http_req_connecting............: avg=3.8µs    min=0s      med=0s       max=4.33ms   p(90)=0s       p(95)=0s       p(99.9)=1.89ms  
     http_req_duration..............: avg=197.4ms  min=18.23ms med=185.86ms max=641.83ms p(90)=231.92ms p(95)=266.68ms p(99.9)=573.74ms
       { expected_response:true }...: avg=197.4ms  min=18.23ms med=185.86ms max=641.83ms p(90)=231.92ms p(95)=266.68ms p(99.9)=573.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30387
     http_req_receiving.............: avg=94.12µs  min=36.45µs med=87.48µs  max=52.12ms  p(90)=114.35µs p(95)=122.81µs p(99.9)=763.46µs
     http_req_sending...............: avg=29.53µs  min=6.58µs  med=18.13µs  max=54.71ms  p(90)=22.34µs  p(95)=24.35µs  p(99.9)=548.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.28ms min=18.12ms med=185.74ms max=641.69ms p(90)=231.81ms p(95)=266.59ms p(99.9)=573.65ms
     http_reqs......................: 30387   248.594122/s
     iteration_duration.............: avg=198.27ms min=56.39ms med=186.24ms max=642.08ms p(90)=232.28ms p(95)=269.3ms  p(99.9)=574ms   
     iterations.....................: 30287   247.776028/s
     success_rate...................: 100.00% ✓ 30287      ✗ 0    
     vus............................: 44      min=0        max=50 
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

     checks.........................: 100.00% ✓ 83172      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 33 MB   272 kB/s
     http_req_blocked...............: avg=7.25µs   min=1.33µs  med=3.24µs   max=4.47ms   p(90)=4.58µs   p(95)=5.13µs   p(99.9)=1.81ms  
     http_req_connecting............: avg=3.75µs   min=0s      med=0s       max=4.43ms   p(90)=0s       p(95)=0s       p(99.9)=1.78ms  
     http_req_duration..............: avg=215.59ms min=23.55ms med=217.61ms max=420.23ms p(90)=241.37ms p(95)=246.64ms p(99.9)=314.93ms
       { expected_response:true }...: avg=215.59ms min=23.55ms med=217.61ms max=420.23ms p(90)=241.37ms p(95)=246.64ms p(99.9)=314.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 27824
     http_req_receiving.............: avg=107.15µs min=33.69µs med=92.3µs   max=76.14ms  p(90)=122.35µs p(95)=133.71µs p(99.9)=892.69µs
     http_req_sending...............: avg=23.5µs   min=6.11µs  med=17.67µs  max=35.03ms  p(90)=22.19µs  p(95)=24.34µs  p(99.9)=683.16µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=215.46ms min=23.41ms med=217.48ms max=420.05ms p(90)=241.23ms p(95)=246.53ms p(99.9)=314.81ms
     http_reqs......................: 27824   226.715407/s
     iteration_duration.............: avg=216.55ms min=66.9ms  med=218.11ms max=450.78ms p(90)=241.65ms p(95)=246.94ms p(99.9)=317.23ms
     iterations.....................: 27724   225.900587/s
     success_rate...................: 100.00% ✓ 27724      ✗ 0    
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

     checks.........................: 100.00% ✓ 6531      ✗ 0   
     data_received..................: 218 MB  1.7 MB/s
     data_sent......................: 2.7 MB  21 kB/s
     http_req_blocked...............: avg=134.13µs min=1.36µs   med=3.44µs  max=10.39ms p(90)=4.95µs   p(95)=5.8µs    p(99.9)=9.66ms
     http_req_connecting............: avg=123.91µs min=0s       med=0s      max=10.22ms p(90)=0s       p(95)=0s       p(99.9)=9.37ms
     http_req_duration..............: avg=2.66s    min=40.33ms  med=2.78s   max=4.73s   p(90)=3.41s    p(95)=3.61s    p(99.9)=4.31s 
       { expected_response:true }...: avg=2.66s    min=40.33ms  med=2.78s   max=4.73s   p(90)=3.41s    p(95)=3.61s    p(99.9)=4.31s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2277
     http_req_receiving.............: avg=100.74µs min=32.46µs  med=88.17µs max=5.91ms  p(90)=123.72µs p(95)=142.09µs p(99.9)=2.95ms
     http_req_sending...............: avg=61.63µs  min=7.1µs    med=18.22µs max=25.35ms p(90)=23.1µs   p(95)=28.63µs  p(99.9)=8ms   
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.66s    min=40.2ms   med=2.78s   max=4.73s   p(90)=3.41s    p(95)=3.61s    p(99.9)=4.31s 
     http_reqs......................: 2277    17.817222/s
     iteration_duration.............: avg=2.78s    min=663.56ms med=2.81s   max=4.73s   p(90)=3.42s    p(95)=3.63s    p(99.9)=4.33s 
     iterations.....................: 2177    17.034735/s
     success_rate...................: 100.00% ✓ 2177      ✗ 0   
     vus............................: 21      min=0       max=50
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

