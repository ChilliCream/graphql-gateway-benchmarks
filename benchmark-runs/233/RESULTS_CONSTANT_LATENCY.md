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
| hive-router | v0.0.72 | 1,561 | 1,584 | 1,551 | 0.6% |  |
| fusion-nightly | 16.3.0-p.1 | 1,546 | 1,567 | 1,542 | 0.5% |  |
| fusion | 16.2.1 | 1,537 | 1,555 | 1,526 | 0.6% |  |
| grafbase | 0.53.5 | 1,118 | 1,139 | 1,108 | 0.8% |  |
| cosmo | 0.324.0 | 1,064 | 1,084 | 1,057 | 0.9% |  |
| hive-gateway-router-runtime | 2.9.0 | 531 | 545 | 526 | 1.2% |  |
| apollo-router | v2.15.1 | 406 | 417 | 402 | 1.3% |  |
| apollo-gateway | 2.14.1 | 237 | 239 | 236 | 0.4% |  |
| hive-gateway | 2.9.0 | 235 | 239 | 233 | 0.9% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 571314      ✗ 0     
     data_received..................: 17 GB   137 MB/s
     data_sent......................: 229 MB  1.9 MB/s
     http_req_blocked...............: avg=3.66µs  min=1.01µs  med=2.52µs  max=8.09ms   p(90)=4.37µs   p(95)=5.29µs   p(99.9)=37.66µs
     http_req_connecting............: avg=617ns   min=0s      med=0s      max=5.25ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.25ms min=14.12ms med=30.97ms max=329.38ms p(90)=37.16ms  p(95)=39.09ms  p(99.9)=57.19ms
       { expected_response:true }...: avg=31.25ms min=14.12ms med=30.97ms max=329.38ms p(90)=37.16ms  p(95)=39.09ms  p(99.9)=57.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 190538
     http_req_receiving.............: avg=83.57µs min=27.79µs med=54.32µs max=44.91ms  p(90)=104.34µs p(95)=148.94µs p(99.9)=2.27ms 
     http_req_sending...............: avg=36.22µs min=5.14µs  med=10.09µs max=137.5ms  p(90)=19.73µs  p(95)=39.46µs  p(99.9)=1.85ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.13ms min=14.02ms med=30.87ms max=328.92ms p(90)=37.03ms  p(95)=38.94ms  p(99.9)=56.27ms
     http_reqs......................: 190538  1561.846072/s
     iteration_duration.............: avg=31.49ms min=14.43ms med=31.2ms  max=354.48ms p(90)=37.37ms  p(95)=39.3ms   p(99.9)=57.67ms
     iterations.....................: 190438  1561.026369/s
     success_rate...................: 100.00% ✓ 190438      ✗ 0     
     vus............................: 24      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.3.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 565881      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 227 MB  1.9 MB/s
     http_req_blocked...............: avg=3.43µs   min=1µs     med=2.38µs   max=4.07ms   p(90)=4.23µs  p(95)=5.12µs   p(99.9)=35µs   
     http_req_connecting............: avg=553ns    min=0s      med=0s       max=4.02ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.55ms  min=13.45ms med=31ms     max=328.31ms p(90)=38.73ms p(95)=41.35ms  p(99.9)=60.96ms
       { expected_response:true }...: avg=31.55ms  min=13.45ms med=31ms     max=328.31ms p(90)=38.73ms p(95)=41.35ms  p(99.9)=60.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 188727
     http_req_receiving.............: avg=659.84µs min=50.73µs med=116.07µs max=112.68ms p(90)=1.85ms  p(95)=2.83ms   p(99.9)=15.71ms
     http_req_sending...............: avg=38.57µs  min=5.12µs  med=9.71µs   max=166.24ms p(90)=20.48µs p(95)=109.39µs p(99.9)=2.21ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.85ms  min=13.34ms med=30.34ms  max=327.64ms p(90)=37.85ms p(95)=40.36ms  p(99.9)=57.31ms
     http_reqs......................: 188727  1546.824746/s
     iteration_duration.............: avg=31.8ms   min=13.73ms med=31.23ms  max=361.8ms  p(90)=38.96ms p(95)=41.57ms  p(99.9)=61.29ms
     iterations.....................: 188627  1546.005136/s
     success_rate...................: 100.00% ✓ 188627      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.2.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 562605      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 225 MB  1.8 MB/s
     http_req_blocked...............: avg=3.56µs   min=1µs     med=2.44µs   max=11.54ms  p(90)=4.18µs  p(95)=5.05µs   p(99.9)=36.66µs
     http_req_connecting............: avg=550ns    min=0s      med=0s       max=3.99ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.74ms  min=14.33ms med=31.13ms  max=355.92ms p(90)=39.06ms p(95)=41.75ms  p(99.9)=59.9ms 
       { expected_response:true }...: avg=31.74ms  min=14.33ms med=31.13ms  max=355.92ms p(90)=39.06ms p(95)=41.75ms  p(99.9)=59.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 187635
     http_req_receiving.............: avg=617.85µs min=51.18µs med=114.02µs max=306.03ms p(90)=1.71ms  p(95)=2.67ms   p(99.9)=13.42ms
     http_req_sending...............: avg=36.75µs  min=5.32µs  med=9.8µs    max=177.76ms p(90)=19.88µs p(95)=100.54µs p(99.9)=1.99ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.09ms  min=14.18ms med=30.53ms  max=269.85ms p(90)=38.22ms p(95)=40.83ms  p(99.9)=58.06ms
     http_reqs......................: 187635  1537.900386/s
     iteration_duration.............: avg=31.98ms  min=14.58ms med=31.36ms  max=365.19ms p(90)=39.28ms p(95)=41.97ms  p(99.9)=60.39ms
     iterations.....................: 187535  1537.080763/s
     success_rate...................: 100.00% ✓ 187535      ✗ 0     
     vus............................: 32      min=0         max=50  
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

     checks.........................: 100.00% ✓ 409083      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 164 MB  1.3 MB/s
     http_req_blocked...............: avg=3.8µs    min=1µs     med=2.26µs  max=4.46ms   p(90)=4.68µs   p(95)=5.87µs   p(99.9)=50.59µs
     http_req_connecting............: avg=917ns    min=0s      med=0s      max=4.42ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.72ms  min=17.64ms med=43.21ms max=359.33ms p(90)=53.24ms  p(95)=56.55ms  p(99.9)=82.53ms
       { expected_response:true }...: avg=43.72ms  min=17.64ms med=43.21ms max=359.33ms p(90)=53.24ms  p(95)=56.55ms  p(99.9)=82.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136461
     http_req_receiving.............: avg=141.83µs min=26.46µs med=59.92µs max=306.76ms p(90)=130.32µs p(95)=202.44µs p(99.9)=3.97ms 
     http_req_sending...............: avg=35.88µs  min=5.08µs  med=9.91µs  max=82.72ms  p(90)=23.4µs   p(95)=109.2µs  p(99.9)=2.29ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.54ms  min=17.51ms med=43.08ms max=124.29ms p(90)=53.08ms  p(95)=56.35ms  p(99.9)=80.02ms
     http_reqs......................: 136461  1118.168757/s
     iteration_duration.............: avg=43.99ms  min=18.19ms med=43.46ms max=378.77ms p(90)=53.48ms  p(95)=56.78ms  p(99.9)=83.07ms
     iterations.....................: 136361  1117.349352/s
     success_rate...................: 100.00% ✓ 136361      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.324.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 389325      ✗ 0     
     data_received..................: 11 GB   93 MB/s
     data_sent......................: 156 MB  1.3 MB/s
     http_req_blocked...............: avg=3.93µs   min=1.16µs  med=2.74µs  max=4.18ms   p(90)=4.43µs   p(95)=5.2µs    p(99.9)=39.06µs
     http_req_connecting............: avg=799ns    min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=45.98ms  min=16.2ms  med=45.32ms max=336.75ms p(90)=56.05ms  p(95)=59.32ms  p(99.9)=80.92ms
       { expected_response:true }...: avg=45.98ms  min=16.2ms  med=45.32ms max=336.75ms p(90)=56.05ms  p(95)=59.32ms  p(99.9)=80.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 129875
     http_req_receiving.............: avg=102.29µs min=29µs    med=69.99µs max=213.03ms p(90)=116.99µs p(95)=142.83µs p(99.9)=2.15ms 
     http_req_sending...............: avg=25.05µs  min=5.4µs   med=11.59µs max=63.3ms   p(90)=18.99µs  p(95)=23.66µs  p(99.9)=1.13ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=45.85ms  min=16.02ms med=45.21ms max=277.09ms p(90)=55.91ms  p(95)=59.2ms   p(99.9)=79.05ms
     http_reqs......................: 129875  1064.055883/s
     iteration_duration.............: avg=46.23ms  min=22.88ms med=45.54ms max=368.17ms p(90)=56.26ms  p(95)=59.53ms  p(99.9)=82.28ms
     iterations.....................: 129775  1063.236591/s
     success_rate...................: 100.00% ✓ 129775      ✗ 0     
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

     checks.........................: 100.00% ✓ 194925     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   638 kB/s
     http_req_blocked...............: avg=5.14µs  min=1.23µs  med=3.29µs  max=4.08ms   p(90)=4.99µs   p(95)=5.67µs   p(99.9)=53.49µs 
     http_req_connecting............: avg=1.59µs  min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=91.99ms min=20.77ms med=90.25ms max=348.51ms p(90)=108.78ms p(95)=116.45ms p(99.9)=217.31ms
       { expected_response:true }...: avg=91.99ms min=20.77ms med=90.25ms max=348.51ms p(90)=108.78ms p(95)=116.45ms p(99.9)=217.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65075
     http_req_receiving.............: avg=92.02µs min=31.44µs med=79.64µs max=135.61ms p(90)=116.9µs  p(95)=131.5µs  p(99.9)=904.12µs
     http_req_sending...............: avg=26.16µs min=5.83µs  med=14.38µs max=121.96ms p(90)=21.34µs  p(95)=23.8µs   p(99.9)=769.31µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.87ms min=20.6ms  med=90.14ms max=347.73ms p(90)=108.67ms p(95)=116.29ms p(99.9)=217.17ms
     http_reqs......................: 65075   531.262633/s
     iteration_duration.............: avg=92.35ms min=30.71ms med=90.52ms max=367.46ms p(90)=109.02ms p(95)=116.72ms p(99.9)=218.97ms
     iterations.....................: 64975   530.446248/s
     success_rate...................: 100.00% ✓ 64975      ✗ 0    
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

     checks.........................: 100.00% ✓ 149157     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   488 kB/s
     http_req_blocked...............: avg=5.44µs   min=1.18µs  med=3.52µs   max=3.86ms   p(90)=5.14µs   p(95)=5.76µs   p(99.9)=123.21µs
     http_req_connecting............: avg=1.7µs    min=0s      med=0s       max=3.83ms   p(90)=0s       p(95)=0s       p(99.9)=64.58µs 
     http_req_duration..............: avg=120.24ms min=21.7ms  med=118.6ms  max=380.46ms p(90)=149.43ms p(95)=159.09ms p(99.9)=206.55ms
       { expected_response:true }...: avg=120.24ms min=21.7ms  med=118.6ms  max=380.46ms p(90)=149.43ms p(95)=159.09ms p(99.9)=206.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49819
     http_req_receiving.............: avg=98.56µs  min=31.27µs med=85.91µs  max=206.79ms p(90)=118.82µs p(95)=131.56µs p(99.9)=769.03µs
     http_req_sending...............: avg=39.52µs  min=5.91µs  med=16.14µs  max=217.88ms p(90)=21.92µs  p(95)=24µs     p(99.9)=877.43µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.1ms  min=21.54ms med=118.48ms max=380.21ms p(90)=149.31ms p(95)=158.96ms p(99.9)=206.14ms
     http_reqs......................: 49819   406.713623/s
     iteration_duration.............: avg=120.71ms min=47.45ms med=118.9ms  max=387.84ms p(90)=149.72ms p(95)=159.38ms p(99.9)=209.76ms
     iterations.....................: 49719   405.89724/s
     success_rate...................: 100.00% ✓ 49719      ✗ 0    
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

     checks.........................: 100.00% ✓ 87285      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=7.52µs   min=1.3µs   med=3.63µs   max=4.1ms    p(90)=5.17µs   p(95)=5.83µs   p(99.9)=1.88ms  
     http_req_connecting............: avg=3.67µs   min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=1.85ms  
     http_req_duration..............: avg=205.42ms min=22.09ms med=204.67ms max=439.57ms p(90)=222.03ms p(95)=227.21ms p(99.9)=308.27ms
       { expected_response:true }...: avg=205.42ms min=22.09ms med=204.67ms max=439.57ms p(90)=222.03ms p(95)=227.21ms p(99.9)=308.27ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29195
     http_req_receiving.............: avg=104.02µs min=34.89µs med=93.57µs  max=67.58ms  p(90)=127.14µs p(95)=141.12µs p(99.9)=658.73µs
     http_req_sending...............: avg=31.19µs  min=6.29µs  med=17.37µs  max=100.14ms p(90)=22.86µs  p(95)=24.9µs   p(99.9)=658.28µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.28ms min=21.93ms med=204.53ms max=431.26ms p(90)=221.9ms  p(95)=227.1ms  p(99.9)=308.14ms
     http_reqs......................: 29195   237.716852/s
     iteration_duration.............: avg=206.34ms min=76.06ms med=205.08ms max=460ms    p(90)=222.32ms p(95)=227.53ms p(99.9)=313.81ms
     iterations.....................: 29095   236.902614/s
     success_rate...................: 100.00% ✓ 29095      ✗ 0    
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

     checks.........................: 100.00% ✓ 86097      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   283 kB/s
     http_req_blocked...............: avg=8.04µs   min=1.27µs  med=3.89µs   max=4.29ms   p(90)=5.49µs   p(95)=6.17µs   p(99.9)=1.94ms  
     http_req_connecting............: avg=3.89µs   min=0s      med=0s       max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=1.91ms  
     http_req_duration..............: avg=208.2ms  min=18.07ms med=193.8ms  max=694.45ms p(90)=243.38ms p(95)=271.23ms p(99.9)=650.94ms
       { expected_response:true }...: avg=208.2ms  min=18.07ms med=193.8ms  max=694.45ms p(90)=243.38ms p(95)=271.23ms p(99.9)=650.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28799
     http_req_receiving.............: avg=103.66µs min=35.94µs med=100.35µs max=3.21ms   p(90)=133.1µs  p(95)=146.45µs p(99.9)=435.1µs 
     http_req_sending...............: avg=27.55µs  min=6.41µs  med=18.26µs  max=62.52ms  p(90)=23.62µs  p(95)=25.48µs  p(99.9)=508.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.07ms min=17.89ms med=193.67ms max=693.83ms p(90)=243.25ms p(95)=271.12ms p(99.9)=650.84ms
     http_reqs......................: 28799   235.423195/s
     iteration_duration.............: avg=209.19ms min=38ms    med=194.2ms  max=694.82ms p(90)=243.81ms p(95)=272.95ms p(99.9)=651.36ms
     iterations.....................: 28699   234.605725/s
     success_rate...................: 100.00% ✓ 28699      ✗ 0    
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

