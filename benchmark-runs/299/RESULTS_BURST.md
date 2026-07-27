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
| hive-router | v0.0.84 | 2,700 | 2,886 | 2,647 | 2.9% |  |
| fusion-nightly-net11 | 16.6.0-p.3 | 2,613 | 2,716 | 2,554 | 2.2% |  |
| fusion-nightly | 16.6.0-p.3 | 2,453 | 2,542 | 2,441 | 1.4% |  |
| fusion | 16.5.1 | 2,396 | 2,474 | 2,356 | 1.5% |  |
| cosmo | 0.334.0 | 1,235 | 1,277 | 1,229 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 558 | 573 | 556 | 1.0% |  |
| hive-gateway | 2.10.8 | 255 | 264 | 254 | 1.3% |  |
| apollo-gateway | 2.14.3 | 232 | 238 | 231 | 0.9% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (12647 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (471777 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.5.1 | 2,351 | 2,438 | 2,342 | 1.4% |  |
| fusion-nightly-net11 | 16.6.0-p.3 | 2,348 | 2,457 | 2,335 | 1.8% |  |
| fusion-nightly | 16.6.0-p.3 | 2,297 | 2,396 | 2,291 | 1.6% |  |
| hive-router | v0.0.84 | 2,236 | 2,372 | 2,217 | 2.3% |  |
| fusion-nightly-fed | 16.6.0-p.3 | 2,206 | 2,297 | 2,199 | 1.5% |  |
| cosmo | 0.334.0 | 1,124 | 1,162 | 1,111 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 529 | 542 | 525 | 1.1% |  |
| hive-gateway | 2.10.8 | 246 | 254 | 244 | 1.4% |  |
| apollo-gateway | 2.14.3 | 238 | 242 | 237 | 0.6% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (18465 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (286143 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 496350      ✗ 0     
     data_received..................: 15 GB   237 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=20.62µs  min=1.05µs  med=2.65µs  max=61.18ms  p(90)=4.28µs   p(95)=5.41µs   p(99.9)=2.02ms  
     http_req_connecting............: avg=17.19µs  min=0s      med=0s      max=61.12ms  p(90)=0s       p(95)=0s       p(99.9)=1.89ms  
     http_req_duration..............: avg=85.4ms   min=1.33ms  med=80.09ms max=329.98ms p(90)=163.97ms p(95)=178.82ms p(99.9)=244.96ms
       { expected_response:true }...: avg=85.4ms   min=1.33ms  med=80.09ms max=329.98ms p(90)=163.97ms p(95)=178.82ms p(99.9)=244.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 166450
     http_req_receiving.............: avg=156.31µs min=27.05µs med=53.03µs max=55.49ms  p(90)=144.77µs p(95)=350.66µs p(99.9)=20.13ms 
     http_req_sending...............: avg=75.93µs  min=4.49µs  med=9.94µs  max=199.66ms p(90)=18.56µs  p(95)=123.85µs p(99.9)=10.86ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.16ms  min=1.29ms  med=79.88ms max=317.37ms p(90)=163.7ms  p(95)=178.37ms p(99.9)=243.9ms 
     http_reqs......................: 166450  2700.64882/s
     iteration_duration.............: avg=86.17ms  min=2.17ms  med=80.9ms  max=341.37ms p(90)=164.44ms p(95)=179.28ms p(99.9)=246.3ms 
     iterations.....................: 165450  2684.423835/s
     success_rate...................: 100.00% ✓ 165450      ✗ 0     
     vus............................: 86      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 485118      ✗ 0     
     data_received..................: 14 GB   229 MB/s
     data_sent......................: 195 MB  3.1 MB/s
     http_req_blocked...............: avg=21.52µs min=1µs     med=2.55µs   max=63.4ms   p(90)=4.1µs    p(95)=5.2µs    p(99.9)=2.52ms  
     http_req_connecting............: avg=18.17µs min=0s      med=0s       max=63.34ms  p(90)=0s       p(95)=0s       p(99.9)=2.34ms  
     http_req_duration..............: avg=87.37ms min=1.89ms  med=81.82ms  max=403.47ms p(90)=168.39ms p(95)=186.34ms p(99.9)=247.41ms
       { expected_response:true }...: avg=87.37ms min=1.89ms  med=81.82ms  max=403.47ms p(90)=168.39ms p(95)=186.34ms p(99.9)=247.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 162706
     http_req_receiving.............: avg=719.5µs min=51.89µs med=111.25µs max=201.55ms p(90)=1.46ms   p(95)=2.41ms   p(99.9)=25.48ms 
     http_req_sending...............: avg=71.36µs min=4.66µs  med=9.6µs    max=130.35ms p(90)=18.92µs  p(95)=121.58µs p(99.9)=10.11ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.57ms min=1.8ms   med=81.07ms  max=402.95ms p(90)=167.49ms p(95)=185.52ms p(99.9)=245.36ms
     http_reqs......................: 162706  2613.533791/s
     iteration_duration.............: avg=88.16ms min=3.39ms  med=82.65ms  max=412.24ms p(90)=168.85ms p(95)=186.83ms p(99.9)=248.47ms
     iterations.....................: 161706  2597.470869/s
     success_rate...................: 100.00% ✓ 161706      ✗ 0     
     vus............................: 68      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 455367      ✗ 0     
     data_received..................: 13 GB   215 MB/s
     data_sent......................: 184 MB  2.9 MB/s
     http_req_blocked...............: avg=16.52µs min=892ns   med=2.06µs  max=89.27ms  p(90)=3.38µs   p(95)=4.35µs   p(99.9)=962.85µs
     http_req_connecting............: avg=13.84µs min=0s      med=0s      max=89.1ms   p(90)=0s       p(95)=0s       p(99.9)=929.83µs
     http_req_duration..............: avg=93.06ms min=1.98ms  med=82.45ms max=1.42s    p(90)=171.19ms p(95)=198.44ms p(99.9)=771.17ms
       { expected_response:true }...: avg=93.06ms min=1.98ms  med=82.45ms max=1.42s    p(90)=171.19ms p(95)=198.44ms p(99.9)=771.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152789
     http_req_receiving.............: avg=1.8ms   min=50.85µs med=98.74µs max=637.55ms p(90)=1.78ms   p(95)=5.08ms   p(99.9)=114.47ms
     http_req_sending...............: avg=62.38µs min=4.38µs  med=8.79µs  max=222.49ms p(90)=15.83µs  p(95)=97.56µs  p(99.9)=7.6ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.19ms min=1.87ms  med=81.12ms max=1.42s    p(90)=168.91ms p(95)=194.81ms p(99.9)=717.94ms
     http_reqs......................: 152789  2453.472616/s
     iteration_duration.............: avg=93.98ms min=3.39ms  med=83.38ms max=1.42s    p(90)=172.05ms p(95)=199.59ms p(99.9)=771.49ms
     iterations.....................: 151789  2437.414702/s
     success_rate...................: 100.00% ✓ 151789      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 444780      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=13.85µs min=832ns   med=2.02µs   max=62.44ms  p(90)=3.41µs   p(95)=4.47µs   p(99.9)=1.16ms  
     http_req_connecting............: avg=11.07µs min=0s      med=0s       max=62.29ms  p(90)=0s       p(95)=0s       p(99.9)=1.08ms  
     http_req_duration..............: avg=95.34ms min=1.94ms  med=82.37ms  max=2.3s     p(90)=179.76ms p(95)=207.52ms p(99.9)=625.12ms
       { expected_response:true }...: avg=95.34ms min=1.94ms  med=82.37ms  max=2.3s     p(90)=179.76ms p(95)=207.52ms p(99.9)=625.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149260
     http_req_receiving.............: avg=1.48ms  min=52.28µs med=101.82µs max=622.88ms p(90)=1.86ms   p(95)=5.08ms   p(99.9)=76.68ms 
     http_req_sending...............: avg=57.01µs min=4.66µs  med=8.55µs   max=124.52ms p(90)=15.82µs  p(95)=97.15µs  p(99.9)=7.3ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.8ms  min=1.85ms  med=81.18ms  max=2.3s     p(90)=177.73ms p(95)=204.43ms p(99.9)=622.09ms
     http_reqs......................: 149260  2396.52552/s
     iteration_duration.............: avg=96.23ms min=3.17ms  med=83.4ms   max=2.3s     p(90)=180.28ms p(95)=208.28ms p(99.9)=629.24ms
     iterations.....................: 148260  2380.469473/s
     success_rate...................: 100.00% ✓ 148260      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 228837      ✗ 0    
     data_received..................: 6.8 GB  108 MB/s
     data_sent......................: 93 MB   1.5 MB/s
     http_req_blocked...............: avg=6.45µs   min=1µs     med=2.75µs   max=20.35ms  p(90)=4.49µs   p(95)=5.46µs   p(99.9)=517.34µs
     http_req_connecting............: avg=3.01µs   min=0s      med=0s       max=20.28ms  p(90)=0s       p(95)=0s       p(99.9)=428.22µs
     http_req_duration..............: avg=184.62ms min=1.88ms  med=185.81ms max=486.46ms p(90)=341.9ms  p(95)=365.56ms p(99.9)=431.19ms
       { expected_response:true }...: avg=184.62ms min=1.88ms  med=185.81ms max=486.46ms p(90)=341.9ms  p(95)=365.56ms p(99.9)=431.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 77279
     http_req_receiving.............: avg=73.81µs  min=26.73µs med=60.25µs  max=21.89ms  p(90)=98.39µs  p(95)=113.17µs p(99.9)=1.12ms  
     http_req_sending...............: avg=32.59µs  min=4.91µs  med=11.25µs  max=146.74ms p(90)=18.28µs  p(95)=22.3µs   p(99.9)=3.55ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.52ms min=1.82ms  med=185.67ms max=486.35ms p(90)=341.81ms p(95)=365.45ms p(99.9)=431.1ms 
     http_reqs......................: 77279   1235.879761/s
     iteration_duration.............: avg=187.27ms min=3.83ms  med=188.63ms max=486.67ms p(90)=342.64ms p(95)=366.16ms p(99.9)=431.53ms
     iterations.....................: 76279   1219.887321/s
     success_rate...................: 100.00% ✓ 76279       ✗ 0    
     vus............................: 81      min=0         max=494
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 104718     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 43 MB   671 kB/s
     http_req_blocked...............: avg=7.48µs   min=1.02µs  med=3.04µs   max=15.09ms  p(90)=4.67µs   p(95)=5.7µs    p(99.9)=577.88µs
     http_req_connecting............: avg=3.51µs   min=0s      med=0s       max=15.02ms  p(90)=0s       p(95)=0s       p(99.9)=527.97µs
     http_req_duration..............: avg=399.43ms min=3.53ms  med=372.93ms max=1.9s     p(90)=781.71ms p(95)=852.41ms p(99.9)=1.24s   
       { expected_response:true }...: avg=399.43ms min=3.53ms  med=372.93ms max=1.9s     p(90)=781.71ms p(95)=852.41ms p(99.9)=1.24s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35906
     http_req_receiving.............: avg=86.35µs  min=31.46µs med=71.73µs  max=77.54ms  p(90)=109.44µs p(95)=124.77µs p(99.9)=1.13ms  
     http_req_sending...............: avg=31.02µs  min=5.01µs  med=13.17µs  max=149.14ms p(90)=20.31µs  p(95)=23.37µs  p(99.9)=2.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=399.31ms min=3.47ms  med=372.74ms max=1.9s     p(90)=781.63ms p(95)=852.32ms p(99.9)=1.24s   
     http_reqs......................: 35906   558.775991/s
     iteration_duration.............: avg=411.12ms min=21.43ms med=387.19ms max=1.91s    p(90)=785.29ms p(95)=855.25ms p(99.9)=1.25s   
     iterations.....................: 34906   543.213801/s
     success_rate...................: 100.00% ✓ 34906      ✗ 0    
     vus............................: 69      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 48396      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   307 kB/s
     http_req_blocked...............: avg=13.15µs  min=1.19µs  med=3.33µs   max=3.44ms   p(90)=5.02µs   p(95)=6.31µs   p(99.9)=2.06ms
     http_req_connecting............: avg=8.28µs   min=0s      med=0s       max=3.4ms    p(90)=0s       p(95)=0s       p(99.9)=2.03ms
     http_req_duration..............: avg=836.07ms min=5.37ms  med=742.69ms max=21.49s   p(90)=1.38s    p(95)=1.56s    p(99.9)=19.1s 
       { expected_response:true }...: avg=836.07ms min=5.37ms  med=742.69ms max=21.49s   p(90)=1.38s    p(95)=1.56s    p(99.9)=19.1s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17132
     http_req_receiving.............: avg=99.55µs  min=32.73µs med=91.85µs  max=20.03ms  p(90)=129.27µs p(95)=144.21µs p(99.9)=1.51ms
     http_req_sending...............: avg=68.44µs  min=5.72µs  med=17.49µs  max=198.43ms p(90)=22.54µs  p(95)=26.78µs  p(99.9)=3.91ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=835.9ms  min=5.29ms  med=742.59ms max=21.49s   p(90)=1.38s    p(95)=1.56s    p(99.9)=19.1s 
     http_reqs......................: 17132   255.075689/s
     iteration_duration.............: avg=887.97ms min=25.34ms med=792.31ms max=21.49s   p(90)=1.41s    p(95)=1.57s    p(99.9)=19.25s
     iterations.....................: 16132   240.186844/s
     success_rate...................: 100.00% ✓ 16132      ✗ 0    
     vus............................: 69      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47895      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   284 kB/s
     http_req_blocked...............: avg=15.2µs   min=1.23µs  med=3.3µs    max=11.97ms  p(90)=4.85µs   p(95)=6.29µs   p(99.9)=2.26ms
     http_req_connecting............: avg=10.19µs  min=0s      med=0s       max=11.91ms  p(90)=0s       p(95)=0s       p(99.9)=2.24ms
     http_req_duration..............: avg=401.73ms min=7.51ms  med=443.07ms max=1.2s     p(90)=699.64ms p(95)=751.6ms  p(99.9)=1.07s 
       { expected_response:true }...: avg=401.73ms min=7.51ms  med=443.07ms max=1.2s     p(90)=699.64ms p(95)=751.6ms  p(99.9)=1.07s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16965
     http_req_receiving.............: avg=90.8µs   min=32.82µs med=81.07µs  max=19.89ms  p(90)=120.86µs p(95)=135.76µs p(99.9)=1.08ms
     http_req_sending...............: avg=48.26µs  min=5.49µs  med=15.67µs  max=127.55ms p(90)=20.92µs  p(95)=24.88µs  p(99.9)=5.92ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=401.59ms min=7.37ms  med=442.97ms max=1.2s     p(90)=699.52ms p(95)=751.51ms p(99.9)=1.07s 
     http_reqs......................: 16965   232.282355/s
     iteration_duration.............: avg=426.86ms min=8.11ms  med=464.56ms max=1.22s    p(90)=704.38ms p(95)=754.7ms  p(99.9)=1.07s 
     iterations.....................: 15965   218.590498/s
     success_rate...................: 100.00% ✓ 15965      ✗ 0    
     vus............................: 56      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 433881      ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=16.58µs min=822ns   med=2.23µs   max=66.18ms  p(90)=3.97µs   p(95)=5.15µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=13.65µs min=0s      med=0s       max=58.25ms  p(90)=0s       p(95)=0s       p(99.9)=1.5ms   
     http_req_duration..............: avg=97.73ms min=1.54ms  med=84.33ms  max=1.25s    p(90)=187.23ms p(95)=214.14ms p(99.9)=737.2ms 
       { expected_response:true }...: avg=97.73ms min=1.54ms  med=84.33ms  max=1.25s    p(90)=187.23ms p(95)=214.14ms p(99.9)=737.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 145627
     http_req_receiving.............: avg=1.59ms  min=50.35µs med=103.01µs max=1.07s    p(90)=1.69ms   p(95)=4.63ms   p(99.9)=97.96ms 
     http_req_sending...............: avg=65.1µs  min=4.69µs  med=9.56µs   max=129.32ms p(90)=20.53µs  p(95)=106.46µs p(99.9)=8.75ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.08ms min=1.46ms  med=82.91ms  max=1.14s    p(90)=184.95ms p(95)=210.04ms p(99.9)=712.69ms
     http_reqs......................: 145627  2351.444567/s
     iteration_duration.............: avg=98.67ms min=2.94ms  med=85.38ms  max=1.25s    p(90)=187.84ms p(95)=214.93ms p(99.9)=737.89ms
     iterations.....................: 144627  2335.29753/s
     success_rate...................: 100.00% ✓ 144627      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 432501      ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=18.62µs  min=1.03µs  med=2.86µs   max=62.63ms  p(90)=4.59µs   p(95)=5.8µs    p(99.9)=1.95ms  
     http_req_connecting............: avg=14.88µs  min=0s      med=0s       max=62.36ms  p(90)=0s       p(95)=0s       p(99.9)=1.9ms   
     http_req_duration..............: avg=97.95ms  min=1.41ms  med=93.25ms  max=425.51ms p(90)=187.79ms p(95)=203.95ms p(99.9)=266.02ms
       { expected_response:true }...: avg=97.95ms  min=1.41ms  med=93.25ms  max=425.51ms p(90)=187.79ms p(95)=203.95ms p(99.9)=266.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145167
     http_req_receiving.............: avg=870.18µs min=55.33µs med=125.44µs max=268.63ms p(90)=1.73ms   p(95)=2.93ms   p(99.9)=30.57ms 
     http_req_sending...............: avg=68.34µs  min=4.43µs  med=10.79µs  max=204.15ms p(90)=21.34µs  p(95)=126.66µs p(99.9)=9.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.01ms  min=1.34ms  med=92.31ms  max=425.39ms p(90)=186.7ms  p(95)=202.89ms p(99.9)=264.07ms
     http_reqs......................: 145167  2348.932659/s
     iteration_duration.............: avg=98.91ms  min=3.58ms  med=94.29ms  max=425.83ms p(90)=188.27ms p(95)=204.41ms p(99.9)=268.07ms
     iterations.....................: 144167  2332.75176/s
     success_rate...................: 100.00% ✓ 144167      ✗ 0     
     vus............................: 92      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 423738      ✗ 0     
     data_received..................: 13 GB   201 MB/s
     data_sent......................: 171 MB  2.8 MB/s
     http_req_blocked...............: avg=13.57µs  min=861ns   med=2.26µs   max=72.57ms  p(90)=3.87µs   p(95)=4.97µs   p(99.9)=987.07µs
     http_req_connecting............: avg=10.44µs  min=0s      med=0s       max=72.34ms  p(90)=0s       p(95)=0s       p(99.9)=865.6µs 
     http_req_duration..............: avg=100.03ms min=1.52ms  med=85.33ms  max=1.85s    p(90)=190.31ms p(95)=219.7ms  p(99.9)=735.43ms
       { expected_response:true }...: avg=100.03ms min=1.52ms  med=85.33ms  max=1.85s    p(90)=190.31ms p(95)=219.7ms  p(99.9)=735.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142246
     http_req_receiving.............: avg=1.45ms   min=53.65µs med=109.52µs max=702.09ms p(90)=1.93ms   p(95)=4.92ms   p(99.9)=74.56ms 
     http_req_sending...............: avg=60.94µs  min=4.54µs  med=9.47µs   max=212.24ms p(90)=18.4µs   p(95)=102.65µs p(99.9)=7.8ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.51ms  min=1.41ms  med=83.92ms  max=1.85s    p(90)=188.24ms p(95)=216.09ms p(99.9)=719.42ms
     http_reqs......................: 142246  2297.045586/s
     iteration_duration.............: avg=100.99ms min=2.61ms  med=86.38ms  max=1.85s    p(90)=190.97ms p(95)=220.45ms p(99.9)=735.97ms
     iterations.....................: 141246  2280.897184/s
     success_rate...................: 100.00% ✓ 141246      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 413055      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=16.66µs  min=1µs     med=3.03µs  max=58.12ms  p(90)=4.87µs   p(95)=6.06µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=12.91µs  min=0s      med=0s      max=58.01ms  p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=102.57ms min=1.56ms  med=96.59ms max=326.12ms p(90)=199.75ms p(95)=216.54ms p(99.9)=262.39ms
       { expected_response:true }...: avg=102.57ms min=1.56ms  med=96.59ms max=326.12ms p(90)=199.75ms p(95)=216.54ms p(99.9)=262.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138685
     http_req_receiving.............: avg=128.68µs min=27.77µs med=59.22µs max=110.14ms p(90)=140.61µs p(95)=365.06µs p(99.9)=10.24ms 
     http_req_sending...............: avg=65.44µs  min=5.19µs  med=11.76µs max=161.31ms p(90)=21.9µs   p(95)=129.99µs p(99.9)=8.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.38ms min=1.48ms  med=96.35ms max=325.25ms p(90)=199.51ms p(95)=216.19ms p(99.9)=261.58ms
     http_reqs......................: 138685  2236.448784/s
     iteration_duration.............: avg=103.57ms min=5.05ms  med=97.72ms max=340.38ms p(90)=200.22ms p(95)=216.98ms p(99.9)=263.37ms
     iterations.....................: 137685  2220.322679/s
     success_rate...................: 100.00% ✓ 137685      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 409023      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 165 MB  2.6 MB/s
     http_req_blocked...............: avg=20.06µs  min=871ns   med=2.68µs   max=70.71ms  p(90)=4.67µs   p(95)=5.85µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=16.2µs   min=0s      med=0s       max=68.45ms  p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=103.66ms min=1.8ms   med=89.18ms  max=1.52s    p(90)=201.46ms p(95)=231.82ms p(99.9)=772.82ms
       { expected_response:true }...: avg=103.66ms min=1.8ms   med=89.18ms  max=1.52s    p(90)=201.46ms p(95)=231.82ms p(99.9)=772.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137341
     http_req_receiving.............: avg=1.49ms   min=53.58µs med=110.96µs max=752.07ms p(90)=1.72ms   p(95)=4.37ms   p(99.9)=144.45ms
     http_req_sending...............: avg=69.81µs  min=4.6µs   med=10.64µs  max=80.59ms  p(90)=21.49µs  p(95)=119.63µs p(99.9)=9.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.1ms  min=1.73ms  med=87.89ms  max=1.52s    p(90)=199.86ms p(95)=228.33ms p(99.9)=740.68ms
     http_reqs......................: 137341  2206.059996/s
     iteration_duration.............: avg=104.69ms min=3.67ms  med=90.32ms  max=1.52s    p(90)=202.05ms p(95)=232.73ms p(99.9)=775.52ms
     iterations.....................: 136341  2189.99735/s
     success_rate...................: 100.00% ✓ 136341      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 208065      ✗ 0    
     data_received..................: 6.2 GB  98 MB/s
     data_sent......................: 85 MB   1.3 MB/s
     http_req_blocked...............: avg=5.02µs   min=942ns   med=2.33µs   max=16.97ms  p(90)=4.11µs   p(95)=5.11µs   p(99.9)=363.24µs
     http_req_connecting............: avg=1.98µs   min=0s      med=0s       max=16.89ms  p(90)=0s       p(95)=0s       p(99.9)=308.34µs
     http_req_duration..............: avg=202.86ms min=1.94ms  med=204.15ms max=599.89ms p(90)=375.89ms p(95)=402.33ms p(99.9)=523.09ms
       { expected_response:true }...: avg=202.86ms min=1.94ms  med=204.15ms max=599.89ms p(90)=375.89ms p(95)=402.33ms p(99.9)=523.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70355
     http_req_receiving.............: avg=138.74µs min=28.49µs med=66.11µs  max=246.4ms  p(90)=109.07µs p(95)=125.07µs p(99.9)=1.46ms  
     http_req_sending...............: avg=27.43µs  min=5.1µs   med=10.96µs  max=120.24ms p(90)=18.66µs  p(95)=22.26µs  p(99.9)=2.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.69ms min=1.86ms  med=203.92ms max=599.81ms p(90)=375.79ms p(95)=402.26ms p(99.9)=523.02ms
     http_reqs......................: 70355   1124.041203/s
     iteration_duration.............: avg=206.02ms min=4.91ms  med=207.61ms max=600.12ms p(90)=376.9ms  p(95)=402.97ms p(99.9)=525.56ms
     iterations.....................: 69355   1108.064496/s
     success_rate...................: 100.00% ✓ 69355       ✗ 0    
     vus............................: 84      min=0         max=496
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 99681     ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   636 kB/s
     http_req_blocked...............: avg=8.68µs   min=1.3µs   med=3.34µs   max=4.32ms  p(90)=5.14µs   p(95)=6.22µs   p(99.9)=1.23ms 
     http_req_connecting............: avg=4.27µs   min=0s      med=0s       max=4.26ms  p(90)=0s       p(95)=0s       p(99.9)=1.21ms 
     http_req_duration..............: avg=419.48ms min=3.82ms  med=392.01ms max=1.67s   p(90)=826.26ms p(95)=898.47ms p(99.9)=1.29s  
       { expected_response:true }...: avg=419.48ms min=3.82ms  med=392.01ms max=1.67s   p(90)=826.26ms p(95)=898.47ms p(99.9)=1.29s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 34227
     http_req_receiving.............: avg=84.25µs  min=32.58µs med=74.11µs  max=9.16ms  p(90)=112.76µs p(95)=127.3µs  p(99.9)=948.6µs
     http_req_sending...............: avg=29.22µs  min=5.47µs  med=14.45µs  max=21.19ms p(90)=21.43µs  p(95)=24.65µs  p(99.9)=3.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=419.36ms min=3.72ms  med=391.87ms max=1.67s   p(90)=826.19ms p(95)=898.34ms p(99.9)=1.29s  
     http_reqs......................: 34227   529.55638/s
     iteration_duration.............: avg=432.34ms min=19.21ms med=410.05ms max=1.67s   p(90)=831.33ms p(95)=901.49ms p(99.9)=1.3s   
     iterations.....................: 33227   514.08449/s
     success_rate...................: 100.00% ✓ 33227     ✗ 0    
     vus............................: 88      min=0       max=500
     vus_max........................: 500     min=500     max=500
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

     checks.........................: 100.00% ✓ 46863      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   296 kB/s
     http_req_blocked...............: avg=12.1µs   min=1.11µs  med=3.39µs   max=13.6ms   p(90)=5.29µs   p(95)=6.96µs  p(99.9)=1.03ms  
     http_req_connecting............: avg=6.68µs   min=0s      med=0s       max=13.54ms  p(90)=0s       p(95)=0s      p(99.9)=993.28µs
     http_req_duration..............: avg=875.16ms min=5.78ms  med=783.65ms max=4.93s    p(90)=1.77s    p(95)=1.96s   p(99.9)=3.88s   
       { expected_response:true }...: avg=875.16ms min=5.78ms  med=783.65ms max=4.93s    p(90)=1.77s    p(95)=1.96s   p(99.9)=3.88s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16621
     http_req_receiving.............: avg=109.8µs  min=34.97µs med=94.38µs  max=123.01ms p(90)=132.16µs p(95)=147.7µs p(99.9)=1.15ms  
     http_req_sending...............: avg=47.92µs  min=5.84µs  med=18.67µs  max=73.26ms  p(90)=24.36µs  p(95)=29.77µs p(99.9)=4.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=875ms    min=5.69ms  med=783.56ms max=4.92s    p(90)=1.77s    p(95)=1.96s   p(99.9)=3.88s   
     http_reqs......................: 16621   246.276997/s
     iteration_duration.............: avg=931.25ms min=22.8ms  med=860.99ms max=4.93s    p(90)=1.78s    p(95)=1.98s   p(99.9)=3.92s   
     iterations.....................: 15621   231.459778/s
     success_rate...................: 100.00% ✓ 15621      ✗ 0    
     vus............................: 77      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 46263      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   286 kB/s
     http_req_blocked...............: avg=14.63µs  min=1.32µs  med=3.7µs    max=12.64ms  p(90)=5.64µs   p(95)=7.15µs   p(99.9)=2.23ms
     http_req_connecting............: avg=9.04µs   min=0s      med=0s       max=12.58ms  p(90)=0s       p(95)=0s       p(99.9)=2.2ms 
     http_req_duration..............: avg=884.61ms min=7.84ms  med=806.91ms max=2.97s    p(90)=1.8s     p(95)=1.91s    p(99.9)=2.78s 
       { expected_response:true }...: avg=884.61ms min=7.84ms  med=806.91ms max=2.97s    p(90)=1.8s     p(95)=1.91s    p(99.9)=2.78s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16421
     http_req_receiving.............: avg=112.67µs min=37.14µs med=93.75µs  max=154.96ms p(90)=138.41µs p(95)=156.23µs p(99.9)=1.41ms
     http_req_sending...............: avg=47.01µs  min=5.66µs  med=18.65µs  max=102.76ms p(90)=24.92µs  p(95)=30.27µs  p(99.9)=3.12ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=884.45ms min=7.69ms  med=806.8ms  max=2.97s    p(90)=1.8s     p(95)=1.91s    p(99.9)=2.78s 
     http_reqs......................: 16421   238.470319/s
     iteration_duration.............: avg=942.01ms min=22.3ms  med=872.6ms  max=2.98s    p(90)=1.82s    p(95)=1.93s    p(99.9)=2.78s 
     iterations.....................: 15421   223.948042/s
     success_rate...................: 100.00% ✓ 15421      ✗ 0    
     vus............................: 6       min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

