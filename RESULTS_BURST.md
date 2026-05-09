## Overview for: `burst-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario is a burst stress test with peaks up to **500 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,739 | 2,862 | 2,690 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,082 | 2,130 | 2,034 | 1.5% |  |
| cosmo | 0.307.0 | 1,191 | 1,201 | 1,189 | 0.5% | non-compatible response (15 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 495 | 500 | 490 | 0.7% |  |
| hive-gateway | 2.5.25 | 229 | 230 | 226 | 0.6% |  |
| apollo-gateway | 2.13.3 | 199 | 203 | 198 | 0.8% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (22308 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (438599 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,346 | 2,430 | 2,288 | 2.0% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,864 | 1,919 | 1,854 | 1.2% |  |
| cosmo | 0.307.0 | 1,120 | 1,124 | 1,104 | 0.8% | non-compatible response (10 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 471 | 480 | 467 | 1.0% |  |
| hive-gateway | 2.5.25 | 230 | 233 | 227 | 0.8% |  |
| apollo-gateway | 2.13.3 | 206 | 209 | 205 | 0.6% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (8199 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (331531 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 505293      ✗ 0     
     data_received..................: 15 GB   240 MB/s
     data_sent......................: 204 MB  3.3 MB/s
     http_req_blocked...............: avg=31.08µs  min=962ns   med=2.43µs  max=70.37ms  p(90)=4.05µs   p(95)=5.22µs   p(99.9)=5.65ms  
     http_req_connecting............: avg=27.79µs  min=0s      med=0s      max=70.33ms  p(90)=0s       p(95)=0s       p(99.9)=5.43ms  
     http_req_duration..............: avg=83.8ms   min=1.52ms  med=76.78ms max=343.39ms p(90)=164.47ms p(95)=183.03ms p(99.9)=255.05ms
       { expected_response:true }...: avg=83.8ms   min=1.52ms  med=76.78ms max=343.39ms p(90)=164.47ms p(95)=183.03ms p(99.9)=255.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 169431
     http_req_receiving.............: avg=424.93µs min=26.15µs med=56.04µs max=85.67ms  p(90)=236.2µs  p(95)=420.75µs p(99.9)=55.62ms 
     http_req_sending...............: avg=91.57µs  min=5.22µs  med=10.16µs max=165.83ms p(90)=18.85µs  p(95)=132.87µs p(99.9)=14.38ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.29ms  min=1.46ms  med=76.31ms max=301.44ms p(90)=163.62ms p(95)=181.7ms  p(99.9)=251.28ms
     http_reqs......................: 169431  2739.145445/s
     iteration_duration.............: avg=84.64ms  min=2.34ms  med=77.62ms max=343.6ms  p(90)=165.08ms p(95)=183.9ms  p(99.9)=256.46ms
     iterations.....................: 168431  2722.978713/s
     success_rate...................: 100.00% ✓ 168431      ✗ 0     
     vus............................: 51      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 388458      ✗ 0     
     data_received..................: 11 GB   183 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=16.64µs  min=1.03µs  med=2.49µs   max=67.22ms  p(90)=3.94µs   p(95)=4.87µs   p(99.9)=2.32ms  
     http_req_connecting............: avg=13.5µs   min=0s      med=0s       max=67.01ms  p(90)=0s       p(95)=0s       p(99.9)=2.25ms  
     http_req_duration..............: avg=109.06ms min=2.37ms  med=100.1ms  max=673.37ms p(90)=211.05ms p(95)=245.53ms p(99.9)=464.34ms
       { expected_response:true }...: avg=109.06ms min=2.37ms  med=100.1ms  max=673.37ms p(90)=211.05ms p(95)=245.53ms p(99.9)=464.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130486
     http_req_receiving.............: avg=1.72ms   min=51.66µs med=115.8µs  max=308.22ms p(90)=1.2ms    p(95)=4.06ms   p(99.9)=141.06ms
     http_req_sending...............: avg=67.61µs  min=5.15µs  med=10.13µs  max=245.21ms p(90)=18.51µs  p(95)=127.39µs p(99.9)=9.34ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.28ms min=2.29ms  med=98.94ms  max=673.07ms p(90)=208.14ms p(95)=239.71ms p(99.9)=415.26ms
     http_reqs......................: 130486  2082.004948/s
     iteration_duration.............: avg=110.18ms min=3.75ms  med=101.54ms max=673.58ms p(90)=211.78ms p(95)=246.21ms p(99.9)=464.87ms
     iterations.....................: 129486  2066.049176/s
     success_rate...................: 100.00% ✓ 129486      ✗ 0     
     vus............................: 89      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 220464      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=6.51µs   min=1.04µs  med=2.19µs   max=28.12ms  p(90)=3.76µs   p(95)=4.68µs   p(99.9)=549.55µs
     http_req_connecting............: avg=3.65µs   min=0s      med=0s       max=28.05ms  p(90)=0s       p(95)=0s       p(99.9)=466.28µs
     http_req_duration..............: avg=191.58ms min=2.04ms  med=189.02ms max=609.44ms p(90)=358.16ms p(95)=387.98ms p(99.9)=518.41ms
       { expected_response:true }...: avg=191.58ms min=2.04ms  med=189.02ms max=609.44ms p(90)=358.16ms p(95)=387.98ms p(99.9)=518.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74488
     http_req_receiving.............: avg=76.56µs  min=28.51µs med=60.47µs  max=106.49ms p(90)=94.96µs  p(95)=109.02µs p(99.9)=1.66ms  
     http_req_sending...............: avg=29.72µs  min=5.14µs  med=10.33µs  max=68.51ms  p(90)=16.1µs   p(95)=19.77µs  p(99.9)=3.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.47ms min=1.95ms  med=188.91ms max=609.35ms p(90)=358.08ms p(95)=387.84ms p(99.9)=518.35ms
     http_reqs......................: 74488   1191.3971/s
     iteration_duration.............: avg=194.43ms min=4.87ms  med=192.05ms max=609.68ms p(90)=359ms    p(95)=388.73ms p(99.9)=519ms   
     iterations.....................: 73488   1175.402616/s
     success_rate...................: 100.00% ✓ 73488       ✗ 0    
     vus............................: 80      min=0         max=492
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 93390      ✗ 0    
     data_received..................: 2.8 GB  44 MB/s
     data_sent......................: 39 MB   594 kB/s
     http_req_blocked...............: avg=9.57µs   min=1.1µs   med=2.98µs   max=4.28ms   p(90)=4.83µs   p(95)=5.94µs   p(99.9)=1.9ms   
     http_req_connecting............: avg=5.35µs   min=0s      med=0s       max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=1.73ms  
     http_req_duration..............: avg=446.8ms  min=3.98ms  med=417.79ms max=1.69s    p(90)=880.9ms  p(95)=955.78ms p(99.9)=1.39s   
       { expected_response:true }...: avg=446.8ms  min=3.98ms  med=417.79ms max=1.69s    p(90)=880.9ms  p(95)=955.78ms p(99.9)=1.39s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32130
     http_req_receiving.............: avg=92.46µs  min=32.59µs med=77.93µs  max=133.72ms p(90)=114.24µs p(95)=127.4µs  p(99.9)=940.68µs
     http_req_sending...............: avg=33.59µs  min=5.71µs  med=13.71µs  max=104.39ms p(90)=21.24µs  p(95)=24.62µs  p(99.9)=3.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=446.68ms min=3.93ms  med=417.63ms max=1.69s    p(90)=880.8ms  p(95)=955.69ms p(99.9)=1.39s   
     http_reqs......................: 32130   495.003415/s
     iteration_duration.............: avg=461.37ms min=27.61ms med=433.82ms max=1.7s     p(90)=885.71ms p(95)=959.02ms p(99.9)=1.39s   
     iterations.....................: 31130   479.597147/s
     success_rate...................: 100.00% ✓ 31130      ✗ 0    
     vus............................: 37      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 43920      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   276 kB/s
     http_req_blocked...............: avg=15.92µs  min=1.15µs  med=3.64µs   max=33.9ms  p(90)=5.43µs   p(95)=7.04µs  p(99.9)=2.5ms 
     http_req_connecting............: avg=10.71µs  min=0s      med=0s       max=33.83ms p(90)=0s       p(95)=0s      p(99.9)=2.47ms
     http_req_duration..............: avg=906.09ms min=6.13ms  med=804.65ms max=19.28s  p(90)=1.59s    p(95)=1.74s   p(99.9)=17.05s
       { expected_response:true }...: avg=906.09ms min=6.13ms  med=804.65ms max=19.28s  p(90)=1.59s    p(95)=1.74s   p(99.9)=17.05s
     http_req_failed................: 0.00%   ✓ 0          ✗ 15640
     http_req_receiving.............: avg=104.68µs min=32.72µs med=98.14µs  max=4.35ms  p(90)=137.11µs p(95)=150.2µs p(99.9)=1.11ms
     http_req_sending...............: avg=28.59µs  min=6.09µs  med=17.28µs  max=52.02ms p(90)=23.61µs  p(95)=28.47µs p(99.9)=1.83ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=905.96ms min=6.03ms  med=804.53ms max=19.28s  p(90)=1.59s    p(95)=1.74s   p(99.9)=17.05s
     http_reqs......................: 15640   229.057723/s
     iteration_duration.............: avg=968ms    min=39.52ms med=878.56ms max=19.28s  p(90)=1.61s    p(95)=1.75s   p(99.9)=17.1s 
     iterations.....................: 14640   214.412089/s
     success_rate...................: 100.00% ✓ 14640      ✗ 0    
     vus............................: 65      min=0        max=498
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 41493      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   245 kB/s
     http_req_blocked...............: avg=15.08µs  min=1.19µs  med=3.36µs   max=4.07ms  p(90)=5.03µs   p(95)=6.64µs   p(99.9)=2.64ms  
     http_req_connecting............: avg=9.9µs    min=0s      med=0s       max=4.04ms  p(90)=0s       p(95)=0s       p(99.9)=2.6ms   
     http_req_duration..............: avg=456.36ms min=8.46ms  med=471.44ms max=1.47s   p(90)=848.31ms p(95)=956.47ms p(99.9)=1.35s   
       { expected_response:true }...: avg=456.36ms min=8.46ms  med=471.44ms max=1.47s   p(90)=848.31ms p(95)=956.47ms p(99.9)=1.35s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14831
     http_req_receiving.............: avg=99.35µs  min=32.77µs med=90.29µs  max=28.36ms p(90)=129.8µs  p(95)=142.7µs  p(99.9)=851.45µs
     http_req_sending...............: avg=30.18µs  min=6.05µs  med=16.26µs  max=48.12ms p(90)=22.09µs  p(95)=26.79µs  p(99.9)=2.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=456.23ms min=8.33ms  med=471.24ms max=1.47s   p(90)=848.16ms p(95)=956.35ms p(99.9)=1.35s   
     http_reqs......................: 14831   199.537962/s
     iteration_duration.............: avg=489.2ms  min=8.81ms  med=495.98ms max=1.48s   p(90)=862.03ms p(95)=961.32ms p(99.9)=1.36s   
     iterations.....................: 13831   186.083848/s
     success_rate...................: 100.00% ✓ 13831      ✗ 0    
     vus............................: 63      min=0        max=494
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 433278      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=32.14µs  min=981ns   med=2.92µs  max=71.63ms  p(90)=4.81µs   p(95)=6.13µs   p(99.9)=10.47ms 
     http_req_connecting............: avg=28.14µs  min=0s      med=0s      max=71.47ms  p(90)=0s       p(95)=0s       p(99.9)=10.39ms 
     http_req_duration..............: avg=97.72ms  min=1.58ms  med=91.97ms max=346.26ms p(90)=189.07ms p(95)=205.87ms p(99.9)=258.52ms
       { expected_response:true }...: avg=97.72ms  min=1.58ms  med=91.97ms max=346.26ms p(90)=189.07ms p(95)=205.87ms p(99.9)=258.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145426
     http_req_receiving.............: avg=344.05µs min=28.07µs med=62.33µs max=183.81ms p(90)=246.82µs p(95)=455.82µs p(99.9)=30.58ms 
     http_req_sending...............: avg=93.23µs  min=5.33µs  med=11.68µs max=308.38ms p(90)=23.31µs  p(95)=147.22µs p(99.9)=14.81ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.29ms  min=1.53ms  med=91.65ms max=291.79ms p(90)=188.14ms p(95)=204.74ms p(99.9)=256.83ms
     http_reqs......................: 145426  2346.671194/s
     iteration_duration.............: avg=98.73ms  min=3.46ms  med=93.08ms max=398.56ms p(90)=189.62ms p(95)=206.42ms p(99.9)=260.57ms
     iterations.....................: 144426  2330.534663/s
     success_rate...................: 100.00% ✓ 144426      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 345300      ✗ 0     
     data_received..................: 10 GB   163 MB/s
     data_sent......................: 139 MB  2.2 MB/s
     http_req_blocked...............: avg=16.76µs  min=962ns   med=2.28µs   max=74.52ms  p(90)=3.85µs   p(95)=4.95µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=13.81µs  min=0s      med=0s       max=74.45ms  p(90)=0s       p(95)=0s       p(99.9)=1.63ms  
     http_req_duration..............: avg=122.64ms min=1.8ms   med=113.04ms max=1.21s    p(90)=234.99ms p(95)=269.97ms p(99.9)=682.45ms
       { expected_response:true }...: avg=122.64ms min=1.8ms   med=113.04ms max=1.21s    p(90)=234.99ms p(95)=269.97ms p(99.9)=682.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 116100
     http_req_receiving.............: avg=2.06ms   min=51.29µs med=117.94µs max=346.11ms p(90)=1.8ms    p(95)=4.97ms   p(99.9)=180.42ms
     http_req_sending...............: avg=58.63µs  min=5.23µs  med=10.04µs  max=62.47ms  p(90)=19.16µs  p(95)=116.52µs p(99.9)=8.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.52ms min=1.71ms  med=111.87ms max=1.18s    p(90)=231.77ms p(95)=263.41ms p(99.9)=679.49ms
     http_reqs......................: 116100  1864.18221/s
     iteration_duration.............: avg=123.98ms min=3.18ms  med=114.45ms max=1.21s    p(90)=235.71ms p(95)=270.81ms p(99.9)=683.97ms
     iterations.....................: 115100  1848.125516/s
     success_rate...................: 100.00% ✓ 115100      ✗ 0     
     vus............................: 71      min=0         max=495 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 207426      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=7.71µs   min=1.08µs  med=2.72µs   max=33.51ms  p(90)=4.41µs   p(95)=5.35µs   p(99.9)=548.33µs
     http_req_connecting............: avg=4.22µs   min=0s      med=0s       max=33.46ms  p(90)=0s       p(95)=0s       p(99.9)=481.98µs
     http_req_duration..............: avg=203.49ms min=2.09ms  med=203.13ms max=698.25ms p(90)=375.11ms p(95)=405.39ms p(99.9)=558.28ms
       { expected_response:true }...: avg=203.49ms min=2.09ms  med=203.13ms max=698.25ms p(90)=375.11ms p(95)=405.39ms p(99.9)=558.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70142
     http_req_receiving.............: avg=87.81µs  min=30.25µs med=66.9µs   max=145.99ms p(90)=103.68µs p(95)=119.58µs p(99.9)=1.6ms   
     http_req_sending...............: avg=30.38µs  min=5.41µs  med=11.75µs  max=64.9ms   p(90)=18.41µs  p(95)=22.17µs  p(99.9)=3.91ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.37ms min=2.03ms  med=202.97ms max=698.15ms p(90)=375.01ms p(95)=405.24ms p(99.9)=558.18ms
     http_reqs......................: 70142   1120.665096/s
     iteration_duration.............: avg=206.68ms min=4.1ms   med=206.73ms max=698.43ms p(90)=376.19ms p(95)=406.02ms p(99.9)=559.17ms
     iterations.....................: 69142   1104.688006/s
     success_rate...................: 100.00% ✓ 69142       ✗ 0    
     vus............................: 84      min=0         max=497
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 89313      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   566 kB/s
     http_req_blocked...............: avg=9.84µs   min=1.21µs  med=3.08µs   max=6.87ms  p(90)=4.89µs   p(95)=5.89µs   p(99.9)=1.96ms  
     http_req_connecting............: avg=5.77µs   min=0s      med=0s       max=6.82ms  p(90)=0s       p(95)=0s       p(99.9)=1.93ms  
     http_req_duration..............: avg=466.95ms min=4.16ms  med=432.69ms max=1.69s   p(90)=922.16ms p(95)=1.01s    p(99.9)=1.48s   
       { expected_response:true }...: avg=466.95ms min=4.16ms  med=432.69ms max=1.69s   p(90)=922.16ms p(95)=1.01s    p(99.9)=1.48s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30771
     http_req_receiving.............: avg=90.62µs  min=32.75µs med=81.43µs  max=45.54ms p(90)=118.33µs p(95)=131.55µs p(99.9)=852.03µs
     http_req_sending...............: avg=29.71µs  min=5.59µs  med=14.12µs  max=45.54ms p(90)=21.39µs  p(95)=24.76µs  p(99.9)=3.34ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=466.83ms min=4.09ms  med=432.57ms max=1.69s   p(90)=922.07ms p(95)=1.01s    p(99.9)=1.48s   
     http_reqs......................: 30771   471.47094/s
     iteration_duration.............: avg=482.87ms min=15.63ms med=450.55ms max=1.71s   p(90)=928.11ms p(95)=1.01s    p(99.9)=1.49s   
     iterations.....................: 29771   456.149016/s
     success_rate...................: 100.00% ✓ 29771      ✗ 0    
     vus............................: 71      min=0        max=497
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 44088      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   276 kB/s
     http_req_blocked...............: avg=15.65µs  min=1.2µs   med=3.73µs   max=5.19ms   p(90)=5.66µs   p(95)=7.15µs   p(99.9)=2.59ms
     http_req_connecting............: avg=10.23µs  min=0s      med=0s       max=5.12ms   p(90)=0s       p(95)=0s       p(99.9)=2.57ms
     http_req_duration..............: avg=929.57ms min=6.34ms  med=852.09ms max=6.16s    p(90)=1.83s    p(95)=2.02s    p(99.9)=4.82s 
       { expected_response:true }...: avg=929.57ms min=6.34ms  med=852.09ms max=6.16s    p(90)=1.83s    p(95)=2.02s    p(99.9)=4.82s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15696
     http_req_receiving.............: avg=106.96µs min=38.67µs med=100.39µs max=8.7ms    p(90)=140.79µs p(95)=152.95µs p(99.9)=1.03ms
     http_req_sending...............: avg=46.01µs  min=5.97µs  med=18.06µs  max=174.44ms p(90)=24.22µs  p(95)=29.83µs  p(99.9)=4.41ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=929.42ms min=6.24ms  med=851.94ms max=6.16s    p(90)=1.83s    p(95)=2.02s    p(99.9)=4.82s 
     http_reqs......................: 15696   230.264662/s
     iteration_duration.............: avg=992.86ms min=10.53ms med=924.55ms max=6.17s    p(90)=1.85s    p(95)=2.04s    p(99.9)=4.84s 
     iterations.....................: 14696   215.594386/s
     success_rate...................: 100.00% ✓ 14696      ✗ 0    
     vus............................: 65      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 40230      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   248 kB/s
     http_req_blocked...............: avg=18.17µs  min=1.21µs  med=3.6µs    max=13.26ms p(90)=5.38µs   p(95)=7.01µs   p(99.9)=3ms   
     http_req_connecting............: avg=12.46µs  min=0s      med=0s       max=13.2ms  p(90)=0s       p(95)=0s       p(99.9)=2.93ms
     http_req_duration..............: avg=1.01s    min=8.62ms  med=939.71ms max=4.17s   p(90)=2.06s    p(95)=2.18s    p(99.9)=3.75s 
       { expected_response:true }...: avg=1.01s    min=8.62ms  med=939.71ms max=4.17s   p(90)=2.06s    p(95)=2.18s    p(99.9)=3.75s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14410
     http_req_receiving.............: avg=105.14µs min=34.57µs med=97.65µs  max=9.91ms  p(90)=137.64µs p(95)=150.36µs p(99.9)=1.11ms
     http_req_sending...............: avg=34.21µs  min=6.05µs  med=17.71µs  max=29.44ms p(90)=23.7µs   p(95)=28.82µs  p(99.9)=3.04ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.01s    min=8.52ms  med=939.57ms max=4.17s   p(90)=2.06s    p(95)=2.18s    p(99.9)=3.75s 
     http_reqs......................: 14410   206.503687/s
     iteration_duration.............: avg=1.08s    min=72.52ms med=1s       max=4.18s   p(90)=2.08s    p(95)=2.19s    p(99.9)=3.82s 
     iterations.....................: 13410   192.173105/s
     success_rate...................: 100.00% ✓ 13410      ✗ 0    
     vus............................: 99      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

