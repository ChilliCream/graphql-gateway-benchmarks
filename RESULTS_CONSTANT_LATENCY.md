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
| hive-router | v0.0.41 | 1,554 | 1,573 | 1,545 | 0.7% |  |
| hotchocolate | 16.0.0-p.11.47 | 1,425 | 1,434 | 1,401 | 0.8% |  |
| cosmo | 0.291.0 | 1,169 | 1,190 | 1,163 | 0.8% | non-compatible response (2 across 1/9 runs) |
| grafbase | 0.53.2 | 1,136 | 1,153 | 1,126 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.6 | 488 | 503 | 483 | 1.4% |  |
| apollo-router | v2.12.0 | 367 | 378 | 363 | 1.4% |  |
| hive-gateway | 2.5.6 | 252 | 257 | 250 | 1.0% |  |
| apollo-gateway | 2.13.2 | 235 | 236 | 234 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 568566      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 228 MB  1.9 MB/s
     http_req_blocked...............: avg=2.89µs  min=952ns   med=2.13µs  max=2.73ms   p(90)=3.92µs   p(95)=4.81µs   p(99.9)=37.44µs
     http_req_connecting............: avg=280ns   min=0s      med=0s      max=2.68ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.41ms min=14.37ms med=31.11ms max=341.57ms p(90)=37.37ms  p(95)=39.31ms  p(99.9)=56.02ms
       { expected_response:true }...: avg=31.41ms min=14.37ms med=31.11ms max=341.57ms p(90)=37.37ms  p(95)=39.31ms  p(99.9)=56.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 189622
     http_req_receiving.............: avg=81.72µs min=27.48µs med=53.1µs  max=27.16ms  p(90)=103.77µs p(95)=148.36µs p(99.9)=2.13ms 
     http_req_sending...............: avg=34.08µs min=5.26µs  med=9.35µs  max=188.77ms p(90)=19.63µs  p(95)=35.61µs  p(99.9)=1.74ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.29ms min=14.3ms  med=31.01ms max=341.36ms p(90)=37.25ms  p(95)=39.17ms  p(99.9)=54.72ms
     http_reqs......................: 189622  1554.108091/s
     iteration_duration.............: avg=31.65ms min=14.53ms med=31.33ms max=350.67ms p(90)=37.58ms  p(95)=39.52ms  p(99.9)=56.84ms
     iterations.....................: 189522  1553.288509/s
     success_rate...................: 100.00% ✓ 189522      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.47)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 521460      ✗ 0     
     data_received..................: 15 GB   125 MB/s
     data_sent......................: 209 MB  1.7 MB/s
     http_req_blocked...............: avg=3.05µs   min=992ns   med=2.02µs  max=4.16ms   p(90)=3.54µs  p(95)=4.29µs  p(99.9)=34.46µs
     http_req_connecting............: avg=583ns    min=0s      med=0s      max=4.11ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=34.27ms  min=13.59ms med=32.9ms  max=481.61ms p(90)=42.78ms p(95)=47.11ms p(99.9)=91.3ms 
       { expected_response:true }...: avg=34.27ms  min=13.59ms med=32.9ms  max=481.61ms p(90)=42.78ms p(95)=47.11ms p(99.9)=91.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 173920
     http_req_receiving.............: avg=621.41µs min=51.92µs med=122.3µs max=36.94ms  p(90)=1.68ms  p(95)=2.56ms  p(99.9)=15.24ms
     http_req_sending...............: avg=33.02µs  min=5.2µs   med=9.2µs   max=129.16ms p(90)=18.54µs p(95)=37.2µs  p(99.9)=1.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=33.62ms  min=13.47ms med=32.27ms max=480.12ms p(90)=41.93ms p(95)=46.28ms p(99.9)=90.36ms
     http_reqs......................: 173920  1425.2695/s
     iteration_duration.............: avg=34.51ms  min=13.83ms med=33.12ms max=481.82ms p(90)=42.99ms p(95)=47.33ms p(99.9)=92.53ms
     iterations.....................: 173820  1424.450003/s
     success_rate...................: 100.00% ✓ 173820      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 427743      ✗ 0     
     data_received..................: 13 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.39µs  min=1.02µs  med=2.28µs  max=3.94ms   p(90)=4.02µs  p(95)=4.8µs    p(99.9)=38.13µs
     http_req_connecting............: avg=694ns   min=0s      med=0s      max=3.9ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.83ms min=18.37ms med=41.22ms max=331.92ms p(90)=50.86ms p(95)=53.92ms  p(99.9)=71.59ms
       { expected_response:true }...: avg=41.83ms min=18.37ms med=41.22ms max=331.92ms p(90)=50.86ms p(95)=53.92ms  p(99.9)=71.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142681
     http_req_receiving.............: avg=86.45µs min=28.4µs  med=63.11µs max=55.54ms  p(90)=109.1µs p(95)=135.39µs p(99.9)=1.8ms  
     http_req_sending...............: avg=25.86µs min=5.31µs  med=10.56µs max=64.72ms  p(90)=18.69µs p(95)=23.39µs  p(99.9)=1.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.72ms min=18.21ms med=41.12ms max=307.72ms p(90)=50.74ms p(95)=53.8ms   p(99.9)=70.93ms
     http_reqs......................: 142681  1169.026591/s
     iteration_duration.............: avg=42.07ms min=18.74ms med=41.43ms max=359.62ms p(90)=51.06ms p(95)=54.12ms  p(99.9)=71.98ms
     iterations.....................: 142581  1168.207262/s
     success_rate...................: 100.00% ✓ 142581      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 415734      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.56µs  min=962ns   med=2.16µs  max=4.19ms   p(90)=4.46µs   p(95)=5.66µs   p(99.9)=42.89µs
     http_req_connecting............: avg=777ns   min=0s      med=0s      max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.02ms min=16.59ms med=42.46ms max=347.54ms p(90)=52.36ms  p(95)=55.7ms   p(99.9)=85.71ms
       { expected_response:true }...: avg=43.02ms min=16.59ms med=42.46ms max=347.54ms p(90)=52.36ms  p(95)=55.7ms   p(99.9)=85.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138678
     http_req_receiving.............: avg=97.21µs min=29.16µs med=59.13µs max=148ms    p(90)=129.12µs p(95)=200.19µs p(99.9)=3.24ms 
     http_req_sending...............: avg=39.16µs min=5.19µs  med=9.68µs  max=218.13ms p(90)=23.36µs  p(95)=107.27µs p(99.9)=2.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.89ms min=16.46ms med=42.34ms max=347.02ms p(90)=52.2ms   p(95)=55.55ms  p(99.9)=84.94ms
     http_reqs......................: 138678  1136.400105/s
     iteration_duration.............: avg=43.29ms min=16.96ms med=42.7ms  max=367.84ms p(90)=52.58ms  p(95)=55.93ms  p(99.9)=86.75ms
     iterations.....................: 138578  1135.580653/s
     success_rate...................: 100.00% ✓ 138578      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 179364     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 72 MB   587 kB/s
     http_req_blocked...............: avg=5.03µs   min=1.16µs  med=2.94µs  max=4.38ms   p(90)=4.44µs   p(95)=5.03µs   p(99.9)=57.24µs 
     http_req_connecting............: avg=1.86µs   min=0s      med=0s      max=4.34ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=99.98ms  min=22.64ms med=97.73ms max=353.15ms p(90)=118.42ms p(95)=126.71ms p(99.9)=231.14ms
       { expected_response:true }...: avg=99.98ms  min=22.64ms med=97.73ms max=353.15ms p(90)=118.42ms p(95)=126.71ms p(99.9)=231.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 59888
     http_req_receiving.............: avg=92.56µs  min=32.5µs  med=78.56µs max=185.04ms p(90)=113.69µs p(95)=127.33µs p(99.9)=855.47µs
     http_req_sending...............: avg=23.22µs  min=5.83µs  med=13.6µs  max=66.2ms   p(90)=20.12µs  p(95)=22.36µs  p(99.9)=610.83µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.87ms  min=22.45ms med=97.63ms max=352.74ms p(90)=118.32ms p(95)=126.58ms p(99.9)=230.75ms
     http_reqs......................: 59888   488.723361/s
     iteration_duration.............: avg=100.38ms min=34.2ms  med=97.98ms max=379.12ms p(90)=118.67ms p(95)=126.99ms p(99.9)=234.12ms
     iterations.....................: 59788   487.907299/s
     success_rate...................: 100.00% ✓ 59788      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 134760     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   441 kB/s
     http_req_blocked...............: avg=5.79µs   min=1.19µs  med=3.38µs   max=4.01ms   p(90)=4.84µs   p(95)=5.44µs   p(99.9)=366µs   
     http_req_connecting............: avg=2.18µs   min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=189.2µs 
     http_req_duration..............: avg=133.08ms min=18.68ms med=130.94ms max=381.16ms p(90)=166.11ms p(95)=178ms    p(99.9)=228.7ms 
       { expected_response:true }...: avg=133.08ms min=18.68ms med=130.94ms max=381.16ms p(90)=166.11ms p(95)=178ms    p(99.9)=228.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 45020
     http_req_receiving.............: avg=98.45µs  min=31.95µs med=84.8µs   max=223.65ms p(90)=118.18µs p(95)=131.05µs p(99.9)=789.83µs
     http_req_sending...............: avg=28.17µs  min=5.67µs  med=15.74µs  max=122.6ms  p(90)=21.58µs  p(95)=23.6µs   p(99.9)=642.7µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=132.95ms min=18.53ms med=130.83ms max=380.49ms p(90)=166ms    p(95)=177.85ms p(99.9)=226.79ms
     http_reqs......................: 45020   367.510365/s
     iteration_duration.............: avg=133.61ms min=38.37ms med=131.26ms max=389.8ms  p(90)=166.4ms  p(95)=178.34ms p(99.9)=232.87ms
     iterations.....................: 44920   366.694039/s
     success_rate...................: 100.00% ✓ 44920      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 92427      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   304 kB/s
     http_req_blocked...............: avg=4.93µs   min=1.22µs  med=3.45µs   max=1.81ms   p(90)=4.91µs   p(95)=5.53µs   p(99.9)=531.56µs
     http_req_connecting............: avg=1.24µs   min=0s      med=0s       max=1.78ms   p(90)=0s       p(95)=0s       p(99.9)=486.56µs
     http_req_duration..............: avg=193.96ms min=18.41ms med=181.44ms max=546.42ms p(90)=226.45ms p(95)=391.24ms p(99.9)=510.56ms
       { expected_response:true }...: avg=193.96ms min=18.41ms med=181.44ms max=546.42ms p(90)=226.45ms p(95)=391.24ms p(99.9)=510.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30909
     http_req_receiving.............: avg=104.62µs min=35.2µs  med=93.51µs  max=92.27ms  p(90)=126.46µs p(95)=140.06µs p(99.9)=721.39µs
     http_req_sending...............: avg=31.52µs  min=6.13µs  med=17.4µs   max=73.34ms  p(90)=22.83µs  p(95)=24.76µs  p(99.9)=541.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.82ms min=18.24ms med=181.31ms max=546.31ms p(90)=226.33ms p(95)=391.14ms p(99.9)=510.43ms
     http_reqs......................: 30909   252.814512/s
     iteration_duration.............: avg=194.82ms min=45.81ms med=181.79ms max=546.67ms p(90)=226.79ms p(95)=391.84ms p(99.9)=510.85ms
     iterations.....................: 30809   251.99658/s
     success_rate...................: 100.00% ✓ 30809      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86580      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   283 kB/s
     http_req_blocked...............: avg=7.4µs    min=1.16µs  med=3.28µs   max=4.29ms   p(90)=4.68µs   p(95)=5.3µs    p(99.9)=2.05ms  
     http_req_connecting............: avg=3.79µs   min=0s      med=0s       max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=1.98ms  
     http_req_duration..............: avg=207.06ms min=20.91ms med=207.38ms max=457.54ms p(90)=221.51ms p(95)=227.46ms p(99.9)=300.95ms
       { expected_response:true }...: avg=207.06ms min=20.91ms med=207.38ms max=457.54ms p(90)=221.51ms p(95)=227.46ms p(99.9)=300.95ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28960
     http_req_receiving.............: avg=105.92µs min=35.62µs med=91.99µs  max=177.52ms p(90)=125.93µs p(95)=138.82µs p(99.9)=675.84µs
     http_req_sending...............: avg=31.47µs  min=5.82µs  med=16.79µs  max=128.79ms p(90)=22.07µs  p(95)=23.99µs  p(99.9)=530.96µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.93ms min=20.71ms med=207.27ms max=447.84ms p(90)=221.39ms p(95)=227.33ms p(99.9)=300.1ms 
     http_reqs......................: 28960   235.800363/s
     iteration_duration.............: avg=208.01ms min=66.89ms med=207.71ms max=464.84ms p(90)=221.79ms p(95)=227.79ms p(99.9)=310.99ms
     iterations.....................: 28860   234.986136/s
     success_rate...................: 100.00% ✓ 28860      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

