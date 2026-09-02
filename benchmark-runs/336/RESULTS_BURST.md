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
| hive-router | v0.0.84 | 2,707 | 2,892 | 2,690 | 2.6% |  |
| fusion-nightly-net11 | 16.7.0-p.2 | 2,643 | 2,752 | 2,624 | 1.6% |  |
| fusion-nightly | 16.7.0-p.2 | 2,546 | 2,649 | 2,532 | 1.5% |  |
| fusion | 16.6.2 | 2,478 | 2,586 | 2,435 | 2.0% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 2,289 | 2,380 | 2,271 | 1.6% |  |
| cosmo | 0.334.0 | 1,234 | 1,270 | 1,225 | 1.1% |  |
| hive-gateway-router-runtime | 2.10.8 | 563 | 577 | 558 | 1.2% |  |
| hive-gateway | 2.10.8 | 257 | 261 | 254 | 0.8% |  |
| apollo-gateway | 2.14.3 | 230 | 238 | 230 | 1.1% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (19906 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (528250 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.2 | 2,485 | 2,587 | 2,468 | 1.6% |  |
| fusion | 16.6.2 | 2,406 | 2,493 | 2,400 | 1.4% |  |
| fusion-nightly | 16.7.0-p.2 | 2,403 | 2,505 | 2,400 | 1.5% |  |
| hive-router | v0.0.84 | 2,365 | 2,520 | 2,315 | 2.7% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 2,136 | 2,236 | 2,119 | 1.8% |  |
| cosmo | 0.334.0 | 1,134 | 1,167 | 1,117 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 543 | 556 | 541 | 0.9% |  |
| hive-gateway | 2.10.8 | 243 | 249 | 241 | 1.0% |  |
| apollo-gateway | 2.14.3 | 232 | 237 | 229 | 1.0% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (37322 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (286041 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 497856      ✗ 0     
     data_received..................: 15 GB   238 MB/s
     data_sent......................: 201 MB  3.3 MB/s
     http_req_blocked...............: avg=16.62µs  min=861ns   med=2.31µs  max=59.2ms   p(90)=3.9µs    p(95)=4.92µs   p(99.9)=936.52µs
     http_req_connecting............: avg=13.61µs  min=0s      med=0s      max=59.12ms  p(90)=0s       p(95)=0s       p(99.9)=879.06µs
     http_req_duration..............: avg=85.15ms  min=1.35ms  med=80.24ms max=287.51ms p(90)=163.95ms p(95)=176.55ms p(99.9)=222.97ms
       { expected_response:true }...: avg=85.15ms  min=1.35ms  med=80.24ms max=287.51ms p(90)=163.95ms p(95)=176.55ms p(99.9)=222.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 166952
     http_req_receiving.............: avg=141.79µs min=25.29µs med=50.38µs max=199.67ms p(90)=130.33µs p(95)=330.11µs p(99.9)=17.74ms 
     http_req_sending...............: avg=64.16µs  min=4.53µs  med=9.19µs  max=132.55ms p(90)=17.56µs  p(95)=114.58µs p(99.9)=8.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.95ms  min=1.3ms   med=80.04ms max=260.16ms p(90)=163.65ms p(95)=176.2ms  p(99.9)=222.01ms
     http_reqs......................: 166952  2707.48255/s
     iteration_duration.............: avg=85.9ms   min=2.04ms  med=81.05ms max=324.55ms p(90)=164.35ms p(95)=176.93ms p(99.9)=224.14ms
     iterations.....................: 165952  2691.265419/s
     success_rate...................: 100.00% ✓ 165952      ✗ 0     
     vus............................: 87      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 490929      ✗ 0     
     data_received..................: 14 GB   232 MB/s
     data_sent......................: 198 MB  3.2 MB/s
     http_req_blocked...............: avg=16.5µs   min=801ns   med=2.09µs  max=54.62ms  p(90)=3.62µs   p(95)=4.7µs    p(99.9)=1.11ms  
     http_req_connecting............: avg=13.71µs  min=0s      med=0s      max=54.5ms   p(90)=0s       p(95)=0s       p(99.9)=1ms     
     http_req_duration..............: avg=86.35ms  min=1.87ms  med=81.63ms max=335.85ms p(90)=165.25ms p(95)=181.3ms  p(99.9)=240.64ms
       { expected_response:true }...: avg=86.35ms  min=1.87ms  med=81.63ms max=335.85ms p(90)=165.25ms p(95)=181.3ms  p(99.9)=240.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 164643
     http_req_receiving.............: avg=581.96µs min=51.62µs med=99.58µs max=124.96ms p(90)=1.12ms   p(95)=1.94ms   p(99.9)=25.58ms 
     http_req_sending...............: avg=63.21µs  min=4.39µs  med=8.65µs  max=146.19ms p(90)=17.8µs   p(95)=107.16µs p(99.9)=8.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.7ms   min=1.78ms  med=80.87ms max=324.78ms p(90)=164.54ms p(95)=180.58ms p(99.9)=240.21ms
     http_reqs......................: 164643  2643.383704/s
     iteration_duration.............: avg=87.12ms  min=4.01ms  med=82.48ms max=345.95ms p(90)=165.75ms p(95)=181.78ms p(99.9)=241.43ms
     iterations.....................: 163643  2627.328459/s
     success_rate...................: 100.00% ✓ 163643      ✗ 0     
     vus............................: 68      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 473286      ✗ 0     
     data_received..................: 14 GB   223 MB/s
     data_sent......................: 191 MB  3.1 MB/s
     http_req_blocked...............: avg=15.42µs min=811ns   med=2.07µs  max=67.97ms  p(90)=3.49µs   p(95)=4.55µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=12.64µs min=0s      med=0s      max=67.93ms  p(90)=0s       p(95)=0s       p(99.9)=1.27ms  
     http_req_duration..............: avg=89.61ms min=1.99ms  med=78.79ms max=1.47s    p(90)=169.21ms p(95)=193.89ms p(99.9)=748ms   
       { expected_response:true }...: avg=89.61ms min=1.99ms  med=78.79ms max=1.47s    p(90)=169.21ms p(95)=193.89ms p(99.9)=748ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 158762
     http_req_receiving.............: avg=1.23ms  min=50.35µs med=93.9µs  max=867.94ms p(90)=1.5ms    p(95)=4.01ms   p(99.9)=77.89ms 
     http_req_sending...............: avg=58.62µs min=4.35µs  med=8.59µs  max=57.52ms  p(90)=16.09µs  p(95)=99.14µs  p(99.9)=7.99ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.31ms min=1.88ms  med=77.66ms max=1.47s    p(90)=167.54ms p(95)=191.36ms p(99.9)=713.73ms
     http_reqs......................: 158762  2546.356718/s
     iteration_duration.............: avg=90.43ms min=3.4ms   med=79.74ms max=1.47s    p(90)=169.82ms p(95)=194.58ms p(99.9)=748.78ms
     iterations.....................: 157762  2530.317888/s
     success_rate...................: 100.00% ✓ 157762      ✗ 0     
     vus............................: 72      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 460191      ✗ 0     
     data_received..................: 14 GB   217 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=12.91µs min=852ns   med=2.06µs   max=49.23ms  p(90)=3.45µs   p(95)=4.43µs   p(99.9)=1.03ms  
     http_req_connecting............: avg=10.17µs min=0s      med=0s       max=49.18ms  p(90)=0s       p(95)=0s       p(99.9)=983.77µs
     http_req_duration..............: avg=92.2ms  min=1.93ms  med=81.6ms   max=1.57s    p(90)=171.87ms p(95)=197.43ms p(99.9)=914.28ms
       { expected_response:true }...: avg=92.2ms  min=1.93ms  med=81.6ms   max=1.57s    p(90)=171.87ms p(95)=197.43ms p(99.9)=914.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154397
     http_req_receiving.............: avg=1.94ms  min=51.05µs med=100.88µs max=1.04s    p(90)=1.97ms   p(95)=5.08ms   p(99.9)=226.63ms
     http_req_sending...............: avg=56.71µs min=4.42µs  med=8.68µs   max=144.02ms p(90)=16.32µs  p(95)=98.79µs  p(99.9)=7.64ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.2ms  min=1.85ms  med=80.3ms   max=1.53s    p(90)=169.83ms p(95)=194.29ms p(99.9)=663.97ms
     http_reqs......................: 154397  2478.852078/s
     iteration_duration.............: avg=93.03ms min=3.24ms  med=82.56ms  max=1.57s    p(90)=172.39ms p(95)=198.06ms p(99.9)=922.16ms
     iterations.....................: 153397  2462.797025/s
     success_rate...................: 100.00% ✓ 153397      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 423132      ✗ 0     
     data_received..................: 13 GB   201 MB/s
     data_sent......................: 171 MB  2.7 MB/s
     http_req_blocked...............: avg=11.13µs  min=882ns   med=2.09µs   max=44.56ms  p(90)=3.54µs   p(95)=4.54µs   p(99.9)=1.1ms  
     http_req_connecting............: avg=8.23µs   min=0s      med=0s       max=44.49ms  p(90)=0s       p(95)=0s       p(99.9)=1.04ms 
     http_req_duration..............: avg=100.27ms min=1.65ms  med=89.1ms   max=1.95s    p(90)=186.76ms p(95)=216.4ms  p(99.9)=1s     
       { expected_response:true }...: avg=100.27ms min=1.65ms  med=89.1ms   max=1.95s    p(90)=186.76ms p(95)=216.4ms  p(99.9)=1s     
     http_req_failed................: 0.00%   ✓ 0           ✗ 142044
     http_req_receiving.............: avg=1.39ms   min=50.67µs med=102.98µs max=1.3s     p(90)=1.79ms   p(95)=4.37ms   p(99.9)=98.81ms
     http_req_sending...............: avg=52.61µs  min=4.53µs  med=8.78µs   max=165.25ms p(90)=16.34µs  p(95)=89.15µs  p(99.9)=7.32ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=98.83ms  min=1.59ms  med=87.91ms  max=1.95s    p(90)=184.93ms p(95)=212.87ms p(99.9)=1s     
     http_reqs......................: 142044  2289.266823/s
     iteration_duration.............: avg=101.22ms min=2.84ms  med=90.2ms   max=1.95s    p(90)=187.31ms p(95)=216.99ms p(99.9)=1.02s  
     iterations.....................: 141044  2273.150219/s
     success_rate...................: 100.00% ✓ 141044      ✗ 0     
     vus............................: 60      min=0         max=498 
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

     checks.........................: 100.00% ✓ 228294      ✗ 0    
     data_received..................: 6.8 GB  108 MB/s
     data_sent......................: 93 MB   1.5 MB/s
     http_req_blocked...............: avg=4.93µs   min=972ns   med=2.02µs   max=9.29ms   p(90)=3.6µs    p(95)=4.51µs   p(99.9)=468.76µs
     http_req_connecting............: avg=2.21µs   min=0s      med=0s       max=9.23ms   p(90)=0s       p(95)=0s       p(99.9)=394.88µs
     http_req_duration..............: avg=185.06ms min=1.85ms  med=184.82ms max=563.46ms p(90)=343.28ms p(95)=368.77ms p(99.9)=473.07ms
       { expected_response:true }...: avg=185.06ms min=1.85ms  med=184.82ms max=563.46ms p(90)=343.28ms p(95)=368.77ms p(99.9)=473.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 77098
     http_req_receiving.............: avg=95.63µs  min=26.49µs med=57.01µs  max=92.49ms  p(90)=93.88µs  p(95)=108.25µs p(99.9)=1.41ms  
     http_req_sending...............: avg=30.52µs  min=4.48µs  med=9.69µs   max=215ms    p(90)=16.58µs  p(95)=20.21µs  p(99.9)=3.11ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.93ms min=1.8ms   med=184.56ms max=563.41ms p(90)=343.2ms  p(95)=368.69ms p(99.9)=473.01ms
     http_reqs......................: 77098   1234.221574/s
     iteration_duration.............: avg=187.7ms  min=4.07ms  med=187.53ms max=563.64ms p(90)=343.99ms p(95)=369.43ms p(99.9)=474.21ms
     iterations.....................: 76098   1218.213097/s
     success_rate...................: 100.00% ✓ 76098       ✗ 0    
     vus............................: 78      min=0         max=493
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

     checks.........................: 100.00% ✓ 105663     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   676 kB/s
     http_req_blocked...............: avg=8.06µs   min=1.08µs  med=2.98µs   max=10.31ms  p(90)=4.74µs   p(95)=5.78µs   p(99.9)=919.76µs
     http_req_connecting............: avg=4.02µs   min=0s      med=0s       max=10.24ms  p(90)=0s       p(95)=0s       p(99.9)=864.73µs
     http_req_duration..............: avg=395.96ms min=3.58ms  med=372.82ms max=1.63s    p(90)=773.12ms p(95)=848.5ms  p(99.9)=1.24s   
       { expected_response:true }...: avg=395.96ms min=3.58ms  med=372.82ms max=1.63s    p(90)=773.12ms p(95)=848.5ms  p(99.9)=1.24s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36221
     http_req_receiving.............: avg=81.79µs  min=28.15µs med=69.49µs  max=53.05ms  p(90)=108.25µs p(95)=123.08µs p(99.9)=928.49µs
     http_req_sending...............: avg=34.34µs  min=4.85µs  med=13.5µs   max=150.02ms p(90)=20.55µs  p(95)=23.69µs  p(99.9)=2.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=395.84ms min=3.47ms  med=372.71ms max=1.63s    p(90)=772.99ms p(95)=848.38ms p(99.9)=1.24s   
     http_reqs......................: 36221   563.204602/s
     iteration_duration.............: avg=407.41ms min=17.07ms med=388.84ms max=1.64s    p(90)=776.93ms p(95)=851.15ms p(99.9)=1.24s   
     iterations.....................: 35221   547.655484/s
     success_rate...................: 100.00% ✓ 35221      ✗ 0    
     vus............................: 72      min=0        max=495
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

     checks.........................: 100.00% ✓ 48696      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   309 kB/s
     http_req_blocked...............: avg=15.22µs  min=1.5µs   med=3.63µs   max=21.89ms p(90)=5.41µs   p(95)=7.02µs   p(99.9)=2.47ms
     http_req_connecting............: avg=9.9µs    min=0s      med=0s       max=21.81ms p(90)=0s       p(95)=0s       p(99.9)=2.44ms
     http_req_duration..............: avg=838.6ms  min=5.27ms  med=725.32ms max=15.59s  p(90)=1.46s    p(95)=1.63s    p(99.9)=14.81s
       { expected_response:true }...: avg=838.6ms  min=5.27ms  med=725.32ms max=15.59s  p(90)=1.46s    p(95)=1.63s    p(99.9)=14.81s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17232
     http_req_receiving.............: avg=96.45µs  min=39µs    med=88.91µs  max=8.78ms  p(90)=125.85µs p(95)=141.26µs p(99.9)=1.25ms
     http_req_sending...............: avg=32.02µs  min=6.06µs  med=17.4µs   max=52.9ms  p(90)=23.24µs  p(95)=27.42µs  p(99.9)=1.71ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=838.47ms min=5.19ms  med=725.21ms max=15.59s  p(90)=1.46s    p(95)=1.63s    p(99.9)=14.81s
     http_reqs......................: 17232   257.354339/s
     iteration_duration.............: avg=890.33ms min=34.46ms med=781.78ms max=15.59s  p(90)=1.49s    p(95)=1.64s    p(99.9)=14.85s
     iterations.....................: 16232   242.419663/s
     success_rate...................: 100.00% ✓ 16232      ✗ 0    
     vus............................: 43      min=0        max=500
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

     checks.........................: 100.00% ✓ 47667      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   283 kB/s
     http_req_blocked...............: avg=14.17µs  min=1.39µs  med=3.46µs   max=4.56ms   p(90)=5.07µs   p(95)=6.52µs   p(99.9)=2.1ms   
     http_req_connecting............: avg=8.98µs   min=0s      med=0s       max=4.36ms   p(90)=0s       p(95)=0s       p(99.9)=2.07ms  
     http_req_duration..............: avg=373.89ms min=7.41ms  med=424.75ms max=1.16s    p(90)=638.38ms p(95)=682.99ms p(99.9)=957.48ms
       { expected_response:true }...: avg=373.89ms min=7.41ms  med=424.75ms max=1.16s    p(90)=638.38ms p(95)=682.99ms p(99.9)=957.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 16889
     http_req_receiving.............: avg=100.94µs min=36.09µs med=81.67µs  max=71.55ms  p(90)=121.15µs p(95)=136.86µs p(99.9)=1.03ms  
     http_req_sending...............: avg=45.8µs   min=5.93µs  med=16.51µs  max=141.99ms p(90)=22.13µs  p(95)=26.43µs  p(99.9)=4.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=373.74ms min=7.28ms  med=424.59ms max=1.16s    p(90)=638.19ms p(95)=682.9ms  p(99.9)=957.33ms
     http_reqs......................: 16889   230.901952/s
     iteration_duration.............: avg=397.42ms min=8.41ms  med=442.71ms max=1.17s    p(90)=646.77ms p(95)=687.3ms  p(99.9)=965.5ms 
     iterations.....................: 15889   217.230216/s
     success_rate...................: 100.00% ✓ 15889      ✗ 0    
     vus............................: 59      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 458058      ✗ 0     
     data_received..................: 14 GB   218 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=22.74µs  min=882ns  med=2.84µs   max=73.55ms  p(90)=4.81µs   p(95)=6.04µs   p(99.9)=2.29ms  
     http_req_connecting............: avg=19.12µs  min=0s     med=0s       max=73.48ms  p(90)=0s       p(95)=0s       p(99.9)=2.25ms  
     http_req_duration..............: avg=92.51ms  min=1.48ms med=86.84ms  max=343.4ms  p(90)=178.44ms p(95)=194.4ms  p(99.9)=259.03ms
       { expected_response:true }...: avg=92.51ms  min=1.48ms med=86.84ms  max=343.4ms  p(90)=178.44ms p(95)=194.4ms  p(99.9)=259.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153686
     http_req_receiving.............: avg=627.83µs min=51.5µs med=107.63µs max=182.99ms p(90)=1.18ms   p(95)=2.11ms   p(99.9)=25.8ms  
     http_req_sending...............: avg=75.98µs  min=4.8µs  med=10.65µs  max=236.1ms  p(90)=22.28µs  p(95)=125.06µs p(99.9)=10.04ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.81ms  min=1.39ms med=86.11ms  max=342.98ms p(90)=177.63ms p(95)=193.58ms p(99.9)=257.93ms
     http_reqs......................: 153686  2485.28022/s
     iteration_duration.............: avg=93.38ms  min=3.26ms med=87.85ms  max=343.59ms p(90)=178.92ms p(95)=194.9ms  p(99.9)=260.4ms 
     iterations.....................: 152686  2469.109065/s
     success_rate...................: 100.00% ✓ 152686      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 444075      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=15.47µs min=862ns   med=2.23µs   max=61.51ms  p(90)=3.96µs   p(95)=5.14µs   p(99.9)=962.76µs
     http_req_connecting............: avg=12.13µs min=0s      med=0s       max=61.43ms  p(90)=0s       p(95)=0s       p(99.9)=913.71µs
     http_req_duration..............: avg=95.49ms min=1.56ms  med=83.47ms  max=1.6s     p(90)=180.95ms p(95)=207.88ms p(99.9)=795.66ms
       { expected_response:true }...: avg=95.49ms min=1.56ms  med=83.47ms  max=1.6s     p(90)=180.95ms p(95)=207.88ms p(99.9)=795.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149025
     http_req_receiving.............: avg=1.3ms   min=51.84µs med=101.53µs max=780.7ms  p(90)=1.54ms   p(95)=3.94ms   p(99.9)=77.03ms 
     http_req_sending...............: avg=61.96µs min=4.85µs  med=9.46µs   max=113.44ms p(90)=19.39µs  p(95)=101.92µs p(99.9)=8.35ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.13ms min=1.48ms  med=82.35ms  max=1.6s     p(90)=179.16ms p(95)=205.39ms p(99.9)=755.01ms
     http_reqs......................: 149025  2406.480924/s
     iteration_duration.............: avg=96.38ms min=2.91ms  med=84.43ms  max=1.6s     p(90)=181.5ms  p(95)=208.64ms p(99.9)=796.05ms
     iterations.....................: 148025  2390.332755/s
     success_rate...................: 100.00% ✓ 148025      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 443727      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=25.46µs min=1.05µs  med=2.92µs   max=132.85ms p(90)=4.78µs   p(95)=6.02µs   p(99.9)=2.9ms   
     http_req_connecting............: avg=21.62µs min=0s      med=0s       max=132.6ms  p(90)=0s       p(95)=0s       p(99.9)=2.88ms  
     http_req_duration..............: avg=95.52ms min=1.55ms  med=81.31ms  max=1.31s    p(90)=183.09ms p(95)=219.91ms p(99.9)=710.67ms
       { expected_response:true }...: avg=95.52ms min=1.55ms  med=81.31ms  max=1.31s    p(90)=183.09ms p(95)=219.91ms p(99.9)=710.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148909
     http_req_receiving.............: avg=1.63ms  min=53.83µs med=107.26µs max=682.29ms p(90)=1.62ms   p(95)=4.31ms   p(99.9)=119.1ms 
     http_req_sending...............: avg=81.35µs min=4.98µs  med=10.8µs   max=173.51ms p(90)=21.55µs  p(95)=123.49µs p(99.9)=11.12ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.81ms min=1.45ms  med=80.08ms  max=1.31s    p(90)=180.8ms  p(95)=215.78ms p(99.9)=700.75ms
     http_reqs......................: 148909  2403.950189/s
     iteration_duration.............: avg=96.47ms min=3.11ms  med=82.32ms  max=1.32s    p(90)=183.82ms p(95)=220.97ms p(99.9)=711.64ms
     iterations.....................: 147909  2387.806436/s
     success_rate...................: 100.00% ✓ 147909      ✗ 0     
     vus............................: 57      min=0         max=499 
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

     checks.........................: 100.00% ✓ 435777      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=14.64µs  min=872ns   med=2.38µs  max=62.77ms  p(90)=4.19µs   p(95)=5.42µs   p(99.9)=599.33µs
     http_req_connecting............: avg=11.47µs  min=0s      med=0s      max=62.53ms  p(90)=0s       p(95)=0s       p(99.9)=523.89µs
     http_req_duration..............: avg=97.25ms  min=1.5ms   med=91.58ms max=308.15ms p(90)=190.28ms p(95)=205.87ms p(99.9)=253.02ms
       { expected_response:true }...: avg=97.25ms  min=1.5ms   med=91.58ms max=308.15ms p(90)=190.28ms p(95)=205.87ms p(99.9)=253.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146259
     http_req_receiving.............: avg=126.82µs min=26.57µs med=53.96µs max=258.19ms p(90)=127.4µs  p(95)=335.39µs p(99.9)=12.05ms 
     http_req_sending...............: avg=65.36µs  min=4.87µs  med=10.25µs max=280.14ms p(90)=21.11µs  p(95)=117.56µs p(99.9)=8.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.06ms  min=1.45ms  med=91.42ms max=290.23ms p(90)=190.05ms p(95)=205.64ms p(99.9)=251.88ms
     http_reqs......................: 146259  2365.893345/s
     iteration_duration.............: avg=98.18ms  min=4.67ms  med=92.62ms max=337.11ms p(90)=190.75ms p(95)=206.31ms p(99.9)=254.51ms
     iterations.....................: 145259  2349.717292/s
     success_rate...................: 100.00% ✓ 145259      ✗ 0     
     vus............................: 94      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 396192      ✗ 0     
     data_received..................: 12 GB   187 MB/s
     data_sent......................: 160 MB  2.6 MB/s
     http_req_blocked...............: avg=16.8µs   min=932ns   med=2.96µs   max=78.54ms  p(90)=4.84µs   p(95)=6.05µs   p(99.9)=1.76ms  
     http_req_connecting............: avg=13.04µs  min=0s      med=0s       max=71.43ms  p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=106.97ms min=1.84ms  med=93.45ms  max=1.26s    p(90)=203.97ms p(95)=233.48ms p(99.9)=712.62ms
       { expected_response:true }...: avg=106.97ms min=1.84ms  med=93.45ms  max=1.26s    p(90)=203.97ms p(95)=233.48ms p(99.9)=712.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 133064
     http_req_receiving.............: avg=1.56ms   min=53.54µs med=117.17µs max=867.99ms p(90)=1.81ms   p(95)=4.23ms   p(99.9)=121.73ms
     http_req_sending...............: avg=72.07µs  min=4.94µs  med=11.34µs  max=282.61ms p(90)=22.13µs  p(95)=118.44µs p(99.9)=8.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.33ms min=1.74ms  med=92.27ms  max=1.26s    p(90)=201.9ms  p(95)=229.71ms p(99.9)=708.11ms
     http_reqs......................: 133064  2136.090349/s
     iteration_duration.............: avg=108.04ms min=3.43ms  med=94.72ms  max=1.26s    p(90)=204.59ms p(95)=234.17ms p(99.9)=713.78ms
     iterations.....................: 132064  2120.037244/s
     success_rate...................: 100.00% ✓ 132064      ✗ 0     
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

     checks.........................: 100.00% ✓ 210120      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=4.91µs   min=921ns   med=2.39µs   max=6.62ms   p(90)=4.19µs   p(95)=5.15µs   p(99.9)=401.54µs
     http_req_connecting............: avg=1.85µs   min=0s      med=0s       max=6.58ms   p(90)=0s       p(95)=0s       p(99.9)=363.21µs
     http_req_duration..............: avg=200.92ms min=1.91ms  med=201.36ms max=528.42ms p(90)=371.51ms p(95)=398.28ms p(99.9)=474.41ms
       { expected_response:true }...: avg=200.92ms min=1.91ms  med=201.36ms max=528.42ms p(90)=371.51ms p(95)=398.28ms p(99.9)=474.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71040
     http_req_receiving.............: avg=76.85µs  min=27.85µs med=62.66µs  max=36.35ms  p(90)=103.96µs p(95)=120.65µs p(99.9)=1.07ms  
     http_req_sending...............: avg=26.92µs  min=4.98µs  med=10.9µs   max=57.56ms  p(90)=18.26µs  p(95)=22.2µs   p(99.9)=3.2ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.82ms min=1.85ms  med=201.25ms max=528.34ms p(90)=371.4ms  p(95)=398.19ms p(99.9)=474.35ms
     http_reqs......................: 71040   1134.411866/s
     iteration_duration.............: avg=204.02ms min=4.16ms  med=204.92ms max=528.59ms p(90)=372.37ms p(95)=399.03ms p(99.9)=474.92ms
     iterations.....................: 70040   1118.44323/s
     success_rate...................: 100.00% ✓ 70040       ✗ 0    
     vus............................: 85      min=0         max=496
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

     checks.........................: 100.00% ✓ 102528     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 42 MB   652 kB/s
     http_req_blocked...............: avg=8.49µs   min=1.06µs  med=2.87µs   max=11.63ms  p(90)=4.65µs   p(95)=5.69µs   p(99.9)=1.23ms
     http_req_connecting............: avg=4.65µs   min=0s      med=0s       max=11.55ms  p(90)=0s       p(95)=0s       p(99.9)=1.19ms
     http_req_duration..............: avg=407.76ms min=3.87ms  med=377.2ms  max=1.87s    p(90)=804.08ms p(95)=871.62ms p(99.9)=1.29s 
       { expected_response:true }...: avg=407.76ms min=3.87ms  med=377.2ms  max=1.87s    p(90)=804.08ms p(95)=871.62ms p(99.9)=1.29s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 35176
     http_req_receiving.............: avg=96.6µs   min=30.72µs med=72.94µs  max=169.51ms p(90)=111.98µs p(95)=126.32µs p(99.9)=1.38ms
     http_req_sending...............: avg=35.71µs  min=5.14µs  med=14.05µs  max=162.11ms p(90)=21.45µs  p(95)=24.57µs  p(99.9)=2.45ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=407.63ms min=3.78ms  med=377.12ms max=1.87s    p(90)=803.96ms p(95)=871.29ms p(99.9)=1.29s 
     http_reqs......................: 35176   543.361862/s
     iteration_duration.............: avg=419.91ms min=15.58ms med=391.4ms  max=1.87s    p(90)=808.01ms p(95)=874.98ms p(99.9)=1.3s  
     iterations.....................: 34176   527.914913/s
     success_rate...................: 100.00% ✓ 34176      ✗ 0    
     vus............................: 91      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 46263      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   292 kB/s
     http_req_blocked...............: avg=14.09µs  min=1.12µs  med=3.2µs    max=6.07ms  p(90)=5µs      p(95)=6.67µs   p(99.9)=2.08ms
     http_req_connecting............: avg=9.21µs   min=0s      med=0s       max=6.02ms  p(90)=0s       p(95)=0s       p(99.9)=1.98ms
     http_req_duration..............: avg=886.12ms min=5.76ms  med=803.54ms max=5.29s   p(90)=1.76s    p(95)=2s       p(99.9)=4.24s 
       { expected_response:true }...: avg=886.12ms min=5.76ms  med=803.54ms max=5.29s   p(90)=1.76s    p(95)=2s       p(99.9)=4.24s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16421
     http_req_receiving.............: avg=103.27µs min=33.89µs med=92.54µs  max=62.88ms p(90)=129.44µs p(95)=145.28µs p(99.9)=1.07ms
     http_req_sending...............: avg=34.59µs  min=5.65µs  med=17.39µs  max=58.34ms p(90)=22.84µs  p(95)=27.64µs  p(99.9)=2.8ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=885.98ms min=5.68ms  med=803.38ms max=5.29s   p(90)=1.76s    p(95)=2s       p(99.9)=4.24s 
     http_reqs......................: 16421   243.329989/s
     iteration_duration.............: avg=943.62ms min=42.22ms med=866.23ms max=5.3s    p(90)=1.78s    p(95)=2.01s    p(99.9)=4.27s 
     iterations.....................: 15421   228.511769/s
     success_rate...................: 100.00% ✓ 15421      ✗ 0    
     vus............................: 81      min=0        max=500
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

     checks.........................: 100.00% ✓ 45111      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   279 kB/s
     http_req_blocked...............: avg=11.18µs  min=1.36µs  med=3.59µs   max=8.74ms  p(90)=5.36µs   p(95)=7.17µs   p(99.9)=810.36µs
     http_req_connecting............: avg=5.81µs   min=0s      med=0s       max=8.68ms  p(90)=0s       p(95)=0s       p(99.9)=784.63µs
     http_req_duration..............: avg=905.53ms min=7.82ms  med=824.95ms max=3.05s   p(90)=1.82s    p(95)=1.96s    p(99.9)=2.86s   
       { expected_response:true }...: avg=905.53ms min=7.82ms  med=824.95ms max=3.05s   p(90)=1.82s    p(95)=1.96s    p(99.9)=2.86s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16037
     http_req_receiving.............: avg=99.88µs  min=33µs    med=89.19µs  max=26.87ms p(90)=130.47µs p(95)=146.92µs p(99.9)=1.41ms  
     http_req_sending...............: avg=31.76µs  min=5.9µs   med=17.56µs  max=32.52ms p(90)=23.38µs  p(95)=28.72µs  p(99.9)=4ms     
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=905.4ms  min=7.73ms  med=824.83ms max=3.05s   p(90)=1.82s    p(95)=1.96s    p(99.9)=2.86s   
     http_reqs......................: 16037   232.768968/s
     iteration_duration.............: avg=965.66ms min=52.78ms med=895.2ms  max=3.06s   p(90)=1.83s    p(95)=1.97s    p(99.9)=2.87s   
     iterations.....................: 15037   218.254472/s
     success_rate...................: 100.00% ✓ 15037      ✗ 0    
     vus............................: 16      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

