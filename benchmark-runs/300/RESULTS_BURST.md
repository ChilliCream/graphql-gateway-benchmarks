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
| hive-router | v0.0.84 | 2,924 | 3,067 | 2,878 | 2.0% |  |
| fusion-nightly-net11 | 16.6.0-p.6 | 2,503 | 2,609 | 2,491 | 1.7% |  |
| fusion | 16.5.1 | 2,497 | 2,590 | 2,475 | 1.5% |  |
| fusion-nightly | 16.6.0-p.6 | 2,419 | 2,539 | 2,408 | 1.9% |  |
| cosmo | 0.334.0 | 1,233 | 1,281 | 1,230 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 559 | 573 | 556 | 1.0% |  |
| hive-gateway | 2.10.8 | 252 | 262 | 251 | 1.3% |  |
| apollo-gateway | 2.14.3 | 231 | 238 | 227 | 1.3% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (10718 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (540331 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.0-p.6 | 2,379 | 2,444 | 2,331 | 1.8% |  |
| fusion | 16.5.1 | 2,332 | 2,432 | 2,324 | 1.6% |  |
| fusion-nightly | 16.6.0-p.6 | 2,299 | 2,392 | 2,290 | 1.6% |  |
| hive-router | v0.0.84 | 2,224 | 2,367 | 2,191 | 2.8% |  |
| fusion-nightly-fed | 16.6.0-p.6 | 2,096 | 2,195 | 2,088 | 1.8% |  |
| cosmo | 0.334.0 | 1,156 | 1,196 | 1,150 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 526 | 536 | 523 | 0.9% |  |
| apollo-gateway | 2.14.3 | 238 | 242 | 237 | 0.6% |  |
| hive-gateway | 2.10.8 | 237 | 242 | 235 | 0.9% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (16291 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (282509 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 537225      ✗ 0     
     data_received..................: 16 GB   257 MB/s
     data_sent......................: 216 MB  3.5 MB/s
     http_req_blocked...............: avg=26.64µs  min=932ns   med=2.68µs  max=65.98ms  p(90)=4.38µs   p(95)=5.58µs   p(99.9)=5.27ms  
     http_req_connecting............: avg=22.81µs  min=0s      med=0s      max=65.87ms  p(90)=0s       p(95)=0s       p(99.9)=4.85ms  
     http_req_duration..............: avg=78.82ms  min=1.36ms  med=73.05ms max=327.1ms  p(90)=153.03ms p(95)=168.8ms  p(99.9)=231.09ms
       { expected_response:true }...: avg=78.82ms  min=1.36ms  med=73.05ms max=327.1ms  p(90)=153.03ms p(95)=168.8ms  p(99.9)=231.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 180075
     http_req_receiving.............: avg=216.65µs min=26.29µs med=53.47µs max=259.39ms p(90)=180.06µs p(95)=373.87µs p(99.9)=29.02ms 
     http_req_sending...............: avg=85.16µs  min=4.51µs  med=10.12µs max=54.18ms  p(90)=19.78µs  p(95)=129.29µs p(99.9)=14.25ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.52ms  min=1.3ms   med=72.79ms max=274.68ms p(90)=152.66ms p(95)=168.22ms p(99.9)=227.88ms
     http_reqs......................: 180075  2924.638767/s
     iteration_duration.............: avg=79.6ms   min=2.07ms  med=73.9ms  max=335.14ms p(90)=153.55ms p(95)=169.61ms p(99.9)=235.23ms
     iterations.....................: 179075  2908.397541/s
     success_rate...................: 100.00% ✓ 179075      ✗ 0     
     vus............................: 82      min=0         max=492 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 465012      ✗ 0     
     data_received..................: 14 GB   220 MB/s
     data_sent......................: 187 MB  3.0 MB/s
     http_req_blocked...............: avg=18.53µs min=892ns   med=2.54µs   max=71.78ms  p(90)=4.07µs   p(95)=5.14µs   p(99.9)=1.88ms  
     http_req_connecting............: avg=15.2µs  min=0s      med=0s       max=71.71ms  p(90)=0s       p(95)=0s       p(99.9)=1.86ms  
     http_req_duration..............: avg=91.15ms min=1.93ms  med=86.64ms  max=385.6ms  p(90)=174.09ms p(95)=190.36ms p(99.9)=267.69ms
       { expected_response:true }...: avg=91.15ms min=1.93ms  med=86.64ms  max=385.6ms  p(90)=174.09ms p(95)=190.36ms p(99.9)=267.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156004
     http_req_receiving.............: avg=755.4µs min=53.79µs med=124.18µs max=113.63ms p(90)=1.53ms   p(95)=2.51ms   p(99.9)=27.02ms 
     http_req_sending...............: avg=65.99µs min=4.63µs  med=9.46µs   max=70ms     p(90)=18.3µs   p(95)=119.11µs p(99.9)=9.28ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.33ms min=1.84ms  med=85.73ms  max=385.53ms p(90)=173.29ms p(95)=189.57ms p(99.9)=266.39ms
     http_reqs......................: 156004  2503.770732/s
     iteration_duration.............: avg=91.98ms min=4.3ms   med=87.62ms  max=385.75ms p(90)=174.58ms p(95)=190.77ms p(99.9)=268.71ms
     iterations.....................: 155004  2487.721332/s
     success_rate...................: 100.00% ✓ 155004      ✗ 0     
     vus............................: 70      min=0         max=495 
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

     checks.........................: 100.00% ✓ 464217      ✗ 0     
     data_received..................: 14 GB   219 MB/s
     data_sent......................: 187 MB  3.0 MB/s
     http_req_blocked...............: avg=14.73µs min=901ns   med=2.08µs  max=66.33ms  p(90)=3.43µs   p(95)=4.47µs   p(99.9)=1.46ms  
     http_req_connecting............: avg=11.9µs  min=0s      med=0s      max=66.28ms  p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=91.38ms min=1.95ms  med=79.97ms max=1.88s    p(90)=173.36ms p(95)=195.9ms  p(99.9)=693.56ms
       { expected_response:true }...: avg=91.38ms min=1.95ms  med=79.97ms max=1.88s    p(90)=173.36ms p(95)=195.9ms  p(99.9)=693.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155739
     http_req_receiving.............: avg=1.3ms   min=51.31µs med=93.31µs max=765.59ms p(90)=1.51ms   p(95)=3.96ms   p(99.9)=96.47ms 
     http_req_sending...............: avg=57.69µs min=4.69µs  med=8.7µs   max=99.29ms  p(90)=15.64µs  p(95)=98.27µs  p(99.9)=8.09ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.01ms min=1.86ms  med=78.77ms max=1.88s    p(90)=171.87ms p(95)=193.76ms p(99.9)=615.56ms
     http_reqs......................: 155739  2497.338895/s
     iteration_duration.............: avg=92.2ms  min=2.79ms  med=80.91ms max=1.88s    p(90)=173.82ms p(95)=196.44ms p(99.9)=694.54ms
     iterations.....................: 154739  2481.303484/s
     success_rate...................: 100.00% ✓ 154739      ✗ 0     
     vus............................: 73      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 449100      ✗ 0     
     data_received..................: 13 GB   212 MB/s
     data_sent......................: 181 MB  2.9 MB/s
     http_req_blocked...............: avg=22µs    min=1µs     med=2.64µs   max=77.76ms  p(90)=4.21µs   p(95)=5.33µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=18.67µs min=0s      med=0s       max=77.7ms   p(90)=0s       p(95)=0s       p(99.9)=1.56ms  
     http_req_duration..............: avg=94.35ms min=1.96ms  med=82.9ms   max=983.2ms  p(90)=175.93ms p(95)=206.84ms p(99.9)=680.25ms
       { expected_response:true }...: avg=94.35ms min=1.96ms  med=82.9ms   max=983.2ms  p(90)=175.93ms p(95)=206.84ms p(99.9)=680.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150700
     http_req_receiving.............: avg=1.52ms  min=50.95µs med=103.29µs max=603.13ms p(90)=1.71ms   p(95)=4.77ms   p(99.9)=108.87ms
     http_req_sending...............: avg=70.78µs min=4.67µs  med=9.89µs   max=104.24ms p(90)=18.55µs  p(95)=117.94µs p(99.9)=9.23ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.75ms min=1.87ms  med=81.72ms  max=983.11ms p(90)=173.95ms p(95)=203.67ms p(99.9)=657.03ms
     http_reqs......................: 150700  2419.395052/s
     iteration_duration.............: avg=95.27ms min=3.56ms  med=83.91ms  max=983.38ms p(90)=176.73ms p(95)=207.87ms p(99.9)=681.12ms
     iterations.....................: 149700  2403.340672/s
     success_rate...................: 100.00% ✓ 149700      ✗ 0     
     vus............................: 71      min=0         max=495 
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

     checks.........................: 100.00% ✓ 228417      ✗ 0    
     data_received..................: 6.8 GB  108 MB/s
     data_sent......................: 93 MB   1.5 MB/s
     http_req_blocked...............: avg=5.48µs   min=1µs     med=2.24µs   max=8.22ms   p(90)=3.85µs   p(95)=4.79µs   p(99.9)=518.18µs
     http_req_connecting............: avg=2.56µs   min=0s      med=0s       max=8.15ms   p(90)=0s       p(95)=0s       p(99.9)=462.82µs
     http_req_duration..............: avg=184.94ms min=1.98ms  med=185.7ms  max=478.28ms p(90)=344.3ms  p(95)=368.51ms p(99.9)=434.97ms
       { expected_response:true }...: avg=184.94ms min=1.98ms  med=185.7ms  max=478.28ms p(90)=344.3ms  p(95)=368.51ms p(99.9)=434.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 77139
     http_req_receiving.............: avg=71.35µs  min=27.91µs med=58.84µs  max=19.36ms  p(90)=96.49µs  p(95)=110.89µs p(99.9)=943.66µs
     http_req_sending...............: avg=32.78µs  min=4.57µs  med=10.15µs  max=142.1ms  p(90)=17.1µs   p(95)=21.05µs  p(99.9)=3.47ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.83ms min=1.88ms  med=185.62ms max=478.21ms p(90)=344.24ms p(95)=368.41ms p(99.9)=434.91ms
     http_reqs......................: 77139   1233.30554/s
     iteration_duration.............: avg=187.59ms min=4.49ms  med=188.39ms max=478.45ms p(90)=345.11ms p(95)=369.05ms p(99.9)=435.2ms 
     iterations.....................: 76139   1217.317447/s
     success_rate...................: 100.00% ✓ 76139       ✗ 0    
     vus............................: 83      min=0         max=493
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

     checks.........................: 100.00% ✓ 104877     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 43 MB   672 kB/s
     http_req_blocked...............: avg=7.78µs   min=1.2µs   med=3.06µs   max=22.41ms  p(90)=4.77µs   p(95)=5.79µs   p(99.9)=716.74µs
     http_req_connecting............: avg=3.6µs    min=0s      med=0s       max=22.35ms  p(90)=0s       p(95)=0s       p(99.9)=635.48µs
     http_req_duration..............: avg=398.9ms  min=3.56ms  med=371.57ms max=1.56s    p(90)=788.34ms p(95)=852.95ms p(99.9)=1.26s   
       { expected_response:true }...: avg=398.9ms  min=3.56ms  med=371.57ms max=1.56s    p(90)=788.34ms p(95)=852.95ms p(99.9)=1.26s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35959
     http_req_receiving.............: avg=86.51µs  min=31.49µs med=71.5µs   max=156.57ms p(90)=109.29µs p(95)=123.9µs  p(99.9)=980.54µs
     http_req_sending...............: avg=29.15µs  min=5.53µs  med=13.82µs  max=84.24ms  p(90)=20.84µs  p(95)=23.88µs  p(99.9)=2.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=398.79ms min=3.45ms  med=371.48ms max=1.56s    p(90)=788.23ms p(95)=852.82ms p(99.9)=1.26s   
     http_reqs......................: 35959   559.422739/s
     iteration_duration.............: avg=410.54ms min=18.95ms med=385.65ms max=1.57s    p(90)=791.47ms p(95)=855.72ms p(99.9)=1.26s   
     iterations.....................: 34959   543.865501/s
     success_rate...................: 100.00% ✓ 34959      ✗ 0    
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

     checks.........................: 100.00% ✓ 48165      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   303 kB/s
     http_req_blocked...............: avg=11.2µs   min=1.18µs  med=3.17µs   max=18.59ms  p(90)=4.85µs  p(95)=6.13µs   p(99.9)=1.17ms
     http_req_connecting............: avg=6.58µs   min=0s      med=0s       max=18.53ms  p(90)=0s      p(95)=0s       p(99.9)=1.15ms
     http_req_duration..............: avg=841.62ms min=5.68ms  med=729.24ms max=19.77s   p(90)=1.42s   p(95)=1.55s    p(99.9)=18.22s
       { expected_response:true }...: avg=841.62ms min=5.68ms  med=729.24ms max=19.77s   p(90)=1.42s   p(95)=1.55s    p(99.9)=18.22s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17055
     http_req_receiving.............: avg=100.61µs min=33.19µs med=90.06µs  max=44.24ms  p(90)=128µs   p(95)=143.24µs p(99.9)=1.91ms
     http_req_sending...............: avg=44.53µs  min=5.52µs  med=17.16µs  max=128.94ms p(90)=22.48µs p(95)=26.79µs  p(99.9)=3.01ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=841.48ms min=5.54ms  med=729.12ms max=19.77s   p(90)=1.42s   p(95)=1.55s    p(99.9)=18.22s
     http_reqs......................: 17055   252.180567/s
     iteration_duration.............: avg=894.05ms min=13.75ms med=781.42ms max=19.77s   p(90)=1.44s   p(95)=1.56s    p(99.9)=18.37s
     iterations.....................: 16055   237.394254/s
     success_rate...................: 100.00% ✓ 16055      ✗ 0    
     vus............................: 86      min=0        max=500
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

     checks.........................: 100.00% ✓ 47856      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   283 kB/s
     http_req_blocked...............: avg=13.89µs  min=1.37µs  med=3.64µs   max=3.66ms  p(90)=5.29µs   p(95)=6.74µs   p(99.9)=2.11ms
     http_req_connecting............: avg=8.61µs   min=0s      med=0s       max=3.62ms  p(90)=0s       p(95)=0s       p(99.9)=2.08ms
     http_req_duration..............: avg=405.2ms  min=7.62ms  med=437.48ms max=1.49s   p(90)=757.91ms p(95)=818.77ms p(99.9)=1.17s 
       { expected_response:true }...: avg=405.2ms  min=7.62ms  med=437.48ms max=1.49s   p(90)=757.91ms p(95)=818.77ms p(99.9)=1.17s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16952
     http_req_receiving.............: avg=102.82µs min=34.71µs med=83.94µs  max=55.31ms p(90)=123.55µs p(95)=139.16µs p(99.9)=1.03ms
     http_req_sending...............: avg=43.12µs  min=6.22µs  med=16.46µs  max=85.12ms p(90)=22.06µs  p(95)=26.27µs  p(99.9)=5.54ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=405.06ms min=7.49ms  med=437.4ms  max=1.49s   p(90)=757.83ms p(95)=818.64ms p(99.9)=1.17s 
     http_reqs......................: 16952   231.406273/s
     iteration_duration.............: avg=430.57ms min=8.43ms  med=466ms    max=1.49s   p(90)=765.16ms p(95)=824.77ms p(99.9)=1.18s 
     iterations.....................: 15952   217.755597/s
     success_rate...................: 100.00% ✓ 15952      ✗ 0    
     vus............................: 61      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 438156      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=21.74µs  min=1.05µs  med=2.89µs  max=66.3ms   p(90)=4.67µs   p(95)=5.91µs   p(99.9)=2.08ms  
     http_req_connecting............: avg=18.17µs  min=0s      med=0s      max=66.13ms  p(90)=0s       p(95)=0s       p(99.9)=2.06ms  
     http_req_duration..............: avg=96.7ms   min=1.47ms  med=90.5ms  max=330.23ms p(90)=187.24ms p(95)=203.7ms  p(99.9)=264.65ms
       { expected_response:true }...: avg=96.7ms   min=1.47ms  med=90.5ms  max=330.23ms p(90)=187.24ms p(95)=203.7ms  p(99.9)=264.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147052
     http_req_receiving.............: avg=820.49µs min=52.95µs med=121.3µs max=104.38ms p(90)=1.65ms   p(95)=2.79ms   p(99.9)=30.92ms 
     http_req_sending...............: avg=69.04µs  min=4.72µs  med=10.61µs max=110.41ms p(90)=21.88µs  p(95)=126.36µs p(99.9)=8.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.81ms  min=1.4ms   med=89.6ms  max=329.74ms p(90)=186.37ms p(95)=202.78ms p(99.9)=263.28ms
     http_reqs......................: 147052  2379.180894/s
     iteration_duration.............: avg=97.64ms  min=3.05ms  med=91.5ms  max=344.93ms p(90)=187.73ms p(95)=204.2ms  p(99.9)=265.43ms
     iterations.....................: 146052  2363.001714/s
     success_rate...................: 100.00% ✓ 146052      ✗ 0     
     vus............................: 93      min=0         max=500 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 430455      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=15.43µs min=842ns   med=2.32µs   max=62.33ms p(90)=4.1µs    p(95)=5.28µs   p(99.9)=1.06ms  
     http_req_connecting............: avg=12.35µs min=0s      med=0s       max=62.26ms p(90)=0s       p(95)=0s       p(99.9)=979.61µs
     http_req_duration..............: avg=98.53ms min=1.56ms  med=84.38ms  max=1.83s   p(90)=188.08ms p(95)=217.28ms p(99.9)=954.77ms
       { expected_response:true }...: avg=98.53ms min=1.56ms  med=84.38ms  max=1.83s   p(90)=188.08ms p(95)=217.28ms p(99.9)=954.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144485
     http_req_receiving.............: avg=1.24ms  min=51.08µs med=102.57µs max=1.05s   p(90)=1.52ms   p(95)=3.91ms   p(99.9)=76.25ms 
     http_req_sending...............: avg=66.6µs  min=4.71µs  med=9.7µs    max=257.4ms p(90)=20.03µs  p(95)=109.6µs  p(99.9)=8.84ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.22ms min=1.46ms  med=83.29ms  max=1.76s   p(90)=186.37ms p(95)=214.24ms p(99.9)=937.9ms 
     http_reqs......................: 144485  2332.194035/s
     iteration_duration.............: avg=99.47ms min=2.87ms  med=85.4ms   max=1.83s   p(90)=188.75ms p(95)=218.04ms p(99.9)=955.97ms
     iterations.....................: 143485  2316.052608/s
     success_rate...................: 100.00% ✓ 143485      ✗ 0     
     vus............................: 55      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 424368      ✗ 0     
     data_received..................: 13 GB   202 MB/s
     data_sent......................: 171 MB  2.8 MB/s
     http_req_blocked...............: avg=21.73µs  min=1.05µs  med=2.98µs  max=75.1ms   p(90)=4.79µs   p(95)=6.03µs   p(99.9)=2.07ms  
     http_req_connecting............: avg=17.91µs  min=0s      med=0s      max=74.92ms  p(90)=0s       p(95)=0s       p(99.9)=1.97ms  
     http_req_duration..............: avg=99.9ms   min=1.58ms  med=84.49ms max=2.02s    p(90)=191.63ms p(95)=227.67ms p(99.9)=954.03ms
       { expected_response:true }...: avg=99.9ms   min=1.58ms  med=84.49ms max=2.02s    p(90)=191.63ms p(95)=227.67ms p(99.9)=954.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142456
     http_req_receiving.............: avg=1.78ms   min=54.89µs med=111.3µs max=924.63ms p(90)=1.75ms   p(95)=5.01ms   p(99.9)=119.41ms
     http_req_sending...............: avg=77.98µs  min=5.25µs  med=11.23µs max=112.21ms p(90)=21.31µs  p(95)=121.71µs p(99.9)=10.34ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.04ms  min=1.49ms  med=83.23ms max=2.02s    p(90)=189.19ms p(95)=222.69ms p(99.9)=802.54ms
     http_reqs......................: 142456  2299.756694/s
     iteration_duration.............: avg=100.92ms min=2.74ms  med=85.51ms max=2.02s    p(90)=192.46ms p(95)=228.56ms p(99.9)=955.1ms 
     iterations.....................: 141456  2283.613066/s
     success_rate...................: 100.00% ✓ 141456      ✗ 0     
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

     checks.........................: 100.00% ✓ 409515      ✗ 0     
     data_received..................: 12 GB   195 MB/s
     data_sent......................: 165 MB  2.7 MB/s
     http_req_blocked...............: avg=9.57µs   min=902ns   med=2.34µs   max=36.58ms  p(90)=4.04µs   p(95)=5.2µs    p(99.9)=501.19µs
     http_req_connecting............: avg=6.44µs   min=0s      med=0s       max=36.4ms   p(90)=0s       p(95)=0s       p(99.9)=425.3µs 
     http_req_duration..............: avg=103.48ms min=1.46ms  med=99.13ms  max=340.01ms p(90)=198.84ms p(95)=214.8ms  p(99.9)=250.88ms
       { expected_response:true }...: avg=103.48ms min=1.46ms  med=99.13ms  max=340.01ms p(90)=198.84ms p(95)=214.8ms  p(99.9)=250.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137505
     http_req_receiving.............: avg=96.64µs  min=26.52µs med=55.17µs  max=49.53ms  p(90)=102.79µs p(95)=275.52µs p(99.9)=5.33ms  
     http_req_sending...............: avg=50.23µs  min=4.88µs  med=10.32µs  max=179.35ms p(90)=17.73µs  p(95)=98.58µs  p(99.9)=6.44ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.33ms min=1.42ms  med=98.98ms  max=339.82ms p(90)=198.67ms p(95)=214.6ms  p(99.9)=250.41ms
     http_reqs......................: 137505  2224.293887/s
     iteration_duration.............: avg=104.46ms min=3.7ms   med=100.37ms max=350.23ms p(90)=199.27ms p(95)=215.24ms p(99.9)=251.32ms
     iterations.....................: 136505  2208.117792/s
     success_rate...................: 100.00% ✓ 136505      ✗ 0     
     vus............................: 93      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 388698      ✗ 0     
     data_received..................: 11 GB   184 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=14.99µs  min=922ns   med=2.62µs   max=98.11ms  p(90)=4.47µs   p(95)=5.63µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=11.71µs  min=0s      med=0s       max=97.91ms  p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=109.02ms min=1.77ms  med=92.13ms  max=1.33s    p(90)=205.75ms p(95)=239.92ms p(99.9)=890.69ms
       { expected_response:true }...: avg=109.02ms min=1.77ms  med=92.13ms  max=1.33s    p(90)=205.75ms p(95)=239.92ms p(99.9)=890.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130566
     http_req_receiving.............: avg=1.97ms   min=54.16µs med=119.04µs max=800.32ms p(90)=2.11ms   p(95)=5.32ms   p(99.9)=141.6ms 
     http_req_sending...............: avg=61.77µs  min=4.82µs  med=10.31µs  max=208.15ms p(90)=20.25µs  p(95)=100.73µs p(99.9)=8.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.98ms min=1.64ms  med=90.74ms  max=1.33s    p(90)=203.48ms p(95)=236ms    p(99.9)=845.52ms
     http_reqs......................: 130566  2096.4218/s
     iteration_duration.............: avg=110.12ms min=3.56ms  med=93.27ms  max=1.33s    p(90)=206.41ms p(95)=240.71ms p(99.9)=891.09ms
     iterations.....................: 129566  2080.365386/s
     success_rate...................: 100.00% ✓ 129566      ✗ 0     
     vus............................: 70      min=0         max=495 
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

     checks.........................: 100.00% ✓ 214005      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=6.08µs   min=932ns   med=2.48µs   max=17.14ms  p(90)=4.38µs   p(95)=5.4µs    p(99.9)=553.05µs
     http_req_connecting............: avg=2.91µs   min=0s      med=0s       max=17.09ms  p(90)=0s       p(95)=0s       p(99.9)=494.11µs
     http_req_duration..............: avg=197.26ms min=1.93ms  med=196.41ms max=541.11ms p(90)=366.01ms p(95)=392.92ms p(99.9)=473.29ms
       { expected_response:true }...: avg=197.26ms min=1.93ms  med=196.41ms max=541.11ms p(90)=366.01ms p(95)=392.92ms p(99.9)=473.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72335
     http_req_receiving.............: avg=77.7µs   min=27.41µs med=64.85µs  max=82.04ms  p(90)=106.85µs p(95)=122.36µs p(99.9)=987.58µs
     http_req_sending...............: avg=29.63µs  min=4.89µs  med=11.32µs  max=126.25ms p(90)=19.46µs  p(95)=23.19µs  p(99.9)=3.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.15ms min=1.87ms  med=196.32ms max=541.04ms p(90)=365.89ms p(95)=392.8ms  p(99.9)=473.2ms 
     http_reqs......................: 72335   1156.004048/s
     iteration_duration.............: avg=200.28ms min=4.4ms   med=200.17ms max=541.24ms p(90)=366.86ms p(95)=393.49ms p(99.9)=473.64ms
     iterations.....................: 71335   1140.022794/s
     success_rate...................: 100.00% ✓ 71335       ✗ 0    
     vus............................: 83      min=0         max=495
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

     checks.........................: 100.00% ✓ 98931      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   632 kB/s
     http_req_blocked...............: avg=8.08µs   min=1µs     med=2.71µs   max=9.53ms   p(90)=4.41µs   p(95)=5.38µs   p(99.9)=1.14ms  
     http_req_connecting............: avg=4.38µs   min=0s      med=0s       max=9.47ms   p(90)=0s       p(95)=0s       p(99.9)=974.64µs
     http_req_duration..............: avg=422.14ms min=3.74ms  med=395.15ms max=1.74s    p(90)=829.57ms p(95)=899.49ms p(99.9)=1.36s   
       { expected_response:true }...: avg=422.14ms min=3.74ms  med=395.15ms max=1.74s    p(90)=829.57ms p(95)=899.49ms p(99.9)=1.36s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33977
     http_req_receiving.............: avg=91.09µs  min=29.72µs med=70.97µs  max=180.93ms p(90)=109.98µs p(95)=124.72µs p(99.9)=1.03ms  
     http_req_sending...............: avg=39.37µs  min=5.01µs  med=12.82µs  max=142.77ms p(90)=20.46µs  p(95)=23.41µs  p(99.9)=3ms     
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=422.01ms min=3.61ms  med=395.05ms max=1.74s    p(90)=829.49ms p(95)=899.37ms p(99.9)=1.36s   
     http_reqs......................: 33977   526.214976/s
     iteration_duration.............: avg=435.15ms min=15.93ms med=411.62ms max=1.74s    p(90)=832.89ms p(95)=903.57ms p(99.9)=1.36s   
     iterations.....................: 32977   510.727588/s
     success_rate...................: 100.00% ✓ 32977      ✗ 0    
     vus............................: 83      min=0        max=500
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

     checks.........................: 100.00% ✓ 46005      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   286 kB/s
     http_req_blocked...............: avg=12.71µs  min=1.24µs  med=3.68µs   max=9.95ms  p(90)=5.61µs   p(95)=7.44µs   p(99.9)=1.3ms 
     http_req_connecting............: avg=7.19µs   min=0s      med=0s       max=9.86ms  p(90)=0s       p(95)=0s       p(99.9)=1.27ms
     http_req_duration..............: avg=888.83ms min=7.56ms  med=802.11ms max=3.03s   p(90)=1.82s    p(95)=1.93s    p(99.9)=2.69s 
       { expected_response:true }...: avg=888.83ms min=7.56ms  med=802.11ms max=3.03s   p(90)=1.82s    p(95)=1.93s    p(99.9)=2.69s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16335
     http_req_receiving.............: avg=103.13µs min=32.18µs med=93.27µs  max=33.56ms p(90)=133.13µs p(95)=150.98µs p(99.9)=1.1ms 
     http_req_sending...............: avg=36.36µs  min=6.16µs  med=18.42µs  max=57.98ms p(90)=24.42µs  p(95)=29.23µs  p(99.9)=4.14ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=888.69ms min=7.48ms  med=801.97ms max=3.03s   p(90)=1.82s    p(95)=1.93s    p(99.9)=2.69s 
     http_reqs......................: 16335   238.003879/s
     iteration_duration.............: avg=946.76ms min=40.13ms med=868.69ms max=3.04s   p(90)=1.83s    p(95)=1.94s    p(99.9)=2.73s 
     iterations.....................: 15335   223.433699/s
     success_rate...................: 100.00% ✓ 15335      ✗ 0    
     vus............................: 85      min=0        max=500
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

     checks.........................: 100.00% ✓ 45333      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   285 kB/s
     http_req_blocked...............: avg=14.82µs  min=1.47µs  med=3.65µs   max=3.74ms  p(90)=5.41µs   p(95)=7.16µs   p(99.9)=2.25ms  
     http_req_connecting............: avg=9.33µs   min=0s      med=0s       max=3.57ms  p(90)=0s       p(95)=0s       p(99.9)=2.23ms  
     http_req_duration..............: avg=904.08ms min=5.79ms  med=818.91ms max=4.87s   p(90)=1.82s    p(95)=2s       p(99.9)=4.36s   
       { expected_response:true }...: avg=904.08ms min=5.79ms  med=818.91ms max=4.87s   p(90)=1.82s    p(95)=2s       p(99.9)=4.36s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16111
     http_req_receiving.............: avg=97.2µs   min=37.39µs med=88.12µs  max=32.83ms p(90)=124.04µs p(95)=139.47µs p(99.9)=982.61µs
     http_req_sending...............: avg=27.06µs  min=6.51µs  med=17.17µs  max=11.53ms p(90)=22.92µs  p(95)=27.96µs  p(99.9)=2.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=903.95ms min=5.72ms  med=818.8ms  max=4.87s   p(90)=1.82s    p(95)=2s       p(99.9)=4.36s   
     http_reqs......................: 16111   237.647083/s
     iteration_duration.............: avg=963.86ms min=31.55ms med=895.54ms max=4.88s   p(90)=1.85s    p(95)=2.01s    p(99.9)=4.39s   
     iterations.....................: 15111   222.896473/s
     success_rate...................: 100.00% ✓ 15111      ✗ 0    
     vus............................: 100     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

