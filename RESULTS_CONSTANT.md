## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,877 | 3,151 | 2,831 | 3.9% |  |
| fusion-nightly | 16.6.0-p.6 | 2,660 | 2,779 | 2,638 | 1.8% |  |
| fusion-nightly-net11 | 16.6.0-p.6 | 2,648 | 2,780 | 2,637 | 1.9% |  |
| fusion | 16.5.1 | 2,589 | 2,684 | 2,582 | 1.4% |  |
| grafbase | 0.53.5 | 2,165 | 2,272 | 2,143 | 1.9% |  |
| cosmo | 0.334.0 | 1,298 | 1,334 | 1,285 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 608 | 625 | 607 | 1.0% |  |
| apollo-router | v2.16.1 | 480 | 488 | 473 | 1.0% |  |
| apollo-gateway | 2.14.3 | 282 | 285 | 281 | 0.5% |  |
| hive-gateway | 2.10.8 | 271 | 280 | 271 | 1.1% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1401 across 9/9 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,541 | 2,720 | 2,527 | 2.6% |  |
| fusion-nightly-net11 | 16.6.0-p.6 | 2,537 | 2,643 | 2,520 | 1.7% |  |
| fusion | 16.5.1 | 2,436 | 2,546 | 2,429 | 1.7% |  |
| fusion-nightly | 16.6.0-p.6 | 2,368 | 2,497 | 2,356 | 2.1% |  |
| fusion-nightly-fed | 16.6.0-p.6 | 2,202 | 2,295 | 2,185 | 1.7% |  |
| grafbase | 0.53.5 | 1,667 | 1,717 | 1,663 | 1.1% |  |
| cosmo | 0.334.0 | 1,196 | 1,243 | 1,191 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 583 | 600 | 576 | 1.3% |  |
| apollo-router | v2.16.1 | 415 | 429 | 404 | 1.8% |  |
| apollo-gateway | 2.14.3 | 266 | 272 | 265 | 0.8% |  |
| hive-gateway | 2.10.8 | 260 | 268 | 258 | 1.4% |  |
| feddi | 5ff8b6165878 | 18 | 18 | 17 | 1.9% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1037295     ✗ 0     
     data_received..................: 30 GB   252 MB/s
     data_sent......................: 416 MB  3.5 MB/s
     http_req_blocked...............: avg=2.79µs  min=901ns   med=1.9µs   max=17.45ms  p(90)=3.13µs  p(95)=3.74µs   p(99.9)=33.08µs
     http_req_connecting............: avg=236ns   min=0s      med=0s      max=3.3ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.14ms min=1.45ms  med=16.61ms max=280.28ms p(90)=24.81ms p(95)=27.75ms  p(99.9)=46.4ms 
       { expected_response:true }...: avg=17.14ms min=1.45ms  med=16.61ms max=280.28ms p(90)=24.81ms p(95)=27.75ms  p(99.9)=46.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 345865
     http_req_receiving.............: avg=80.95µs min=25.89µs med=45.91µs max=30.33ms  p(90)=81.39µs p(95)=124.13µs p(99.9)=6.24ms 
     http_req_sending...............: avg=42.93µs min=4.16µs  med=8.11µs  max=113.26ms p(90)=14.29µs p(95)=80.02µs  p(99.9)=4.75ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=17.02ms min=1.37ms  med=16.51ms max=269.72ms p(90)=24.66ms p(95)=27.54ms  p(99.9)=45.47ms
     http_reqs......................: 345865  2877.91085/s
     iteration_duration.............: avg=17.34ms min=2ms     med=16.8ms  max=288.88ms p(90)=25.01ms p(95)=27.96ms  p(99.9)=47.06ms
     iterations.....................: 345765  2877.078759/s
     success_rate...................: 100.00% ✓ 345765      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 959439      ✗ 0     
     data_received..................: 28 GB   233 MB/s
     data_sent......................: 384 MB  3.2 MB/s
     http_req_blocked...............: avg=3.18µs   min=1.04µs  med=2.31µs  max=17.49ms  p(90)=3.62µs  p(95)=4.24µs  p(99.9)=32.7µs  
     http_req_connecting............: avg=324ns    min=0s      med=0s      max=3.82ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.54ms  min=1.98ms  med=16ms    max=281.09ms p(90)=30.05ms p(95)=36.33ms p(99.9)=116.64ms
       { expected_response:true }...: avg=18.54ms  min=1.98ms  med=16ms    max=281.09ms p(90)=30.05ms p(95)=36.33ms p(99.9)=116.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 319913
     http_req_receiving.............: avg=546.56µs min=49.57µs med=91.03µs max=249.21ms p(90)=1.06ms  p(95)=1.9ms   p(99.9)=24.45ms 
     http_req_sending...............: avg=42.52µs  min=4.51µs  med=8.76µs  max=119.51ms p(90)=15.29µs p(95)=92.94µs p(99.9)=3.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=17.95ms  min=1.89ms  med=15.48ms max=276.59ms p(90)=29.15ms p(95)=35.28ms p(99.9)=115.2ms 
     http_reqs......................: 319913  2660.168367/s
     iteration_duration.............: avg=18.75ms  min=3.03ms  med=16.2ms  max=294.18ms p(90)=30.27ms p(95)=36.58ms p(99.9)=117.8ms 
     iterations.....................: 319813  2659.336838/s
     success_rate...................: 100.00% ✓ 319813      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 955188      ✗ 0     
     data_received..................: 28 GB   232 MB/s
     data_sent......................: 383 MB  3.2 MB/s
     http_req_blocked...............: avg=2.78µs   min=812ns   med=1.91µs   max=15.04ms  p(90)=3.24µs  p(95)=3.88µs  p(99.9)=28.28µs
     http_req_connecting............: avg=297ns    min=0s      med=0s       max=3.83ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.62ms  min=1.89ms  med=17.72ms  max=291.23ms p(90)=26.69ms p(95)=30.24ms p(99.9)=51.12ms
       { expected_response:true }...: avg=18.62ms  min=1.89ms  med=17.72ms  max=291.23ms p(90)=26.69ms p(95)=30.24ms p(99.9)=51.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 318496
     http_req_receiving.............: avg=663.69µs min=50.61µs med=100.89µs max=211.76ms p(90)=1.71ms  p(95)=2.55ms  p(99.9)=20.43ms
     http_req_sending...............: avg=45.44µs  min=4.52µs  med=8.27µs   max=103.31ms p(90)=16.52µs p(95)=89.1µs  p(99.9)=4.88ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.91ms  min=1.8ms   med=17.02ms  max=290.77ms p(90)=25.82ms p(95)=29.31ms p(99.9)=49.2ms 
     http_reqs......................: 318496  2648.684609/s
     iteration_duration.............: avg=18.83ms  min=3.26ms  med=17.92ms  max=300.76ms p(90)=26.9ms  p(95)=30.48ms p(99.9)=51.72ms
     iterations.....................: 318396  2647.852986/s
     success_rate...................: 100.00% ✓ 318396      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 933963      ✗ 0     
     data_received..................: 27 GB   227 MB/s
     data_sent......................: 374 MB  3.1 MB/s
     http_req_blocked...............: avg=2.74µs   min=892ns   med=1.97µs  max=10.67ms  p(90)=3.21µs  p(95)=3.78µs  p(99.9)=33.64µs 
     http_req_connecting............: avg=299ns    min=0s      med=0s      max=3.9ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.05ms  min=2.01ms  med=16.39ms max=305.61ms p(90)=30.9ms  p(95)=37.5ms  p(99.9)=123.99ms
       { expected_response:true }...: avg=19.05ms  min=2.01ms  med=16.39ms max=305.61ms p(90)=30.9ms  p(95)=37.5ms  p(99.9)=123.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 311421
     http_req_receiving.............: avg=560.04µs min=51.11µs med=89.69µs max=186.74ms p(90)=1.05ms  p(95)=1.86ms  p(99.9)=26.32ms 
     http_req_sending...............: avg=42.32µs  min=4.45µs  med=8.05µs  max=142.83ms p(90)=14.16µs p(95)=79.54µs p(99.9)=3.81ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.45ms  min=1.92ms  med=15.86ms max=305.51ms p(90)=29.94ms p(95)=36.44ms p(99.9)=122.02ms
     http_reqs......................: 311421  2589.604482/s
     iteration_duration.............: avg=19.26ms  min=3ms     med=16.58ms max=305.84ms p(90)=31.12ms p(95)=37.73ms p(99.9)=124.86ms
     iterations.....................: 311321  2588.772937/s
     success_rate...................: 100.00% ✓ 311321      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 780696      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 313 MB  2.6 MB/s
     http_req_blocked...............: avg=3.16µs  min=922ns   med=2.25µs  max=17.5ms   p(90)=3.91µs  p(95)=4.71µs   p(99.9)=32.41µs
     http_req_connecting............: avg=368ns   min=0s      med=0s      max=4.04ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.83ms min=1.72ms  med=22.59ms max=302.26ms p(90)=27.08ms p(95)=28.87ms  p(99.9)=47.64ms
       { expected_response:true }...: avg=22.83ms min=1.72ms  med=22.59ms max=302.26ms p(90)=27.08ms p(95)=28.87ms  p(99.9)=47.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 260332
     http_req_receiving.............: avg=88.62µs min=26.34µs med=52.77µs max=149.8ms  p(90)=91.65µs p(95)=117.31µs p(99.9)=6.61ms 
     http_req_sending...............: avg=34.85µs min=4.74µs  med=9.54µs  max=155.43ms p(90)=16.7µs  p(95)=25.76µs  p(99.9)=1.69ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.71ms min=1.62ms  med=22.5ms  max=302.05ms p(90)=26.95ms p(95)=28.68ms  p(99.9)=46.45ms
     http_reqs......................: 260332  2165.369524/s
     iteration_duration.............: avg=23.04ms min=4.12ms  med=22.79ms max=317.46ms p(90)=27.28ms p(95)=29.08ms  p(99.9)=48.04ms
     iterations.....................: 260232  2164.537752/s
     success_rate...................: 100.00% ✓ 260232      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 468048      ✗ 0     
     data_received..................: 14 GB   114 MB/s
     data_sent......................: 188 MB  1.6 MB/s
     http_req_blocked...............: avg=3.28µs  min=1.07µs  med=2.36µs  max=3.89ms   p(90)=3.71µs  p(95)=4.3µs    p(99.9)=33.35µs 
     http_req_connecting............: avg=629ns   min=0s      med=0s      max=3.85ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.23ms min=1.96ms  med=37.8ms  max=315.44ms p(90)=53.53ms p(95)=58.31ms  p(99.9)=80.7ms  
       { expected_response:true }...: avg=38.23ms min=1.96ms  med=37.8ms  max=315.44ms p(90)=53.53ms p(95)=58.31ms  p(99.9)=80.7ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 156116
     http_req_receiving.............: avg=69.16µs min=26.47µs med=57.3µs  max=24.82ms  p(90)=91.3µs  p(95)=106.38µs p(99.9)=830.6µs 
     http_req_sending...............: avg=23.2µs  min=4.97µs  med=10.18µs max=108.29ms p(90)=15.62µs p(95)=19.39µs  p(99.9)=881.25µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.13ms min=1.9ms   med=37.71ms max=315.29ms p(90)=53.43ms p(95)=58.21ms  p(99.9)=80.46ms 
     http_reqs......................: 156116  1298.083307/s
     iteration_duration.............: avg=38.45ms min=3.51ms  med=38ms    max=343.71ms p(90)=53.72ms p(95)=58.5ms   p(99.9)=81.22ms 
     iterations.....................: 156016  1297.251821/s
     success_rate...................: 100.00% ✓ 156016      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 219537     ✗ 0    
     data_received..................: 6.4 GB  53 MB/s
     data_sent......................: 88 MB   731 kB/s
     http_req_blocked...............: avg=4.42µs   min=1.24µs  med=2.96µs  max=3.59ms   p(90)=4.4µs    p(95)=5.02µs   p(99.9)=43.96µs 
     http_req_connecting............: avg=1.18µs   min=0s      med=0s      max=3.55ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.65ms  min=3.56ms  med=79.75ms max=345.43ms p(90)=100.53ms p(95)=110.5ms  p(99.9)=193.78ms
       { expected_response:true }...: avg=81.65ms  min=3.56ms  med=79.75ms max=345.43ms p(90)=100.53ms p(95)=110.5ms  p(99.9)=193.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73279
     http_req_receiving.............: avg=142.36µs min=31.04µs med=70.22µs max=200ms    p(90)=105.67µs p(95)=118.78µs p(99.9)=872.24µs
     http_req_sending...............: avg=21.33µs  min=5.43µs  med=13.41µs max=117.11ms p(90)=19.72µs  p(95)=22.06µs  p(99.9)=628.32µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.49ms  min=3.5ms   med=79.65ms max=218.8ms  p(90)=100.41ms p(95)=110.35ms p(99.9)=188.38ms
     http_reqs......................: 73279   608.183153/s
     iteration_duration.............: avg=82ms     min=5.25ms  med=79.99ms max=355.19ms p(90)=100.78ms p(95)=110.75ms p(99.9)=195.65ms
     iterations.....................: 73179   607.353197/s
     success_rate...................: 100.00% ✓ 73179      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.16.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 173517     ✗ 0    
     data_received..................: 5.1 GB  42 MB/s
     data_sent......................: 70 MB   577 kB/s
     http_req_blocked...............: avg=4.93µs   min=1.21µs  med=3.23µs   max=3.88ms   p(90)=4.55µs   p(95)=5.12µs   p(99.9)=53.06µs 
     http_req_connecting............: avg=1.49µs   min=0s      med=0s       max=3.84ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=103.33ms min=4.44ms  med=103.08ms max=310.34ms p(90)=124.78ms p(95)=131.05ms p(99.9)=161.28ms
       { expected_response:true }...: avg=103.33ms min=4.44ms  med=103.08ms max=310.34ms p(90)=124.78ms p(95)=131.05ms p(99.9)=161.28ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 57939
     http_req_receiving.............: avg=84.91µs  min=31.29µs med=76.04µs  max=177.04ms p(90)=107.37µs p(95)=120.11µs p(99.9)=566.19µs
     http_req_sending...............: avg=24.06µs  min=5.51µs  med=15.56µs  max=87.14ms  p(90)=20.85µs  p(95)=22.69µs  p(99.9)=553.99µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.22ms min=4.32ms  med=102.97ms max=294.7ms  p(90)=124.68ms p(95)=130.93ms p(99.9)=160.48ms
     http_reqs......................: 57939   480.53922/s
     iteration_duration.............: avg=103.76ms min=18.94ms med=103.34ms max=317.67ms p(90)=125.03ms p(95)=131.29ms p(99.9)=162.67ms
     iterations.....................: 57839   479.709832/s
     success_rate...................: 100.00% ✓ 57839      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 102339     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   340 kB/s
     http_req_blocked...............: avg=6.13µs   min=1.18µs  med=3.13µs   max=3.41ms   p(90)=4.35µs   p(95)=4.86µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=2.76µs   min=0s      med=0s       max=3.36ms   p(90)=0s       p(95)=0s       p(99.9)=1.51ms  
     http_req_duration..............: avg=175.19ms min=7.3ms   med=173.79ms max=389.08ms p(90)=198.51ms p(95)=203.65ms p(99.9)=265.25ms
       { expected_response:true }...: avg=175.19ms min=7.3ms   med=173.79ms max=389.08ms p(90)=198.51ms p(95)=203.65ms p(99.9)=265.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34213
     http_req_receiving.............: avg=87.79µs  min=33.07µs med=80.42µs  max=116.36ms p(90)=110.16µs p(95)=120.58µs p(99.9)=485.24µs
     http_req_sending...............: avg=30.42µs  min=4.99µs  med=16.14µs  max=157.87ms p(90)=20.43µs  p(95)=22.09µs  p(99.9)=487.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.07ms min=7.21ms  med=173.68ms max=388.62ms p(90)=198.42ms p(95)=203.55ms p(99.9)=264.67ms
     http_reqs......................: 34213   282.967171/s
     iteration_duration.............: avg=175.97ms min=55.75ms med=174.2ms  max=399.67ms p(90)=198.79ms p(95)=203.94ms p(99.9)=269.93ms
     iterations.....................: 34113   282.140096/s
     success_rate...................: 100.00% ✓ 34113      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 98079      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   326 kB/s
     http_req_blocked...............: avg=6.48µs   min=1.59µs  med=3.6µs    max=3.48ms   p(90)=4.97µs   p(95)=5.57µs   p(99.9)=1.24ms  
     http_req_connecting............: avg=2.63µs   min=0s      med=0s       max=3.44ms   p(90)=0s       p(95)=0s       p(99.9)=1.22ms  
     http_req_duration..............: avg=182.78ms min=5.97ms  med=167.02ms max=670.17ms p(90)=212.12ms p(95)=252.82ms p(99.9)=585.18ms
       { expected_response:true }...: avg=182.78ms min=5.97ms  med=167.02ms max=670.17ms p(90)=212.12ms p(95)=252.82ms p(99.9)=585.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32793
     http_req_receiving.............: avg=97.33µs  min=35.83µs med=87.91µs  max=141.39ms p(90)=118.18µs p(95)=129.17µs p(99.9)=716.1µs 
     http_req_sending...............: avg=27.97µs  min=6.21µs  med=17.69µs  max=76.53ms  p(90)=22.39µs  p(95)=24.27µs  p(99.9)=573.32µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.65ms min=5.89ms  med=166.9ms  max=670.06ms p(90)=211.98ms p(95)=252.68ms p(99.9)=585.04ms
     http_reqs......................: 32793   271.415597/s
     iteration_duration.............: avg=183.61ms min=31.02ms med=167.37ms max=670.42ms p(90)=212.62ms p(95)=254.39ms p(99.9)=585.45ms
     iterations.....................: 32693   270.587934/s
     success_rate...................: 100.00% ✓ 32693      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 916452      ✗ 0     
     data_received..................: 27 GB   222 MB/s
     data_sent......................: 367 MB  3.1 MB/s
     http_req_blocked...............: avg=3µs     min=922ns   med=2.2µs   max=11.11ms  p(90)=3.9µs   p(95)=4.7µs    p(99.9)=37.65µs
     http_req_connecting............: avg=270ns   min=0s      med=0s      max=3.32ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.41ms min=1.73ms  med=19.1ms  max=302.79ms p(90)=26.87ms p(95)=29.31ms  p(99.9)=48.9ms 
       { expected_response:true }...: avg=19.41ms min=1.73ms  med=19.1ms  max=302.79ms p(90)=26.87ms p(95)=29.31ms  p(99.9)=48.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 305584
     http_req_receiving.............: avg=88.25µs min=26.08µs med=50.12µs max=117.02ms p(90)=92.77µs p(95)=132.05µs p(99.9)=6.33ms 
     http_req_sending...............: avg=42.47µs min=4.57µs  med=9.47µs  max=109.08ms p(90)=18.29µs p(95)=82.6µs   p(99.9)=3.51ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.28ms min=1.68ms  med=18.99ms max=302.23ms p(90)=26.72ms p(95)=29.12ms  p(99.9)=47.58ms
     http_reqs......................: 305584  2541.846555/s
     iteration_duration.............: avg=19.63ms min=3.17ms  med=19.3ms  max=313.9ms  p(90)=27.08ms p(95)=29.52ms  p(99.9)=49.49ms
     iterations.....................: 305484  2541.014755/s
     success_rate...................: 100.00% ✓ 305484      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 914889      ✗ 0     
     data_received..................: 27 GB   223 MB/s
     data_sent......................: 367 MB  3.0 MB/s
     http_req_blocked...............: avg=3.23µs   min=912ns   med=2.35µs   max=17.6ms   p(90)=3.98µs  p(95)=4.71µs  p(99.9)=35.06µs
     http_req_connecting............: avg=318ns    min=0s      med=0s       max=4.13ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.44ms  min=1.51ms  med=18.56ms  max=283.39ms p(90)=27.98ms p(95)=31.57ms p(99.9)=52.73ms
       { expected_response:true }...: avg=19.44ms  min=1.51ms  med=18.56ms  max=283.39ms p(90)=27.98ms p(95)=31.57ms p(99.9)=52.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 305063
     http_req_receiving.............: avg=751.48µs min=50.68µs med=107.15µs max=105.24ms p(90)=1.98ms  p(95)=2.99ms  p(99.9)=21.41ms
     http_req_sending...............: avg=45.12µs  min=4.55µs  med=9.07µs   max=127.25ms p(90)=18.32µs p(95)=89.21µs p(99.9)=4.18ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.64ms  min=1.38ms  med=17.76ms  max=282.73ms p(90)=27.04ms p(95)=30.57ms p(99.9)=50.54ms
     http_reqs......................: 305063  2537.996399/s
     iteration_duration.............: avg=19.66ms  min=2.52ms  med=18.77ms  max=318.45ms p(90)=28.2ms  p(95)=31.8ms  p(99.9)=53.51ms
     iterations.....................: 304963  2537.164441/s
     success_rate...................: 100.00% ✓ 304963      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 878271      ✗ 0     
     data_received..................: 26 GB   214 MB/s
     data_sent......................: 352 MB  2.9 MB/s
     http_req_blocked...............: avg=2.89µs   min=862ns   med=2.09µs  max=18.63ms  p(90)=3.56µs  p(95)=4.25µs  p(99.9)=32.46µs 
     http_req_connecting............: avg=306ns    min=0s      med=0s      max=3.74ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.26ms  min=1.59ms  med=17.03ms max=702.39ms p(90)=33.15ms p(95)=40.6ms  p(99.9)=143.75ms
       { expected_response:true }...: avg=20.26ms  min=1.59ms  med=17.03ms max=702.39ms p(90)=33.15ms p(95)=40.6ms  p(99.9)=143.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 292857
     http_req_receiving.............: avg=556.56µs min=49.86µs med=93.96µs max=258.23ms p(90)=1.05ms  p(95)=1.8ms   p(99.9)=28.12ms 
     http_req_sending...............: avg=40.41µs  min=4.66µs  med=8.75µs  max=148.16ms p(90)=17µs    p(95)=80.15µs p(99.9)=3.01ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.67ms  min=1.48ms  med=16.52ms max=702.31ms p(90)=32.19ms p(95)=39.46ms p(99.9)=141.72ms
     http_reqs......................: 292857  2436.293611/s
     iteration_duration.............: avg=20.48ms  min=2.69ms  med=17.24ms max=702.58ms p(90)=33.37ms p(95)=40.85ms p(99.9)=144.76ms
     iterations.....................: 292757  2435.461706/s
     success_rate...................: 100.00% ✓ 292757      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 853923      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 342 MB  2.8 MB/s
     http_req_blocked...............: avg=3.26µs   min=1.03µs  med=2.57µs   max=4.26ms   p(90)=3.99µs  p(95)=4.66µs  p(99.9)=34.08µs 
     http_req_connecting............: avg=346ns    min=0s      med=0s       max=4.21ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.84ms  min=1.63ms  med=17.33ms  max=392.32ms p(90)=34.42ms p(95)=42.31ms p(99.9)=155.33ms
       { expected_response:true }...: avg=20.84ms  min=1.63ms  med=17.33ms  max=392.32ms p(90)=34.42ms p(95)=42.31ms p(99.9)=155.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 284741
     http_req_receiving.............: avg=617.78µs min=51.95µs med=100.14µs max=179.81ms p(90)=1.14ms  p(95)=2ms     p(99.9)=30.16ms 
     http_req_sending...............: avg=44.62µs  min=4.72µs  med=9.86µs   max=212.51ms p(90)=17.48µs p(95)=91.02µs p(99.9)=3.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.18ms  min=1.52ms  med=16.77ms  max=392.17ms p(90)=33.37ms p(95)=41.03ms p(99.9)=154.19ms
     http_reqs......................: 284741  2368.760035/s
     iteration_duration.............: avg=21.06ms  min=2.57ms  med=17.54ms  max=392.53ms p(90)=34.65ms p(95)=42.56ms p(99.9)=156.04ms
     iterations.....................: 284641  2367.928135/s
     success_rate...................: 100.00% ✓ 284641      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 794031      ✗ 0     
     data_received..................: 23 GB   193 MB/s
     data_sent......................: 318 MB  2.6 MB/s
     http_req_blocked...............: avg=3.53µs  min=1.08µs med=2.72µs   max=21.86ms  p(90)=4.25µs  p(95)=4.98µs  p(99.9)=35.68µs 
     http_req_connecting............: avg=367ns   min=0s     med=0s       max=4.04ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.42ms min=1.86ms med=18.68ms  max=592.73ms p(90)=36.4ms  p(95)=45.1ms  p(99.9)=168.98ms
       { expected_response:true }...: avg=22.42ms min=1.86ms med=18.68ms  max=592.73ms p(90)=36.4ms  p(95)=45.1ms  p(99.9)=168.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 264777
     http_req_receiving.............: avg=612.7µs min=53µs   med=103.02µs max=268.48ms p(90)=1.16ms  p(95)=1.99ms  p(99.9)=29.41ms 
     http_req_sending...............: avg=41.82µs min=5.01µs med=10.73µs  max=36.32ms  p(90)=19.07µs p(95)=80.48µs p(99.9)=2.94ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.77ms min=1.72ms med=18.11ms  max=592.32ms p(90)=35.32ms p(95)=43.82ms p(99.9)=167.13ms
     http_reqs......................: 264777  2202.066536/s
     iteration_duration.............: avg=22.65ms min=2.95ms med=18.89ms  max=592.92ms p(90)=36.62ms p(95)=45.34ms p(99.9)=170.18ms
     iterations.....................: 264677  2201.234868/s
     success_rate...................: 100.00% ✓ 264677      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 601341      ✗ 0     
     data_received..................: 18 GB   146 MB/s
     data_sent......................: 241 MB  2.0 MB/s
     http_req_blocked...............: avg=3.3µs   min=892ns   med=2.27µs  max=3.49ms   p(90)=4.49µs   p(95)=5.57µs   p(99.9)=36.5µs 
     http_req_connecting............: avg=468ns   min=0s      med=0s      max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.67ms min=2.22ms  med=29.14ms max=307.98ms p(90)=38.93ms  p(95)=42.21ms  p(99.9)=62.31ms
       { expected_response:true }...: avg=29.67ms min=2.22ms  med=29.14ms max=307.98ms p(90)=38.93ms  p(95)=42.21ms  p(99.9)=62.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 200547
     http_req_receiving.............: avg=94.07µs min=27.38µs med=56.11µs max=162.56ms p(90)=126.47µs p(95)=197.84µs p(99.9)=3.43ms 
     http_req_sending...............: avg=43.68µs min=4.69µs  med=9.77µs  max=194.99ms p(90)=24.55µs  p(95)=105.98µs p(99.9)=2.73ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.54ms min=2.12ms  med=29.02ms max=307.11ms p(90)=38.78ms  p(95)=42.04ms  p(99.9)=61.56ms
     http_reqs......................: 200547  1667.3911/s
     iteration_duration.............: avg=29.92ms min=4.69ms  med=29.36ms max=318.7ms  p(90)=39.15ms  p(95)=42.43ms  p(99.9)=62.97ms
     iterations.....................: 200447  1666.559678/s
     success_rate...................: 100.00% ✓ 200447      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 431499      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 173 MB  1.4 MB/s
     http_req_blocked...............: avg=3.9µs   min=1.1µs   med=2.93µs  max=4.13ms   p(90)=4.49µs   p(95)=5.2µs    p(99.9)=38.85µs 
     http_req_connecting............: avg=662ns   min=0s      med=0s      max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.45ms min=2.15ms  med=41.04ms max=299.36ms p(90)=57.78ms  p(95)=62.91ms  p(99.9)=87.48ms 
       { expected_response:true }...: avg=41.45ms min=2.15ms  med=41.04ms max=299.36ms p(90)=57.78ms  p(95)=62.91ms  p(99.9)=87.48ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 143933
     http_req_receiving.............: avg=86.39µs min=29.64µs med=72.01µs max=187.38ms p(90)=111.72µs p(95)=128.57µs p(99.9)=931.97µs
     http_req_sending...............: avg=25.43µs min=5.2µs   med=12.39µs max=109.5ms  p(90)=18.89µs  p(95)=22.78µs  p(99.9)=942.22µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.33ms min=2.03ms  med=40.93ms max=298.67ms p(90)=57.67ms  p(95)=62.81ms  p(99.9)=87.16ms 
     http_reqs......................: 143933  1196.585134/s
     iteration_duration.............: avg=41.7ms  min=4.35ms  med=41.27ms max=320.62ms p(90)=58ms     p(95)=63.14ms  p(99.9)=88.11ms 
     iterations.....................: 143833  1195.753785/s
     success_rate...................: 100.00% ✓ 143833      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 210828     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   701 kB/s
     http_req_blocked...............: avg=3.83µs  min=992ns   med=2.72µs  max=3.94ms   p(90)=4.23µs   p(95)=4.87µs   p(99.9)=49.25µs 
     http_req_connecting............: avg=795ns   min=0s      med=0s      max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.04ms min=3.87ms  med=83.34ms max=299.31ms p(90)=104.77ms p(95)=115.24ms p(99.9)=199.11ms
       { expected_response:true }...: avg=85.04ms min=3.87ms  med=83.34ms max=299.31ms p(90)=104.77ms p(95)=115.24ms p(99.9)=199.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70376
     http_req_receiving.............: avg=82.05µs min=27.93µs med=72.21µs max=115.14ms p(90)=109.15µs p(95)=122.84µs p(99.9)=619.49µs
     http_req_sending...............: avg=22.16µs min=5.15µs  med=13.78µs max=72.73ms  p(90)=20.4µs   p(95)=22.57µs  p(99.9)=666.7µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.94ms min=3.73ms  med=83.24ms max=299.05ms p(90)=104.67ms p(95)=115.12ms p(99.9)=198.58ms
     http_reqs......................: 70376   583.806244/s
     iteration_duration.............: avg=85.4ms  min=26.49ms med=83.59ms max=306.02ms p(90)=105.03ms p(95)=115.5ms  p(99.9)=201.14ms
     iterations.....................: 70276   582.976691/s
     success_rate...................: 100.00% ✓ 70276      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 150120     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   499 kB/s
     http_req_blocked...............: avg=5.26µs   min=1.05µs  med=3.08µs   max=4ms      p(90)=4.56µs   p(95)=5.14µs   p(99.9)=334.43µs
     http_req_connecting............: avg=1.94µs   min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=72.1µs  
     http_req_duration..............: avg=119.44ms min=5.39ms  med=117.06ms max=310.47ms p(90)=158.39ms p(95)=170.38ms p(99.9)=220.96ms
       { expected_response:true }...: avg=119.44ms min=5.39ms  med=117.06ms max=310.47ms p(90)=158.39ms p(95)=170.38ms p(99.9)=220.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50140
     http_req_receiving.............: avg=88.59µs  min=30.11µs med=83.57µs  max=88.08ms  p(90)=114.27µs p(95)=126.38µs p(99.9)=571.31µs
     http_req_sending...............: avg=26.82µs  min=5.46µs  med=16.49µs  max=104.21ms p(90)=21.59µs  p(95)=23.44µs  p(99.9)=509.35µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.32ms min=5.29ms  med=116.94ms max=309.91ms p(90)=158.3ms  p(95)=170.28ms p(99.9)=220.75ms
     http_reqs......................: 50140   415.497083/s
     iteration_duration.............: avg=119.94ms min=27.35ms med=117.38ms max=320.32ms p(90)=158.69ms p(95)=170.7ms  p(99.9)=223.46ms
     iterations.....................: 50040   414.668409/s
     success_rate...................: 100.00% ✓ 50040      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 96597      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=6.09µs   min=1.15µs  med=2.96µs   max=4.09ms   p(90)=4.29µs   p(95)=4.79µs   p(99.9)=1.35ms  
     http_req_connecting............: avg=2.94µs   min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=185.6ms  min=7.83ms  med=184.65ms max=385.34ms p(90)=196.82ms p(95)=201.15ms p(99.9)=270.55ms
       { expected_response:true }...: avg=185.6ms  min=7.83ms  med=184.65ms max=385.34ms p(90)=196.82ms p(95)=201.15ms p(99.9)=270.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32299
     http_req_receiving.............: avg=92.63µs  min=31.1µs  med=86.49µs  max=101.7ms  p(90)=116.77µs p(95)=128.37µs p(99.9)=415.36µs
     http_req_sending...............: avg=22.78µs  min=5.49µs  med=16.69µs  max=46.86ms  p(90)=21.22µs  p(95)=23µs     p(99.9)=482.99µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.48ms min=7.74ms  med=184.54ms max=385.24ms p(90)=196.72ms p(95)=201.03ms p(99.9)=270.3ms 
     http_reqs......................: 32299   266.952755/s
     iteration_duration.............: avg=186.45ms min=50.91ms med=184.94ms max=393.58ms p(90)=197.11ms p(95)=201.44ms p(99.9)=278.79ms
     iterations.....................: 32199   266.12625/s
     success_rate...................: 100.00% ✓ 32199      ✗ 0    
     vus............................: 5       min=5        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 94173      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=6.62µs   min=1.4µs   med=3.65µs   max=3.49ms   p(90)=5.03µs   p(95)=5.62µs   p(99.9)=1.35ms  
     http_req_connecting............: avg=2.69µs   min=0s      med=0s       max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=1.33ms  
     http_req_duration..............: avg=190.39ms min=6.17ms  med=174.47ms max=667.62ms p(90)=224.73ms p(95)=272.83ms p(99.9)=563.56ms
       { expected_response:true }...: avg=190.39ms min=6.17ms  med=174.47ms max=667.62ms p(90)=224.73ms p(95)=272.83ms p(99.9)=563.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31491
     http_req_receiving.............: avg=94.17µs  min=34.78µs med=88.25µs  max=45.37ms  p(90)=118.18µs p(95)=129.19µs p(99.9)=649.89µs
     http_req_sending...............: avg=25.74µs  min=6.46µs  med=18.2µs   max=45.7ms   p(90)=22.82µs  p(95)=24.69µs  p(99.9)=512.96µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.27ms min=6.08ms  med=174.36ms max=667.54ms p(90)=224.62ms p(95)=272.61ms p(99.9)=563.44ms
     http_reqs......................: 31491   260.516519/s
     iteration_duration.............: avg=191.25ms min=70.01ms med=174.81ms max=667.84ms p(90)=225.12ms p(95)=273.81ms p(99.9)=563.79ms
     iterations.....................: 31391   259.689246/s
     success_rate...................: 100.00% ✓ 31391      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (5ff8b6165878)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 6573      ✗ 0   
     data_received..................: 219 MB  1.7 MB/s
     data_sent......................: 2.7 MB  22 kB/s
     http_req_blocked...............: avg=48.83µs min=1.17µs   med=3.05µs  max=5.4ms    p(90)=4.5µs    p(95)=5.32µs   p(99.9)=4.29ms  
     http_req_connecting............: avg=43.43µs min=0s       med=0s      max=5.2ms    p(90)=0s       p(95)=0s       p(99.9)=4.27ms  
     http_req_duration..............: avg=2.64s   min=32.36ms  med=2.7s    max=16.12s   p(90)=3.35s    p(95)=3.66s    p(99.9)=15.34s  
       { expected_response:true }...: avg=2.64s   min=32.36ms  med=2.7s    max=16.12s   p(90)=3.35s    p(95)=3.66s    p(99.9)=15.34s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2291
     http_req_receiving.............: avg=94.92µs min=36.96µs  med=90.95µs max=767.48µs p(90)=130.19µs p(95)=145.14µs p(99.9)=360.85µs
     http_req_sending...............: avg=64.08µs min=5.88µs   med=17.83µs max=3.28ms   p(90)=23.11µs  p(95)=27.99µs  p(99.9)=3.19ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.64s   min=32.27ms  med=2.7s    max=16.12s   p(90)=3.35s    p(95)=3.66s    p(99.9)=15.34s  
     http_reqs......................: 2291    18.115672/s
     iteration_duration.............: avg=2.76s   min=504.81ms med=2.72s   max=16.14s   p(90)=3.38s    p(95)=3.67s    p(99.9)=15.47s  
     iterations.....................: 2191    17.32494/s
     success_rate...................: 100.00% ✓ 2191      ✗ 0   
     vus............................: 35      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

