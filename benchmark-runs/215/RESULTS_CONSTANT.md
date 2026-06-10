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
| hive-router | v0.0.65 | 2,815 | 3,003 | 2,736 | 3.0% |  |
| hotchocolate | 16.1.3 | 2,137 | 2,193 | 2,120 | 0.9% |  |
| grafbase | 0.53.5 | 2,017 | 2,078 | 1,985 | 1.5% |  |
| cosmo | 0.321.1 | 1,219 | 1,237 | 1,209 | 0.8% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 557 | 572 | 554 | 1.2% |  |
| apollo-router | v2.15.0 | 440 | 451 | 435 | 1.3% |  |
| apollo-gateway | 2.14.1 | 248 | 250 | 246 | 0.5% |  |
| hive-gateway | 2.8.2 | 239 | 244 | 236 | 1.1% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,346 | 2,483 | 2,314 | 2.4% |  |
| hotchocolate | 16.1.3 | 1,933 | 1,997 | 1,915 | 1.3% |  |
| grafbase | 0.53.5 | 1,541 | 1,584 | 1,526 | 1.3% |  |
| cosmo | 0.321.1 | 1,156 | 1,178 | 1,149 | 1.0% | non-compatible response (6 across 4/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 534 | 549 | 529 | 1.3% |  |
| apollo-router | v2.15.0 | 388 | 400 | 378 | 1.8% |  |
| hive-gateway | 2.8.2 | 247 | 252 | 245 | 1.0% |  |
| apollo-gateway | 2.14.1 | 238 | 241 | 236 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1015053     ✗ 0     
     data_received..................: 30 GB   247 MB/s
     data_sent......................: 407 MB  3.4 MB/s
     http_req_blocked...............: avg=3.47µs   min=1.09µs  med=2.45µs  max=26.23ms  p(90)=3.66µs  p(95)=4.29µs   p(99.9)=35.42µs
     http_req_connecting............: avg=402ns    min=0s      med=0s      max=5.61ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.49ms  min=1.57ms  med=16.61ms max=301.78ms p(90)=25.87ms p(95)=29.65ms  p(99.9)=52.82ms
       { expected_response:true }...: avg=17.49ms  min=1.57ms  med=16.61ms max=301.78ms p(90)=25.87ms p(95)=29.65ms  p(99.9)=52.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 338451
     http_req_receiving.............: avg=127.51µs min=28.76µs med=52.33µs max=176.87ms p(90)=100µs   p(95)=274.02µs p(99.9)=11.77ms
     http_req_sending...............: avg=60.35µs  min=5.28µs  med=9.57µs  max=94.33ms  p(90)=16.31µs p(95)=124.59µs p(99.9)=12.2ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=17.3ms   min=1.5ms   med=16.46ms max=300.57ms p(90)=25.6ms  p(95)=29.29ms  p(99.9)=51.3ms 
     http_reqs......................: 338451  2815.826226/s
     iteration_duration.............: avg=17.72ms  min=2.16ms  med=16.82ms max=346.19ms p(90)=26.1ms  p(95)=29.91ms  p(99.9)=53.8ms 
     iterations.....................: 338351  2814.994252/s
     success_rate...................: 100.00% ✓ 338351      ✗ 0     
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

     checks.........................: 100.00% ✓ 771279      ✗ 0     
     data_received..................: 23 GB   187 MB/s
     data_sent......................: 309 MB  2.6 MB/s
     http_req_blocked...............: avg=3.4µs    min=1.01µs  med=2.43µs   max=11.72ms  p(90)=3.62µs   p(95)=4.24µs  p(99.9)=34.86µs 
     http_req_connecting............: avg=383ns    min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=23.09ms  min=2.45ms  med=14.92ms  max=307.89ms p(90)=50.77ms  p(95)=69.44ms p(99.9)=165.22ms
       { expected_response:true }...: avg=23.09ms  min=2.45ms  med=14.92ms  max=307.89ms p(90)=50.77ms  p(95)=69.44ms p(99.9)=165.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 257193
     http_req_receiving.............: avg=666.84µs min=51.39µs med=106.95µs max=230.39ms p(90)=982.93µs p(95)=1.54ms  p(99.9)=61.53ms 
     http_req_sending...............: avg=44.65µs  min=4.95µs  med=9.52µs   max=190.25ms p(90)=15.89µs  p(95)=108µs   p(99.9)=3.25ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.38ms  min=2.32ms  med=14.41ms  max=307.15ms p(90)=49.33ms  p(95)=67.94ms p(99.9)=162.21ms
     http_reqs......................: 257193  2137.912592/s
     iteration_duration.............: avg=23.32ms  min=3.52ms  med=15.14ms  max=344.96ms p(90)=51.01ms  p(95)=69.69ms p(99.9)=166.96ms
     iterations.....................: 257093  2137.081344/s
     success_rate...................: 100.00% ✓ 257093      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 727509      ✗ 0     
     data_received..................: 21 GB   177 MB/s
     data_sent......................: 292 MB  2.4 MB/s
     http_req_blocked...............: avg=3.35µs  min=1.1µs   med=2.57µs  max=7.98ms   p(90)=4.01µs   p(95)=4.78µs   p(99.9)=38.51µs
     http_req_connecting............: avg=233ns   min=0s      med=0s      max=2.68ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.48ms min=1.91ms  med=24.23ms max=326.93ms p(90)=29.48ms  p(95)=31.83ms  p(99.9)=53.6ms 
       { expected_response:true }...: avg=24.48ms min=1.91ms  med=24.23ms max=326.93ms p(90)=29.48ms  p(95)=31.83ms  p(99.9)=53.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 242603
     http_req_receiving.............: avg=112.9µs min=30.06µs med=60.03µs max=92.96ms  p(90)=104.24µs p(95)=205.25µs p(99.9)=9.25ms 
     http_req_sending...............: avg=47.89µs min=5.03µs  med=10.51µs max=185.64ms p(90)=17.96µs  p(95)=119.2µs  p(99.9)=4.02ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.32ms min=1.84ms  med=24.11ms max=299.77ms p(90)=29.3ms   p(95)=31.56ms  p(99.9)=52.72ms
     http_reqs......................: 242603  2017.476842/s
     iteration_duration.............: avg=24.73ms min=3.77ms  med=24.45ms max=340.89ms p(90)=29.71ms  p(95)=32.07ms  p(99.9)=54.43ms
     iterations.....................: 242503  2016.645246/s
     success_rate...................: 100.00% ✓ 242503      ✗ 0     
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

     checks.........................: 100.00% ✓ 439617      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 176 MB  1.5 MB/s
     http_req_blocked...............: avg=3.54µs  min=1.13µs  med=2.51µs  max=4.09ms   p(90)=3.94µs   p(95)=4.59µs   p(99.9)=37.54µs
     http_req_connecting............: avg=690ns   min=0s      med=0s      max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.69ms min=2.16ms  med=40.19ms max=313.85ms p(90)=57.36ms  p(95)=62.5ms   p(99.9)=88.14ms
       { expected_response:true }...: avg=40.69ms min=2.16ms  med=40.19ms max=313.85ms p(90)=57.36ms  p(95)=62.5ms   p(99.9)=88.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146639
     http_req_receiving.............: avg=83.06µs min=29.67µs med=63.2µs  max=101.92ms p(90)=100.41µs p(95)=119.49µs p(99.9)=1.92ms 
     http_req_sending...............: avg=26.9µs  min=5.31µs  med=10.88µs max=93.4ms   p(90)=16.85µs  p(95)=20.61µs  p(99.9)=1.25ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.58ms min=2.05ms  med=40.08ms max=313.09ms p(90)=57.24ms  p(95)=62.37ms  p(99.9)=87.83ms
     http_reqs......................: 146639  1219.188854/s
     iteration_duration.............: avg=40.93ms min=4.48ms  med=40.4ms  max=341.98ms p(90)=57.57ms  p(95)=62.72ms  p(99.9)=88.82ms
     iterations.....................: 146539  1218.357432/s
     success_rate...................: 100.00% ✓ 146539      ✗ 0     
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

     checks.........................: 100.00% ✓ 201387     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 81 MB   670 kB/s
     http_req_blocked...............: avg=4.81µs  min=1.12µs  med=3.04µs  max=4.05ms   p(90)=4.62µs   p(95)=5.25µs   p(99.9)=46.96µs 
     http_req_connecting............: avg=1.5µs   min=0s      med=0s      max=4ms      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=89ms    min=3.96ms  med=88.46ms max=356.87ms p(90)=112.82ms p(95)=124.44ms p(99.9)=220.35ms
       { expected_response:true }...: avg=89ms    min=3.96ms  med=88.46ms max=356.87ms p(90)=112.82ms p(95)=124.44ms p(99.9)=220.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67229
     http_req_receiving.............: avg=85.47µs min=31.88µs med=77.14µs max=23.48ms  p(90)=112.05µs p(95)=125.45µs p(99.9)=860.92µs
     http_req_sending...............: avg=24.68µs min=5.51µs  med=13.33µs max=150.78ms p(90)=19.96µs  p(95)=22.23µs  p(99.9)=667.32µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.89ms min=3.87ms  med=88.36ms max=356.2ms  p(90)=112.71ms p(95)=124.33ms p(99.9)=220.27ms
     http_reqs......................: 67229   557.746534/s
     iteration_duration.............: avg=89.39ms min=27.62ms med=88.72ms max=382.71ms p(90)=113.07ms p(95)=124.77ms p(99.9)=225.13ms
     iterations.....................: 67129   556.916912/s
     success_rate...................: 100.00% ✓ 67129      ✗ 0    
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

     checks.........................: 100.00% ✓ 159180     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   529 kB/s
     http_req_blocked...............: avg=5.83µs   min=1.29µs  med=3.49µs   max=4.29ms   p(90)=4.89µs   p(95)=5.45µs   p(99.9)=101.47µs
     http_req_connecting............: avg=2.08µs   min=0s      med=0s       max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.64ms min=5.17ms  med=112.44ms max=369.23ms p(90)=136ms    p(95)=142.95ms p(99.9)=174.35ms
       { expected_response:true }...: avg=112.64ms min=5.17ms  med=112.44ms max=369.23ms p(90)=136ms    p(95)=142.95ms p(99.9)=174.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53160
     http_req_receiving.............: avg=136.13µs min=31.54µs med=83.47µs  max=156.43ms p(90)=115.53µs p(95)=127.99µs p(99.9)=1.39ms  
     http_req_sending...............: avg=20.69µs  min=6.01µs  med=15.84µs  max=17.57ms  p(90)=21.23µs  p(95)=23.08µs  p(99.9)=511.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.48ms min=5.07ms  med=112.32ms max=212.92ms p(90)=135.9ms  p(95)=142.83ms p(99.9)=173.86ms
     http_reqs......................: 53160   440.508918/s
     iteration_duration.............: avg=113.11ms min=9.02ms  med=112.73ms max=379.43ms p(90)=136.28ms p(95)=143.23ms p(99.9)=177.32ms
     iterations.....................: 53060   439.680271/s
     success_rate...................: 100.00% ✓ 53060      ✗ 0    
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

     checks.........................: 100.00% ✓ 89952      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   298 kB/s
     http_req_blocked...............: avg=5.25µs   min=1.25µs  med=3.44µs   max=2.66ms   p(90)=4.72µs   p(95)=5.3µs    p(99.9)=605.3µs 
     http_req_connecting............: avg=1.64µs   min=0s      med=0s       max=2.63ms   p(90)=0s       p(95)=0s       p(99.9)=580.86µs
     http_req_duration..............: avg=199.32ms min=8.49ms  med=201.47ms max=348.31ms p(90)=211.33ms p(95)=215.95ms p(99.9)=289.51ms
       { expected_response:true }...: avg=199.32ms min=8.49ms  med=201.47ms max=348.31ms p(90)=211.33ms p(95)=215.95ms p(99.9)=289.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30084
     http_req_receiving.............: avg=102.59µs min=35.81µs med=90.56µs  max=72.18ms  p(90)=122.08µs p(95)=135.66µs p(99.9)=666.75µs
     http_req_sending...............: avg=29.7µs   min=5.89µs  med=16.93µs  max=119.5ms  p(90)=21.49µs  p(95)=23.25µs  p(99.9)=597.01µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.19ms min=8.34ms  med=201.36ms max=348.06ms p(90)=211.21ms p(95)=215.84ms p(99.9)=288.94ms
     http_reqs......................: 30084   248.498476/s
     iteration_duration.............: avg=200.23ms min=49.68ms med=201.97ms max=361.56ms p(90)=211.6ms  p(95)=216.24ms p(99.9)=290.43ms
     iterations.....................: 29984   247.672461/s
     success_rate...................: 100.00% ✓ 29984      ✗ 0    
     vus............................: 35      min=35       max=50 
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

     checks.........................: 100.00% ✓ 86670      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=7.26µs   min=1.25µs  med=3.58µs   max=3.97ms   p(90)=5.01µs   p(95)=5.64µs   p(99.9)=1.82ms  
     http_req_connecting............: avg=3.47µs   min=0s      med=0s       max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=206.82ms min=6.55ms  med=187.31ms max=659.75ms p(90)=241.22ms p(95)=409.37ms p(99.9)=615.94ms
       { expected_response:true }...: avg=206.82ms min=6.55ms  med=187.31ms max=659.75ms p(90)=241.22ms p(95)=409.37ms p(99.9)=615.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28990
     http_req_receiving.............: avg=167.5µs  min=35.69µs med=95.78µs  max=159.22ms p(90)=127.61µs p(95)=141.12µs p(99.9)=1.43ms  
     http_req_sending...............: avg=36.05µs  min=5.9µs   med=17.43µs  max=208.62ms p(90)=22.39µs  p(95)=24.22µs  p(99.9)=591.18µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.61ms min=6.41ms  med=187.19ms max=659.64ms p(90)=240.88ms p(95)=408.89ms p(99.9)=615.79ms
     http_reqs......................: 28990   239.755518/s
     iteration_duration.............: avg=207.81ms min=56.17ms med=187.7ms  max=660.02ms p(90)=241.67ms p(95)=410.02ms p(99.9)=616.26ms
     iterations.....................: 28890   238.92849/s
     success_rate...................: 100.00% ✓ 28890      ✗ 0    
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

     checks.........................: 100.00% ✓ 846171      ✗ 0     
     data_received..................: 25 GB   205 MB/s
     data_sent......................: 339 MB  2.8 MB/s
     http_req_blocked...............: avg=3.3µs    min=1.01µs  med=2.21µs  max=11.98ms  p(90)=3.58µs  p(95)=4.35µs   p(99.9)=32.93µs
     http_req_connecting............: avg=631ns    min=0s      med=0s      max=7.11ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.03ms  min=1.85ms  med=20.57ms max=324.29ms p(90)=29.13ms p(95)=32.12ms  p(99.9)=54.05ms
       { expected_response:true }...: avg=21.03ms  min=1.85ms  med=20.57ms max=324.29ms p(90)=29.13ms p(95)=32.12ms  p(99.9)=54.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 282157
     http_req_receiving.............: avg=109.44µs min=28.61µs med=53.42µs max=234.55ms p(90)=99.78µs p(95)=248.85µs p(99.9)=8.33ms 
     http_req_sending...............: avg=54.37µs  min=4.76µs  med=9.71µs  max=153.28ms p(90)=17.66µs p(95)=122.25µs p(99.9)=6.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.86ms  min=1.76ms  med=20.44ms max=322.28ms p(90)=28.93ms p(95)=31.84ms  p(99.9)=52.77ms
     http_reqs......................: 282157  2346.759549/s
     iteration_duration.............: avg=21.26ms  min=3.85ms  med=20.79ms max=337.81ms p(90)=29.35ms p(95)=32.36ms  p(99.9)=54.74ms
     iterations.....................: 282057  2345.927828/s
     success_rate...................: 100.00% ✓ 282057      ✗ 0     
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

     checks.........................: 100.00% ✓ 697116      ✗ 0     
     data_received..................: 20 GB   170 MB/s
     data_sent......................: 279 MB  2.3 MB/s
     http_req_blocked...............: avg=3.45µs   min=1.02µs  med=2.47µs   max=12.04ms  p(90)=3.81µs  p(95)=4.48µs   p(99.9)=38.84µs 
     http_req_connecting............: avg=424ns    min=0s      med=0s       max=4.27ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.57ms  min=1.98ms  med=17.44ms  max=648.13ms p(90)=53.82ms p(95)=71.46ms  p(99.9)=209.92ms
       { expected_response:true }...: avg=25.57ms  min=1.98ms  med=17.44ms  max=648.13ms p(90)=53.82ms p(95)=71.46ms  p(99.9)=209.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 232472
     http_req_receiving.............: avg=731.68µs min=52.44µs med=108.57µs max=355.59ms p(90)=1.13ms  p(95)=1.79ms   p(99.9)=63.43ms 
     http_req_sending...............: avg=42.78µs  min=5.24µs  med=9.97µs   max=38.12ms  p(90)=17.79µs p(95)=106.54µs p(99.9)=3.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.8ms   min=1.85ms  med=16.87ms  max=648.02ms p(90)=52.45ms p(95)=69.87ms  p(99.9)=199.13ms
     http_reqs......................: 232472  1933.279464/s
     iteration_duration.............: avg=25.81ms  min=2.77ms  med=17.67ms  max=648.32ms p(90)=54.06ms p(95)=71.69ms  p(99.9)=211.4ms 
     iterations.....................: 232372  1932.447846/s
     success_rate...................: 100.00% ✓ 232372      ✗ 0     
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

     checks.........................: 100.00% ✓ 556059      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 223 MB  1.9 MB/s
     http_req_blocked...............: avg=3.25µs   min=972ns   med=2.43µs  max=4.33ms   p(90)=4.68µs   p(95)=5.86µs   p(99.9)=43.02µs
     http_req_connecting............: avg=199ns    min=0s      med=0s      max=1.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.09ms  min=2.35ms  med=31.13ms max=320.2ms  p(90)=42.83ms  p(95)=47.65ms  p(99.9)=89.29ms
       { expected_response:true }...: avg=32.09ms  min=2.35ms  med=31.13ms max=320.2ms  p(90)=42.83ms  p(95)=47.65ms  p(99.9)=89.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 185453
     http_req_receiving.............: avg=116.27µs min=30.09µs med=61.3µs  max=177.13ms p(90)=133.16µs p(95)=274.52µs p(99.9)=6.35ms 
     http_req_sending...............: avg=48.15µs  min=5.26µs  med=10.39µs max=159.46ms p(90)=24.23µs  p(95)=131.62µs p(99.9)=3.33ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.93ms  min=2.22ms  med=30.99ms max=308.92ms p(90)=42.63ms  p(95)=47.4ms   p(99.9)=88.76ms
     http_reqs......................: 185453  1541.532052/s
     iteration_duration.............: avg=32.36ms  min=4.14ms  med=31.37ms max=330.11ms p(90)=43.07ms  p(95)=47.9ms   p(99.9)=90.38ms
     iterations.....................: 185353  1540.700827/s
     success_rate...................: 100.00% ✓ 185353      ✗ 0     
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

     checks.........................: 100.00% ✓ 417024      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.91µs  min=1.1µs   med=2.88µs  max=3.95ms   p(90)=4.45µs   p(95)=5.14µs   p(99.9)=36.69µs
     http_req_connecting............: avg=720ns   min=0s      med=0s      max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.89ms min=2.31ms  med=42.35ms max=334.83ms p(90)=60.19ms  p(95)=65.69ms  p(99.9)=91.02ms
       { expected_response:true }...: avg=42.89ms min=2.31ms  med=42.35ms max=334.83ms p(90)=60.19ms  p(95)=65.69ms  p(99.9)=91.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139108
     http_req_receiving.............: avg=88.76µs min=28.07µs med=70.97µs max=106.65ms p(90)=110.08µs p(95)=128.45µs p(99.9)=1.72ms 
     http_req_sending...............: avg=30.42µs min=5µs     med=12.79µs max=156.39ms p(90)=19.61µs  p(95)=23.26µs  p(99.9)=1.16ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.77ms min=2.22ms  med=42.24ms max=334.16ms p(90)=60.07ms  p(95)=65.57ms  p(99.9)=90.63ms
     http_reqs......................: 139108  1156.296025/s
     iteration_duration.............: avg=43.15ms min=3.98ms  med=42.57ms max=346.5ms  p(90)=60.41ms  p(95)=65.91ms  p(99.9)=91.78ms
     iterations.....................: 139008  1155.464803/s
     success_rate...................: 100.00% ✓ 139008      ✗ 0     
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

     checks.........................: 100.00% ✓ 193041     ✗ 0    
     data_received..................: 5.6 GB  47 MB/s
     data_sent......................: 77 MB   642 kB/s
     http_req_blocked...............: avg=5.3µs    min=1.18µs  med=3.38µs  max=4.1ms    p(90)=4.95µs   p(95)=5.62µs   p(99.9)=50.52µs 
     http_req_connecting............: avg=1.62µs   min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.88ms  min=4.31ms  med=90.44ms max=360.66ms p(90)=115.24ms p(95)=127.69ms p(99.9)=232.63ms
       { expected_response:true }...: avg=92.88ms  min=4.31ms  med=90.44ms max=360.66ms p(90)=115.24ms p(95)=127.69ms p(99.9)=232.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64447
     http_req_receiving.............: avg=126.44µs min=30.62µs med=82.97µs max=103.62ms p(90)=117.45µs p(95)=131.04µs p(99.9)=1.24ms  
     http_req_sending...............: avg=26.22µs  min=6.11µs  med=15.04µs max=92.53ms  p(90)=21.41µs  p(95)=23.61µs  p(99.9)=730.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.73ms  min=4.18ms  med=90.31ms max=303.89ms p(90)=115.1ms  p(95)=127.45ms p(99.9)=232.19ms
     http_reqs......................: 64447   534.295574/s
     iteration_duration.............: avg=93.27ms  min=6.9ms   med=90.7ms  max=371.32ms p(90)=115.5ms  p(95)=128.01ms p(99.9)=234.31ms
     iterations.....................: 64347   533.466528/s
     success_rate...................: 100.00% ✓ 64347      ✗ 0    
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

     checks.........................: 100.00% ✓ 140274     ✗ 0    
     data_received..................: 4.1 GB  34 MB/s
     data_sent......................: 56 MB   466 kB/s
     http_req_blocked...............: avg=6µs      min=1.28µs  med=3.63µs   max=4ms      p(90)=5.12µs   p(95)=5.72µs   p(99.9)=281.38µs
     http_req_connecting............: avg=2.13µs   min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=128.77µs
     http_req_duration..............: avg=127.83ms min=5.76ms  med=125.39ms max=362.94ms p(90)=169.42ms p(95)=182.48ms p(99.9)=234.17ms
       { expected_response:true }...: avg=127.83ms min=5.76ms  med=125.39ms max=362.94ms p(90)=169.42ms p(95)=182.48ms p(99.9)=234.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46858
     http_req_receiving.............: avg=112.63µs min=33.88µs med=88.36µs  max=83.59ms  p(90)=120.14µs p(95)=132.72µs p(99.9)=953.94µs
     http_req_sending...............: avg=26.15µs  min=5.85µs  med=16.92µs  max=131.37ms p(90)=22.32µs  p(95)=24.09µs  p(99.9)=573.59µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=127.69ms min=5.63ms  med=125.27ms max=280.94ms p(90)=169.31ms p(95)=182.35ms p(99.9)=231.77ms
     http_reqs......................: 46858   388.072797/s
     iteration_duration.............: avg=128.36ms min=13.47ms med=125.72ms max=371.63ms p(90)=169.72ms p(95)=182.79ms p(99.9)=236.81ms
     iterations.....................: 46758   387.244608/s
     success_rate...................: 100.00% ✓ 46758      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 89592      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   297 kB/s
     http_req_blocked...............: avg=7.4µs    min=1.35µs  med=3.68µs   max=4.2ms    p(90)=5.22µs   p(95)=5.87µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=3.48µs   min=0s      med=0s       max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=200.07ms min=6.63ms  med=183.01ms max=670.72ms p(90)=230.14ms p(95)=283.9ms  p(99.9)=610.55ms
       { expected_response:true }...: avg=200.07ms min=6.63ms  med=183.01ms max=670.72ms p(90)=230.14ms p(95)=283.9ms  p(99.9)=610.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29964
     http_req_receiving.............: avg=103.86µs min=35.13µs med=99.38µs  max=19.85ms  p(90)=131.22µs p(95)=144.85µs p(99.9)=582.05µs
     http_req_sending...............: avg=32.71µs  min=6.18µs  med=18.39µs  max=99.84ms  p(90)=23.26µs  p(95)=25.08µs  p(99.9)=593.86µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.94ms min=6.47ms  med=182.88ms max=670.61ms p(90)=230.04ms p(95)=283.78ms p(99.9)=610.44ms
     http_reqs......................: 29964   247.548067/s
     iteration_duration.............: avg=201.03ms min=38.34ms med=183.38ms max=671.01ms p(90)=230.61ms p(95)=284.96ms p(99.9)=610.82ms
     iterations.....................: 29864   246.721915/s
     success_rate...................: 100.00% ✓ 29864      ✗ 0    
     vus............................: 25      min=25       max=50 
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

     checks.........................: 100.00% ✓ 86226      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=5.47µs   min=1.34µs  med=3.63µs   max=2.45ms   p(90)=5.01µs   p(95)=5.59µs   p(99.9)=694.41µs
     http_req_connecting............: avg=1.61µs   min=0s      med=0s       max=2.42ms   p(90)=0s       p(95)=0s       p(99.9)=621.87µs
     http_req_duration..............: avg=207.93ms min=8.57ms  med=208.12ms max=381.33ms p(90)=223.56ms p(95)=227.91ms p(99.9)=308.24ms
       { expected_response:true }...: avg=207.93ms min=8.57ms  med=208.12ms max=381.33ms p(90)=223.56ms p(95)=227.91ms p(99.9)=308.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28842
     http_req_receiving.............: avg=112.81µs min=35.66µs med=94.49µs  max=74.91ms  p(90)=126.35µs p(95)=139.05µs p(99.9)=862.11µs
     http_req_sending...............: avg=42.99µs  min=6.32µs  med=17.69µs  max=97.85ms  p(90)=22.23µs  p(95)=24.04µs  p(99.9)=628.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.78ms min=8.43ms  med=208ms    max=332.08ms p(90)=223.43ms p(95)=227.75ms p(99.9)=306.28ms
     http_reqs......................: 28842   238.09029/s
     iteration_duration.............: avg=208.92ms min=74.41ms med=208.41ms max=389.6ms  p(90)=223.84ms p(95)=228.22ms p(99.9)=312.42ms
     iterations.....................: 28742   237.264792/s
     success_rate...................: 100.00% ✓ 28742      ✗ 0    
     vus............................: 46      min=46       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

