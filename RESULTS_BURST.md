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
| hive-router | v0.0.65 | 2,705 | 2,793 | 2,641 | 2.0% |  |
| fusion-nightly | 16.3.0-p.1 | 2,090 | 2,148 | 2,061 | 1.5% |  |
| fusion | 16.2.0 | 2,065 | 2,106 | 2,035 | 1.2% |  |
| cosmo | 0.321.1 | 1,126 | 1,126 | 1,122 | 0.3% | non-compatible response (20 across 7/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 504 | 511 | 500 | 0.7% |  |
| hive-gateway | 2.8.2 | 222 | 227 | 221 | 0.8% |  |
| apollo-gateway | 2.14.1 | 200 | 205 | 199 | 0.9% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (10451 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (410126 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,129 | 2,246 | 2,088 | 2.3% |  |
| fusion-nightly | 16.3.0-p.1 | 1,957 | 2,004 | 1,942 | 1.1% |  |
| fusion | 16.2.0 | 1,929 | 1,988 | 1,893 | 1.5% |  |
| cosmo | 0.321.1 | 1,097 | 1,102 | 1,094 | 0.4% | non-compatible response (13 across 6/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 490 | 497 | 483 | 1.0% |  |
| hive-gateway | 2.8.2 | 211 | 217 | 209 | 1.3% |  |
| apollo-gateway | 2.14.1 | 202 | 206 | 200 | 0.9% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (11910 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (242890 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 498969      ✗ 0     
     data_received..................: 15 GB   237 MB/s
     data_sent......................: 201 MB  3.2 MB/s
     http_req_blocked...............: avg=28.41µs  min=962ns   med=2.25µs  max=75ms     p(90)=3.71µs   p(95)=4.76µs   p(99.9)=4.2ms   
     http_req_connecting............: avg=25.08µs  min=0s      med=0s      max=74.92ms  p(90)=0s       p(95)=0s       p(99.9)=3.84ms  
     http_req_duration..............: avg=84.9ms   min=1.62ms  med=79.17ms max=290.61ms p(90)=164.43ms p(95)=179.62ms p(99.9)=244.96ms
       { expected_response:true }...: avg=84.9ms   min=1.62ms  med=79.17ms max=290.61ms p(90)=164.43ms p(95)=179.62ms p(99.9)=244.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 167323
     http_req_receiving.............: avg=410.38µs min=27.66µs med=56.16µs max=80.7ms   p(90)=225.97µs p(95)=419.09µs p(99.9)=55.01ms 
     http_req_sending...............: avg=87.22µs  min=5.36µs  med=10.09µs max=76.91ms  p(90)=19µs     p(95)=135.08µs p(99.9)=13.99ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.4ms   min=1.55ms  med=78.86ms max=284.19ms p(90)=163.84ms p(95)=178.32ms p(99.9)=234.08ms
     http_reqs......................: 167323  2705.092905/s
     iteration_duration.............: avg=85.71ms  min=2.37ms  med=79.98ms max=394.17ms p(90)=164.93ms p(95)=180.16ms p(99.9)=247.73ms
     iterations.....................: 166323  2688.926013/s
     success_rate...................: 100.00% ✓ 166323      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.3.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 389940      ✗ 0     
     data_received..................: 12 GB   183 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=17.23µs  min=992ns   med=2.2µs    max=51.12ms  p(90)=3.58µs   p(95)=4.66µs   p(99.9)=2.24ms  
     http_req_connecting............: avg=14.01µs  min=0s      med=0s       max=51.07ms  p(90)=0s       p(95)=0s       p(99.9)=2.1ms   
     http_req_duration..............: avg=108.62ms min=2.28ms  med=101.96ms max=505.93ms p(90)=211.65ms p(95)=236.53ms p(99.9)=378.95ms
       { expected_response:true }...: avg=108.62ms min=2.28ms  med=101.96ms max=505.93ms p(90)=211.65ms p(95)=236.53ms p(99.9)=378.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130980
     http_req_receiving.............: avg=1.93ms   min=52.85µs med=314.4µs  max=266.36ms p(90)=3ms      p(95)=6.5ms    p(99.9)=93.99ms 
     http_req_sending...............: avg=67.03µs  min=5.34µs  med=9.62µs   max=292ms    p(90)=18.39µs  p(95)=120.76µs p(99.9)=8.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.62ms min=2.2ms   med=100.35ms max=505.84ms p(90)=208.86ms p(95)=232.3ms  p(99.9)=359.73ms
     http_reqs......................: 130980  2090.419327/s
     iteration_duration.............: avg=109.74ms min=3.31ms  med=103.26ms max=506.14ms p(90)=212.24ms p(95)=237.24ms p(99.9)=382.72ms
     iterations.....................: 129980  2074.45949/s
     success_rate...................: 100.00% ✓ 129980      ✗ 0     
     vus............................: 90      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.2.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 386046      ✗ 0     
     data_received..................: 11 GB   181 MB/s
     data_sent......................: 156 MB  2.5 MB/s
     http_req_blocked...............: avg=17.33µs  min=981ns   med=2.16µs   max=118.6ms  p(90)=3.56µs   p(95)=4.63µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=14.46µs  min=0s      med=0s       max=118.53ms p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=109.72ms min=2.43ms  med=98.1ms   max=807.94ms p(90)=219.03ms p(95)=263.16ms p(99.9)=490.7ms 
       { expected_response:true }...: avg=109.72ms min=2.43ms  med=98.1ms   max=807.94ms p(90)=219.03ms p(95)=263.16ms p(99.9)=490.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 129682
     http_req_receiving.............: avg=3.72ms   min=51.25µs med=148.45µs max=544.41ms p(90)=4.72ms   p(95)=14.04ms  p(99.9)=162.15ms
     http_req_sending...............: avg=62.18µs  min=5.35µs  med=9.55µs   max=61.29ms  p(90)=18.01µs  p(95)=117.57µs p(99.9)=8.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.94ms min=2.31ms  med=95.86ms  max=587.66ms p(90)=211.68ms p(95)=248.37ms p(99.9)=433.73ms
     http_reqs......................: 129682  2065.801492/s
     iteration_duration.............: avg=110.88ms min=3.48ms  med=99.42ms  max=808.15ms p(90)=219.9ms  p(95)=264.17ms p(99.9)=491.05ms
     iterations.....................: 128682  2049.871744/s
     success_rate...................: 100.00% ✓ 128682      ✗ 0     
     vus............................: 93      min=0         max=500 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 208491      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=6.53µs   min=1.03µs  med=2.15µs   max=48.37ms  p(90)=3.64µs   p(95)=4.55µs   p(99.9)=517.98µs
     http_req_connecting............: avg=3.72µs   min=0s      med=0s       max=48.3ms   p(90)=0s       p(95)=0s       p(99.9)=449.15µs
     http_req_duration..............: avg=202.46ms min=2.06ms  med=204.46ms max=609.37ms p(90)=374.72ms p(95)=400.58ms p(99.9)=500.68ms
       { expected_response:true }...: avg=202.46ms min=2.06ms  med=204.46ms max=609.37ms p(90)=374.72ms p(95)=400.58ms p(99.9)=500.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70497
     http_req_receiving.............: avg=73.48µs  min=29.91µs med=60.98µs  max=17.34ms  p(90)=94.31µs  p(95)=107.98µs p(99.9)=1.57ms  
     http_req_sending...............: avg=27.62µs  min=5.39µs  med=10.44µs  max=79.63ms  p(90)=16.4µs   p(95)=19.95µs  p(99.9)=3.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.36ms min=1.97ms  med=204.38ms max=609.31ms p(90)=374.63ms p(95)=400.48ms p(99.9)=500.62ms
     http_reqs......................: 70497   1126.684386/s
     iteration_duration.............: avg=205.61ms min=4.38ms  med=207.83ms max=609.52ms p(90)=375.5ms  p(95)=401.36ms p(99.9)=501.15ms
     iterations.....................: 69497   1110.702367/s
     success_rate...................: 100.00% ✓ 69497       ✗ 0    
     vus............................: 84      min=0         max=496
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 95028      ✗ 0    
     data_received..................: 2.9 GB  44 MB/s
     data_sent......................: 39 MB   606 kB/s
     http_req_blocked...............: avg=9.25µs   min=1.19µs  med=2.92µs   max=4.19ms  p(90)=4.68µs   p(95)=5.67µs   p(99.9)=1.7ms 
     http_req_connecting............: avg=5.34µs   min=0s      med=0s       max=4.12ms  p(90)=0s       p(95)=0s       p(99.9)=1.67ms
     http_req_duration..............: avg=439.34ms min=3.9ms   med=408.99ms max=1.82s   p(90)=867.99ms p(95)=942.85ms p(99.9)=1.38s 
       { expected_response:true }...: avg=439.34ms min=3.9ms   med=408.99ms max=1.82s   p(90)=867.99ms p(95)=942.85ms p(99.9)=1.38s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32676
     http_req_receiving.............: avg=89.37µs  min=33.82µs med=77.15µs  max=66.32ms p(90)=113.15µs p(95)=126.8µs  p(99.9)=1.01ms
     http_req_sending...............: avg=25.64µs  min=5.91µs  med=13.49µs  max=36.8ms  p(90)=20.99µs  p(95)=24.34µs  p(99.9)=2.4ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=439.22ms min=3.84ms  med=408.84ms max=1.82s   p(90)=867.88ms p(95)=942.77ms p(99.9)=1.38s 
     http_reqs......................: 32676   504.656865/s
     iteration_duration.............: avg=453.45ms min=20.46ms med=425.89ms max=1.82s   p(90)=872.5ms  p(95)=946.11ms p(99.9)=1.39s 
     iterations.....................: 31676   489.212598/s
     success_rate...................: 100.00% ✓ 31676      ✗ 0    
     vus............................: 91      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 42483      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   268 kB/s
     http_req_blocked...............: avg=14.16µs  min=1.33µs  med=3.81µs   max=19.91ms  p(90)=5.68µs  p(95)=7.53µs   p(99.9)=1.6ms 
     http_req_connecting............: avg=8.38µs   min=0s      med=0s       max=19.79ms  p(90)=0s      p(95)=0s       p(99.9)=1.4ms 
     http_req_duration..............: avg=942.29ms min=6.11ms  med=825.41ms max=16.34s   p(90)=1.72s   p(95)=1.92s    p(99.9)=14.73s
       { expected_response:true }...: avg=942.29ms min=6.11ms  med=825.41ms max=16.34s   p(90)=1.72s   p(95)=1.92s    p(99.9)=14.73s
     http_req_failed................: 0.00%   ✓ 0          ✗ 15161
     http_req_receiving.............: avg=125.45µs min=39.85µs med=99.08µs  max=132.94ms p(90)=139µs   p(95)=152.86µs p(99.9)=1.08ms
     http_req_sending...............: avg=57.13µs  min=6.45µs  med=18.46µs  max=153.73ms p(90)=24.83µs p(95)=29.89µs  p(99.9)=2.75ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=942.11ms min=6.03ms  med=825.32ms max=16.34s   p(90)=1.72s   p(95)=1.92s    p(99.9)=14.73s
     http_reqs......................: 15161   222.476558/s
     iteration_duration.............: avg=1s       min=65.33ms med=892.98ms max=16.34s   p(90)=1.76s   p(95)=1.93s    p(99.9)=14.76s
     iterations.....................: 14161   207.802291/s
     success_rate...................: 100.00% ✓ 14161      ✗ 0    
     vus............................: 63      min=0        max=499
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 41754      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   246 kB/s
     http_req_blocked...............: avg=17.1µs   min=1.06µs  med=3.31µs   max=17.89ms p(90)=5µs      p(95)=6.64µs   p(99.9)=3.04ms  
     http_req_connecting............: avg=12µs     min=0s      med=0s       max=17.83ms p(90)=0s       p(95)=0s       p(99.9)=3ms     
     http_req_duration..............: avg=473.11ms min=8.43ms  med=540.84ms max=1.46s   p(90)=811.3ms  p(95)=881.29ms p(99.9)=1.24s   
       { expected_response:true }...: avg=473.11ms min=8.43ms  med=540.84ms max=1.46s   p(90)=811.3ms  p(95)=881.29ms p(99.9)=1.24s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14918
     http_req_receiving.............: avg=95.36µs  min=33.55µs med=88.54µs  max=6.45ms  p(90)=127.87µs p(95)=141.37µs p(99.9)=826.76µs
     http_req_sending...............: avg=29.87µs  min=6.04µs  med=16.45µs  max=47.9ms  p(90)=22.83µs  p(95)=27.67µs  p(99.9)=2.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=472.98ms min=8.33ms  med=540.73ms max=1.46s   p(90)=811.2ms  p(95)=881.18ms p(99.9)=1.24s   
     http_reqs......................: 14918   200.560023/s
     iteration_duration.............: avg=506.94ms min=9.05ms  med=569.68ms max=1.47s   p(90)=817.64ms p(95)=887.77ms p(99.9)=1.25s   
     iterations.....................: 13918   187.11586/s
     success_rate...................: 100.00% ✓ 13918      ✗ 0    
     vus............................: 64      min=0        max=496
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 394413      ✗ 0     
     data_received..................: 12 GB   186 MB/s
     data_sent......................: 159 MB  2.6 MB/s
     http_req_blocked...............: avg=17.24µs  min=992ns   med=2.37µs   max=66.76ms  p(90)=3.96µs   p(95)=5.15µs   p(99.9)=3.09ms  
     http_req_connecting............: avg=14.11µs  min=0s      med=0s       max=66.7ms   p(90)=0s       p(95)=0s       p(99.9)=2.95ms  
     http_req_duration..............: avg=107.38ms min=1.74ms  med=102.19ms max=377.44ms p(90)=206.42ms p(95)=224.14ms p(99.9)=271.9ms 
       { expected_response:true }...: avg=107.38ms min=1.74ms  med=102.19ms max=377.44ms p(90)=206.42ms p(95)=224.14ms p(99.9)=271.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 132471
     http_req_receiving.............: avg=154.15µs min=29.51µs med=62.03µs  max=260.96ms p(90)=168.78µs p(95)=407.91µs p(99.9)=13.57ms 
     http_req_sending...............: avg=77.23µs  min=5.4µs   med=10.89µs  max=91.51ms  p(90)=21.16µs  p(95)=137.89µs p(99.9)=9.95ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.15ms min=1.64ms  med=101.95ms max=369.38ms p(90)=206.1ms  p(95)=223.9ms  p(99.9)=270.59ms
     http_reqs......................: 132471  2129.1962/s
     iteration_duration.............: avg=108.48ms min=4.11ms  med=103.65ms max=393.72ms p(90)=206.96ms p(95)=224.64ms p(99.9)=273.22ms
     iterations.....................: 131471  2113.123277/s
     success_rate...................: 100.00% ✓ 131471      ✗ 0     
     vus............................: 68      min=0         max=495 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 361599      ✗ 0     
     data_received..................: 11 GB   172 MB/s
     data_sent......................: 146 MB  2.4 MB/s
     http_req_blocked...............: avg=13.97µs  min=1µs     med=2.32µs   max=50.54ms  p(90)=4.02µs   p(95)=5.23µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=10.94µs  min=0s      med=0s       max=50.48ms  p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=117.09ms min=1.69ms  med=111.03ms max=550.95ms p(90)=224.24ms p(95)=246.06ms p(99.9)=374.36ms
       { expected_response:true }...: avg=117.09ms min=1.69ms  med=111.03ms max=550.95ms p(90)=224.24ms p(95)=246.06ms p(99.9)=374.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 121533
     http_req_receiving.............: avg=1.75ms   min=53.24µs med=359.6µs  max=221.62ms p(90)=3.15ms   p(95)=6.11ms   p(99.9)=85.94ms 
     http_req_sending...............: avg=61.81µs  min=5.36µs  med=10.08µs  max=192.67ms p(90)=20.1µs   p(95)=123.61µs p(99.9)=8.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.28ms min=1.6ms   med=109.27ms max=550.86ms p(90)=221.87ms p(95)=243.17ms p(99.9)=355.5ms 
     http_reqs......................: 121533  1957.657596/s
     iteration_duration.............: avg=118.34ms min=3.38ms  med=112.51ms max=551.16ms p(90)=224.9ms  p(95)=246.7ms  p(99.9)=375.6ms 
     iterations.....................: 120533  1941.549563/s
     success_rate...................: 100.00% ✓ 120533      ✗ 0     
     vus............................: 63      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.2.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 357258      ✗ 0     
     data_received..................: 11 GB   169 MB/s
     data_sent......................: 144 MB  2.3 MB/s
     http_req_blocked...............: avg=16.16µs  min=992ns   med=2.29µs   max=56.77ms  p(90)=3.98µs   p(95)=5.15µs   p(99.9)=2.72ms  
     http_req_connecting............: avg=13.17µs  min=0s      med=0s       max=56.56ms  p(90)=0s       p(95)=0s       p(99.9)=2.7ms   
     http_req_duration..............: avg=118.57ms min=1.8ms   med=108.08ms max=707.87ms p(90)=230.75ms p(95)=270.32ms p(99.9)=520.94ms
       { expected_response:true }...: avg=118.57ms min=1.8ms   med=108.08ms max=707.87ms p(90)=230.75ms p(95)=270.32ms p(99.9)=520.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 120086
     http_req_receiving.............: avg=3.1ms    min=53.64µs med=148.58µs max=461.15ms p(90)=4.08ms   p(95)=10.08ms  p(99.9)=170.15ms
     http_req_sending...............: avg=67.29µs  min=5.43µs  med=9.95µs   max=165.75ms p(90)=19.67µs  p(95)=120.34µs p(99.9)=9.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.4ms  min=1.71ms  med=106ms    max=658.34ms p(90)=224.96ms p(95)=260.7ms  p(99.9)=486.64ms
     http_reqs......................: 120086  1929.497372/s
     iteration_duration.............: avg=119.84ms min=3.04ms  med=109.56ms max=708.09ms p(90)=231.57ms p(95)=271.28ms p(99.9)=522.49ms
     iterations.....................: 119086  1913.429742/s
     success_rate...................: 100.00% ✓ 119086      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 203559      ✗ 0    
     data_received..................: 6.0 GB  96 MB/s
     data_sent......................: 83 MB   1.3 MB/s
     http_req_blocked...............: avg=6.76µs   min=1.04µs  med=2.45µs   max=34.7ms   p(90)=4.24µs   p(95)=5.26µs   p(99.9)=578.45µs
     http_req_connecting............: avg=3.52µs   min=0s      med=0s       max=34.65ms  p(90)=0s       p(95)=0s       p(99.9)=509.35µs
     http_req_duration..............: avg=207.31ms min=2.22ms  med=206.84ms max=701.27ms p(90)=382.89ms p(95)=413.95ms p(99.9)=547.9ms 
       { expected_response:true }...: avg=207.31ms min=2.22ms  med=206.84ms max=701.27ms p(90)=382.89ms p(95)=413.95ms p(99.9)=547.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 68853
     http_req_receiving.............: avg=91.53µs  min=28.62µs med=65.27µs  max=129.31ms p(90)=104.36µs p(95)=120.3µs  p(99.9)=2.41ms  
     http_req_sending...............: avg=28.97µs  min=5.02µs  med=11.47µs  max=30.07ms  p(90)=19.01µs  p(95)=22.7µs   p(99.9)=3.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.18ms min=2.14ms  med=206.7ms  max=701.2ms  p(90)=382.76ms p(95)=413.86ms p(99.9)=547.83ms
     http_reqs......................: 68853   1097.231762/s
     iteration_duration.............: avg=210.63ms min=3.46ms  med=210.33ms max=701.45ms p(90)=383.96ms p(95)=414.86ms p(99.9)=548.32ms
     iterations.....................: 67853   1081.295902/s
     success_rate...................: 100.00% ✓ 67853       ✗ 0    
     vus............................: 94      min=0         max=500
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 92826      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   588 kB/s
     http_req_blocked...............: avg=10.42µs  min=1.19µs  med=3.4µs    max=8.22ms   p(90)=5.3µs    p(95)=6.37µs   p(99.9)=1.85ms  
     http_req_connecting............: avg=6.01µs   min=0s      med=0s       max=8.16ms   p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=449.42ms min=4.06ms  med=423.17ms max=2.05s    p(90)=881.55ms p(95)=955.56ms p(99.9)=1.47s   
       { expected_response:true }...: avg=449.42ms min=4.06ms  med=423.17ms max=2.05s    p(90)=881.55ms p(95)=955.56ms p(99.9)=1.47s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31942
     http_req_receiving.............: avg=101.47µs min=32.48µs med=83.86µs  max=160.86ms p(90)=120.99µs p(95)=135.72µs p(99.9)=898.36µs
     http_req_sending...............: avg=27.21µs  min=6.05µs  med=14.93µs  max=70.76ms  p(90)=22.39µs  p(95)=25.73µs  p(99.9)=2.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=449.29ms min=3.99ms  med=423.08ms max=2.05s    p(90)=881.41ms p(95)=955.47ms p(99.9)=1.47s   
     http_reqs......................: 31942   490.043939/s
     iteration_duration.............: avg=464.19ms min=21.17ms med=441.05ms max=2.05s    p(90)=885.43ms p(95)=960.05ms p(99.9)=1.48s   
     iterations.....................: 30942   474.702259/s
     success_rate...................: 100.00% ✓ 30942      ✗ 0    
     vus............................: 65      min=0        max=496
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 40638      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   254 kB/s
     http_req_blocked...............: avg=18.35µs  min=1.25µs  med=3.86µs   max=27.21ms p(90)=5.78µs   p(95)=7.47µs   p(99.9)=2.59ms  
     http_req_connecting............: avg=12.61µs  min=0s      med=0s       max=27.15ms p(90)=0s       p(95)=0s       p(99.9)=2.57ms  
     http_req_duration..............: avg=1s       min=6.8ms   med=918.97ms max=6.17s   p(90)=1.99s    p(95)=2.24s    p(99.9)=5.87s   
       { expected_response:true }...: avg=1s       min=6.8ms   med=918.97ms max=6.17s   p(90)=1.99s    p(95)=2.24s    p(99.9)=5.87s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14546
     http_req_receiving.............: avg=106.44µs min=32.26µs med=100.14µs max=22.24ms p(90)=139.75µs p(95)=151.75µs p(99.9)=767.75µs
     http_req_sending...............: avg=34.6µs   min=6.16µs  med=18.57µs  max=53.59ms p(90)=24.77µs  p(95)=30.42µs  p(99.9)=3.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1s       min=6.69ms  med=918.87ms max=6.17s   p(90)=1.99s    p(95)=2.24s    p(99.9)=5.87s   
     http_reqs......................: 14546   211.209298/s
     iteration_duration.............: avg=1.07s    min=43.61ms med=1s       max=6.18s   p(90)=2.01s    p(95)=2.26s    p(99.9)=5.89s   
     iterations.....................: 13546   196.689204/s
     success_rate...................: 100.00% ✓ 13546      ✗ 0    
     vus............................: 9       min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 39390      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   243 kB/s
     http_req_blocked...............: avg=16.71µs  min=1.28µs  med=3.62µs   max=3.99ms   p(90)=5.4µs    p(95)=7.04µs  p(99.9)=2.66ms 
     http_req_connecting............: avg=11.25µs  min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s      p(99.9)=2.62ms 
     http_req_duration..............: avg=1.03s    min=8.71ms  med=935.01ms max=4.56s    p(90)=2.07s    p(95)=2.23s   p(99.9)=3.97s  
       { expected_response:true }...: avg=1.03s    min=8.71ms  med=935.01ms max=4.56s    p(90)=2.07s    p(95)=2.23s   p(99.9)=3.97s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14130
     http_req_receiving.............: avg=303.75µs min=36.71µs med=97.27µs  max=191.21ms p(90)=138.59µs p(95)=151.8µs p(99.9)=75.85ms
     http_req_sending...............: avg=35.11µs  min=6.14µs  med=17.88µs  max=61.17ms  p(90)=23.68µs  p(95)=28.53µs p(99.9)=2.79ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=1.03s    min=8.6ms   med=934.86ms max=4.56s    p(90)=2.07s    p(95)=2.23s   p(99.9)=3.97s  
     http_reqs......................: 14130   202.062332/s
     iteration_duration.............: avg=1.11s    min=11.26ms med=1.06s    max=4.56s    p(90)=2.09s    p(95)=2.24s   p(99.9)=4s     
     iterations.....................: 13130   187.762096/s
     success_rate...................: 100.00% ✓ 13130      ✗ 0    
     vus............................: 35      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

