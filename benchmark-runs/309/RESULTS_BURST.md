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
| hive-router | v0.0.84 | 2,816 | 2,925 | 2,745 | 2.3% |  |
| fusion | 16.6.0 | 2,517 | 2,593 | 2,499 | 1.1% |  |
| cosmo | 0.334.0 | 1,213 | 1,246 | 1,203 | 1.1% |  |
| hive-gateway-router-runtime | 2.10.8 | 577 | 589 | 575 | 0.9% |  |
| hive-gateway | 2.10.8 | 254 | 260 | 253 | 0.9% |  |
| apollo-gateway | 2.14.3 | 236 | 243 | 233 | 1.2% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (9219 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (560078 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.6.0 | 2,376 | 2,423 | 2,321 | 1.4% |  |
| hive-router | v0.0.84 | 2,347 | 2,488 | 2,319 | 2.3% |  |
| cosmo | 0.334.0 | 1,164 | 1,208 | 1,158 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 525 | 537 | 523 | 0.9% |  |
| hive-gateway | 2.10.8 | 239 | 247 | 236 | 1.3% |  |
| apollo-gateway | 2.14.3 | 231 | 238 | 229 | 1.2% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (23167 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (376995 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 517968      ✗ 0     
     data_received..................: 15 GB   247 MB/s
     data_sent......................: 209 MB  3.4 MB/s
     http_req_blocked...............: avg=25.7µs   min=962ns  med=2.74µs  max=74.95ms  p(90)=4.48µs   p(95)=5.69µs   p(99.9)=1.67ms  
     http_req_connecting............: avg=22.07µs  min=0s     med=0s      max=74.79ms  p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=81.81ms  min=1.37ms med=75.83ms max=329.72ms p(90)=157.15ms p(95)=174.23ms p(99.9)=241.75ms
       { expected_response:true }...: avg=81.81ms  min=1.37ms med=75.83ms max=329.72ms p(90)=157.15ms p(95)=174.23ms p(99.9)=241.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 173656
     http_req_receiving.............: avg=168.43µs min=25.7µs med=52.1µs  max=69.77ms  p(90)=159.66µs p(95)=364.66µs p(99.9)=20.94ms 
     http_req_sending...............: avg=74.27µs  min=4.18µs med=10.09µs max=45.47ms  p(90)=19.54µs  p(95)=128.31µs p(99.9)=10.61ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.57ms  min=1.31ms med=75.6ms  max=289.77ms p(90)=156.82ms p(95)=173.77ms p(99.9)=240.79ms
     http_reqs......................: 173656  2816.191262/s
     iteration_duration.............: avg=82.56ms  min=2.1ms  med=76.64ms max=362.22ms p(90)=157.61ms p(95)=174.82ms p(99.9)=243.99ms
     iterations.....................: 172656  2799.974193/s
     success_rate...................: 100.00% ✓ 172656      ✗ 0     
     vus............................: 87      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 467298      ✗ 0     
     data_received..................: 14 GB   221 MB/s
     data_sent......................: 188 MB  3.0 MB/s
     http_req_blocked...............: avg=17.39µs min=881ns   med=2.15µs  max=95.18ms  p(90)=3.65µs   p(95)=4.72µs   p(99.9)=1.91ms  
     http_req_connecting............: avg=14.32µs min=0s      med=0s      max=95.12ms  p(90)=0s       p(95)=0s       p(99.9)=1.84ms  
     http_req_duration..............: avg=90.72ms min=1.95ms  med=79.52ms max=1.19s    p(90)=173.16ms p(95)=199.06ms p(99.9)=563.33ms
       { expected_response:true }...: avg=90.72ms min=1.95ms  med=79.52ms max=1.19s    p(90)=173.16ms p(95)=199.06ms p(99.9)=563.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156766
     http_req_receiving.............: avg=1.4ms   min=50.92µs med=95.82µs max=503.95ms p(90)=1.55ms   p(95)=4.3ms    p(99.9)=103.01ms
     http_req_sending...............: avg=66.27µs min=4.79µs  med=9.07µs  max=255.86ms p(90)=17.16µs  p(95)=102.7µs  p(99.9)=8.91ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.25ms min=1.86ms  med=78.26ms max=1.19s    p(90)=171.28ms p(95)=195.75ms p(99.9)=561.01ms
     http_reqs......................: 156766  2517.460981/s
     iteration_duration.............: avg=91.56ms min=3.44ms  med=80.52ms max=1.19s    p(90)=173.66ms p(95)=199.8ms  p(99.9)=563.76ms
     iterations.....................: 155766  2501.402263/s
     success_rate...................: 100.00% ✓ 155766      ✗ 0     
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

     checks.........................: 100.00% ✓ 224487      ✗ 0    
     data_received..................: 6.7 GB  107 MB/s
     data_sent......................: 91 MB   1.5 MB/s
     http_req_blocked...............: avg=6.07µs   min=1.04µs  med=2.64µs   max=9.83ms   p(90)=4.24µs   p(95)=5.09µs   p(99.9)=517.04µs
     http_req_connecting............: avg=2.77µs   min=0s      med=0s       max=9.79ms   p(90)=0s       p(95)=0s       p(99.9)=451.96µs
     http_req_duration..............: avg=188.17ms min=1.91ms  med=188.83ms max=501.76ms p(90)=351.16ms p(95)=375.3ms  p(99.9)=450.75ms
       { expected_response:true }...: avg=188.17ms min=1.91ms  med=188.83ms max=501.76ms p(90)=351.16ms p(95)=375.3ms  p(99.9)=450.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75829
     http_req_receiving.............: avg=76.34µs  min=27.03µs med=58.25µs  max=147.66ms p(90)=94.15µs  p(95)=108.38µs p(99.9)=958.76µs
     http_req_sending...............: avg=28.51µs  min=4.94µs  med=10.77µs  max=175.44ms p(90)=16.57µs  p(95)=20.13µs  p(99.9)=3.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.07ms min=1.82ms  med=188.66ms max=501.68ms p(90)=351.07ms p(95)=375.22ms p(99.9)=450.44ms
     http_reqs......................: 75829   1213.986003/s
     iteration_duration.............: avg=190.91ms min=3.78ms  med=191.77ms max=502ms    p(90)=351.95ms p(95)=375.91ms p(99.9)=451.06ms
     iterations.....................: 74829   1197.976482/s
     success_rate...................: 100.00% ✓ 74829       ✗ 0    
     vus............................: 77      min=0         max=493
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

     checks.........................: 100.00% ✓ 108285     ✗ 0    
     data_received..................: 3.3 GB  51 MB/s
     data_sent......................: 45 MB   694 kB/s
     http_req_blocked...............: avg=7.67µs   min=1.03µs  med=2.49µs   max=5.05ms  p(90)=4.17µs   p(95)=5.14µs   p(99.9)=1.41ms
     http_req_connecting............: avg=4.22µs   min=0s      med=0s       max=5ms     p(90)=0s       p(95)=0s       p(99.9)=1.36ms
     http_req_duration..............: avg=386.67ms min=3.47ms  med=360.42ms max=1.58s   p(90)=761.77ms p(95)=825.3ms  p(99.9)=1.18s 
       { expected_response:true }...: avg=386.67ms min=3.47ms  med=360.42ms max=1.58s   p(90)=761.77ms p(95)=825.3ms  p(99.9)=1.18s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 37095
     http_req_receiving.............: avg=80.96µs  min=29.1µs  med=67.04µs  max=46.42ms p(90)=106.69µs p(95)=121.71µs p(99.9)=1.02ms
     http_req_sending...............: avg=28.84µs  min=5.24µs  med=12.81µs  max=74.41ms p(90)=21.08µs  p(95)=23.99µs  p(99.9)=2.86ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=386.56ms min=3.37ms  med=360.28ms max=1.58s   p(90)=761.66ms p(95)=825.18ms p(99.9)=1.18s 
     http_reqs......................: 37095   577.868905/s
     iteration_duration.............: avg=397.6ms  min=25.97ms med=373.5ms  max=1.58s   p(90)=765.08ms p(95)=828.25ms p(99.9)=1.19s 
     iterations.....................: 36095   562.290824/s
     success_rate...................: 100.00% ✓ 36095      ✗ 0    
     vus............................: 65      min=0        max=497
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

     checks.........................: 100.00% ✓ 48342      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   307 kB/s
     http_req_blocked...............: avg=15.1µs   min=1.26µs  med=3.78µs   max=16.79ms p(90)=5.57µs  p(95)=6.89µs   p(99.9)=2.28ms
     http_req_connecting............: avg=9.66µs   min=0s      med=0s       max=16.69ms p(90)=0s      p(95)=0s       p(99.9)=2.25ms
     http_req_duration..............: avg=829.88ms min=5.48ms  med=748.9ms  max=16.73s  p(90)=1.53s   p(95)=1.7s     p(99.9)=14.51s
       { expected_response:true }...: avg=829.88ms min=5.48ms  med=748.9ms  max=16.73s  p(90)=1.53s   p(95)=1.7s     p(99.9)=14.51s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17114
     http_req_receiving.............: avg=99.2µs   min=38.73µs med=91.22µs  max=9.06ms  p(90)=128.8µs p(95)=146.35µs p(99.9)=1.11ms
     http_req_sending...............: avg=40.78µs  min=6.23µs  med=17.98µs  max=96.2ms  p(90)=23.94µs p(95)=28.29µs  p(99.9)=1.78ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=829.74ms min=5.4ms   med=748.77ms max=16.73s  p(90)=1.53s   p(95)=1.7s     p(99.9)=14.51s
     http_reqs......................: 17114   254.674204/s
     iteration_duration.............: avg=881.46ms min=32.51ms med=803.31ms max=16.73s  p(90)=1.54s   p(95)=1.71s    p(99.9)=14.52s
     iterations.....................: 16114   239.793159/s
     success_rate...................: 100.00% ✓ 16114      ✗ 0    
     vus............................: 67      min=0        max=498
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

     checks.........................: 100.00% ✓ 48861      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   290 kB/s
     http_req_blocked...............: avg=13.62µs  min=1.43µs med=3.41µs   max=9.64ms  p(90)=5.09µs   p(95)=6.54µs   p(99.9)=2.11ms  
     http_req_connecting............: avg=8.55µs   min=0s     med=0s       max=9.57ms  p(90)=0s       p(95)=0s       p(99.9)=2.09ms  
     http_req_duration..............: avg=389.7ms  min=7.34ms med=450.84ms max=1.09s   p(90)=648.78ms p(95)=685.61ms p(99.9)=946.08ms
       { expected_response:true }...: avg=389.7ms  min=7.34ms med=450.84ms max=1.09s   p(90)=648.78ms p(95)=685.61ms p(99.9)=946.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17287
     http_req_receiving.............: avg=98.57µs  min=34.1µs med=84.11µs  max=94.27ms p(90)=123.64µs p(95)=139.59µs p(99.9)=1.04ms  
     http_req_sending...............: avg=32.76µs  min=5.74µs med=16.78µs  max=28.34ms p(90)=22.67µs  p(95)=26.98µs  p(99.9)=3.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=389.57ms min=7.21ms med=450.54ms max=1.09s   p(90)=648.69ms p(95)=685.53ms p(99.9)=945.95ms
     http_reqs......................: 17287   236.914121/s
     iteration_duration.............: avg=413.67ms min=9.47ms med=473.39ms max=1.1s    p(90)=652.55ms p(95)=690.94ms p(99.9)=954.48ms
     iterations.....................: 16287   223.209365/s
     success_rate...................: 100.00% ✓ 16287      ✗ 0    
     vus............................: 47      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 438348      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=17.47µs min=902ns   med=2.32µs   max=92.52ms  p(90)=4.06µs   p(95)=5.25µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=14.28µs min=0s      med=0s       max=92.44ms  p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=96.7ms  min=1.58ms  med=82.5ms   max=1.17s    p(90)=181.61ms p(95)=216.42ms p(99.9)=776.24ms
       { expected_response:true }...: avg=96.7ms  min=1.58ms  med=82.5ms   max=1.17s    p(90)=181.61ms p(95)=216.42ms p(99.9)=776.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147116
     http_req_receiving.............: avg=1.56ms  min=53.04µs med=105.05µs max=700.13ms p(90)=1.69ms   p(95)=4.58ms   p(99.9)=113.78ms
     http_req_sending...............: avg=65.81µs min=4.95µs  med=9.76µs   max=163.7ms  p(90)=20.41µs  p(95)=107.21µs p(99.9)=8.96ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.07ms min=1.5ms   med=81.37ms  max=1.17s    p(90)=179.38ms p(95)=210.73ms p(99.9)=731.12ms
     http_reqs......................: 147116  2376.270241/s
     iteration_duration.............: avg=97.63ms min=2.67ms  med=83.54ms  max=1.17s    p(90)=182.24ms p(95)=217.23ms p(99.9)=778.72ms
     iterations.....................: 146116  2360.117883/s
     success_rate...................: 100.00% ✓ 146116      ✗ 0     
     vus............................: 54      min=0         max=499 
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

     checks.........................: 100.00% ✓ 433674      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=13.83µs  min=942ns   med=2.52µs  max=46.11ms  p(90)=4.53µs   p(95)=5.81µs   p(99.9)=706.42µs
     http_req_connecting............: avg=10.33µs  min=0s      med=0s      max=46.04ms  p(90)=0s       p(95)=0s       p(99.9)=632.09µs
     http_req_duration..............: avg=97.71ms  min=1.49ms  med=92.53ms max=324.99ms p(90)=186.62ms p(95)=202.83ms p(99.9)=255.17ms
       { expected_response:true }...: avg=97.71ms  min=1.49ms  med=92.53ms max=324.99ms p(90)=186.62ms p(95)=202.83ms p(99.9)=255.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145558
     http_req_receiving.............: avg=126.53µs min=26.14µs med=56.44µs max=204.62ms p(90)=132.76µs p(95)=339.62µs p(99.9)=11.02ms 
     http_req_sending...............: avg=62.09µs  min=4.61µs  med=10.73µs max=103.13ms p(90)=22.46µs  p(95)=122.16µs p(99.9)=7.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.53ms  min=1.44ms  med=92.34ms max=324.8ms  p(90)=186.41ms p(95)=202.57ms p(99.9)=254.08ms
     http_reqs......................: 145558  2347.613229/s
     iteration_duration.............: avg=98.64ms  min=3.59ms  med=93.57ms max=333.4ms  p(90)=187.09ms p(95)=203.27ms p(99.9)=256.33ms
     iterations.....................: 144558  2331.484859/s
     success_rate...................: 100.00% ✓ 144558      ✗ 0     
     vus............................: 57      min=0         max=498 
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

     checks.........................: 100.00% ✓ 215889      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=5.7µs    min=1µs     med=2.49µs   max=18.77ms  p(90)=4.33µs   p(95)=5.34µs   p(99.9)=520.04µs
     http_req_connecting............: avg=2.53µs   min=0s      med=0s       max=18.34ms  p(90)=0s       p(95)=0s       p(99.9)=462.63µs
     http_req_duration..............: avg=195.54ms min=2.1ms   med=197.18ms max=509.31ms p(90)=361.18ms p(95)=386.6ms  p(99.9)=461.47ms
       { expected_response:true }...: avg=195.54ms min=2.1ms   med=197.18ms max=509.31ms p(90)=361.18ms p(95)=386.6ms  p(99.9)=461.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72963
     http_req_receiving.............: avg=79.35µs  min=27.21µs med=64.41µs  max=120.93ms p(90)=105.56µs p(95)=121.17µs p(99.9)=1.18ms  
     http_req_sending...............: avg=31µs     min=5.1µs   med=11.71µs  max=185.78ms p(90)=19.84µs  p(95)=23.45µs  p(99.9)=3.16ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.43ms min=2.03ms  med=197.07ms max=509.26ms p(90)=361.08ms p(95)=386.48ms p(99.9)=461.37ms
     http_reqs......................: 72963   1164.051944/s
     iteration_duration.............: avg=198.51ms min=5.58ms  med=200.4ms  max=509.48ms p(90)=361.95ms p(95)=387.21ms p(99.9)=461.96ms
     iterations.....................: 71963   1148.097941/s
     success_rate...................: 100.00% ✓ 71963       ✗ 0    
     vus............................: 87      min=0         max=497
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

     checks.........................: 100.00% ✓ 98772      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   630 kB/s
     http_req_blocked...............: avg=8.26µs   min=1.23µs  med=3.34µs   max=20.98ms  p(90)=5.04µs   p(95)=6.1µs    p(99.9)=682.31µs
     http_req_connecting............: avg=3.92µs   min=0s      med=0s       max=20.92ms  p(90)=0s       p(95)=0s       p(99.9)=655.05µs
     http_req_duration..............: avg=423.03ms min=3.8ms   med=395.67ms max=1.51s    p(90)=829.27ms p(95)=901.17ms p(99.9)=1.33s   
       { expected_response:true }...: avg=423.03ms min=3.8ms   med=395.67ms max=1.51s    p(90)=829.27ms p(95)=901.17ms p(99.9)=1.33s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33924
     http_req_receiving.............: avg=91.88µs  min=32µs    med=75.12µs  max=141.48ms p(90)=114.54µs p(95)=128.57µs p(99.9)=1.42ms  
     http_req_sending...............: avg=35.11µs  min=5.57µs  med=15.02µs  max=134.8ms  p(90)=21.79µs  p(95)=25.07µs  p(99.9)=3.07ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=422.9ms  min=3.71ms  med=395.55ms max=1.51s    p(90)=829.12ms p(95)=901.04ms p(99.9)=1.33s   
     http_reqs......................: 33924   525.096298/s
     iteration_duration.............: avg=436.11ms min=23.82ms med=409.38ms max=1.52s    p(90)=833.05ms p(95)=904.82ms p(99.9)=1.35s   
     iterations.....................: 32924   509.61769/s
     success_rate...................: 100.00% ✓ 32924      ✗ 0    
     vus............................: 84      min=0        max=498
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

     checks.........................: 100.00% ✓ 45408      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   287 kB/s
     http_req_blocked...............: avg=15.4µs   min=1.33µs  med=3.84µs   max=10.53ms p(90)=5.78µs   p(95)=7.94µs   p(99.9)=2.19ms
     http_req_connecting............: avg=9.67µs   min=0s      med=0s       max=10.48ms p(90)=0s       p(95)=0s       p(99.9)=2.18ms
     http_req_duration..............: avg=902.2ms  min=5.8ms   med=819.83ms max=4.93s   p(90)=1.8s     p(95)=2.02s    p(99.9)=4.2s  
       { expected_response:true }...: avg=902.2ms  min=5.8ms   med=819.83ms max=4.93s   p(90)=1.8s     p(95)=2.02s    p(99.9)=4.2s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16136
     http_req_receiving.............: avg=108.75µs min=37.02µs med=94.97µs  max=95.68ms p(90)=132.39µs p(95)=147.61µs p(99.9)=1.16ms
     http_req_sending...............: avg=35.22µs  min=6.94µs  med=18.87µs  max=26.44ms p(90)=24.56µs  p(95)=30.34µs  p(99.9)=4.33ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=902.05ms min=5.71ms  med=819.73ms max=4.93s   p(90)=1.8s     p(95)=2.02s    p(99.9)=4.2s  
     http_reqs......................: 16136   239.124684/s
     iteration_duration.............: avg=961.87ms min=62.21ms med=887.25ms max=4.95s   p(90)=1.82s    p(95)=2.05s    p(99.9)=4.22s 
     iterations.....................: 15136   224.305355/s
     success_rate...................: 100.00% ✓ 15136      ✗ 0    
     vus............................: 79      min=0        max=500
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

     checks.........................: 100.00% ✓ 44766      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   278 kB/s
     http_req_blocked...............: avg=13.67µs  min=1.09µs  med=3.11µs   max=3.78ms   p(90)=4.8µs    p(95)=6.47µs  p(99.9)=2.07ms
     http_req_connecting............: avg=8.84µs   min=0s      med=0s       max=3.73ms   p(90)=0s       p(95)=0s      p(99.9)=2.05ms
     http_req_duration..............: avg=912.32ms min=7.78ms  med=829.86ms max=3.15s    p(90)=1.86s    p(95)=1.98s   p(99.9)=2.88s 
       { expected_response:true }...: avg=912.32ms min=7.78ms  med=829.86ms max=3.15s    p(90)=1.86s    p(95)=1.98s   p(99.9)=2.88s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15922
     http_req_receiving.............: avg=98.69µs  min=31.75µs med=87.85µs  max=58.11ms  p(90)=127.04µs p(95)=142.1µs p(99.9)=1.17ms
     http_req_sending...............: avg=38.18µs  min=5.41µs  med=16.88µs  max=132.89ms p(90)=22.35µs  p(95)=27.47µs p(99.9)=2.36ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=912.18ms min=7.66ms  med=829.75ms max=3.15s    p(90)=1.86s    p(95)=1.98s   p(99.9)=2.88s 
     http_reqs......................: 15922   231.256775/s
     iteration_duration.............: avg=973.4ms  min=45.66ms med=914.01ms max=3.15s    p(90)=1.87s    p(95)=1.99s   p(99.9)=2.89s 
     iterations.....................: 14922   216.73242/s
     success_rate...................: 100.00% ✓ 14922      ✗ 0    
     vus............................: 104     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

