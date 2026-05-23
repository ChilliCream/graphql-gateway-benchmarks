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
| hive-router | v0.0.49 | 1,585 | 1,624 | 1,578 | 0.9% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,441 | 1,462 | 1,433 | 0.7% |  |
| cosmo | 0.307.0 | 1,145 | 1,162 | 1,139 | 0.7% | non-compatible response (1 across 1/9 runs) |
| grafbase | 0.53.3 | 1,129 | 1,151 | 1,121 | 1.0% |  |
| hive-gateway-router-runtime | 2.5.25 | 507 | 518 | 500 | 1.2% |  |
| apollo-router | v2.13.1 | 377 | 382 | 369 | 1.0% |  |
| hive-gateway | 2.5.25 | 242 | 246 | 239 | 1.0% |  |
| apollo-gateway | 2.13.3 | 231 | 234 | 229 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 580005      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.36µs  min=952ns   med=2.09µs  max=8.5ms    p(90)=3.85µs   p(95)=4.78µs  p(99.9)=34.07µs
     http_req_connecting............: avg=784ns   min=0s      med=0s      max=8.46ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=30.79ms min=14.59ms med=30.52ms max=319.37ms p(90)=36.6ms   p(95)=38.52ms p(99.9)=57.4ms 
       { expected_response:true }...: avg=30.79ms min=14.59ms med=30.52ms max=319.37ms p(90)=36.6ms   p(95)=38.52ms p(99.9)=57.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 193435
     http_req_receiving.............: avg=81.45µs min=27.27µs med=51.55µs max=114.7ms  p(90)=102.61µs p(95)=148.6µs p(99.9)=2.21ms 
     http_req_sending...............: avg=36.38µs min=5.02µs  med=9.22µs  max=179.02ms p(90)=19.57µs  p(95)=45.9µs  p(99.9)=2.06ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.67ms min=14.51ms med=30.42ms max=315.95ms p(90)=36.48ms  p(95)=38.38ms p(99.9)=56.25ms
     http_reqs......................: 193435  1585.474734/s
     iteration_duration.............: avg=31.02ms min=14.84ms med=30.74ms max=335.16ms p(90)=36.81ms  p(95)=38.74ms p(99.9)=57.8ms 
     iterations.....................: 193335  1584.655092/s
     success_rate...................: 100.00% ✓ 193335      ✗ 0     
     vus............................: 32      min=0         max=50  
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

     checks.........................: 100.00% ✓ 527295      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 211 MB  1.7 MB/s
     http_req_blocked...............: avg=3.03µs   min=942ns   med=2.05µs  max=5.13ms   p(90)=3.76µs  p(95)=4.65µs   p(99.9)=31.95µs
     http_req_connecting............: avg=434ns    min=0s      med=0s      max=4.63ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.88ms  min=13.77ms med=32.76ms max=488.9ms  p(90)=41.55ms p(95)=45.08ms  p(99.9)=82.68ms
       { expected_response:true }...: avg=33.88ms  min=13.77ms med=32.76ms max=488.9ms  p(90)=41.55ms p(95)=45.08ms  p(99.9)=82.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175865
     http_req_receiving.............: avg=767.71µs min=51.44µs med=115.9µs max=266.12ms p(90)=2.2ms   p(95)=3.33ms   p(99.9)=15.41ms
     http_req_sending...............: avg=42.2µs   min=4.99µs  med=9.03µs  max=266.23ms p(90)=19.9µs  p(95)=105.16µs p(99.9)=2.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.07ms  min=13.64ms med=31.98ms max=488.8ms  p(90)=40.5ms  p(95)=43.89ms  p(99.9)=81.11ms
     http_reqs......................: 175865  1441.421104/s
     iteration_duration.............: avg=34.13ms  min=14.06ms med=32.98ms max=489.09ms p(90)=41.77ms p(95)=45.3ms   p(99.9)=83.79ms
     iterations.....................: 175765  1440.601486/s
     success_rate...................: 100.00% ✓ 175765      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 419169      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.49µs  min=952ns   med=2.38µs  max=4.05ms   p(90)=3.97µs   p(95)=4.72µs   p(99.9)=32.74µs
     http_req_connecting............: avg=741ns   min=0s      med=0s      max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.7ms  min=19.37ms med=42.11ms max=318.93ms p(90)=51.87ms  p(95)=54.94ms  p(99.9)=72.84ms
       { expected_response:true }...: avg=42.7ms  min=19.37ms med=42.11ms max=318.93ms p(90)=51.87ms  p(95)=54.94ms  p(99.9)=72.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139823
     http_req_receiving.............: avg=84.04µs min=28.73µs med=62.61µs max=65.57ms  p(90)=107.04µs p(95)=133.27µs p(99.9)=1.72ms 
     http_req_sending...............: avg=27.7µs  min=5.26µs  med=10.52µs max=117.82ms p(90)=18.18µs  p(95)=22.92µs  p(99.9)=1.3ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.58ms min=19.29ms med=42ms    max=299.89ms p(90)=51.76ms  p(95)=54.83ms  p(99.9)=72.43ms
     http_reqs......................: 139823  1145.779686/s
     iteration_duration.............: avg=42.93ms min=21.46ms med=42.31ms max=348.32ms p(90)=52.08ms  p(95)=55.14ms  p(99.9)=73.21ms
     iterations.....................: 139723  1144.960236/s
     success_rate...................: 100.00% ✓ 139723      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 413208      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.7µs    min=922ns   med=2.2µs   max=10.69ms  p(90)=4.54µs   p(95)=5.69µs   p(99.9)=50.12µs
     http_req_connecting............: avg=778ns    min=0s      med=0s      max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.28ms  min=17.15ms med=42.8ms  max=338.17ms p(90)=52.55ms  p(95)=55.84ms  p(99.9)=80.28ms
       { expected_response:true }...: avg=43.28ms  min=17.15ms med=42.8ms  max=338.17ms p(90)=52.55ms  p(95)=55.84ms  p(99.9)=80.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137836
     http_req_receiving.............: avg=124.64µs min=29.49µs med=58.58µs max=254.28ms p(90)=129.86µs p(95)=205.49µs p(99.9)=3.77ms 
     http_req_sending...............: avg=37.67µs  min=5.05µs  med=9.68µs  max=114.06ms p(90)=23.4µs   p(95)=109.53µs p(99.9)=2.6ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.12ms  min=17.07ms med=42.67ms max=230.94ms p(90)=52.41ms  p(95)=55.67ms  p(99.9)=79.83ms
     http_reqs......................: 137836  1129.533156/s
     iteration_duration.............: avg=43.55ms  min=17.35ms med=43.04ms max=359.68ms p(90)=52.79ms  p(95)=56.08ms  p(99.9)=80.89ms
     iterations.....................: 137736  1128.71368/s
     success_rate...................: 100.00% ✓ 137736      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 186285     ✗ 0    
     data_received..................: 5.4 GB  45 MB/s
     data_sent......................: 75 MB   610 kB/s
     http_req_blocked...............: avg=4.56µs  min=1.12µs  med=2.93µs  max=3.83ms   p(90)=4.46µs   p(95)=5.1µs    p(99.9)=57.37µs 
     http_req_connecting............: avg=1.36µs  min=0s      med=0s      max=3.79ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.26ms min=19.1ms  med=96.79ms max=357.08ms p(90)=122.54ms p(95)=132.7ms  p(99.9)=226.87ms
       { expected_response:true }...: avg=96.26ms min=19.1ms  med=96.79ms max=357.08ms p(90)=122.54ms p(95)=132.7ms  p(99.9)=226.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62195
     http_req_receiving.............: avg=88.06µs min=31.56µs med=77.08µs max=150.65ms p(90)=113.04µs p(95)=126.71µs p(99.9)=888.47µs
     http_req_sending...............: avg=26.56µs min=5.69µs  med=13.73µs max=104.7ms  p(90)=20.57µs  p(95)=22.91µs  p(99.9)=956.06µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.15ms min=19ms    med=96.67ms max=356.02ms p(90)=122.42ms p(95)=132.58ms p(99.9)=226.77ms
     http_reqs......................: 62195   507.930136/s
     iteration_duration.............: avg=96.64ms min=35.19ms med=97.06ms max=380.02ms p(90)=122.8ms  p(95)=132.97ms p(99.9)=229.34ms
     iterations.....................: 62095   507.113463/s
     success_rate...................: 100.00% ✓ 62095      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 138612     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 56 MB   454 kB/s
     http_req_blocked...............: avg=5.1µs    min=1.21µs  med=3.36µs   max=3.23ms   p(90)=4.89µs   p(95)=5.51µs   p(99.9)=212.16µs
     http_req_connecting............: avg=1.52µs   min=0s      med=0s       max=3.2ms    p(90)=0s       p(95)=0s       p(99.9)=150.69µs
     http_req_duration..............: avg=129.39ms min=20.69ms med=127.29ms max=359.73ms p(90)=162.05ms p(95)=173.01ms p(99.9)=219.9ms 
       { expected_response:true }...: avg=129.39ms min=20.69ms med=127.29ms max=359.73ms p(90)=162.05ms p(95)=173.01ms p(99.9)=219.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 46304
     http_req_receiving.............: avg=90.27µs  min=32.07µs med=84.83µs  max=29.41ms  p(90)=118.42µs p(95)=131µs    p(99.9)=733.33µs
     http_req_sending...............: avg=33.52µs  min=5.89µs  med=15.79µs  max=154.23ms p(90)=21.97µs  p(95)=24.1µs   p(99.9)=544.46µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=129.26ms min=20.53ms med=127.17ms max=359.43ms p(90)=161.93ms p(95)=172.89ms p(99.9)=219.17ms
     http_reqs......................: 46304   377.985684/s
     iteration_duration.............: avg=129.9ms  min=48.35ms med=127.6ms  max=393.47ms p(90)=162.34ms p(95)=173.33ms p(99.9)=224.38ms
     iterations.....................: 46204   377.16937/s
     success_rate...................: 100.00% ✓ 46204      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 88821      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   292 kB/s
     http_req_blocked...............: avg=7.12µs   min=1.28µs  med=3.46µs   max=4ms      p(90)=4.96µs   p(95)=5.59µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=3.42µs   min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=201.91ms min=19.18ms med=193.45ms max=869.06ms p(90)=254.29ms p(95)=392.84ms p(99.9)=562.06ms
       { expected_response:true }...: avg=201.91ms min=19.18ms med=193.45ms max=869.06ms p(90)=254.29ms p(95)=392.84ms p(99.9)=562.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29707
     http_req_receiving.............: avg=101.57µs min=35.38µs med=95.54µs  max=29.83ms  p(90)=128.66µs p(95)=142.42µs p(99.9)=593.47µs
     http_req_sending...............: avg=28.1µs   min=6.33µs  med=17.96µs  max=72.99ms  p(90)=23.28µs  p(95)=25.14µs  p(99.9)=600.93µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.78ms min=18.97ms med=193.33ms max=868.92ms p(90)=254.17ms p(95)=392.62ms p(99.9)=561.94ms
     http_reqs......................: 29707   242.852128/s
     iteration_duration.............: avg=202.8ms  min=64.07ms med=193.93ms max=869.31ms p(90)=254.67ms p(95)=394.74ms p(99.9)=562.4ms 
     iterations.....................: 29607   242.034637/s
     success_rate...................: 100.00% ✓ 29607      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 84966      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   278 kB/s
     http_req_blocked...............: avg=7.41µs   min=1.23µs  med=3.39µs   max=4.22ms   p(90)=4.81µs   p(95)=5.4µs    p(99.9)=1.97ms  
     http_req_connecting............: avg=3.78µs   min=0s      med=0s       max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=1.93ms  
     http_req_duration..............: avg=211ms    min=20.77ms med=209.51ms max=442.7ms  p(90)=228.12ms p(95)=234.94ms p(99.9)=302.51ms
       { expected_response:true }...: avg=211ms    min=20.77ms med=209.51ms max=442.7ms  p(90)=228.12ms p(95)=234.94ms p(99.9)=302.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28422
     http_req_receiving.............: avg=179.06µs min=32.23µs med=92.73µs  max=153.38ms p(90)=126.44µs p(95)=140.06µs p(99.9)=1.47ms  
     http_req_sending...............: avg=34.12µs  min=6.06µs  med=17.45µs  max=124.44ms p(90)=22.75µs  p(95)=24.62µs  p(99.9)=630.08µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.79ms min=20.65ms med=209.39ms max=442.08ms p(90)=227.99ms p(95)=234.75ms p(99.9)=297.63ms
     http_reqs......................: 28422   231.364665/s
     iteration_duration.............: avg=211.97ms min=50.81ms med=209.83ms max=461.6ms  p(90)=228.42ms p(95)=235.37ms p(99.9)=310.97ms
     iterations.....................: 28322   230.550631/s
     success_rate...................: 100.00% ✓ 28322      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

