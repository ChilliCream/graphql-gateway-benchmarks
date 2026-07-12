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
| hive-router | v0.0.78 | 2,773 | 2,877 | 2,719 | 2.0% |  |
| fusion-nightly-net11 | 16.5.0-p.12 | 2,474 | 2,570 | 2,453 | 1.6% |  |
| fusion-nightly | 16.5.0-p.12 | 2,374 | 2,456 | 2,353 | 1.5% |  |
| fusion | 16.4.0 | 2,201 | 2,285 | 2,192 | 1.4% |  |
| cosmo | 0.329.0 | 1,164 | 1,207 | 1,157 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.2 | 576 | 590 | 575 | 0.9% |  |
| hive-gateway | 2.10.2 | 254 | 261 | 250 | 1.3% |  |
| apollo-gateway | 2.14.2 | 234 | 241 | 231 | 1.2% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (15368 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (508544 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly | 16.5.0-p.12 | 2,343 | 2,429 | 2,334 | 1.4% |  |
| fusion-nightly-net11 | 16.5.0-p.12 | 2,256 | 2,349 | 2,238 | 1.6% |  |
| hive-router | v0.0.78 | 2,249 | 2,425 | 2,213 | 2.9% |  |
| fusion | 16.4.0 | 2,108 | 2,203 | 2,100 | 1.6% |  |
| fusion-nightly-fed | 16.5.0-p.12 | 2,083 | 2,174 | 2,068 | 1.7% |  |
| cosmo | 0.329.0 | 1,097 | 1,140 | 1,091 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.2 | 528 | 542 | 524 | 1.0% |  |
| hive-gateway | 2.10.2 | 246 | 252 | 243 | 1.1% |  |
| apollo-gateway | 2.14.2 | 237 | 242 | 237 | 0.7% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (36515 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (292581 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 509877      ✗ 0     
     data_received..................: 15 GB   243 MB/s
     data_sent......................: 205 MB  3.3 MB/s
     http_req_blocked...............: avg=19.18µs  min=921ns   med=2.3µs   max=71.05ms  p(90)=3.9µs    p(95)=4.97µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=15.85µs  min=0s      med=0s      max=70.87ms  p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=83.13ms  min=1.35ms  med=77.99ms max=321.09ms p(90)=157.35ms p(95)=172.48ms p(99.9)=234.36ms
       { expected_response:true }...: avg=83.13ms  min=1.35ms  med=77.99ms max=321.09ms p(90)=157.35ms p(95)=172.48ms p(99.9)=234.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 170959
     http_req_receiving.............: avg=145.21µs min=24.52µs med=50.35µs max=195.69ms p(90)=131.3µs  p(95)=334.11µs p(99.9)=19.08ms 
     http_req_sending...............: avg=69.67µs  min=4.54µs  med=9.26µs  max=219.96ms p(90)=17.6µs   p(95)=118.83µs p(99.9)=9.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.92ms  min=1.31ms  med=77.83ms max=314.95ms p(90)=157.08ms p(95)=172.08ms p(99.9)=233.15ms
     http_reqs......................: 170959  2773.80241/s
     iteration_duration.............: avg=83.87ms  min=1.97ms  med=78.79ms max=325.82ms p(90)=157.79ms p(95)=172.99ms p(99.9)=236.21ms
     iterations.....................: 169959  2757.577453/s
     success_rate...................: 100.00% ✓ 169959      ✗ 0     
     vus............................: 84      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 459375      ✗ 0     
     data_received..................: 14 GB   217 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=19.09µs  min=1µs     med=2.59µs   max=58.67ms  p(90)=4.17µs   p(95)=5.33µs   p(99.9)=1.86ms  
     http_req_connecting............: avg=15.73µs  min=0s      med=0s       max=55.96ms  p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=92.25ms  min=1.93ms  med=87.6ms   max=357.24ms p(90)=176.11ms p(95)=193.65ms p(99.9)=257.67ms
       { expected_response:true }...: avg=92.25ms  min=1.93ms  med=87.6ms   max=357.24ms p(90)=176.11ms p(95)=193.65ms p(99.9)=257.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154125
     http_req_receiving.............: avg=825.31µs min=53.76µs med=119.85µs max=158.27ms p(90)=1.59ms   p(95)=2.71ms   p(99.9)=31.66ms 
     http_req_sending...............: avg=67.34µs  min=4.52µs  med=9.6µs    max=195.87ms p(90)=18.65µs  p(95)=116.28µs p(99.9)=9.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.36ms  min=1.85ms  med=86.68ms  max=356.72ms p(90)=175.24ms p(95)=192.74ms p(99.9)=255.76ms
     http_reqs......................: 154125  2474.966636/s
     iteration_duration.............: avg=93.11ms  min=3.05ms  med=88.54ms  max=357.45ms p(90)=176.64ms p(95)=194.21ms p(99.9)=260.38ms
     iterations.....................: 153125  2458.908458/s
     success_rate...................: 100.00% ✓ 153125      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 441267      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=16.78µs min=982ns   med=2.48µs   max=54.37ms  p(90)=3.92µs   p(95)=4.89µs   p(99.9)=1.02ms  
     http_req_connecting............: avg=13.65µs min=0s      med=0s       max=54.32ms  p(90)=0s       p(95)=0s       p(99.9)=970.62µs
     http_req_duration..............: avg=96.05ms min=1.97ms  med=83.2ms   max=1.13s    p(90)=184.07ms p(95)=212.39ms p(99.9)=776.83ms
       { expected_response:true }...: avg=96.05ms min=1.97ms  med=83.2ms   max=1.13s    p(90)=184.07ms p(95)=212.39ms p(99.9)=776.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148089
     http_req_receiving.............: avg=1.89ms  min=51.37µs med=102.83µs max=790.66ms p(90)=1.9ms    p(95)=5.95ms   p(99.9)=118.12ms
     http_req_sending...............: avg=64.95µs min=4.53µs  med=9.4µs    max=149.57ms p(90)=16.73µs  p(95)=110.41µs p(99.9)=8.74ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.09ms min=1.89ms  med=81.75ms  max=1.13s    p(90)=181.51ms p(95)=208.81ms p(99.9)=702.19ms
     http_reqs......................: 148089  2374.023453/s
     iteration_duration.............: avg=96.96ms min=3.44ms  med=84.18ms  max=1.13s    p(90)=184.7ms  p(95)=213.07ms p(99.9)=778.44ms
     iterations.....................: 147089  2357.992395/s
     success_rate...................: 100.00% ✓ 147089      ✗ 0     
     vus............................: 74      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.4.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 408900      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 165 MB  2.6 MB/s
     http_req_blocked...............: avg=18.31µs  min=852ns   med=2.02µs   max=149.85ms p(90)=3.31µs   p(95)=4.2µs    p(99.9)=809.23µs
     http_req_connecting............: avg=15.6µs   min=0s      med=0s       max=149.71ms p(90)=0s       p(95)=0s       p(99.9)=726.26µs
     http_req_duration..............: avg=103.68ms min=2.01ms  med=93.75ms  max=1.6s     p(90)=194.22ms p(95)=222.48ms p(99.9)=705.63ms
       { expected_response:true }...: avg=103.68ms min=2.01ms  med=93.75ms  max=1.6s     p(90)=194.22ms p(95)=222.48ms p(99.9)=705.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137300
     http_req_receiving.............: avg=1.67ms   min=51.01µs med=104.25µs max=551.31ms p(90)=1.91ms   p(95)=5.08ms   p(99.9)=112.92ms
     http_req_sending...............: avg=52.74µs  min=4.54µs  med=8.47µs   max=147.64ms p(90)=14.61µs  p(95)=80.76µs  p(99.9)=7.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.95ms min=1.91ms  med=92.46ms  max=1.6s     p(90)=192.06ms p(95)=218.46ms p(99.9)=671.07ms
     http_reqs......................: 137300  2201.531264/s
     iteration_duration.............: avg=104.67ms min=3.17ms  med=94.9ms   max=1.6s     p(90)=194.76ms p(95)=223.21ms p(99.9)=706.01ms
     iterations.....................: 136300  2185.496804/s
     success_rate...................: 100.00% ✓ 136300      ✗ 0     
     vus............................: 74      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 215322      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=5.56µs   min=941ns  med=2.28µs   max=20.3ms   p(90)=3.79µs   p(95)=4.65µs   p(99.9)=426.92µs
     http_req_connecting............: avg=2.64µs   min=0s     med=0s       max=20.13ms  p(90)=0s       p(95)=0s       p(99.9)=371.08µs
     http_req_duration..............: avg=196.08ms min=1.97ms med=196.12ms max=543.4ms  p(90)=364.56ms p(95)=391.22ms p(99.9)=474.35ms
       { expected_response:true }...: avg=196.08ms min=1.97ms med=196.12ms max=543.4ms  p(90)=364.56ms p(95)=391.22ms p(99.9)=474.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72774
     http_req_receiving.............: avg=74.27µs  min=28.9µs med=60.95µs  max=80.76ms  p(90)=96.24µs  p(95)=111.71µs p(99.9)=976.26µs
     http_req_sending...............: avg=27.81µs  min=4.67µs med=10.06µs  max=132.86ms p(90)=15.65µs  p(95)=19.24µs  p(99.9)=2.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.98ms min=1.86ms med=196.01ms max=543.31ms p(90)=364.45ms p(95)=391.12ms p(99.9)=474.3ms 
     http_reqs......................: 72774   1164.365884/s
     iteration_duration.............: avg=199.03ms min=3.57ms med=199.45ms max=543.6ms  p(90)=365.38ms p(95)=391.91ms p(99.9)=474.86ms
     iterations.....................: 71774   1148.366133/s
     success_rate...................: 100.00% ✓ 71774       ✗ 0    
     vus............................: 79      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 108057     ✗ 0    
     data_received..................: 3.3 GB  51 MB/s
     data_sent......................: 44 MB   692 kB/s
     http_req_blocked...............: avg=8.54µs   min=1.15µs  med=3.26µs   max=4.3ms   p(90)=5.08µs   p(95)=6.18µs   p(99.9)=1.46ms
     http_req_connecting............: avg=4.28µs   min=0s      med=0s       max=4.25ms  p(90)=0s       p(95)=0s       p(99.9)=1.42ms
     http_req_duration..............: avg=387.4ms  min=3.4ms   med=361.39ms max=1.83s   p(90)=764.3ms  p(95)=829.79ms p(99.9)=1.2s  
       { expected_response:true }...: avg=387.4ms  min=3.4ms   med=361.39ms max=1.83s   p(90)=764.3ms  p(95)=829.79ms p(99.9)=1.2s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 37019
     http_req_receiving.............: avg=84.4µs   min=29.55µs med=73.46µs  max=17.53ms p(90)=113.21µs p(95)=128.87µs p(99.9)=1.15ms
     http_req_sending...............: avg=34.91µs  min=5.37µs  med=14.48µs  max=169.1ms p(90)=21.85µs  p(95)=24.9µs   p(99.9)=2.9ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=387.28ms min=3.35ms  med=361.15ms max=1.83s   p(90)=764.2ms  p(95)=829.7ms  p(99.9)=1.2s  
     http_reqs......................: 37019   576.691006/s
     iteration_duration.............: avg=398.41ms min=30.81ms med=374.69ms max=1.83s   p(90)=767.74ms p(95)=833.14ms p(99.9)=1.21s 
     iterations.....................: 36019   561.112762/s
     success_rate...................: 100.00% ✓ 36019      ✗ 0    
     vus............................: 63      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 48291      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   307 kB/s
     http_req_blocked...............: avg=14.53µs  min=1.58µs  med=3.87µs   max=16ms    p(90)=5.75µs   p(95)=7.18µs   p(99.9)=2.14ms
     http_req_connecting............: avg=8.94µs   min=0s      med=0s       max=15.93ms p(90)=0s       p(95)=0s       p(99.9)=2.12ms
     http_req_duration..............: avg=832.25ms min=5.56ms  med=736.89ms max=19.24s  p(90)=1.41s    p(95)=1.61s    p(99.9)=18.35s
       { expected_response:true }...: avg=832.25ms min=5.56ms  med=736.89ms max=19.24s  p(90)=1.41s    p(95)=1.61s    p(99.9)=18.35s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17097
     http_req_receiving.............: avg=107.89µs min=37.61µs med=93.07µs  max=90.53ms p(90)=130.34µs p(95)=147.18µs p(99.9)=1.22ms
     http_req_sending...............: avg=33.14µs  min=7.08µs  med=18.56µs  max=73.75ms p(90)=24.45µs  p(95)=28.65µs  p(99.9)=2.86ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=832.11ms min=5.48ms  med=736.81ms max=19.24s  p(90)=1.41s    p(95)=1.61s    p(99.9)=18.35s
     http_reqs......................: 17097   254.618154/s
     iteration_duration.............: avg=884.02ms min=25.89ms med=792.17ms max=19.24s  p(90)=1.44s    p(95)=1.63s    p(99.9)=18.38s
     iterations.....................: 16097   239.72559/s
     success_rate...................: 100.00% ✓ 16097      ✗ 0    
     vus............................: 65      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 48345      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   287 kB/s
     http_req_blocked...............: avg=12.04µs  min=1.44µs  med=3.6µs    max=11.47ms p(90)=5.28µs   p(95)=6.77µs   p(99.9)=1.2ms 
     http_req_connecting............: avg=6.75µs   min=0s      med=0s       max=11.33ms p(90)=0s       p(95)=0s       p(99.9)=1.18ms
     http_req_duration..............: avg=397.75ms min=7.37ms  med=447.79ms max=1.17s   p(90)=686.23ms p(95)=737.75ms p(99.9)=1.02s 
       { expected_response:true }...: avg=397.75ms min=7.37ms  med=447.79ms max=1.17s   p(90)=686.23ms p(95)=737.75ms p(99.9)=1.02s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17115
     http_req_receiving.............: avg=96.1µs   min=35.72µs med=88.16µs  max=2.36ms  p(90)=126.48µs p(95)=143.08µs p(99.9)=1.1ms 
     http_req_sending...............: avg=30.59µs  min=5.46µs  med=17.27µs  max=26.43ms p(90)=22.77µs  p(95)=27.66µs  p(99.9)=2.94ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=397.62ms min=7.28ms  med=447.68ms max=1.17s   p(90)=686.15ms p(95)=737.63ms p(99.9)=1.02s 
     http_reqs......................: 17115   234.319298/s
     iteration_duration.............: avg=422.39ms min=12.56ms med=474.74ms max=1.18s   p(90)=692.57ms p(95)=741.75ms p(99.9)=1.03s 
     iterations.....................: 16115   220.628425/s
     success_rate...................: 100.00% ✓ 16115      ✗ 0    
     vus............................: 51      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 432060      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=16.24µs min=871ns   med=2.27µs   max=54.87ms  p(90)=3.9µs    p(95)=5.02µs   p(99.9)=1.62ms  
     http_req_connecting............: avg=13.06µs min=0s      med=0s       max=54.73ms  p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=98.15ms min=1.46ms  med=83.82ms  max=1.68s    p(90)=181.23ms p(95)=212.09ms p(99.9)=1.13s   
       { expected_response:true }...: avg=98.15ms min=1.46ms  med=83.82ms  max=1.68s    p(90)=181.23ms p(95)=212.09ms p(99.9)=1.13s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 145020
     http_req_receiving.............: avg=2.02ms  min=52.73µs med=104.55µs max=1.13s    p(90)=1.9ms    p(95)=5.78ms   p(99.9)=156.22ms
     http_req_sending...............: avg=61.77µs min=4.59µs  med=9.16µs   max=155.19ms p(90)=18.17µs  p(95)=104.39µs p(99.9)=9.05ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.06ms min=1.35ms  med=82.45ms  max=1.63s    p(90)=178.48ms p(95)=207.83ms p(99.9)=1.02s   
     http_reqs......................: 145020  2343.490458/s
     iteration_duration.............: avg=99.08ms min=2.64ms  med=84.85ms  max=1.68s    p(90)=181.89ms p(95)=212.83ms p(99.9)=1.14s   
     iterations.....................: 144020  2327.330684/s
     success_rate...................: 100.00% ✓ 144020      ✗ 0     
     vus............................: 51      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 415449      ✗ 0     
     data_received..................: 12 GB   198 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=22.55µs  min=1µs     med=3.05µs   max=52.15ms  p(90)=4.91µs   p(95)=6.12µs   p(99.9)=5.79ms  
     http_req_connecting............: avg=18.48µs  min=0s      med=0s       max=52.07ms  p(90)=0s       p(95)=0s       p(99.9)=5.52ms  
     http_req_duration..............: avg=101.96ms min=1.49ms  med=97.14ms  max=384.92ms p(90)=193.85ms p(95)=210.39ms p(99.9)=276.84ms
       { expected_response:true }...: avg=101.96ms min=1.49ms  med=97.14ms  max=384.92ms p(90)=193.85ms p(95)=210.39ms p(99.9)=276.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139483
     http_req_receiving.............: avg=976.97µs min=53.03µs med=128.72µs max=83.85ms  p(90)=1.82ms   p(95)=3.27ms   p(99.9)=35.05ms 
     http_req_sending...............: avg=70.18µs  min=4.94µs  med=11.36µs  max=171.39ms p(90)=22.74µs  p(95)=126.37µs p(99.9)=9.07ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.91ms min=1.39ms  med=96.05ms  max=384.7ms  p(90)=192.7ms  p(95)=209.17ms p(99.9)=275.06ms
     http_reqs......................: 139483  2256.275106/s
     iteration_duration.............: avg=102.97ms min=3.16ms  med=98.32ms  max=385.19ms p(90)=194.38ms p(95)=210.9ms  p(99.9)=278.02ms
     iterations.....................: 138483  2240.099119/s
     success_rate...................: 100.00% ✓ 138483      ✗ 0     
     vus............................: 94      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 415794      ✗ 0     
     data_received..................: 12 GB   197 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=14.07µs  min=882ns   med=2.43µs  max=63.54ms  p(90)=4.2µs    p(95)=5.46µs   p(99.9)=1.92ms  
     http_req_connecting............: avg=10.84µs  min=0s      med=0s      max=63.38ms  p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=101.92ms min=1.53ms  med=96.02ms max=311.38ms p(90)=196.23ms p(95)=216.22ms p(99.9)=274.24ms
       { expected_response:true }...: avg=101.92ms min=1.53ms  med=96.02ms max=311.38ms p(90)=196.23ms p(95)=216.22ms p(99.9)=274.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139598
     http_req_receiving.............: avg=109.56µs min=26.83µs med=55.46µs max=70.29ms  p(90)=117.43µs p(95)=314.85µs p(99.9)=6.89ms  
     http_req_sending...............: avg=56.88µs  min=4.86µs  med=10.6µs  max=183.02ms p(90)=19.91µs  p(95)=110.83µs p(99.9)=7.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.75ms min=1.48ms  med=95.88ms max=311.31ms p(90)=196.01ms p(95)=215.96ms p(99.9)=273.84ms
     http_reqs......................: 139598  2249.842191/s
     iteration_duration.............: avg=102.9ms  min=4.59ms  med=97.32ms max=314.33ms p(90)=196.74ms p(95)=216.68ms p(99.9)=275.07ms
     iterations.....................: 138598  2233.725612/s
     success_rate...................: 100.00% ✓ 138598      ✗ 0     
     vus............................: 59      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.4.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 389184      ✗ 0     
     data_received..................: 12 GB   185 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=8.77µs   min=881ns  med=2.19µs   max=33.29ms  p(90)=3.75µs   p(95)=4.79µs   p(99.9)=845.42µs
     http_req_connecting............: avg=5.96µs   min=0s     med=0s       max=33.22ms  p(90)=0s       p(95)=0s       p(99.9)=799.94µs
     http_req_duration..............: avg=108.99ms min=1.6ms  med=94.77ms  max=2.13s    p(90)=203.81ms p(95)=236.79ms p(99.9)=887.33ms
       { expected_response:true }...: avg=108.99ms min=1.6ms  med=94.77ms  max=2.13s    p(90)=203.81ms p(95)=236.79ms p(99.9)=887.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130728
     http_req_receiving.............: avg=1.85ms   min=52µs   med=115.84µs max=1.14s    p(90)=2.16ms   p(95)=5.88ms   p(99.9)=92.92ms 
     http_req_sending...............: avg=52.48µs  min=4.75µs med=9.4µs    max=158.61ms p(90)=17.97µs  p(95)=81.05µs  p(99.9)=6.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.08ms min=1.52ms med=93.33ms  max=2.13s    p(90)=201.69ms p(95)=232.54ms p(99.9)=879.52ms
     http_reqs......................: 130728  2108.208164/s
     iteration_duration.............: avg=110.07ms min=3.31ms med=95.98ms  max=2.13s    p(90)=204.45ms p(95)=237.55ms p(99.9)=891.31ms
     iterations.....................: 129728  2092.081488/s
     success_rate...................: 100.00% ✓ 129728      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 386529      ✗ 0     
     data_received..................: 11 GB   183 MB/s
     data_sent......................: 156 MB  2.5 MB/s
     http_req_blocked...............: avg=11.46µs  min=851ns  med=2.29µs   max=55.78ms  p(90)=3.99µs   p(95)=5.12µs   p(99.9)=882.71µs
     http_req_connecting............: avg=8.49µs   min=0s     med=0s       max=55.73ms  p(90)=0s       p(95)=0s       p(99.9)=811.02µs
     http_req_duration..............: avg=109.65ms min=1.88ms med=98.22ms  max=1.65s    p(90)=208.97ms p(95)=236.02ms p(99.9)=724.75ms
       { expected_response:true }...: avg=109.65ms min=1.88ms med=98.22ms  max=1.65s    p(90)=208.97ms p(95)=236.02ms p(99.9)=724.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 129843
     http_req_receiving.............: avg=1.69ms   min=53.7µs med=114.37µs max=1.22s    p(90)=1.96ms   p(95)=5.22ms   p(99.9)=91.81ms 
     http_req_sending...............: avg=54.52µs  min=4.7µs  med=9.79µs   max=164.22ms p(90)=19.23µs  p(95)=92.22µs  p(99.9)=7.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.91ms min=1.79ms med=96.9ms   max=1.65s    p(90)=206.61ms p(95)=231.86ms p(99.9)=705.9ms 
     http_reqs......................: 129843  2083.942182/s
     iteration_duration.............: avg=110.75ms min=3.46ms med=99.38ms  max=1.65s    p(90)=209.57ms p(95)=236.76ms p(99.9)=727.31ms
     iterations.....................: 128843  2067.892475/s
     success_rate...................: 100.00% ✓ 128843      ✗ 0     
     vus............................: 72      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 203247      ✗ 0    
     data_received..................: 6.0 GB  96 MB/s
     data_sent......................: 83 MB   1.3 MB/s
     http_req_blocked...............: avg=5.43µs   min=1µs     med=2.22µs   max=3.78ms   p(90)=3.85µs   p(95)=4.82µs   p(99.9)=538.5µs 
     http_req_connecting............: avg=2.5µs    min=0s      med=0s       max=3.75ms   p(90)=0s       p(95)=0s       p(99.9)=438.36µs
     http_req_duration..............: avg=207.62ms min=2.09ms  med=207.89ms max=578.91ms p(90)=383.46ms p(95)=411.87ms p(99.9)=506.93ms
       { expected_response:true }...: avg=207.62ms min=2.09ms  med=207.89ms max=578.91ms p(90)=383.46ms p(95)=411.87ms p(99.9)=506.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 68749
     http_req_receiving.............: avg=77.13µs  min=25.77µs med=61.57µs  max=142.9ms  p(90)=102.04µs p(95)=118.78µs p(99.9)=989.85µs
     http_req_sending...............: avg=31.02µs  min=5.05µs  med=10.79µs  max=159.53ms p(90)=17.65µs  p(95)=21.4µs   p(99.9)=2.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.51ms min=1.99ms  med=207.79ms max=578.85ms p(90)=383.38ms p(95)=411.73ms p(99.9)=506.8ms 
     http_reqs......................: 68749   1097.516664/s
     iteration_duration.............: avg=210.91ms min=4.88ms  med=211.56ms max=579.12ms p(90)=384.37ms p(95)=412.6ms  p(99.9)=507.38ms
     iterations.....................: 67749   1081.552553/s
     success_rate...................: 100.00% ✓ 67749       ✗ 0    
     vus............................: 85      min=0         max=498
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 99360      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   634 kB/s
     http_req_blocked...............: avg=7.74µs   min=1.04µs  med=2.46µs   max=8.01ms  p(90)=4.2µs    p(95)=5.18µs   p(99.9)=1.23ms 
     http_req_connecting............: avg=4.26µs   min=0s      med=0s       max=7.95ms  p(90)=0s       p(95)=0s       p(99.9)=1.17ms 
     http_req_duration..............: avg=420.66ms min=3.65ms  med=390.47ms max=1.77s   p(90)=829.4ms  p(95)=908.09ms p(99.9)=1.38s  
       { expected_response:true }...: avg=420.66ms min=3.65ms  med=390.47ms max=1.77s   p(90)=829.4ms  p(95)=908.09ms p(99.9)=1.38s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 34120
     http_req_receiving.............: avg=206.63µs min=30.17µs med=69.32µs  max=228.8ms p(90)=108.43µs p(95)=123.24µs p(99.9)=31.66ms
     http_req_sending...............: avg=22.7µs   min=5.32µs  med=12.22µs  max=53.67ms p(90)=19.6µs   p(95)=22.61µs  p(99.9)=1.81ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=420.44ms min=3.59ms  med=390.38ms max=1.77s   p(90)=829.3ms  p(95)=907.9ms  p(99.9)=1.38s  
     http_reqs......................: 34120   528.237583/s
     iteration_duration.............: avg=433.59ms min=15.34ms med=406.55ms max=1.78s   p(90)=833.55ms p(95)=911.75ms p(99.9)=1.38s  
     iterations.....................: 33120   512.755825/s
     success_rate...................: 100.00% ✓ 33120      ✗ 0    
     vus............................: 85      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47196      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   296 kB/s
     http_req_blocked...............: avg=14.37µs  min=1.13µs  med=3.19µs   max=10.33ms p(90)=4.98µs   p(95)=6.65µs   p(99.9)=2.1ms 
     http_req_connecting............: avg=9.5µs    min=0s      med=0s       max=10.27ms p(90)=0s       p(95)=0s       p(99.9)=2.08ms
     http_req_duration..............: avg=868.97ms min=5.8ms   med=787.01ms max=4.64s   p(90)=1.73s    p(95)=1.95s    p(99.9)=4.07s 
       { expected_response:true }...: avg=868.97ms min=5.8ms   med=787.01ms max=4.64s   p(90)=1.73s    p(95)=1.95s    p(99.9)=4.07s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16732
     http_req_receiving.............: avg=99.97µs  min=30.74µs med=92.76µs  max=8.62ms  p(90)=131.31µs p(95)=146.43µs p(99.9)=1.51ms
     http_req_sending...............: avg=35.18µs  min=5.78µs  med=18.05µs  max=55.8ms  p(90)=23.68µs  p(95)=28.74µs  p(99.9)=3.96ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=868.83ms min=5.71ms  med=786.92ms max=4.64s   p(90)=1.73s    p(95)=1.95s    p(99.9)=4.07s 
     http_reqs......................: 16732   246.220839/s
     iteration_duration.............: avg=924.21ms min=68.35ms med=846.69ms max=4.65s   p(90)=1.75s    p(95)=1.96s    p(99.9)=4.1s  
     iterations.....................: 15732   231.505274/s
     success_rate...................: 100.00% ✓ 15732      ✗ 0    
     vus............................: 16      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 45954      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   285 kB/s
     http_req_blocked...............: avg=14.6µs   min=1.15µs  med=3.29µs   max=10.01ms p(90)=5.13µs   p(95)=6.82µs   p(99.9)=2.18ms
     http_req_connecting............: avg=9.39µs   min=0s      med=0s       max=9.94ms  p(90)=0s       p(95)=0s       p(99.9)=2.13ms
     http_req_duration..............: avg=890.09ms min=7.62ms  med=812.04ms max=3.17s   p(90)=1.82s    p(95)=1.97s    p(99.9)=2.82s 
       { expected_response:true }...: avg=890.09ms min=7.62ms  med=812.04ms max=3.17s   p(90)=1.82s    p(95)=1.97s    p(99.9)=2.82s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16318
     http_req_receiving.............: avg=105.19µs min=33.05µs med=90.39µs  max=91.26ms p(90)=129.98µs p(95)=146.29µs p(99.9)=1.27ms
     http_req_sending...............: avg=29.38µs  min=5.51µs  med=17.55µs  max=22.48ms p(90)=23.49µs  p(95)=29.15µs  p(99.9)=2.27ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=889.95ms min=7.53ms  med=811.85ms max=3.17s   p(90)=1.82s    p(95)=1.97s    p(99.9)=2.82s 
     http_reqs......................: 16318   237.818664/s
     iteration_duration.............: avg=948.19ms min=12.64ms med=893.29ms max=3.17s   p(90)=1.83s    p(95)=1.97s    p(99.9)=2.85s 
     iterations.....................: 15318   223.244656/s
     success_rate...................: 100.00% ✓ 15318      ✗ 0    
     vus............................: 83      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

