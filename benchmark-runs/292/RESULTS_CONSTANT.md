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
| hive-router | v0.0.83 | 3,059 | 3,267 | 2,944 | 3.3% |  |
| fusion-nightly-net11 | 16.5.1-p.2 | 2,661 | 2,784 | 2,643 | 1.7% |  |
| fusion-nightly | 16.5.1-p.2 | 2,567 | 2,675 | 2,557 | 1.6% |  |
| fusion | 16.5.0 | 2,487 | 2,590 | 2,469 | 1.7% |  |
| grafbase | 0.53.5 | 2,155 | 2,275 | 2,137 | 2.3% |  |
| cosmo | 0.331.1 | 1,278 | 1,328 | 1,271 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.4 | 620 | 644 | 617 | 1.5% |  |
| apollo-router | v2.16.0 | 489 | 508 | 487 | 1.7% |  |
| apollo-gateway | 2.14.2 | 280 | 286 | 278 | 0.9% |  |
| hive-gateway | 2.10.4 | 276 | 285 | 276 | 1.3% |  |
| feddi | 5ff8b6165878 | 0 | 0 | 0 | 0.0% | non-compatible response (716 across 5/6 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.83 | 2,542 | 2,702 | 2,502 | 2.4% |  |
| fusion-nightly-net11 | 16.5.1-p.2 | 2,500 | 2,591 | 2,493 | 1.4% |  |
| fusion-nightly | 16.5.1-p.2 | 2,309 | 2,420 | 2,294 | 1.9% |  |
| fusion | 16.5.0 | 2,296 | 2,406 | 2,279 | 1.9% |  |
| fusion-nightly-fed | 16.5.1-p.2 | 2,138 | 2,249 | 2,125 | 1.9% |  |
| grafbase | 0.53.5 | 1,619 | 1,678 | 1,615 | 1.4% |  |
| cosmo | 0.331.1 | 1,210 | 1,253 | 1,203 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.4 | 588 | 607 | 582 | 1.3% |  |
| apollo-router | v2.16.0 | 441 | 455 | 432 | 1.5% |  |
| apollo-gateway | 2.14.2 | 274 | 278 | 273 | 0.5% |  |
| hive-gateway | 2.10.4 | 262 | 270 | 261 | 1.1% |  |
| feddi | 5ff8b6165878 | 22 | 23 | 22 | 1.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1102899     ✗ 0     
     data_received..................: 32 GB   268 MB/s
     data_sent......................: 442 MB  3.7 MB/s
     http_req_blocked...............: avg=2.97µs   min=912ns   med=2.15µs  max=21.45ms  p(90)=3.42µs  p(95)=4.05µs   p(99.9)=33.38µs
     http_req_connecting............: avg=236ns    min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.1ms   min=1.4ms   med=15.31ms max=301.94ms p(90)=23.65ms p(95)=27.11ms  p(99.9)=47.73ms
       { expected_response:true }...: avg=16.1ms   min=1.4ms   med=15.31ms max=301.94ms p(90)=23.65ms p(95)=27.11ms  p(99.9)=47.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 367733
     http_req_receiving.............: avg=107.44µs min=25.18µs med=43.94µs max=266.31ms p(90)=81.62µs p(95)=151.88µs p(99.9)=11.06ms
     http_req_sending...............: avg=47.07µs  min=4.57µs  med=8.31µs  max=35.94ms  p(90)=14.73µs p(95)=90.03µs  p(99.9)=7.05ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.95ms  min=1.35ms  med=15.2ms  max=104.21ms p(90)=23.46ms p(95)=26.81ms  p(99.9)=46.48ms
     http_reqs......................: 367733  3059.95013/s
     iteration_duration.............: avg=16.31ms  min=2ms     med=15.5ms  max=312.99ms p(90)=23.86ms p(95)=27.34ms  p(99.9)=48.49ms
     iterations.....................: 367633  3059.118019/s
     success_rate...................: 100.00% ✓ 367633      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 959784      ✗ 0     
     data_received..................: 28 GB   233 MB/s
     data_sent......................: 385 MB  3.2 MB/s
     http_req_blocked...............: avg=3.15µs   min=822ns   med=1.85µs  max=55.18ms  p(90)=3.14µs  p(95)=3.78µs  p(99.9)=27.46µs
     http_req_connecting............: avg=636ns    min=0s      med=0s      max=9.68ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.53ms  min=1.91ms  med=17.65ms max=278.58ms p(90)=26.73ms p(95)=30.23ms p(99.9)=50.94ms
       { expected_response:true }...: avg=18.53ms  min=1.91ms  med=17.65ms max=278.58ms p(90)=26.73ms p(95)=30.23ms p(99.9)=50.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 320028
     http_req_receiving.............: avg=659.34µs min=49.99µs med=97.71µs max=94.03ms  p(90)=1.68ms  p(95)=2.52ms  p(99.9)=19.75ms
     http_req_sending...............: avg=45.82µs  min=4.39µs  med=7.73µs  max=241.25ms p(90)=14.72µs p(95)=79.39µs p(99.9)=5.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.83ms  min=1.83ms  med=16.95ms max=277.87ms p(90)=25.87ms p(95)=29.34ms p(99.9)=49.18ms
     http_reqs......................: 320028  2661.860933/s
     iteration_duration.............: avg=18.74ms  min=3.29ms  med=17.84ms max=295.44ms p(90)=26.93ms p(95)=30.46ms p(99.9)=51.42ms
     iterations.....................: 319928  2661.029174/s
     success_rate...................: 100.00% ✓ 319928      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 925998      ✗ 0     
     data_received..................: 27 GB   225 MB/s
     data_sent......................: 371 MB  3.1 MB/s
     http_req_blocked...............: avg=2.79µs  min=882ns   med=1.94µs  max=17.48ms  p(90)=3.19µs  p(95)=3.79µs  p(99.9)=29.76µs 
     http_req_connecting............: avg=280ns   min=0s      med=0s      max=3.96ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.22ms min=2.05ms  med=16.51ms max=289.87ms p(90)=31.32ms p(95)=37.84ms p(99.9)=122.6ms 
       { expected_response:true }...: avg=19.22ms min=2.05ms  med=16.51ms max=289.87ms p(90)=31.32ms p(95)=37.84ms p(99.9)=122.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 308766
     http_req_receiving.............: avg=554.2µs min=49.71µs med=88.27µs max=166.52ms p(90)=1.05ms  p(95)=1.87ms  p(99.9)=25.38ms 
     http_req_sending...............: avg=43.99µs min=4.56µs  med=8.16µs  max=218.4ms  p(90)=15.14µs p(95)=76.83µs p(99.9)=4.46ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.62ms min=1.91ms  med=15.99ms max=273.72ms p(90)=30.37ms p(95)=36.74ms p(99.9)=121.11ms
     http_reqs......................: 308766  2567.524664/s
     iteration_duration.............: avg=19.43ms min=3.08ms  med=16.7ms  max=300.33ms p(90)=31.53ms p(95)=38.08ms p(99.9)=123.51ms
     iterations.....................: 308666  2566.69312/s
     success_rate...................: 100.00% ✓ 308666      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 896829      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 359 MB  3.0 MB/s
     http_req_blocked...............: avg=2.48µs   min=862ns   med=1.87µs  max=13.21ms  p(90)=3.03µs  p(95)=3.58µs  p(99.9)=24.82µs 
     http_req_connecting............: avg=167ns    min=0s      med=0s      max=2.53ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.85ms  min=1.99ms  med=16.95ms max=303.31ms p(90)=32.37ms p(95)=39.48ms p(99.9)=130.42ms
       { expected_response:true }...: avg=19.85ms  min=1.99ms  med=16.95ms max=303.31ms p(90)=32.37ms p(95)=39.48ms p(99.9)=130.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 299043
     http_req_receiving.............: avg=594.22µs min=51.25µs med=90.86µs max=193.4ms  p(90)=1.1ms   p(95)=1.98ms  p(99.9)=26.81ms 
     http_req_sending...............: avg=41.08µs  min=4.58µs  med=7.98µs  max=152.26ms p(90)=13.34µs p(95)=58.11µs p(99.9)=4.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.22ms  min=1.87ms  med=16.4ms  max=302.95ms p(90)=31.38ms p(95)=38.37ms p(99.9)=127.84ms
     http_reqs......................: 299043  2487.056742/s
     iteration_duration.............: avg=20.06ms  min=2.83ms  med=17.14ms max=328.3ms  p(90)=32.59ms p(95)=39.71ms p(99.9)=131.35ms
     iterations.....................: 298943  2486.22507/s
     success_rate...................: 100.00% ✓ 298943      ✗ 0     
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

     checks.........................: 100.00% ✓ 777336      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 312 MB  2.6 MB/s
     http_req_blocked...............: avg=3.01µs  min=952ns   med=2.17µs  max=11.72ms  p(90)=3.7µs   p(95)=4.46µs   p(99.9)=35.63µs
     http_req_connecting............: avg=354ns   min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.93ms min=1.66ms  med=22.7ms  max=305.49ms p(90)=27.18ms p(95)=28.97ms  p(99.9)=48.08ms
       { expected_response:true }...: avg=22.93ms min=1.66ms  med=22.7ms  max=305.49ms p(90)=27.18ms p(95)=28.97ms  p(99.9)=48.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 259212
     http_req_receiving.............: avg=88.68µs min=26.53µs med=54.46µs max=188.62ms p(90)=93.51µs p(95)=120.08µs p(99.9)=6.12ms 
     http_req_sending...............: avg=35.5µs  min=4.8µs   med=9.54µs  max=173.27ms p(90)=16.71µs p(95)=26.32µs  p(99.9)=1.7ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.8ms  min=1.61ms  med=22.6ms  max=304.97ms p(90)=27.05ms p(95)=28.81ms  p(99.9)=47ms   
     http_reqs......................: 259212  2155.987853/s
     iteration_duration.............: avg=23.14ms min=3.9ms   med=22.89ms max=315.43ms p(90)=27.38ms p(95)=29.18ms  p(99.9)=48.57ms
     iterations.....................: 259112  2155.156106/s
     success_rate...................: 100.00% ✓ 259112      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 461115      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 185 MB  1.5 MB/s
     http_req_blocked...............: avg=2.88µs  min=912ns   med=1.95µs  max=4.06ms   p(90)=3.28µs  p(95)=3.91µs   p(99.9)=32.45µs 
     http_req_connecting............: avg=618ns   min=0s      med=0s      max=4.01ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.8ms  min=2.02ms  med=38.42ms max=285.36ms p(90)=54.28ms p(95)=59.03ms  p(99.9)=81.54ms 
       { expected_response:true }...: avg=38.8ms  min=2.02ms  med=38.42ms max=285.36ms p(90)=54.28ms p(95)=59.03ms  p(99.9)=81.54ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 153805
     http_req_receiving.............: avg=70.29µs min=25.73µs med=57.25µs max=137.43ms p(90)=91.72µs p(95)=106.77µs p(99.9)=872.38µs
     http_req_sending...............: avg=19.71µs min=4.55µs  med=9.25µs  max=22.64ms  p(90)=15.24µs p(95)=19.1µs   p(99.9)=887.69µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.71ms min=1.92ms  med=38.34ms max=284.85ms p(90)=54.19ms p(95)=58.94ms  p(99.9)=81.46ms 
     http_reqs......................: 153805  1278.781779/s
     iteration_duration.............: avg=39.03ms min=3.95ms  med=38.62ms max=303.09ms p(90)=54.48ms p(95)=59.23ms  p(99.9)=82.06ms 
     iterations.....................: 153705  1277.950348/s
     success_rate...................: 100.00% ✓ 153705      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 223986     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 90 MB   745 kB/s
     http_req_blocked...............: avg=4.54µs   min=1.24µs  med=3.15µs  max=4.21ms   p(90)=4.69µs   p(95)=5.38µs   p(99.9)=42.54µs 
     http_req_connecting............: avg=1.03µs   min=0s      med=0s      max=3.39ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.02ms  min=3.68ms  med=78.45ms max=309.02ms p(90)=98.73ms  p(95)=108.79ms p(99.9)=186.74ms
       { expected_response:true }...: avg=80.02ms  min=3.68ms  med=78.45ms max=309.02ms p(90)=98.73ms  p(95)=108.79ms p(99.9)=186.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74762
     http_req_receiving.............: avg=112.51µs min=30.44µs med=71.7µs  max=200.68ms p(90)=108.29µs p(95)=121.44µs p(99.9)=721.18µs
     http_req_sending...............: avg=25.5µs   min=5.11µs  med=13.87µs max=165.95ms p(90)=20.62µs  p(95)=23µs     p(99.9)=671.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.88ms  min=3.62ms  med=78.35ms max=307.91ms p(90)=98.61ms  p(95)=108.62ms p(99.9)=184.14ms
     http_reqs......................: 74762   620.471344/s
     iteration_duration.............: avg=80.37ms  min=18.25ms med=78.69ms max=330.24ms p(90)=98.99ms  p(95)=109.07ms p(99.9)=187.77ms
     iterations.....................: 74662   619.641415/s
     success_rate...................: 100.00% ✓ 74662      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 176955     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   588 kB/s
     http_req_blocked...............: avg=4.44µs   min=1.06µs  med=2.81µs   max=3.8ms    p(90)=4.29µs   p(95)=4.83µs   p(99.9)=50.75µs 
     http_req_connecting............: avg=1.43µs   min=0s      med=0s       max=3.76ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.32ms min=4.58ms  med=101.04ms max=332.09ms p(90)=122.15ms p(95)=128.53ms p(99.9)=157.39ms
       { expected_response:true }...: avg=101.32ms min=4.58ms  med=101.04ms max=332.09ms p(90)=122.15ms p(95)=128.53ms p(99.9)=157.39ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 59085
     http_req_receiving.............: avg=85.31µs  min=28.63µs med=72.79µs  max=201.02ms p(90)=104.49µs p(95)=117.5µs  p(99.9)=549.98µs
     http_req_sending...............: avg=25.47µs  min=5.19µs  med=14.45µs  max=190.3ms  p(90)=20.39µs  p(95)=22.24µs  p(99.9)=531.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.21ms min=4.47ms  med=100.95ms max=316.58ms p(90)=122.04ms p(95)=128.43ms p(99.9)=156.17ms
     http_reqs......................: 59085   489.994146/s
     iteration_duration.............: avg=101.74ms min=24.93ms med=101.32ms max=345.08ms p(90)=122.39ms p(95)=128.78ms p(99.9)=158.61ms
     iterations.....................: 58985   489.164843/s
     success_rate...................: 100.00% ✓ 58985      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 101592     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   337 kB/s
     http_req_blocked...............: avg=6.1µs    min=1.44µs  med=3.42µs   max=3.23ms   p(90)=4.74µs   p(95)=5.28µs   p(99.9)=943.49µs
     http_req_connecting............: avg=2.47µs   min=0s      med=0s       max=3.2ms    p(90)=0s       p(95)=0s       p(99.9)=920.3µs 
     http_req_duration..............: avg=176.5ms  min=7.41ms  med=156.93ms max=359.52ms p(90)=240.66ms p(95)=250.02ms p(99.9)=314ms   
       { expected_response:true }...: avg=176.5ms  min=7.41ms  med=156.93ms max=359.52ms p(90)=240.66ms p(95)=250.02ms p(99.9)=314ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33964
     http_req_receiving.............: avg=88.13µs  min=33.69µs med=83.86µs  max=30.93ms  p(90)=113.56µs p(95)=124.17µs p(99.9)=476.08µs
     http_req_sending...............: avg=24.46µs  min=5.92µs  med=17.35µs  max=46.05ms  p(90)=21.9µs   p(95)=23.64µs  p(99.9)=553.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.39ms min=7.29ms  med=156.83ms max=359.44ms p(90)=240.56ms p(95)=249.9ms  p(99.9)=313.89ms
     http_reqs......................: 33964   280.839584/s
     iteration_duration.............: avg=177.27ms min=41.92ms med=157.2ms  max=364.11ms p(90)=240.95ms p(95)=250.33ms p(99.9)=315.9ms 
     iterations.....................: 33864   280.01271/s
     success_rate...................: 100.00% ✓ 33864      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 100059     ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   333 kB/s
     http_req_blocked...............: avg=6.78µs   min=1.59µs  med=3.76µs   max=4.16ms   p(90)=5.22µs   p(95)=5.84µs   p(99.9)=1.23ms  
     http_req_connecting............: avg=2.75µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=1.21ms  
     http_req_duration..............: avg=179.16ms min=5.47ms  med=163.71ms max=626.85ms p(90)=210.76ms p(95)=250.16ms p(99.9)=537.82ms
       { expected_response:true }...: avg=179.16ms min=5.47ms  med=163.71ms max=626.85ms p(90)=210.76ms p(95)=250.16ms p(99.9)=537.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33453
     http_req_receiving.............: avg=166.69µs min=36.27µs med=91.2µs   max=163.18ms p(90)=121.05µs p(95)=133.06µs p(99.9)=6.04ms  
     http_req_sending...............: avg=27.97µs  min=5.87µs  med=18.19µs  max=120.34ms p(90)=22.84µs  p(95)=24.67µs  p(99.9)=519.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=178.96ms min=5.38ms  med=163.59ms max=626.73ms p(90)=210.39ms p(95)=248.43ms p(99.9)=537.71ms
     http_reqs......................: 33453   276.957438/s
     iteration_duration.............: avg=179.98ms min=35.8ms  med=164.06ms max=627.1ms  p(90)=211.14ms p(95)=251.7ms  p(99.9)=538.1ms 
     iterations.....................: 33353   276.129538/s
     success_rate...................: 100.00% ✓ 33353      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (rust subgraphs) (5ff8b6165878)</summary>

  **K6 Output**


```
data_received..................: 5.7 MB 96 kB/s
     data_sent......................: 73 kB  1.2 kB/s
     http_req_blocked...............: avg=6.33µs   min=2.72µs  med=3.52µs  max=156.89µs p(90)=5.03µs   p(95)=5.13µs   p(99.9)=148.1µs 
     http_req_connecting............: avg=1.4µs    min=0s      med=0s      max=84.06µs  p(90)=0s       p(95)=0s       p(99.9)=79.1µs  
     http_req_duration..............: avg=530.46ms min=22.54ms med=28.72ms max=30.02s   p(90)=39.48ms  p(95)=41ms     p(99.9)=28.25s  
       { expected_response:true }...: avg=530.46ms min=22.54ms med=28.72ms max=30.02s   p(90)=39.48ms  p(95)=41ms     p(99.9)=28.25s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 60  
     http_req_receiving.............: avg=119.09µs min=77.51µs med=114.3µs max=285.47µs p(90)=162.17µs p(95)=188.68µs p(99.9)=284.25µs
     http_req_sending...............: avg=22.56µs  min=14.96µs med=19.31µs max=193.57µs p(90)=22.21µs  p(95)=23.22µs  p(99.9)=184.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=530.32ms min=22.39ms med=28.61ms max=30.02s   p(90)=39.35ms  p(95)=40.85ms  p(99.9)=28.25s  
     http_reqs......................: 60     0.999995/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 916773      ✗ 0     
     data_received..................: 27 GB   222 MB/s
     data_sent......................: 367 MB  3.1 MB/s
     http_req_blocked...............: avg=3.19µs  min=952ns   med=2.45µs  max=11.8ms   p(90)=3.98µs  p(95)=4.69µs   p(99.9)=35.37µs
     http_req_connecting............: avg=319ns   min=0s      med=0s      max=3.74ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.41ms min=1.78ms  med=19.05ms max=296.72ms p(90)=27.21ms p(95)=29.74ms  p(99.9)=49.09ms
       { expected_response:true }...: avg=19.41ms min=1.78ms  med=19.05ms max=296.72ms p(90)=27.21ms p(95)=29.74ms  p(99.9)=49.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 305691
     http_req_receiving.............: avg=87.73µs min=23.95µs med=51.15µs max=63.93ms  p(90)=92.13µs p(95)=132.94µs p(99.9)=6.2ms  
     http_req_sending...............: avg=43.42µs min=4.77µs  med=9.83µs  max=106.79ms p(90)=17.31µs p(95)=86.72µs  p(99.9)=3.19ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.28ms min=1.7ms   med=18.94ms max=296.36ms p(90)=27.06ms p(95)=29.53ms  p(99.9)=48.18ms
     http_reqs......................: 305691  2542.540151/s
     iteration_duration.............: avg=19.62ms min=2.91ms  med=19.25ms max=306.57ms p(90)=27.41ms p(95)=29.95ms  p(99.9)=49.58ms
     iterations.....................: 305591  2541.708416/s
     success_rate...................: 100.00% ✓ 305591      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 901257      ✗ 0     
     data_received..................: 26 GB   219 MB/s
     data_sent......................: 361 MB  3.0 MB/s
     http_req_blocked...............: avg=2.81µs   min=881ns   med=2µs      max=13.49ms  p(90)=3.47µs  p(95)=4.19µs  p(99.9)=31.78µs
     http_req_connecting............: avg=314ns    min=0s      med=0s       max=3.46ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.74ms  min=1.53ms  med=18.91ms  max=279.76ms p(90)=28.29ms p(95)=31.79ms p(99.9)=53.1ms 
       { expected_response:true }...: avg=19.74ms  min=1.53ms  med=18.91ms  max=279.76ms p(90)=28.29ms p(95)=31.79ms p(99.9)=53.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 300519
     http_req_receiving.............: avg=750.04µs min=53.31µs med=119.56µs max=182.73ms p(90)=1.92ms  p(95)=2.82ms  p(99.9)=19.37ms
     http_req_sending...............: avg=42.88µs  min=4.6µs   med=8.57µs   max=197.45ms p(90)=18.03µs p(95)=85.97µs p(99.9)=3.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.95ms  min=1.44ms  med=18.11ms  max=279.33ms p(90)=27.37ms p(95)=30.82ms p(99.9)=51.13ms
     http_reqs......................: 300519  2500.201153/s
     iteration_duration.............: avg=19.96ms  min=2.91ms  med=19.11ms  max=290.78ms p(90)=28.51ms p(95)=32.02ms p(99.9)=53.66ms
     iterations.....................: 300419  2499.369192/s
     success_rate...................: 100.00% ✓ 300419      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 832605      ✗ 0     
     data_received..................: 24 GB   202 MB/s
     data_sent......................: 334 MB  2.8 MB/s
     http_req_blocked...............: avg=2.91µs   min=821ns   med=2.02µs  max=14.43ms  p(90)=3.44µs  p(95)=4.12µs  p(99.9)=32.17µs 
     http_req_connecting............: avg=321ns    min=0s      med=0s      max=3.84ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.4ms   min=1.58ms  med=17.74ms max=371.74ms p(90)=35.17ms p(95)=43.38ms p(99.9)=159.85ms
       { expected_response:true }...: avg=21.4ms   min=1.58ms  med=17.74ms max=371.74ms p(90)=35.17ms p(95)=43.38ms p(99.9)=159.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 277635
     http_req_receiving.............: avg=614.11µs min=50.26µs med=97.11µs max=151.8ms  p(90)=1.13ms  p(95)=1.92ms  p(99.9)=29.03ms 
     http_req_sending...............: avg=37.07µs  min=4.48µs  med=8.37µs  max=173.77ms p(90)=15.48µs p(95)=39.9µs  p(99.9)=2.71ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.75ms  min=1.49ms  med=17.19ms max=371.66ms p(90)=34.15ms p(95)=42.19ms p(99.9)=159.28ms
     http_reqs......................: 277635  2309.493844/s
     iteration_duration.............: avg=21.61ms  min=2.72ms  med=17.94ms max=371.97ms p(90)=35.38ms p(95)=43.62ms p(99.9)=160.08ms
     iterations.....................: 277535  2308.661998/s
     success_rate...................: 100.00% ✓ 277535      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 827808      ✗ 0     
     data_received..................: 24 GB   201 MB/s
     data_sent......................: 332 MB  2.8 MB/s
     http_req_blocked...............: avg=3.48µs   min=1.06µs  med=2.64µs  max=13.77ms  p(90)=4.2µs   p(95)=4.93µs  p(99.9)=40.34µs 
     http_req_connecting............: avg=340ns    min=0s      med=0s      max=3.86ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.51ms  min=1.65ms  med=17.9ms  max=390.55ms p(90)=35.37ms p(95)=43.53ms p(99.9)=158.98ms
       { expected_response:true }...: avg=21.51ms  min=1.65ms  med=17.9ms  max=390.55ms p(90)=35.37ms p(95)=43.53ms p(99.9)=158.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 276036
     http_req_receiving.............: avg=632.58µs min=52.52µs med=102.9µs max=228.85ms p(90)=1.15ms  p(95)=1.98ms  p(99.9)=30.97ms 
     http_req_sending...............: avg=41.88µs  min=4.84µs  med=9.98µs  max=39.87ms  p(90)=18.34µs p(95)=78.08µs p(99.9)=3.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.83ms  min=1.53ms  med=17.33ms max=390.31ms p(90)=34.33ms p(95)=42.28ms p(99.9)=155.67ms
     http_reqs......................: 276036  2296.153222/s
     iteration_duration.............: avg=21.73ms  min=2.75ms  med=18.11ms max=390.73ms p(90)=35.59ms p(95)=43.76ms p(99.9)=159.52ms
     iterations.....................: 275936  2295.321391/s
     success_rate...................: 100.00% ✓ 275936      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 771021      ✗ 0     
     data_received..................: 23 GB   187 MB/s
     data_sent......................: 309 MB  2.6 MB/s
     http_req_blocked...............: avg=3.72µs   min=1.06µs  med=2.84µs   max=15.5ms   p(90)=4.5µs   p(95)=5.27µs  p(99.9)=39.84µs 
     http_req_connecting............: avg=373ns    min=0s      med=0s       max=3.49ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=23.09ms  min=2ms     med=19.37ms  max=311.8ms  p(90)=37.38ms p(95)=46.25ms p(99.9)=166.13ms
       { expected_response:true }...: avg=23.09ms  min=2ms     med=19.37ms  max=311.8ms  p(90)=37.38ms p(95)=46.25ms p(99.9)=166.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 257107
     http_req_receiving.............: avg=627.82µs min=53.41µs med=105.53µs max=218.64ms p(90)=1.17ms  p(95)=2.03ms  p(99.9)=29.31ms 
     http_req_sending...............: avg=44.22µs  min=5.05µs  med=10.9µs   max=162.84ms p(90)=19.91µs p(95)=74.97µs p(99.9)=3.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.42ms  min=1.85ms  med=18.78ms  max=311.68ms p(90)=36.35ms p(95)=45.02ms p(99.9)=164.35ms
     http_reqs......................: 257107  2138.085833/s
     iteration_duration.............: avg=23.33ms  min=3.17ms  med=19.59ms  max=317.6ms  p(90)=37.62ms p(95)=46.5ms  p(99.9)=167.14ms
     iterations.....................: 257007  2137.254239/s
     success_rate...................: 100.00% ✓ 257007      ✗ 0     
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

     checks.........................: 100.00% ✓ 584082      ✗ 0     
     data_received..................: 17 GB   142 MB/s
     data_sent......................: 234 MB  1.9 MB/s
     http_req_blocked...............: avg=3.42µs  min=902ns   med=2.32µs  max=5.3ms    p(90)=4.68µs   p(95)=5.77µs   p(99.9)=37.45µs
     http_req_connecting............: avg=457ns   min=0s      med=0s      max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.56ms min=2.25ms  med=29.9ms  max=281.97ms p(90)=40.02ms  p(95)=43.47ms  p(99.9)=65.35ms
       { expected_response:true }...: avg=30.56ms min=2.25ms  med=29.9ms  max=281.97ms p(90)=40.02ms  p(95)=43.47ms  p(99.9)=65.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194794
     http_req_receiving.............: avg=95.67µs min=28.38µs med=58.52µs max=116.06ms p(90)=127.27µs p(95)=195.76µs p(99.9)=3.68ms 
     http_req_sending...............: avg=41.08µs min=4.62µs  med=9.74µs  max=139.69ms p(90)=24.25µs  p(95)=103.35µs p(99.9)=2.67ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.42ms min=2.17ms  med=29.78ms max=281.37ms p(90)=39.86ms  p(95)=43.26ms  p(99.9)=64.38ms
     http_reqs......................: 194794  1619.325481/s
     iteration_duration.............: avg=30.8ms  min=7.95ms  med=30.13ms max=315.21ms p(90)=40.24ms  p(95)=43.68ms  p(99.9)=65.75ms
     iterations.....................: 194694  1618.49418/s
     success_rate...................: 100.00% ✓ 194694      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 436518      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 175 MB  1.5 MB/s
     http_req_blocked...............: avg=3.97µs  min=1.13µs  med=2.92µs  max=3.71ms   p(90)=4.5µs    p(95)=5.21µs   p(99.9)=40.53µs 
     http_req_connecting............: avg=707ns   min=0s      med=0s      max=3.67ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.97ms min=2.05ms  med=40.56ms max=298.02ms p(90)=57.16ms  p(95)=62.14ms  p(99.9)=86ms    
       { expected_response:true }...: avg=40.97ms min=2.05ms  med=40.56ms max=298.02ms p(90)=57.16ms  p(95)=62.14ms  p(99.9)=86ms    
     http_req_failed................: 0.00%   ✓ 0           ✗ 145606
     http_req_receiving.............: avg=79.6µs  min=28.72µs med=65.48µs max=85.19ms  p(90)=104.56µs p(95)=121.95µs p(99.9)=944.9µs 
     http_req_sending...............: avg=28.1µs  min=5.49µs  med=12.41µs max=214.52ms p(90)=19µs     p(95)=22.77µs  p(99.9)=945.96µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.87ms min=1.98ms  med=40.46ms max=297.88ms p(90)=57.05ms  p(95)=62.03ms  p(99.9)=85.59ms 
     http_reqs......................: 145606  1210.611532/s
     iteration_duration.............: avg=41.22ms min=4.07ms  med=40.78ms max=322.72ms p(90)=57.38ms  p(95)=62.36ms  p(99.9)=86.43ms 
     iterations.....................: 145506  1209.780102/s
     success_rate...................: 100.00% ✓ 145506      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 212460     ✗ 0    
     data_received..................: 6.2 GB  52 MB/s
     data_sent......................: 85 MB   707 kB/s
     http_req_blocked...............: avg=4.95µs  min=1.17µs  med=3.4µs   max=4.16ms   p(90)=5µs      p(95)=5.69µs   p(99.9)=46.1µs  
     http_req_connecting............: avg=1.27µs  min=0s      med=0s      max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.35ms min=3.9ms   med=82.1ms  max=344.72ms p(90)=104.98ms p(95)=116.24ms p(99.9)=199.7ms 
       { expected_response:true }...: avg=84.35ms min=3.9ms   med=82.1ms  max=344.72ms p(90)=104.98ms p(95)=116.24ms p(99.9)=199.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 70920
     http_req_receiving.............: avg=91.4µs  min=29.61µs med=76.62µs max=117ms    p(90)=113.05µs p(95)=126.1µs  p(99.9)=739.03µs
     http_req_sending...............: avg=25.91µs min=5.66µs  med=15.57µs max=194.59ms p(90)=22.18µs  p(95)=24.49µs  p(99.9)=631.23µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.24ms min=3.77ms  med=81.99ms max=343.98ms p(90)=104.87ms p(95)=116.12ms p(99.9)=199.02ms
     http_reqs......................: 70920   588.429347/s
     iteration_duration.............: avg=84.73ms min=16.89ms med=82.37ms max=354ms    p(90)=105.26ms p(95)=116.55ms p(99.9)=200.62ms
     iterations.....................: 70820   587.599638/s
     success_rate...................: 100.00% ✓ 70820      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 159633     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   531 kB/s
     http_req_blocked...............: avg=5.57µs   min=1.25µs  med=3.63µs   max=4.02ms   p(90)=5.17µs   p(95)=5.76µs   p(99.9)=119.97µs
     http_req_connecting............: avg=1.68µs   min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.25ms min=5.43ms  med=110.1ms  max=316.89ms p(90)=148.44ms p(95)=159ms    p(99.9)=201.71ms
       { expected_response:true }...: avg=112.25ms min=5.43ms  med=110.1ms  max=316.89ms p(90)=148.44ms p(95)=159ms    p(99.9)=201.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53311
     http_req_receiving.............: avg=91.03µs  min=31.32µs med=82.57µs  max=207.16ms p(90)=114.13µs p(95)=126.88µs p(99.9)=504.13µs
     http_req_sending...............: avg=25.15µs  min=5.65µs  med=17.92µs  max=126.54ms p(90)=23.19µs  p(95)=25.1µs   p(99.9)=540.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.13ms min=5.29ms  med=110ms    max=308.34ms p(90)=148.33ms p(95)=158.88ms p(99.9)=201.42ms
     http_reqs......................: 53311   441.786798/s
     iteration_duration.............: avg=112.74ms min=10.96ms med=110.43ms max=326.32ms p(90)=148.74ms p(95)=159.32ms p(99.9)=204.65ms
     iterations.....................: 53211   440.958101/s
     success_rate...................: 100.00% ✓ 53211      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 99150      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   329 kB/s
     http_req_blocked...............: avg=5.98µs   min=1.13µs  med=3.04µs   max=3.31ms   p(90)=4.34µs   p(95)=4.88µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=2.73µs   min=0s      med=0s       max=3.27ms   p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=180.83ms min=7.79ms  med=186.09ms max=360.72ms p(90)=193.45ms p(95)=197.19ms p(99.9)=264.96ms
       { expected_response:true }...: avg=180.83ms min=7.79ms  med=186.09ms max=360.72ms p(90)=193.45ms p(95)=197.19ms p(99.9)=264.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33150
     http_req_receiving.............: avg=93.9µs   min=32.75µs med=88.46µs  max=80.42ms  p(90)=118.79µs p(95)=130.05µs p(99.9)=481.43µs
     http_req_sending...............: avg=21.54µs  min=5.18µs  med=17.33µs  max=23.98ms  p(90)=21.86µs  p(95)=23.64µs  p(99.9)=427.2µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=180.71ms min=7.66ms  med=185.98ms max=360.32ms p(90)=193.34ms p(95)=197.09ms p(99.9)=264.78ms
     http_reqs......................: 33150   274.051813/s
     iteration_duration.............: avg=181.64ms min=26.91ms med=186.36ms max=370.37ms p(90)=193.72ms p(95)=197.46ms p(99.9)=265.58ms
     iterations.....................: 33050   273.225111/s
     success_rate...................: 100.00% ✓ 33050      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95049      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   316 kB/s
     http_req_blocked...............: avg=6.71µs   min=1.49µs  med=3.6µs    max=4.09ms   p(90)=5.01µs   p(95)=5.62µs   p(99.9)=1.3ms   
     http_req_connecting............: avg=2.84µs   min=0s      med=0s       max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=188.61ms min=6.14ms  med=173.63ms max=637.12ms p(90)=219.52ms p(95)=270.2ms  p(99.9)=553.04ms
       { expected_response:true }...: avg=188.61ms min=6.14ms  med=173.63ms max=637.12ms p(90)=219.52ms p(95)=270.2ms  p(99.9)=553.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31783
     http_req_receiving.............: avg=97.03µs  min=37.62µs med=89.09µs  max=62.94ms  p(90)=120.22µs p(95)=132µs    p(99.9)=651.02µs
     http_req_sending...............: avg=33.23µs  min=6.64µs  med=18.13µs  max=107.74ms p(90)=23.12µs  p(95)=24.94µs  p(99.9)=533.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.48ms min=6.05ms  med=173.5ms  max=636.99ms p(90)=219.41ms p(95)=270.09ms p(99.9)=552.92ms
     http_reqs......................: 31783   262.978722/s
     iteration_duration.............: avg=189.48ms min=25.11ms med=174.02ms max=637.41ms p(90)=219.98ms p(95)=272.24ms p(99.9)=553.48ms
     iterations.....................: 31683   262.151303/s
     success_rate...................: 100.00% ✓ 31683      ✗ 0    
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

     checks.........................: 100.00% ✓ 8205      ✗ 0   
     data_received..................: 271 MB  2.2 MB/s
     data_sent......................: 3.4 MB  27 kB/s
     http_req_blocked...............: avg=54.69µs min=1.2µs    med=3.22µs  max=6.08ms p(90)=4.74µs   p(95)=5.53µs   p(99.9)=5.58ms  
     http_req_connecting............: avg=49.57µs min=0s       med=0s      max=5.91ms p(90)=0s       p(95)=0s       p(99.9)=5.54ms  
     http_req_duration..............: avg=2.12s   min=28.32ms  med=2.16s   max=4.46s  p(90)=2.89s    p(95)=3.11s    p(99.9)=3.87s   
       { expected_response:true }...: avg=2.12s   min=28.32ms  med=2.16s   max=4.46s  p(90)=2.89s    p(95)=3.11s    p(99.9)=3.87s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2835
     http_req_receiving.............: avg=97.3µs  min=33.95µs  med=94.14µs max=1.4ms  p(90)=134.32µs p(95)=151.19µs p(99.9)=343.25µs
     http_req_sending...............: avg=42.59µs min=5.3µs    med=18.57µs max=2.95ms p(90)=23.68µs  p(95)=26.34µs  p(99.9)=2.35ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.12s   min=28.21ms  med=2.16s   max=4.46s  p(90)=2.89s    p(95)=3.11s    p(99.9)=3.87s   
     http_reqs......................: 2835    22.609276/s
     iteration_duration.............: avg=2.2s    min=348.46ms med=2.19s   max=4.46s  p(90)=2.9s     p(95)=3.13s    p(99.9)=3.87s   
     iterations.....................: 2735    21.811771/s
     success_rate...................: 100.00% ✓ 2735      ✗ 0   
     vus............................: 22      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

