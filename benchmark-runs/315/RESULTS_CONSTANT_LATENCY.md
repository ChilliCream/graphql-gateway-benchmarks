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
| fusion | 16.6.0 | 1,877 | 1,925 | 1,872 | 1.0% |  |
| fusion-nightly | 16.6.1-p.1 | 1,876 | 1,918 | 1,864 | 1.0% |  |
| fusion-nightly-net11 | 16.6.1-p.1 | 1,874 | 1,926 | 1,870 | 1.1% |  |
| hive-router | v0.0.84 | 1,827 | 1,907 | 1,818 | 1.6% |  |
| fusion-nightly-fed | 16.6.1-p.1 | 1,817 | 1,867 | 1,812 | 1.1% |  |
| grafbase | 0.53.5 | 1,315 | 1,333 | 1,303 | 0.7% |  |
| cosmo | 0.334.0 | 1,232 | 1,274 | 1,227 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 552 | 569 | 550 | 1.2% |  |
| apollo-router | v2.16.1 | 407 | 414 | 394 | 1.4% |  |
| hive-gateway | 2.10.8 | 262 | 269 | 261 | 1.0% |  |
| apollo-gateway | 2.14.3 | 258 | 262 | 258 | 0.5% |  |
| feddi | 5ff8b6165878 | 16 | 16 | 15 | 3.3% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 686427      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.84µs   min=902ns   med=1.98µs  max=4.35ms   p(90)=3.65µs   p(95)=4.42µs  p(99.9)=25.8µs 
     http_req_connecting............: avg=447ns    min=0s      med=0s      max=4.31ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26ms     min=17.33ms med=25.39ms max=310.94ms p(90)=30.48ms  p(95)=32.26ms p(99.9)=49.75ms
       { expected_response:true }...: avg=26ms     min=17.33ms med=25.39ms max=310.94ms p(90)=30.48ms  p(95)=32.26ms p(99.9)=49.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228909
     http_req_receiving.............: avg=306.75µs min=50.18µs med=91.91µs max=166.06ms p(90)=773.77µs p(95)=1.29ms  p(99.9)=8.29ms 
     http_req_sending...............: avg=31.88µs  min=4.68µs  med=8.49µs  max=198.93ms p(90)=18.63µs  p(95)=29.93µs p(99.9)=1.61ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.66ms  min=17.05ms med=25.06ms max=310.82ms p(90)=30.05ms  p(95)=31.82ms p(99.9)=48.29ms
     http_reqs......................: 228909  1877.409878/s
     iteration_duration.............: avg=26.21ms  min=17.55ms med=25.59ms max=322.92ms p(90)=30.68ms  p(95)=32.46ms p(99.9)=50.3ms 
     iterations.....................: 228809  1876.589723/s
     success_rate...................: 100.00% ✓ 228809      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 686046      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.84µs   min=901ns   med=2.01µs  max=6.75ms   p(90)=3.8µs    p(95)=4.52µs  p(99.9)=29.41µs
     http_req_connecting............: avg=364ns    min=0s      med=0s      max=3.31ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.01ms  min=17.35ms med=25.44ms max=308.49ms p(90)=30.43ms  p(95)=32.19ms p(99.9)=49.77ms
       { expected_response:true }...: avg=26.01ms  min=17.35ms med=25.44ms max=308.49ms p(90)=30.43ms  p(95)=32.19ms p(99.9)=49.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228782
     http_req_receiving.............: avg=308.53µs min=49.64µs med=91.35µs max=102.41ms p(90)=770.89µs p(95)=1.29ms  p(99.9)=8.27ms 
     http_req_sending...............: avg=33.4µs   min=4.53µs  med=8.52µs  max=133.31ms p(90)=18.82µs  p(95)=31.32µs p(99.9)=1.6ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.67ms  min=17.21ms med=25.12ms max=307.9ms  p(90)=30.01ms  p(95)=31.74ms p(99.9)=47.93ms
     http_reqs......................: 228782  1876.395184/s
     iteration_duration.............: avg=26.23ms  min=17.56ms med=25.65ms max=316.79ms p(90)=30.63ms  p(95)=32.39ms p(99.9)=50.09ms
     iterations.....................: 228682  1875.575017/s
     success_rate...................: 100.00% ✓ 228682      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 685413      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.83µs   min=852ns   med=1.96µs  max=7.22ms   p(90)=3.61µs   p(95)=4.33µs  p(99.9)=30.53µs
     http_req_connecting............: avg=404ns    min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.04ms  min=17.31ms med=25.48ms max=303.21ms p(90)=30.39ms  p(95)=32.16ms p(99.9)=49.22ms
       { expected_response:true }...: avg=26.04ms  min=17.31ms med=25.48ms max=303.21ms p(90)=30.39ms  p(95)=32.16ms p(99.9)=49.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228571
     http_req_receiving.............: avg=269.91µs min=49.9µs  med=90.4µs  max=85.16ms  p(90)=666.21µs p(95)=1.15ms  p(99.9)=6.63ms 
     http_req_sending...............: avg=30.6µs   min=4.59µs  med=8.44µs  max=192.88ms p(90)=18.07µs  p(95)=28.7µs  p(99.9)=1.5ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.74ms  min=17.21ms med=25.19ms max=303.05ms p(90)=30.03ms  p(95)=31.77ms p(99.9)=47.55ms
     http_reqs......................: 228571  1874.578484/s
     iteration_duration.............: avg=26.25ms  min=17.57ms med=25.68ms max=319.54ms p(90)=30.59ms  p(95)=32.36ms p(99.9)=49.56ms
     iterations.....................: 228471  1873.758354/s
     success_rate...................: 100.00% ✓ 228471      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 668196      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 268 MB  2.2 MB/s
     http_req_blocked...............: avg=2.81µs  min=892ns   med=2.14µs  max=6.17ms   p(90)=3.84µs  p(95)=4.55µs  p(99.9)=33.5µs 
     http_req_connecting............: avg=198ns   min=0s      med=0s      max=2.32ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.72ms min=18.4ms  med=26.3ms  max=305.65ms p(90)=30.4ms  p(95)=31.81ms p(99.9)=46.91ms
       { expected_response:true }...: avg=26.72ms min=18.4ms  med=26.3ms  max=305.65ms p(90)=30.4ms  p(95)=31.81ms p(99.9)=46.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 222832
     http_req_receiving.............: avg=72.81µs min=25.26µs med=50.24µs max=184.48ms p(90)=92.35µs p(95)=115.5µs p(99.9)=1.67ms 
     http_req_sending...............: avg=27.49µs min=4.43µs  med=9.11µs  max=142.4ms  p(90)=17.74µs p(95)=23.59µs p(99.9)=1.31ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.62ms min=18.3ms  med=26.21ms max=305.49ms p(90)=30.3ms  p(95)=31.7ms  p(99.9)=45.6ms 
     http_reqs......................: 222832  1827.064505/s
     iteration_duration.............: avg=26.93ms min=18.64ms med=26.5ms  max=312.07ms p(90)=30.6ms  p(95)=32.01ms p(99.9)=47.37ms
     iterations.....................: 222732  1826.244576/s
     success_rate...................: 100.00% ✓ 222732      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 664656      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 266 MB  2.2 MB/s
     http_req_blocked...............: avg=2.87µs   min=831ns   med=2.01µs  max=3.54ms   p(90)=3.78µs   p(95)=4.52µs  p(99.9)=31.13µs
     http_req_connecting............: avg=416ns    min=0s      med=0s      max=3.5ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.85ms  min=17.86ms med=26.28ms max=302.02ms p(90)=31.34ms  p(95)=33.17ms p(99.9)=50.21ms
       { expected_response:true }...: avg=26.85ms  min=17.86ms med=26.28ms max=302.02ms p(90)=31.34ms  p(95)=33.17ms p(99.9)=50.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 221652
     http_req_receiving.............: avg=306.86µs min=49.56µs med=94.83µs max=266.37ms p(90)=776.83µs p(95)=1.28ms  p(99.9)=7.88ms 
     http_req_sending...............: avg=29.11µs  min=4.22µs  med=8.51µs  max=95.98ms  p(90)=19.37µs  p(95)=30.41µs p(99.9)=1.41ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.51ms  min=17.78ms med=25.96ms max=301.65ms p(90)=30.94ms  p(95)=32.72ms p(99.9)=48.54ms
     http_reqs......................: 221652  1817.219073/s
     iteration_duration.............: avg=27.07ms  min=18.04ms med=26.49ms max=311.88ms p(90)=31.55ms  p(95)=33.38ms p(99.9)=50.71ms
     iterations.....................: 221552  1816.399221/s
     success_rate...................: 100.00% ✓ 221552      ✗ 0     
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

     checks.........................: 100.00% ✓ 481179      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 193 MB  1.6 MB/s
     http_req_blocked...............: avg=3.52µs  min=831ns   med=2.24µs  max=4.12ms   p(90)=4.84µs   p(95)=5.87µs   p(99.9)=48.86µs
     http_req_connecting............: avg=596ns   min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.14ms min=18.2ms  med=36.88ms max=303.24ms p(90)=43.58ms  p(95)=45.55ms  p(99.9)=61.07ms
       { expected_response:true }...: avg=37.14ms min=18.2ms  med=36.88ms max=303.24ms p(90)=43.58ms  p(95)=45.55ms  p(99.9)=61.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160493
     http_req_receiving.............: avg=87.85µs min=26.77µs med=55.88µs max=190.46ms p(90)=125.59µs p(95)=170.92µs p(99.9)=2.08ms 
     http_req_sending...............: avg=34.37µs min=4.32µs  med=9.24µs  max=158.58ms p(90)=24.31µs  p(95)=51.38µs  p(99.9)=1.94ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.02ms min=18.11ms med=36.77ms max=302.58ms p(90)=43.45ms  p(95)=45.41ms  p(99.9)=59.45ms
     http_reqs......................: 160493  1315.622612/s
     iteration_duration.............: avg=37.4ms  min=21.05ms med=37.11ms max=316.1ms  p(90)=43.8ms   p(95)=45.77ms  p(99.9)=61.68ms
     iterations.....................: 160393  1314.802874/s
     success_rate...................: 100.00% ✓ 160393      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 450861      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 181 MB  1.5 MB/s
     http_req_blocked...............: avg=3.46µs  min=992ns   med=2.51µs  max=3.93ms   p(90)=4.23µs   p(95)=4.93µs   p(99.9)=36.76µs 
     http_req_connecting............: avg=611ns   min=0s      med=0s      max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.69ms min=18.58ms med=39.08ms max=318.01ms p(90)=47.66ms  p(95)=50.34ms  p(99.9)=65.84ms 
       { expected_response:true }...: avg=39.69ms min=18.58ms med=39.08ms max=318.01ms p(90)=47.66ms  p(95)=50.34ms  p(99.9)=65.84ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 150387
     http_req_receiving.............: avg=78.23µs min=27.62µs med=63.46µs max=178.24ms p(90)=104.85µs p(95)=122.19µs p(99.9)=931.87µs
     http_req_sending...............: avg=25.27µs min=4.82µs  med=11.31µs max=239.68ms p(90)=19.23µs  p(95)=22.85µs  p(99.9)=930.1µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.58ms min=18.37ms med=38.98ms max=314.81ms p(90)=47.56ms  p(95)=50.24ms  p(99.9)=65.42ms 
     http_reqs......................: 150387  1232.924279/s
     iteration_duration.............: avg=39.91ms min=21.62ms med=39.29ms max=326.9ms  p(90)=47.87ms  p(95)=50.56ms  p(99.9)=66.24ms 
     iterations.....................: 150287  1232.104445/s
     success_rate...................: 100.00% ✓ 150287      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 202182     ✗ 0    
     data_received..................: 5.9 GB  48 MB/s
     data_sent......................: 81 MB   663 kB/s
     http_req_blocked...............: avg=4.83µs  min=1.21µs  med=3.21µs  max=4.13ms   p(90)=4.76µs   p(95)=5.46µs   p(99.9)=47.31µs 
     http_req_connecting............: avg=1.36µs  min=0s      med=0s      max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.69ms min=20.53ms med=89.69ms max=308.64ms p(90)=129.11ms p(95)=140.84ms p(99.9)=225.19ms
       { expected_response:true }...: avg=88.69ms min=20.53ms med=89.69ms max=308.64ms p(90)=129.11ms p(95)=140.84ms p(99.9)=225.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67494
     http_req_receiving.............: avg=85.24µs min=31.7µs  med=74.69µs max=83.44ms  p(90)=110.92µs p(95)=124.47µs p(99.9)=708.46µs
     http_req_sending...............: avg=25.8µs  min=5.45µs  med=14.31µs max=124.06ms p(90)=20.74µs  p(95)=23.16µs  p(99.9)=664.97µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.57ms min=20.38ms med=89.59ms max=307.95ms p(90)=128.99ms p(95)=140.72ms p(99.9)=224.24ms
     http_reqs......................: 67494   552.124995/s
     iteration_duration.............: avg=89.03ms min=30.42ms med=89.98ms max=335.88ms p(90)=129.36ms p(95)=141.13ms p(99.9)=227.1ms 
     iterations.....................: 67394   551.306959/s
     success_rate...................: 100.00% ✓ 67394      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 149172     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   489 kB/s
     http_req_blocked...............: avg=5.82µs   min=1.04µs  med=3.49µs   max=3.73ms   p(90)=5.02µs   p(95)=5.62µs   p(99.9)=254.55µs
     http_req_connecting............: avg=2.07µs   min=0s      med=0s       max=3.69ms   p(90)=0s       p(95)=0s       p(99.9)=217.89µs
     http_req_duration..............: avg=120.21ms min=20.83ms med=118.27ms max=338.71ms p(90)=150.75ms p(95)=160.5ms  p(99.9)=205.68ms
       { expected_response:true }...: avg=120.21ms min=20.83ms med=118.27ms max=338.71ms p(90)=150.75ms p(95)=160.5ms  p(99.9)=205.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49824
     http_req_receiving.............: avg=88.06µs  min=29.65µs med=83.52µs  max=67.23ms  p(90)=114.85µs p(95)=127.05µs p(99.9)=493.84µs
     http_req_sending...............: avg=27.14µs  min=5.52µs  med=17.21µs  max=175.79ms p(90)=22.88µs  p(95)=24.84µs  p(99.9)=501.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.1ms  min=20.75ms med=118.16ms max=338.43ms p(90)=150.65ms p(95)=160.37ms p(99.9)=205.33ms
     http_reqs......................: 49824   407.326473/s
     iteration_duration.............: avg=120.69ms min=31.58ms med=118.59ms max=363.32ms p(90)=151.07ms p(95)=160.8ms  p(99.9)=208.36ms
     iterations.....................: 49724   406.508943/s
     success_rate...................: 100.00% ✓ 49724      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95886      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   315 kB/s
     http_req_blocked...............: avg=6.04µs   min=1.1µs   med=3.22µs   max=3.37ms   p(90)=4.68µs   p(95)=5.3µs    p(99.9)=1.25ms  
     http_req_connecting............: avg=2.6µs    min=0s      med=0s       max=3.32ms   p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=187.02ms min=17.73ms med=174.65ms max=625.65ms p(90)=224.46ms p(95)=258.36ms p(99.9)=576.4ms 
       { expected_response:true }...: avg=187.02ms min=17.73ms med=174.65ms max=625.65ms p(90)=224.46ms p(95)=258.36ms p(99.9)=576.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32062
     http_req_receiving.............: avg=100.38µs min=32.29µs med=91.95µs  max=57.86ms  p(90)=123.62µs p(95)=137.56µs p(99.9)=827.63µs
     http_req_sending...............: avg=24.5µs   min=5.44µs  med=18.04µs  max=31.67ms  p(90)=22.72µs  p(95)=24.56µs  p(99.9)=501.7µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.89ms min=17.58ms med=174.54ms max=625.54ms p(90)=224.34ms p(95)=258.04ms p(99.9)=576.29ms
     http_reqs......................: 32062   262.328769/s
     iteration_duration.............: avg=187.84ms min=47.43ms med=175.06ms max=625.97ms p(90)=224.81ms p(95)=259.49ms p(99.9)=576.66ms
     iterations.....................: 31962   261.510577/s
     success_rate...................: 100.00% ✓ 31962      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94767      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=7.34µs   min=1.43µs  med=3.61µs   max=4.37ms   p(90)=5.13µs   p(95)=5.73µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=3.41µs   min=0s      med=0s       max=4.33ms   p(90)=0s       p(95)=0s       p(99.9)=1.61ms  
     http_req_duration..............: avg=189.21ms min=22.8ms  med=182.75ms max=407.43ms p(90)=210.8ms  p(95)=215.95ms p(99.9)=285.96ms
       { expected_response:true }...: avg=189.21ms min=22.8ms  med=182.75ms max=407.43ms p(90)=210.8ms  p(95)=215.95ms p(99.9)=285.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31689
     http_req_receiving.............: avg=103.01µs min=36.66µs med=89.11µs  max=143.11ms p(90)=122.63µs p(95)=136.06µs p(99.9)=438.41µs
     http_req_sending...............: avg=29.07µs  min=6.55µs  med=18.53µs  max=97.23ms  p(90)=23.6µs   p(95)=25.57µs  p(99.9)=587.85µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.08ms min=22.66ms med=182.63ms max=407.24ms p(90)=210.68ms p(95)=215.83ms p(99.9)=284.59ms
     http_reqs......................: 31689   258.276886/s
     iteration_duration.............: avg=190.06ms min=55.21ms med=183.03ms max=420.39ms p(90)=211.09ms p(95)=216.25ms p(99.9)=292.98ms
     iterations.....................: 31589   257.461849/s
     success_rate...................: 100.00% ✓ 31589      ✗ 0    
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

     checks.........................: 100.00% ✓ 5937      ✗ 0   
     data_received..................: 199 MB  1.6 MB/s
     data_sent......................: 2.5 MB  20 kB/s
     http_req_blocked...............: avg=30.32µs min=1.55µs  med=3.6µs   max=3.52ms   p(90)=5.37µs   p(95)=6.4µs    p(99.9)=2.57ms  
     http_req_connecting............: avg=24.38µs min=0s      med=0s      max=2.7ms    p(90)=0s       p(95)=0s       p(99.9)=2.52ms  
     http_req_duration..............: avg=2.92s   min=43.25ms med=3.03s   max=12.98s   p(90)=3.71s    p(95)=3.91s    p(99.9)=11.43s  
       { expected_response:true }...: avg=2.92s   min=43.25ms med=3.03s   max=12.98s   p(90)=3.71s    p(95)=3.91s    p(99.9)=11.43s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2079
     http_req_receiving.............: avg=99.67µs min=37.32µs med=94.01µs max=462.17µs p(90)=137.41µs p(95)=152.57µs p(99.9)=316.42µs
     http_req_sending...............: avg=62.24µs min=8.32µs  med=19.05µs max=37.33ms  p(90)=25.1µs   p(95)=30.37µs  p(99.9)=4.02ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.92s   min=43.09ms med=3.03s   max=12.98s   p(90)=3.71s    p(95)=3.91s    p(99.9)=11.43s  
     http_reqs......................: 2079    16.24559/s
     iteration_duration.............: avg=3.07s   min=1.05s   med=3.05s   max=12.99s   p(90)=3.72s    p(95)=3.93s    p(99.9)=11.49s  
     iterations.....................: 1979    15.464177/s
     success_rate...................: 100.00% ✓ 1979      ✗ 0   
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

