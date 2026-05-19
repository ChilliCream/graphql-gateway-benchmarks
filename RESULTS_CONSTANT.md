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
| hive-router | v0.0.49 | 3,038 | 3,187 | 2,910 | 2.6% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,178 | 2,231 | 2,171 | 0.9% |  |
| grafbase | 0.53.3 | 2,005 | 2,068 | 1,984 | 1.4% |  |
| cosmo | 0.307.0 | 1,247 | 1,262 | 1,241 | 0.6% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 541 | 552 | 535 | 1.0% |  |
| apollo-router | v2.13.1 | 399 | 410 | 394 | 1.3% |  |
| hive-gateway | 2.5.25 | 255 | 260 | 253 | 0.8% |  |
| apollo-gateway | 2.13.3 | 249 | 252 | 248 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,492 | 2,605 | 2,469 | 1.7% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,990 | 2,036 | 1,966 | 1.2% |  |
| grafbase | 0.53.3 | 1,524 | 1,565 | 1,505 | 1.3% |  |
| cosmo | 0.307.0 | 1,170 | 1,195 | 1,163 | 1.0% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 512 | 523 | 507 | 1.0% |  |
| apollo-router | v2.13.1 | 372 | 382 | 368 | 1.3% |  |
| hive-gateway | 2.5.25 | 246 | 250 | 243 | 0.9% |  |
| apollo-gateway | 2.13.3 | 236 | 240 | 235 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1095456     ✗ 0     
     data_received..................: 32 GB   267 MB/s
     data_sent......................: 439 MB  3.7 MB/s
     http_req_blocked...............: avg=2.7µs    min=952ns   med=2µs     max=13.8ms   p(90)=3.14µs   p(95)=3.78µs   p(99.9)=30.52µs
     http_req_connecting............: avg=270ns    min=0s      med=0s      max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.2ms   min=1.7ms   med=15.3ms  max=349.11ms p(90)=23.84ms  p(95)=27.49ms  p(99.9)=50.74ms
       { expected_response:true }...: avg=16.2ms   min=1.7ms   med=15.3ms  max=349.11ms p(90)=23.84ms  p(95)=27.49ms  p(99.9)=50.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 365252
     http_req_receiving.............: avg=128.14µs min=26.89µs med=49.96µs max=34.52ms  p(90)=101.29µs p(95)=278.79µs p(99.9)=10.74ms
     http_req_sending...............: avg=59.83µs  min=4.98µs  med=8.88µs  max=211.1ms  p(90)=15.72µs  p(95)=122.57µs p(99.9)=8.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.01ms  min=1.63ms  med=15.15ms max=348.57ms p(90)=23.59ms  p(95)=27.11ms  p(99.9)=49.41ms
     http_reqs......................: 365252  3038.728328/s
     iteration_duration.............: avg=16.42ms  min=2.1ms   med=15.5ms  max=359.93ms p(90)=24.06ms  p(95)=27.74ms  p(99.9)=52.09ms
     iterations.....................: 365152  3037.896374/s
     success_rate...................: 100.00% ✓ 365152      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 785688      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 315 MB  2.6 MB/s
     http_req_blocked...............: avg=2.82µs   min=981ns   med=1.95µs  max=22.18ms  p(90)=3.02µs   p(95)=3.6µs    p(99.9)=29.65µs 
     http_req_connecting............: avg=450ns    min=0s      med=0s      max=4.82ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.67ms  min=2.38ms  med=14.66ms max=332.07ms p(90)=49.82ms  p(95)=68.37ms  p(99.9)=164.35ms
       { expected_response:true }...: avg=22.67ms  min=2.38ms  med=14.66ms max=332.07ms p(90)=49.82ms  p(95)=68.37ms  p(99.9)=164.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 261996
     http_req_receiving.............: avg=657.75µs min=50.43µs med=99.37µs max=239.07ms p(90)=953.86µs p(95)=1.49ms   p(99.9)=60.24ms 
     http_req_sending...............: avg=44.71µs  min=4.93µs  med=8.75µs  max=130.09ms p(90)=14.69µs  p(95)=106.18µs p(99.9)=4.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.96ms  min=2.28ms  med=14.14ms max=331.99ms p(90)=48.35ms  p(95)=66.83ms  p(99.9)=162.34ms
     http_reqs......................: 261996  2178.258963/s
     iteration_duration.............: avg=22.9ms   min=2.97ms  med=14.87ms max=348.87ms p(90)=50.07ms  p(95)=68.6ms   p(99.9)=165.91ms
     iterations.....................: 261896  2177.427553/s
     success_rate...................: 100.00% ✓ 261896      ✗ 0     
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

     checks.........................: 100.00% ✓ 723279      ✗ 0     
     data_received..................: 21 GB   176 MB/s
     data_sent......................: 290 MB  2.4 MB/s
     http_req_blocked...............: avg=3.64µs   min=1.02µs  med=2.6µs   max=10.88ms  p(90)=4.04µs   p(95)=4.78µs   p(99.9)=42.33µs
     http_req_connecting............: avg=446ns    min=0s      med=0s      max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.63ms  min=1.92ms  med=24.37ms max=345.13ms p(90)=29.77ms  p(95)=32.27ms  p(99.9)=54.58ms
       { expected_response:true }...: avg=24.63ms  min=1.92ms  med=24.37ms max=345.13ms p(90)=29.77ms  p(95)=32.27ms  p(99.9)=54.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 241193
     http_req_receiving.............: avg=118.56µs min=30.42µs med=61.66µs max=172.02ms p(90)=105.93µs p(95)=210.97µs p(99.9)=10.07ms
     http_req_sending...............: avg=52.39µs  min=4.89µs  med=10.74µs max=275.33ms p(90)=18.12µs  p(95)=119.92µs p(99.9)=4.18ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.46ms  min=1.83ms  med=24.24ms max=344.58ms p(90)=29.57ms  p(95)=31.97ms  p(99.9)=53.61ms
     http_reqs......................: 241193  2005.680772/s
     iteration_duration.............: avg=24.87ms  min=4.18ms  med=24.58ms max=362.41ms p(90)=30ms     p(95)=32.52ms  p(99.9)=55.32ms
     iterations.....................: 241093  2004.849205/s
     success_rate...................: 100.00% ✓ 241093      ✗ 0     
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

     checks.........................: 100.00% ✓ 449868      ✗ 0     
     data_received..................: 13 GB   110 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.22µs  min=1.07µs  med=2.3µs   max=4.27ms   p(90)=3.55µs  p(95)=4.13µs   p(99.9)=34.65µs
     http_req_connecting............: avg=600ns   min=0s      med=0s      max=4.23ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.77ms min=2.16ms  med=39.21ms max=303.94ms p(90)=56.22ms p(95)=61.35ms  p(99.9)=86.7ms 
       { expected_response:true }...: avg=39.77ms min=2.16ms  med=39.21ms max=303.94ms p(90)=56.22ms p(95)=61.35ms  p(99.9)=86.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 150056
     http_req_receiving.............: avg=82.46µs min=29.14µs med=61.17µs max=170.01ms p(90)=96.79µs p(95)=116.01µs p(99.9)=1.8ms  
     http_req_sending...............: avg=25.77µs min=5.28µs  med=10.26µs max=132.09ms p(90)=15.53µs p(95)=19.71µs  p(99.9)=1.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.66ms min=2.06ms  med=39.12ms max=303.48ms p(90)=56.11ms p(95)=61.23ms  p(99.9)=86.41ms
     http_reqs......................: 150056  1247.543725/s
     iteration_duration.............: avg=40ms    min=4.42ms  med=39.42ms max=334.55ms p(90)=56.43ms p(95)=61.55ms  p(99.9)=87.3ms 
     iterations.....................: 149956  1246.712339/s
     success_rate...................: 100.00% ✓ 149956      ✗ 0     
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

     checks.........................: 100.00% ✓ 195606     ✗ 0    
     data_received..................: 5.7 GB  48 MB/s
     data_sent......................: 78 MB   651 kB/s
     http_req_blocked...............: avg=4.89µs  min=1.13µs  med=2.98µs  max=4.43ms   p(90)=4.55µs   p(95)=5.16µs   p(99.9)=58.4µs  
     http_req_connecting............: avg=1.61µs  min=0s      med=0s      max=4.4ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=91.65ms min=4.13ms  med=89ms    max=356.26ms p(90)=110.72ms p(95)=122ms    p(99.9)=215.46ms
       { expected_response:true }...: avg=91.65ms min=4.13ms  med=89ms    max=356.26ms p(90)=110.72ms p(95)=122ms    p(99.9)=215.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65302
     http_req_receiving.............: avg=85.04µs min=31.48µs med=77µs    max=48.03ms  p(90)=111.02µs p(95)=123.32µs p(99.9)=782.54µs
     http_req_sending...............: avg=25.6µs  min=5.71µs  med=13.49µs max=171.87ms p(90)=20.29µs  p(95)=22.55µs  p(99.9)=636.96µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.54ms min=4.01ms  med=88.9ms  max=355.76ms p(90)=110.61ms p(95)=121.87ms p(99.9)=215.23ms
     http_reqs......................: 65302   541.717715/s
     iteration_duration.............: avg=92.03ms min=18.07ms med=89.23ms max=370.3ms  p(90)=110.97ms p(95)=122.3ms  p(99.9)=217.33ms
     iterations.....................: 65202   540.888157/s
     success_rate...................: 100.00% ✓ 65202      ✗ 0    
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

     checks.........................: 100.00% ✓ 144477     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   480 kB/s
     http_req_blocked...............: avg=4.35µs   min=1.22µs  med=3.29µs   max=2.13ms   p(90)=4.69µs   p(95)=5.25µs   p(99.9)=137µs   
     http_req_connecting............: avg=886ns    min=0s      med=0s       max=2.09ms   p(90)=0s       p(95)=0s       p(99.9)=69.09µs 
     http_req_duration..............: avg=124.1ms  min=5.39ms  med=123.77ms max=369.03ms p(90)=150.24ms p(95)=158.04ms p(99.9)=190.59ms
       { expected_response:true }...: avg=124.1ms  min=5.39ms  med=123.77ms max=369.03ms p(90)=150.24ms p(95)=158.04ms p(99.9)=190.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48259
     http_req_receiving.............: avg=152.79µs min=30.76µs med=82.12µs  max=261.12ms p(90)=113.16µs p(95)=124.7µs  p(99.9)=846.16µs
     http_req_sending...............: avg=23.36µs  min=5.4µs   med=15.27µs  max=74.57ms  p(90)=20.66µs  p(95)=22.42µs  p(99.9)=652.14µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.93ms min=5.28ms  med=123.64ms max=260.52ms p(90)=150.09ms p(95)=157.84ms p(99.9)=187.92ms
     http_reqs......................: 48259   399.851151/s
     iteration_duration.............: avg=124.62ms min=36.14ms med=124.07ms max=378.35ms p(90)=150.51ms p(95)=158.32ms p(99.9)=193.84ms
     iterations.....................: 48159   399.022598/s
     success_rate...................: 100.00% ✓ 48159      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 92241      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   306 kB/s
     http_req_blocked...............: avg=7.38µs   min=1.25µs  med=3.52µs   max=4.56ms   p(90)=4.97µs   p(95)=5.62µs   p(99.9)=1.86ms  
     http_req_connecting............: avg=3.66µs   min=0s      med=0s       max=4.51ms   p(90)=0s       p(95)=0s       p(99.9)=1.81ms  
     http_req_duration..............: avg=194.37ms min=6.35ms  med=168.38ms max=622.7ms  p(90)=263.95ms p(95)=383.63ms p(99.9)=566.72ms
       { expected_response:true }...: avg=194.37ms min=6.35ms  med=168.38ms max=622.7ms  p(90)=263.95ms p(95)=383.63ms p(99.9)=566.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30847
     http_req_receiving.............: avg=104.84µs min=35.18µs med=95.14µs  max=37.09ms  p(90)=127.56µs p(95)=140.51µs p(99.9)=765.48µs
     http_req_sending...............: avg=21.52µs  min=6.2µs   med=17.13µs  max=22.84ms  p(90)=22.39µs  p(95)=24.45µs  p(99.9)=586.11µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.24ms min=6.19ms  med=168.25ms max=622.56ms p(90)=263.87ms p(95)=383.51ms p(99.9)=566.61ms
     http_reqs......................: 30847   255.153881/s
     iteration_duration.............: avg=195.25ms min=27.11ms med=168.91ms max=622.93ms p(90)=264.46ms p(95)=388.14ms p(99.9)=567.02ms
     iterations.....................: 30747   254.326721/s
     success_rate...................: 100.00% ✓ 30747      ✗ 0    
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

     checks.........................: 100.00% ✓ 90426      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 36 MB   300 kB/s
     http_req_blocked...............: avg=4.82µs   min=1.27µs  med=3.14µs   max=2.48ms   p(90)=4.39µs   p(95)=4.94µs   p(99.9)=616.51µs
     http_req_connecting............: avg=1.5µs    min=0s      med=0s       max=2.46ms   p(90)=0s       p(95)=0s       p(99.9)=567.97µs
     http_req_duration..............: avg=198.26ms min=8.49ms  med=198.41ms max=352ms    p(90)=210.53ms p(95)=214.95ms p(99.9)=282.17ms
       { expected_response:true }...: avg=198.26ms min=8.49ms  med=198.41ms max=352ms    p(90)=210.53ms p(95)=214.95ms p(99.9)=282.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30242
     http_req_receiving.............: avg=101.74µs min=35.06µs med=87.61µs  max=82.78ms  p(90)=118.55µs p(95)=130.33µs p(99.9)=535.97µs
     http_req_sending...............: avg=29.69µs  min=5.55µs  med=15.64µs  max=95.09ms  p(90)=20.79µs  p(95)=22.59µs  p(99.9)=567.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.13ms min=8.4ms   med=198.29ms max=351.3ms  p(90)=210.42ms p(95)=214.79ms p(99.9)=281.96ms
     http_reqs......................: 30242   249.806865/s
     iteration_duration.............: avg=199.17ms min=57.1ms  med=198.71ms max=366.31ms p(90)=210.78ms p(95)=215.29ms p(99.9)=283.46ms
     iterations.....................: 30142   248.980838/s
     success_rate...................: 100.00% ✓ 30142      ✗ 0    
     vus............................: 37      min=37       max=50 
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

     checks.........................: 100.00% ✓ 898782      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 360 MB  3.0 MB/s
     http_req_blocked...............: avg=2.98µs   min=942ns   med=2.17µs  max=4.86ms   p(90)=3.68µs   p(95)=4.55µs   p(99.9)=32.22µs
     http_req_connecting............: avg=367ns    min=0s      med=0s      max=4.68ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.78ms  min=1.79ms  med=19.22ms max=329.05ms p(90)=27.23ms  p(95)=30.34ms  p(99.9)=53.27ms
       { expected_response:true }...: avg=19.78ms  min=1.79ms  med=19.22ms max=329.05ms p(90)=27.23ms  p(95)=30.34ms  p(99.9)=53.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 299694
     http_req_receiving.............: avg=113.38µs min=28.32µs med=53.84µs max=160.92ms p(90)=105.38µs p(95)=264.79µs p(99.9)=8.5ms  
     http_req_sending...............: avg=50.74µs  min=5.25µs  med=9.58µs  max=76.67ms  p(90)=18.21µs  p(95)=125.27µs p(99.9)=4.75ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.62ms  min=1.69ms  med=19.08ms max=328.54ms p(90)=27.03ms  p(95)=30.08ms  p(99.9)=52.14ms
     http_reqs......................: 299694  2492.799829/s
     iteration_duration.............: avg=20.01ms  min=3.51ms  med=19.43ms max=341.94ms p(90)=27.45ms  p(95)=30.58ms  p(99.9)=54ms   
     iterations.....................: 299594  2491.968047/s
     success_rate...................: 100.00% ✓ 299594      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 717501      ✗ 0     
     data_received..................: 21 GB   174 MB/s
     data_sent......................: 288 MB  2.4 MB/s
     http_req_blocked...............: avg=3.39µs   min=1.02µs  med=2.48µs   max=11.34ms  p(90)=3.98µs  p(95)=4.75µs   p(99.9)=37.57µs 
     http_req_connecting............: avg=444ns    min=0s      med=0s       max=4.05ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.83ms  min=1.9ms   med=17.07ms  max=614.45ms p(90)=52.48ms p(95)=68.93ms  p(99.9)=185.13ms
       { expected_response:true }...: avg=24.83ms  min=1.9ms   med=17.07ms  max=614.45ms p(90)=52.48ms p(95)=68.93ms  p(99.9)=185.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 239267
     http_req_receiving.............: avg=666.31µs min=50.77µs med=105.52µs max=247.73ms p(90)=1.13ms  p(95)=1.82ms   p(99.9)=54.86ms 
     http_req_sending...............: avg=45.59µs  min=5.33µs  med=10.12µs  max=257.89ms p(90)=18.49µs p(95)=111.32µs p(99.9)=3.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.12ms  min=1.77ms  med=16.52ms  max=614.33ms p(90)=51.14ms p(95)=67.49ms  p(99.9)=182.75ms
     http_reqs......................: 239267  1990.023549/s
     iteration_duration.............: avg=25.07ms  min=2.56ms  med=17.29ms  max=614.65ms p(90)=52.71ms p(95)=69.17ms  p(99.9)=185.63ms
     iterations.....................: 239167  1989.191832/s
     success_rate...................: 100.00% ✓ 239167      ✗ 0     
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

     checks.........................: 100.00% ✓ 549723      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.45µs   min=981ns  med=2.42µs  max=3.5ms    p(90)=4.77µs   p(95)=5.93µs   p(99.9)=45.5µs 
     http_req_connecting............: avg=419ns    min=0s     med=0s      max=3.47ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.46ms  min=2.35ms med=31.53ms max=338.19ms p(90)=43.24ms  p(95)=47.96ms  p(99.9)=88.24ms
       { expected_response:true }...: avg=32.46ms  min=2.35ms med=31.53ms max=338.19ms p(90)=43.24ms  p(95)=47.96ms  p(99.9)=88.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183341
     http_req_receiving.............: avg=117.82µs min=30.6µs med=62.33µs max=191.88ms p(90)=135.15µs p(95)=278.21µs p(99.9)=5.9ms  
     http_req_sending...............: avg=50.54µs  min=4.98µs med=10.73µs max=195.33ms p(90)=24.49µs  p(95)=136.27µs p(99.9)=3.78ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.29ms  min=2.26ms med=31.38ms max=337.75ms p(90)=43.05ms  p(95)=47.7ms   p(99.9)=87.54ms
     http_reqs......................: 183341  1524.043367/s
     iteration_duration.............: avg=32.73ms  min=3.47ms med=31.76ms max=357.74ms p(90)=43.48ms  p(95)=48.2ms   p(99.9)=88.96ms
     iterations.....................: 183241  1523.212105/s
     success_rate...................: 100.00% ✓ 183241      ✗ 0     
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

     checks.........................: 100.00% ✓ 422262      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.33µs  min=1.04µs med=2.23µs  max=4.4ms    p(90)=3.68µs   p(95)=4.36µs   p(99.9)=36.87µs
     http_req_connecting............: avg=713ns   min=0s     med=0s      max=4.35ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.38ms min=2.24ms med=41.81ms max=335.28ms p(90)=59.6ms   p(95)=65.03ms  p(99.9)=91.25ms
       { expected_response:true }...: avg=42.38ms min=2.24ms med=41.81ms max=335.28ms p(90)=59.6ms   p(95)=65.03ms  p(99.9)=91.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140854
     http_req_receiving.............: avg=86.38µs min=28.7µs med=64.78µs max=175.76ms p(90)=101.52µs p(95)=119.77µs p(99.9)=1.83ms 
     http_req_sending...............: avg=24.6µs  min=5.15µs med=10.86µs max=79.32ms  p(90)=17.27µs  p(95)=20.87µs  p(99.9)=1.1ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.27ms min=2.11ms med=41.71ms max=294.77ms p(90)=59.49ms  p(95)=64.92ms  p(99.9)=90.91ms
     http_reqs......................: 140854  1170.991221/s
     iteration_duration.............: avg=42.62ms min=4.2ms  med=42.01ms max=352.59ms p(90)=59.81ms  p(95)=65.23ms  p(99.9)=91.66ms
     iterations.....................: 140754  1170.15987/s
     success_rate...................: 100.00% ✓ 140754      ✗ 0     
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

     checks.........................: 100.00% ✓ 185022     ✗ 0    
     data_received..................: 5.4 GB  45 MB/s
     data_sent......................: 74 MB   615 kB/s
     http_req_blocked...............: avg=4.69µs   min=1.13µs med=3.11µs  max=4.11ms   p(90)=4.61µs   p(95)=5.21µs   p(99.9)=50.04µs 
     http_req_connecting............: avg=1.29µs   min=0s     med=0s      max=3.71ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.89ms  min=4.29ms med=95.06ms max=349.22ms p(90)=122.95ms p(95)=137.4ms  p(99.9)=232.93ms
       { expected_response:true }...: avg=96.89ms  min=4.29ms med=95.06ms max=349.22ms p(90)=122.95ms p(95)=137.4ms  p(99.9)=232.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61774
     http_req_receiving.............: avg=103.15µs min=31.5µs med=82.27µs max=184.7ms  p(90)=116.05µs p(95)=129.38µs p(99.9)=1.1ms   
     http_req_sending...............: avg=28.25µs  min=5.89µs med=14.57µs max=184.35ms p(90)=20.9µs   p(95)=23.16µs  p(99.9)=902.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.75ms  min=4.18ms med=94.93ms max=325.46ms p(90)=122.83ms p(95)=137.25ms p(99.9)=231.86ms
     http_reqs......................: 61774   512.328474/s
     iteration_duration.............: avg=97.29ms  min=9.78ms med=95.31ms max=362.08ms p(90)=123.22ms p(95)=137.75ms p(99.9)=235.53ms
     iterations.....................: 61674   511.499115/s
     success_rate...................: 100.00% ✓ 61674      ✗ 0    
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

     checks.........................: 100.00% ✓ 134730     ✗ 0    
     data_received..................: 3.9 GB  33 MB/s
     data_sent......................: 54 MB   448 kB/s
     http_req_blocked...............: avg=6.05µs   min=1.12µs  med=3.42µs   max=4.07ms   p(90)=4.9µs    p(95)=5.46µs   p(99.9)=612.3µs 
     http_req_connecting............: avg=2.44µs   min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=539.29µs
     http_req_duration..............: avg=133.08ms min=5.95ms  med=130.46ms max=326.09ms p(90)=175.99ms p(95)=189.43ms p(99.9)=247.59ms
       { expected_response:true }...: avg=133.08ms min=5.95ms  med=130.46ms max=326.09ms p(90)=175.99ms p(95)=189.43ms p(99.9)=247.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45010
     http_req_receiving.............: avg=172.88µs min=33.14µs med=87.77µs  max=184.46ms p(90)=119.3µs  p(95)=131.54µs p(99.9)=1.3ms   
     http_req_sending...............: avg=32.73µs  min=5.88µs  med=16.23µs  max=227.93ms p(90)=21.43µs  p(95)=23.27µs  p(99.9)=567.91µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=132.87ms min=5.82ms  med=130.32ms max=285.4ms  p(90)=175.67ms p(95)=189.03ms p(99.9)=242.1ms 
     http_reqs......................: 45010   372.7057/s
     iteration_duration.............: avg=133.65ms min=22.38ms med=130.79ms max=371.23ms p(90)=176.29ms p(95)=189.76ms p(99.9)=252.06ms
     iterations.....................: 44910   371.877649/s
     success_rate...................: 100.00% ✓ 44910      ✗ 0    
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

     checks.........................: 100.00% ✓ 89397      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   297 kB/s
     http_req_blocked...............: avg=6.96µs   min=1.12µs  med=3.46µs   max=3.96ms   p(90)=4.81µs   p(95)=5.38µs   p(99.9)=1.69ms  
     http_req_connecting............: avg=3.35µs   min=0s      med=0s       max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=200.57ms min=6.49ms  med=189.59ms max=670.9ms  p(90)=254.08ms p(95)=374.7ms  p(99.9)=568.22ms
       { expected_response:true }...: avg=200.57ms min=6.49ms  med=189.59ms max=670.9ms  p(90)=254.08ms p(95)=374.7ms  p(99.9)=568.22ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29899
     http_req_receiving.............: avg=106.91µs min=32.05µs med=94.62µs  max=164.9ms  p(90)=126.49µs p(95)=139.98µs p(99.9)=544.35µs
     http_req_sending...............: avg=36.35µs  min=6.23µs  med=17.4µs   max=123.37ms p(90)=22.18µs  p(95)=24.02µs  p(99.9)=571.14µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.42ms min=6.35ms  med=189.46ms max=670.82ms p(90)=253.94ms p(95)=374.61ms p(99.9)=567.96ms
     http_reqs......................: 29899   246.949921/s
     iteration_duration.............: avg=201.52ms min=48.51ms med=190.02ms max=671.09ms p(90)=254.58ms p(95)=376ms    p(99.9)=568.51ms
     iterations.....................: 29799   246.123974/s
     success_rate...................: 100.00% ✓ 29799      ✗ 0    
     vus............................: 19      min=19       max=50 
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

     checks.........................: 100.00% ✓ 85659      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   284 kB/s
     http_req_blocked...............: avg=5.09µs   min=1.25µs  med=3.54µs   max=2.27ms   p(90)=4.86µs   p(95)=5.46µs   p(99.9)=512.38µs
     http_req_connecting............: avg=1.39µs   min=0s      med=0s       max=2.25ms   p(90)=0s       p(95)=0s       p(99.9)=477.24µs
     http_req_duration..............: avg=209.28ms min=8.74ms  med=213.89ms max=395.65ms p(90)=222.06ms p(95)=227.47ms p(99.9)=297.12ms
       { expected_response:true }...: avg=209.28ms min=8.74ms  med=213.89ms max=395.65ms p(90)=222.06ms p(95)=227.47ms p(99.9)=297.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28653
     http_req_receiving.............: avg=100.63µs min=32.91µs med=94.71µs  max=45.21ms  p(90)=126.21µs p(95)=139.02µs p(99.9)=836.86µs
     http_req_sending...............: avg=29.4µs   min=6.27µs  med=17.41µs  max=68.99ms  p(90)=22.45µs  p(95)=24.27µs  p(99.9)=688.79µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.15ms min=8.59ms  med=213.77ms max=395.48ms p(90)=221.94ms p(95)=227.36ms p(99.9)=297.02ms
     http_reqs......................: 28653   236.612513/s
     iteration_duration.............: avg=210.28ms min=58.83ms med=214.17ms max=407.89ms p(90)=222.34ms p(95)=227.75ms p(99.9)=298.16ms
     iterations.....................: 28553   235.786727/s
     success_rate...................: 100.00% ✓ 28553      ✗ 0    
     vus............................: 42      min=42       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

