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
| hive-router | v0.0.84 | 2,956 | 3,188 | 2,895 | 3.4% |  |
| fusion-nightly-net11 | 16.6.0-p.11 | 2,705 | 2,835 | 2,663 | 2.1% |  |
| fusion | 16.5.1 | 2,564 | 2,671 | 2,551 | 1.6% |  |
| fusion-nightly | 16.6.0-p.11 | 2,517 | 2,656 | 2,502 | 2.2% |  |
| grafbase | 0.53.5 | 2,087 | 2,210 | 2,065 | 2.4% |  |
| cosmo | 0.334.0 | 1,306 | 1,351 | 1,298 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 614 | 633 | 608 | 1.3% |  |
| apollo-router | v2.16.1 | 440 | 462 | 435 | 2.1% |  |
| apollo-gateway | 2.14.3 | 285 | 289 | 284 | 0.6% |  |
| hive-gateway | 2.10.8 | 273 | 281 | 271 | 1.3% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1214 across 9/9 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,572 | 2,749 | 2,551 | 2.6% |  |
| fusion-nightly-net11 | 16.6.0-p.11 | 2,516 | 2,595 | 2,501 | 1.3% |  |
| fusion | 16.5.1 | 2,398 | 2,498 | 2,388 | 1.6% |  |
| fusion-nightly | 16.6.0-p.11 | 2,375 | 2,472 | 2,363 | 1.6% |  |
| fusion-nightly-fed | 16.6.0-p.11 | 2,259 | 2,365 | 2,251 | 1.7% |  |
| grafbase | 0.53.5 | 1,684 | 1,737 | 1,678 | 1.2% |  |
| cosmo | 0.334.0 | 1,222 | 1,254 | 1,210 | 1.1% |  |
| hive-gateway-router-runtime | 2.10.8 | 567 | 589 | 566 | 1.3% |  |
| apollo-router | v2.16.1 | 444 | 464 | 442 | 1.9% |  |
| apollo-gateway | 2.14.3 | 267 | 270 | 265 | 0.7% |  |
| hive-gateway | 2.10.8 | 260 | 267 | 257 | 1.2% |  |
| feddi | 5ff8b6165878 | 16 | 17 | 16 | 3.3% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1065597     ✗ 0     
     data_received..................: 31 GB   259 MB/s
     data_sent......................: 427 MB  3.6 MB/s
     http_req_blocked...............: avg=2.61µs  min=902ns   med=1.9µs   max=18ms     p(90)=3.01µs  p(95)=3.55µs   p(99.9)=27.54µs
     http_req_connecting............: avg=249ns   min=0s      med=0s      max=3.93ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.68ms min=1.42ms  med=16.03ms max=272.83ms p(90)=24.69ms p(95)=27.78ms  p(99.9)=46.4ms 
       { expected_response:true }...: avg=16.68ms min=1.42ms  med=16.03ms max=272.83ms p(90)=24.69ms p(95)=27.78ms  p(99.9)=46.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 355299
     http_req_receiving.............: avg=84.54µs min=25.53µs med=44.99µs max=105.37ms p(90)=78.8µs  p(95)=122.93µs p(99.9)=7.62ms 
     http_req_sending...............: avg=42.68µs min=4.38µs  med=8.04µs  max=114.24ms p(90)=13.43µs p(95)=77.53µs  p(99.9)=5.14ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.55ms min=1.38ms  med=15.92ms max=272.16ms p(90)=24.52ms p(95)=27.55ms  p(99.9)=45.49ms
     http_reqs......................: 355299  2956.032371/s
     iteration_duration.............: avg=16.88ms min=1.89ms  med=16.21ms max=287.67ms p(90)=24.89ms p(95)=28ms     p(99.9)=47.18ms
     iterations.....................: 355199  2955.200387/s
     success_rate...................: 100.00% ✓ 355199      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 975591      ✗ 0     
     data_received..................: 29 GB   237 MB/s
     data_sent......................: 391 MB  3.3 MB/s
     http_req_blocked...............: avg=3.08µs   min=1.03µs  med=2.34µs   max=17.71ms  p(90)=3.7µs   p(95)=4.32µs  p(99.9)=33.41µs
     http_req_connecting............: avg=261ns    min=0s      med=0s       max=3.45ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.23ms  min=1.93ms  med=17.34ms  max=292.02ms p(90)=26.13ms p(95)=29.72ms p(99.9)=51.06ms
       { expected_response:true }...: avg=18.23ms  min=1.93ms  med=17.34ms  max=292.02ms p(90)=26.13ms p(95)=29.72ms p(99.9)=51.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 325297
     http_req_receiving.............: avg=656.99µs min=51.72µs med=103.39µs max=70.89ms  p(90)=1.67ms  p(95)=2.5ms   p(99.9)=20.6ms 
     http_req_sending...............: avg=43.81µs  min=4.62µs  med=8.72µs   max=111.56ms p(90)=16.16µs p(95)=92.54µs p(99.9)=4.46ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.52ms  min=1.84ms  med=16.66ms  max=291.36ms p(90)=25.26ms p(95)=28.81ms p(99.9)=49.33ms
     http_reqs......................: 325297  2705.252568/s
     iteration_duration.............: avg=18.44ms  min=3.14ms  med=17.54ms  max=308.58ms p(90)=26.34ms p(95)=29.95ms p(99.9)=51.63ms
     iterations.....................: 325197  2704.420943/s
     success_rate...................: 100.00% ✓ 325197      ✗ 0     
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

     checks.........................: 100.00% ✓ 924753      ✗ 0     
     data_received..................: 27 GB   225 MB/s
     data_sent......................: 371 MB  3.1 MB/s
     http_req_blocked...............: avg=2.66µs   min=892ns   med=1.93µs  max=16.54ms  p(90)=3.19µs  p(95)=3.8µs   p(99.9)=27.63µs 
     http_req_connecting............: avg=281ns    min=0s      med=0s      max=3.36ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.24ms  min=2.01ms  med=16.55ms max=291.99ms p(90)=31.14ms p(95)=37.63ms p(99.9)=124.97ms
       { expected_response:true }...: avg=19.24ms  min=2.01ms  med=16.55ms max=291.99ms p(90)=31.14ms p(95)=37.63ms p(99.9)=124.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 308351
     http_req_receiving.............: avg=542.73µs min=48.67µs med=88.81µs max=230.56ms p(90)=1.04ms  p(95)=1.83ms  p(99.9)=24.59ms 
     http_req_sending...............: avg=41.91µs  min=4.47µs  med=8.07µs  max=163.16ms p(90)=14.69µs p(95)=78.01µs p(99.9)=3.86ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.66ms  min=1.9ms   med=16.04ms max=277.21ms p(90)=30.23ms p(95)=36.6ms  p(99.9)=123.5ms 
     http_reqs......................: 308351  2564.349938/s
     iteration_duration.............: avg=19.45ms  min=3.01ms  med=16.74ms max=313.29ms p(90)=31.35ms p(95)=37.86ms p(99.9)=126.53ms
     iterations.....................: 308251  2563.518305/s
     success_rate...................: 100.00% ✓ 308251      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 908082      ✗ 0     
     data_received..................: 27 GB   221 MB/s
     data_sent......................: 364 MB  3.0 MB/s
     http_req_blocked...............: avg=2.9µs    min=922ns   med=2.2µs   max=16.17ms  p(90)=3.46µs  p(95)=4.02µs  p(99.9)=34.13µs 
     http_req_connecting............: avg=310ns    min=0s      med=0s      max=3.93ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.6ms   min=2.02ms  med=16.85ms max=320.52ms p(90)=32ms    p(95)=38.69ms p(99.9)=124.65ms
       { expected_response:true }...: avg=19.6ms   min=2.02ms  med=16.85ms max=320.52ms p(90)=32ms    p(95)=38.69ms p(99.9)=124.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 302794
     http_req_receiving.............: avg=594.66µs min=51.72µs med=91.53µs max=130.22ms p(90)=1.12ms  p(95)=2.06ms  p(99.9)=25.55ms 
     http_req_sending...............: avg=42.66µs  min=4.76µs  med=8.39µs  max=138.56ms p(90)=14.35µs p(95)=86.32µs p(99.9)=4.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.96ms  min=1.92ms  med=16.28ms max=320.43ms p(90)=31.03ms p(95)=37.55ms p(99.9)=123.5ms 
     http_reqs......................: 302794  2517.911159/s
     iteration_duration.............: avg=19.81ms  min=2.56ms  med=17.05ms max=320.7ms  p(90)=32.22ms p(95)=38.94ms p(99.9)=125.77ms
     iterations.....................: 302694  2517.0796/s
     success_rate...................: 100.00% ✓ 302694      ✗ 0     
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

     checks.........................: 100.00% ✓ 752532      ✗ 0     
     data_received..................: 22 GB   183 MB/s
     data_sent......................: 302 MB  2.5 MB/s
     http_req_blocked...............: avg=3.21µs  min=932ns   med=2.51µs  max=3.52ms   p(90)=4.08µs  p(95)=4.82µs   p(99.9)=37.82µs
     http_req_connecting............: avg=347ns   min=0s      med=0s      max=3.47ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.69ms min=1.73ms  med=23.46ms max=293.39ms p(90)=28.07ms p(95)=29.81ms  p(99.9)=47.73ms
       { expected_response:true }...: avg=23.69ms min=1.73ms  med=23.46ms max=293.39ms p(90)=28.07ms p(95)=29.81ms  p(99.9)=47.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 250944
     http_req_receiving.............: avg=89.39µs min=28.32µs med=57.72µs max=87.97ms  p(90)=95.92µs p(95)=122.33µs p(99.9)=5.66ms 
     http_req_sending...............: avg=35.59µs min=4.63µs  med=10.03µs max=172.4ms  p(90)=16.29µs p(95)=25.49µs  p(99.9)=1.89ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.57ms min=1.68ms  med=23.36ms max=292.53ms p(90)=27.94ms p(95)=29.64ms  p(99.9)=46.68ms
     http_reqs......................: 250944  2087.29187/s
     iteration_duration.............: avg=23.91ms min=4.93ms  med=23.66ms max=314.36ms p(90)=28.27ms p(95)=30.03ms  p(99.9)=48.24ms
     iterations.....................: 250844  2086.460094/s
     success_rate...................: 100.00% ✓ 250844      ✗ 0     
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

     checks.........................: 100.00% ✓ 470925      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 189 MB  1.6 MB/s
     http_req_blocked...............: avg=4.38µs  min=1.06µs  med=2.49µs  max=9.19ms   p(90)=3.94µs  p(95)=4.59µs   p(99.9)=32.28µs 
     http_req_connecting............: avg=1.54µs  min=0s      med=0s      max=9.15ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.98ms min=1.92ms  med=37.55ms max=302.41ms p(90)=53.11ms p(95)=58.01ms  p(99.9)=80.83ms 
       { expected_response:true }...: avg=37.98ms min=1.92ms  med=37.55ms max=302.41ms p(90)=53.11ms p(95)=58.01ms  p(99.9)=80.83ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 157075
     http_req_receiving.............: avg=72.08µs min=25.96µs med=58.07µs max=50.99ms  p(90)=94.07µs p(95)=110.14µs p(99.9)=966.61µs
     http_req_sending...............: avg=26.06µs min=4.78µs  med=10.53µs max=117.67ms p(90)=16.52µs p(95)=20.59µs  p(99.9)=1.12ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.89ms min=1.86ms  med=37.46ms max=301.27ms p(90)=53.01ms p(95)=57.9ms   p(99.9)=80.59ms 
     http_reqs......................: 157075  1306.030076/s
     iteration_duration.............: avg=38.21ms min=4.06ms  med=37.75ms max=318.87ms p(90)=53.32ms p(95)=58.22ms  p(99.9)=81.2ms  
     iterations.....................: 156975  1305.198606/s
     success_rate...................: 100.00% ✓ 156975      ✗ 0     
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

     checks.........................: 100.00% ✓ 221703     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   738 kB/s
     http_req_blocked...............: avg=3.97µs  min=1.07µs  med=2.43µs  max=4ms      p(90)=3.99µs   p(95)=4.6µs    p(99.9)=42.56µs 
     http_req_connecting............: avg=1.22µs  min=0s      med=0s      max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.86ms min=3.63ms  med=78.92ms max=320.99ms p(90)=99.45ms  p(95)=109.14ms p(99.9)=190.28ms
       { expected_response:true }...: avg=80.86ms min=3.63ms  med=78.92ms max=320.99ms p(90)=99.45ms  p(95)=109.14ms p(99.9)=190.28ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74001
     http_req_receiving.............: avg=78.39µs min=29.02µs med=64.75µs max=161.62ms p(90)=102.21µs p(95)=115.52µs p(99.9)=678.36µs
     http_req_sending...............: avg=20.7µs  min=4.8µs   med=11.8µs  max=128.66ms p(90)=18.69µs  p(95)=20.78µs  p(99.9)=578.07µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.76ms min=3.57ms  med=78.83ms max=308.77ms p(90)=99.36ms  p(95)=109.04ms p(99.9)=189.66ms
     http_reqs......................: 74001   614.121915/s
     iteration_duration.............: avg=81.2ms  min=14.8ms  med=79.14ms max=333.2ms  p(90)=99.69ms  p(95)=109.45ms p(99.9)=191.54ms
     iterations.....................: 73901   613.292032/s
     success_rate...................: 100.00% ✓ 73901      ✗ 0    
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

     checks.........................: 100.00% ✓ 159174     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   529 kB/s
     http_req_blocked...............: avg=3.86µs   min=1.11µs  med=2.89µs   max=2.47ms   p(90)=4.24µs   p(95)=4.75µs   p(99.9)=78.8µs  
     http_req_connecting............: avg=804ns    min=0s      med=0s       max=2.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.66ms min=4.55ms  med=112.48ms max=320.5ms  p(90)=135.89ms p(95)=142.85ms p(99.9)=177.09ms
       { expected_response:true }...: avg=112.66ms min=4.55ms  med=112.48ms max=320.5ms  p(90)=135.89ms p(95)=142.85ms p(99.9)=177.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53158
     http_req_receiving.............: avg=82.7µs   min=29.63µs med=76.04µs  max=144.59ms p(90)=106.83µs p(95)=119.39µs p(99.9)=556.92µs
     http_req_sending...............: avg=22.52µs  min=5.05µs  med=14.81µs  max=93.61ms  p(90)=19.94µs  p(95)=21.64µs  p(99.9)=476.69µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.56ms min=4.49ms  med=112.38ms max=320.37ms p(90)=135.78ms p(95)=142.76ms p(99.9)=176.71ms
     http_reqs......................: 53158   440.718272/s
     iteration_duration.............: avg=113.11ms min=23.02ms med=112.74ms max=325.82ms p(90)=136.15ms p(95)=143.12ms p(99.9)=178.25ms
     iterations.....................: 53058   439.889199/s
     success_rate...................: 100.00% ✓ 53058      ✗ 0    
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

     checks.........................: 100.00% ✓ 103182     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   342 kB/s
     http_req_blocked...............: avg=6.53µs   min=1.38µs  med=3.34µs   max=3.75ms   p(90)=4.67µs   p(95)=5.25µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=2.96µs   min=0s      med=0s       max=3.65ms   p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=173.74ms min=7.55ms  med=175.81ms max=380.46ms p(90)=194.2ms  p(95)=199.51ms p(99.9)=256.66ms
       { expected_response:true }...: avg=173.74ms min=7.55ms  med=175.81ms max=380.46ms p(90)=194.2ms  p(95)=199.51ms p(99.9)=256.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34494
     http_req_receiving.............: avg=87.76µs  min=29.66µs med=83.69µs  max=25.63ms  p(90)=114.17µs p(95)=125.19µs p(99.9)=442.53µs
     http_req_sending...............: avg=25.11µs  min=5.93µs  med=17.06µs  max=106.92ms p(90)=21.81µs  p(95)=23.58µs  p(99.9)=449.16µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.63ms min=7.41ms  med=175.71ms max=376.11ms p(90)=194.09ms p(95)=199.39ms p(99.9)=256.47ms
     http_reqs......................: 34494   285.21638/s
     iteration_duration.............: avg=174.53ms min=54.23ms med=176.29ms max=403.91ms p(90)=194.5ms  p(95)=199.81ms p(99.9)=257.67ms
     iterations.....................: 34394   284.389522/s
     success_rate...................: 100.00% ✓ 34394      ✗ 0    
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

     checks.........................: 100.00% ✓ 99042      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   329 kB/s
     http_req_blocked...............: avg=5.92µs   min=1.1µs   med=2.95µs   max=3.7ms    p(90)=4.24µs   p(95)=4.79µs   p(99.9)=1.29ms  
     http_req_connecting............: avg=2.73µs   min=0s      med=0s       max=3.66ms   p(90)=0s       p(95)=0s       p(99.9)=1.27ms  
     http_req_duration..............: avg=181.04ms min=5.93ms  med=166.44ms max=607.66ms p(90)=209.29ms p(95)=248.35ms p(99.9)=534.99ms
       { expected_response:true }...: avg=181.04ms min=5.93ms  med=166.44ms max=607.66ms p(90)=209.29ms p(95)=248.35ms p(99.9)=534.99ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33114
     http_req_receiving.............: avg=87.75µs  min=30.81µs med=84.84µs  max=19.1ms   p(90)=113.75µs p(95)=125.23µs p(99.9)=627.88µs
     http_req_sending...............: avg=27.52µs  min=5.37µs  med=16.62µs  max=68.37ms  p(90)=20.97µs  p(95)=22.69µs  p(99.9)=634.03µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=180.92ms min=5.81ms  med=166.33ms max=607.56ms p(90)=209.19ms p(95)=248.12ms p(99.9)=534.92ms
     http_reqs......................: 33114   273.809868/s
     iteration_duration.............: avg=181.84ms min=56.44ms med=166.76ms max=607.91ms p(90)=209.74ms p(95)=249.44ms p(99.9)=535.2ms 
     iterations.....................: 33014   272.982997/s
     success_rate...................: 100.00% ✓ 33014      ✗ 0    
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

     checks.........................: 100.00% ✓ 927402      ✗ 0     
     data_received..................: 27 GB   225 MB/s
     data_sent......................: 372 MB  3.1 MB/s
     http_req_blocked...............: avg=3.19µs  min=841ns   med=2.25µs  max=15.91ms  p(90)=3.98µs  p(95)=4.83µs  p(99.9)=39.35µs
     http_req_connecting............: avg=268ns   min=0s      med=0s      max=3.36ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.18ms min=1.77ms  med=18.87ms max=291.64ms p(90)=26.59ms p(95)=29.08ms p(99.9)=48.78ms
       { expected_response:true }...: avg=19.18ms min=1.77ms  med=18.87ms max=291.64ms p(90)=26.59ms p(95)=29.08ms p(99.9)=48.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 309234
     http_req_receiving.............: avg=90.87µs min=24.25µs med=48.99µs max=211.52ms p(90)=91.82µs p(95)=135.8µs p(99.9)=7.15ms 
     http_req_sending...............: avg=44.93µs min=4.69µs  med=9.48µs  max=129.27ms p(90)=17.89µs p(95)=82.19µs p(99.9)=4.54ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.05ms min=1.72ms  med=18.76ms max=291.11ms p(90)=26.43ms p(95)=28.86ms p(99.9)=47.63ms
     http_reqs......................: 309234  2572.127717/s
     iteration_duration.............: avg=19.39ms min=3.19ms  med=19.07ms max=301.97ms p(90)=26.79ms p(95)=29.3ms  p(99.9)=49.29ms
     iterations.....................: 309134  2571.295943/s
     success_rate...................: 100.00% ✓ 309134      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 907260      ✗ 0     
     data_received..................: 27 GB   221 MB/s
     data_sent......................: 364 MB  3.0 MB/s
     http_req_blocked...............: avg=3.71µs   min=1µs     med=2.64µs   max=20.01ms  p(90)=4.28µs  p(95)=5.02µs  p(99.9)=36µs   
     http_req_connecting............: avg=323ns    min=0s      med=0s       max=4.04ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.6ms   min=1.54ms  med=18.68ms  max=302.64ms p(90)=28.33ms p(95)=31.99ms p(99.9)=53.73ms
       { expected_response:true }...: avg=19.6ms   min=1.54ms  med=18.68ms  max=302.64ms p(90)=28.33ms p(95)=31.99ms p(99.9)=53.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 302520
     http_req_receiving.............: avg=764.29µs min=53.82µs med=112.42µs max=209.69ms p(90)=1.98ms  p(95)=3.03ms  p(99.9)=22.02ms
     http_req_sending...............: avg=49.72µs  min=4.92µs  med=9.67µs   max=180.08ms p(90)=18.92µs p(95)=98.03µs p(99.9)=5.29ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.78ms  min=1.43ms  med=17.86ms  max=302.46ms p(90)=27.37ms p(95)=30.98ms p(99.9)=51.26ms
     http_reqs......................: 302520  2516.868198/s
     iteration_duration.............: avg=19.82ms  min=2.62ms  med=18.9ms   max=315.11ms p(90)=28.55ms p(95)=32.24ms p(99.9)=54.32ms
     iterations.....................: 302420  2516.03623/s
     success_rate...................: 100.00% ✓ 302420      ✗ 0     
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

     checks.........................: 100.00% ✓ 864519      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=3.19µs   min=892ns  med=2.4µs   max=15.99ms  p(90)=3.92µs  p(95)=4.6µs   p(99.9)=37.64µs 
     http_req_connecting............: avg=302ns    min=0s     med=0s      max=3.49ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.59ms  min=1.5ms  med=17.23ms max=365.94ms p(90)=33.84ms p(95)=41.51ms p(99.9)=145.89ms
       { expected_response:true }...: avg=20.59ms  min=1.5ms  med=17.23ms max=365.94ms p(90)=33.84ms p(95)=41.51ms p(99.9)=145.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288273
     http_req_receiving.............: avg=604.57µs min=52.4µs med=96.55µs max=321.4ms  p(90)=1.12ms  p(95)=1.97ms  p(99.9)=29.08ms 
     http_req_sending...............: avg=44.21µs  min=4.75µs med=9.19µs  max=225.43ms p(90)=16.83µs p(95)=83.61µs p(99.9)=3.31ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.94ms  min=1.43ms med=16.69ms max=365.84ms p(90)=32.8ms  p(95)=40.28ms p(99.9)=144.76ms
     http_reqs......................: 288273  2398.246483/s
     iteration_duration.............: avg=20.81ms  min=2.53ms med=17.44ms max=366.14ms p(90)=34.07ms p(95)=41.75ms p(99.9)=147.48ms
     iterations.....................: 288173  2397.414547/s
     success_rate...................: 100.00% ✓ 288173      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 856323      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 343 MB  2.9 MB/s
     http_req_blocked...............: avg=2.67µs   min=832ns   med=1.94µs  max=12.59ms  p(90)=3.32µs  p(95)=4µs     p(99.9)=28.41µs 
     http_req_connecting............: avg=304ns    min=0s      med=0s      max=3.19ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.79ms  min=1.61ms  med=17.39ms max=295.13ms p(90)=34.11ms p(95)=41.98ms p(99.9)=146.9ms 
       { expected_response:true }...: avg=20.79ms  min=1.61ms  med=17.39ms max=295.13ms p(90)=34.11ms p(95)=41.98ms p(99.9)=146.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 285541
     http_req_receiving.............: avg=609.56µs min=51.64µs med=94.43µs max=246.67ms p(90)=1.14ms  p(95)=1.99ms  p(99.9)=28.95ms 
     http_req_sending...............: avg=41.46µs  min=4.27µs  med=8.28µs  max=228.95ms p(90)=16.15µs p(95)=65.56µs p(99.9)=3.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.14ms  min=1.49ms  med=16.83ms max=295.02ms p(90)=33.07ms p(95)=40.71ms p(99.9)=144.15ms
     http_reqs......................: 285541  2375.340805/s
     iteration_duration.............: avg=21.01ms  min=2.74ms  med=17.59ms max=297.65ms p(90)=34.33ms p(95)=42.22ms p(99.9)=148.04ms
     iterations.....................: 285441  2374.508932/s
     success_rate...................: 100.00% ✓ 285441      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 814710      ✗ 0     
     data_received..................: 24 GB   198 MB/s
     data_sent......................: 326 MB  2.7 MB/s
     http_req_blocked...............: avg=3.65µs   min=952ns   med=2.83µs   max=17.23ms  p(90)=4.61µs  p(95)=5.42µs  p(99.9)=39.19µs 
     http_req_connecting............: avg=298ns    min=0s      med=0s       max=3.62ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.85ms  min=1.97ms  med=18.75ms  max=506.31ms p(90)=35.05ms p(95)=42.47ms p(99.9)=140.82ms
       { expected_response:true }...: avg=21.85ms  min=1.97ms  med=18.75ms  max=506.31ms p(90)=35.05ms p(95)=42.47ms p(99.9)=140.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 271670
     http_req_receiving.............: avg=571.24µs min=51.83µs med=100.39µs max=487.69ms p(90)=1.09ms  p(95)=1.94ms  p(99.9)=26.71ms 
     http_req_sending...............: avg=46.48µs  min=4.72µs  med=10.74µs  max=150.25ms p(90)=20.43µs p(95)=92.83µs p(99.9)=4.11ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.23ms  min=1.83ms  med=18.21ms  max=360.78ms p(90)=34.09ms p(95)=41.41ms p(99.9)=139.32ms
     http_reqs......................: 271670  2259.194125/s
     iteration_duration.............: avg=22.08ms  min=3.12ms  med=18.97ms  max=506.52ms p(90)=35.3ms  p(95)=42.71ms p(99.9)=141.97ms
     iterations.....................: 271570  2258.36253/s
     success_rate...................: 100.00% ✓ 271570      ✗ 0     
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

     checks.........................: 100.00% ✓ 607737      ✗ 0     
     data_received..................: 18 GB   148 MB/s
     data_sent......................: 244 MB  2.0 MB/s
     http_req_blocked...............: avg=3.11µs  min=862ns   med=2.23µs  max=3.12ms   p(90)=4.41µs   p(95)=5.49µs   p(99.9)=46.1µs 
     http_req_connecting............: avg=300ns   min=0s      med=0s      max=3.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.37ms min=2.21ms  med=28.84ms max=323.92ms p(90)=38.66ms  p(95)=42.01ms  p(99.9)=63.32ms
       { expected_response:true }...: avg=29.37ms min=2.21ms  med=28.84ms max=323.92ms p(90)=38.66ms  p(95)=42.01ms  p(99.9)=63.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 202679
     http_req_receiving.............: avg=94.5µs  min=26.86µs med=54.95µs max=48.32ms  p(90)=125.25µs p(95)=205.29µs p(99.9)=4.17ms 
     http_req_sending...............: avg=42.03µs min=4.82µs  med=9.56µs  max=235.44ms p(90)=24.28µs  p(95)=106.08µs p(99.9)=2.87ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.23ms min=2.14ms  med=28.72ms max=323.71ms p(90)=38.5ms   p(95)=41.83ms  p(99.9)=62.52ms
     http_reqs......................: 202679  1684.89331/s
     iteration_duration.............: avg=29.6ms  min=6.2ms   med=29.07ms max=332.69ms p(90)=38.88ms  p(95)=42.24ms  p(99.9)=63.86ms
     iterations.....................: 202579  1684.061999/s
     success_rate...................: 100.00% ✓ 202579      ✗ 0     
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

     checks.........................: 100.00% ✓ 440865      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 177 MB  1.5 MB/s
     http_req_blocked...............: avg=4.09µs  min=1.19µs  med=3.14µs  max=4.23ms   p(90)=4.75µs   p(95)=5.5µs    p(99.9)=37.78µs 
     http_req_connecting............: avg=642ns   min=0s      med=0s      max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.56ms min=2.21ms  med=40.15ms max=304.51ms p(90)=56.24ms  p(95)=61.23ms  p(99.9)=84.34ms 
       { expected_response:true }...: avg=40.56ms min=2.21ms  med=40.15ms max=304.51ms p(90)=56.24ms  p(95)=61.23ms  p(99.9)=84.34ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 147055
     http_req_receiving.............: avg=81.92µs min=26.02µs med=67.7µs  max=184.71ms p(90)=106.93µs p(95)=123.49µs p(99.9)=909.36µs
     http_req_sending...............: avg=28.26µs min=5.07µs  med=13.79µs max=203.4ms  p(90)=21.06µs  p(95)=24.97µs  p(99.9)=1.01ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.45ms min=2.11ms  med=40.04ms max=303.84ms p(90)=56.13ms  p(95)=61.11ms  p(99.9)=83.89ms 
     http_reqs......................: 147055  1222.496733/s
     iteration_duration.............: avg=40.82ms min=4.07ms  med=40.38ms max=317.32ms p(90)=56.47ms  p(95)=61.46ms  p(99.9)=84.73ms 
     iterations.....................: 146955  1221.665414/s
     success_rate...................: 100.00% ✓ 146955      ✗ 0     
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

     checks.........................: 100.00% ✓ 204729     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 82 MB   681 kB/s
     http_req_blocked...............: avg=4.24µs  min=1.06µs  med=2.68µs  max=3.97ms   p(90)=4.17µs   p(95)=4.76µs   p(99.9)=68.58µs 
     http_req_connecting............: avg=1.28µs  min=0s      med=0s      max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.57ms min=3.87ms  med=86.16ms max=325.83ms p(90)=111.95ms p(95)=124.2ms  p(99.9)=207.3ms 
       { expected_response:true }...: avg=87.57ms min=3.87ms  med=86.16ms max=325.83ms p(90)=111.95ms p(95)=124.2ms  p(99.9)=207.3ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 68343
     http_req_receiving.............: avg=80.83µs min=29.63µs med=70.5µs  max=101.61ms p(90)=106.97µs p(95)=120.78µs p(99.9)=657.73µs
     http_req_sending...............: avg=24.33µs min=5.13µs  med=13.18µs max=113.32ms p(90)=20.01µs  p(95)=22.05µs  p(99.9)=581.6µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.47ms min=3.78ms  med=86.07ms max=325.18ms p(90)=111.83ms p(95)=124.07ms p(99.9)=207.09ms
     http_reqs......................: 68343   567.098453/s
     iteration_duration.............: avg=87.93ms min=36.14ms med=86.41ms max=336.88ms p(90)=112.2ms  p(95)=124.49ms p(99.9)=207.75ms
     iterations.....................: 68243   566.26867/s
     success_rate...................: 100.00% ✓ 68243      ✗ 0    
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

     checks.........................: 100.00% ✓ 160608    ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   534 kB/s
     http_req_blocked...............: avg=5.84µs   min=1.37µs  med=3.67µs   max=3.73ms   p(90)=5.29µs   p(95)=5.91µs   p(99.9)=126µs   
     http_req_connecting............: avg=1.87µs   min=0s      med=0s       max=3.69ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.6ms  min=5.12ms  med=109.38ms max=333.87ms p(90)=147.5ms  p(95)=158.65ms p(99.9)=203.25ms
       { expected_response:true }...: avg=111.6ms  min=5.12ms  med=109.38ms max=333.87ms p(90)=147.5ms  p(95)=158.65ms p(99.9)=203.25ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 53636
     http_req_receiving.............: avg=90.36µs  min=30.71µs med=84.07µs  max=107.06ms p(90)=115.98µs p(95)=128.74µs p(99.9)=576.02µs
     http_req_sending...............: avg=28.09µs  min=6.42µs  med=18.04µs  max=190.03ms p(90)=23.49µs  p(95)=25.53µs  p(99.9)=558.99µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.48ms min=5.04ms  med=109.27ms max=333.52ms p(90)=147.38ms p(95)=158.53ms p(99.9)=202.57ms
     http_reqs......................: 53636   444.49764/s
     iteration_duration.............: avg=112.1ms  min=35.39ms med=109.71ms max=343.52ms p(90)=147.79ms p(95)=158.98ms p(99.9)=206.96ms
     iterations.....................: 53536   443.66891/s
     success_rate...................: 100.00% ✓ 53536     ✗ 0    
     vus............................: 50      min=50      max=50 
     vus_max........................: 50      min=50      max=50
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

     checks.........................: 100.00% ✓ 96843      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=7.09µs   min=1.5µs   med=3.75µs   max=3.81ms   p(90)=5.19µs   p(95)=5.79µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=3.01µs   min=0s      med=0s       max=3.76ms   p(90)=0s       p(95)=0s       p(99.9)=1.56ms  
     http_req_duration..............: avg=185.11ms min=7.81ms  med=173.96ms max=355.31ms p(90)=234.14ms p(95)=238.87ms p(99.9)=319.7ms 
       { expected_response:true }...: avg=185.11ms min=7.81ms  med=173.96ms max=355.31ms p(90)=234.14ms p(95)=238.87ms p(99.9)=319.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32381
     http_req_receiving.............: avg=95.94µs  min=35.02µs med=90.19µs  max=51.09ms  p(90)=122.02µs p(95)=134.77µs p(99.9)=709.14µs
     http_req_sending...............: avg=26.35µs  min=5.81µs  med=18.08µs  max=50.21ms  p(90)=22.75µs  p(95)=24.69µs  p(99.9)=594.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.99ms min=7.67ms  med=173.84ms max=355.01ms p(90)=234.03ms p(95)=238.76ms p(99.9)=319.58ms
     http_reqs......................: 32381   267.689719/s
     iteration_duration.............: avg=185.96ms min=41.69ms med=174.26ms max=371.55ms p(90)=234.46ms p(95)=239.17ms p(99.9)=322.4ms 
     iterations.....................: 32281   266.863032/s
     success_rate...................: 100.00% ✓ 32281      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 94137      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=7.45µs   min=1.52µs  med=3.78µs   max=4.57ms   p(90)=5.21µs   p(95)=5.8µs    p(99.9)=1.57ms  
     http_req_connecting............: avg=3.38µs   min=0s      med=0s       max=4.52ms   p(90)=0s       p(95)=0s       p(99.9)=1.47ms  
     http_req_duration..............: avg=190.46ms min=6.08ms  med=177.41ms max=752.29ms p(90)=221.08ms p(95)=269.03ms p(99.9)=598.4ms 
       { expected_response:true }...: avg=190.46ms min=6.08ms  med=177.41ms max=752.29ms p(90)=221.08ms p(95)=269.03ms p(99.9)=598.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31479
     http_req_receiving.............: avg=107.01µs min=38.19µs med=91.92µs  max=94.49ms  p(90)=122.25µs p(95)=133.72µs p(99.9)=747.08µs
     http_req_sending...............: avg=27.36µs  min=6.58µs  med=18.16µs  max=113.06ms p(90)=22.83µs  p(95)=24.58µs  p(99.9)=498.07µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.33ms min=5.89ms  med=177.29ms max=752.18ms p(90)=220.95ms p(95)=268.95ms p(99.9)=598.32ms
     http_reqs......................: 31479   260.17838/s
     iteration_duration.............: avg=191.32ms min=39.27ms med=177.79ms max=752.52ms p(90)=221.48ms p(95)=269.81ms p(99.9)=598.64ms
     iterations.....................: 31379   259.351866/s
     success_rate...................: 100.00% ✓ 31379      ✗ 0    
     vus............................: 2       min=2        max=50 
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

     checks.........................: 100.00% ✓ 6132      ✗ 0   
     data_received..................: 205 MB  1.6 MB/s
     data_sent......................: 2.6 MB  20 kB/s
     http_req_blocked...............: avg=49.49µs min=1.49µs  med=3.27µs  max=3.47ms  p(90)=4.76µs   p(95)=5.77µs  p(99.9)=3.27ms  
     http_req_connecting............: avg=45.09µs min=0s      med=0s      max=3.43ms  p(90)=0s       p(95)=0s      p(99.9)=3.24ms  
     http_req_duration..............: avg=2.83s   min=39.32ms med=2.9s    max=4.81s   p(90)=3.64s    p(95)=3.83s   p(99.9)=4.71s   
       { expected_response:true }...: avg=2.83s   min=39.32ms med=2.9s    max=4.81s   p(90)=3.64s    p(95)=3.83s   p(99.9)=4.71s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2144
     http_req_receiving.............: avg=97.88µs min=35.74µs med=85.77µs max=15.03ms p(90)=134.21µs p(95)=151.7µs p(99.9)=332.52µs
     http_req_sending...............: avg=55.53µs min=5.87µs  med=16.84µs max=22.56ms p(90)=22.68µs  p(95)=28.31µs p(99.9)=6.92ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=2.83s   min=39.17ms med=2.9s    max=4.81s   p(90)=3.64s    p(95)=3.83s   p(99.9)=4.71s   
     http_reqs......................: 2144    16.879033/s
     iteration_duration.............: avg=2.96s   min=1.27s   med=2.94s   max=4.81s   p(90)=3.65s    p(95)=3.84s   p(99.9)=4.72s   
     iterations.....................: 2044    16.091765/s
     success_rate...................: 100.00% ✓ 2044      ✗ 0   
     vus............................: 10      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

