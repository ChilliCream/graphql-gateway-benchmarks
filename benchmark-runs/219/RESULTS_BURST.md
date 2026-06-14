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
| hive-router | v0.0.65 | 2,650 | 2,756 | 2,600 | 2.2% |  |
| hotchocolate | 16.1.3 | 2,002 | 2,037 | 1,962 | 1.2% |  |
| cosmo | 0.321.1 | 1,148 | 1,148 | 1,141 | 0.4% | non-compatible response (15 across 7/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 512 | 519 | 509 | 0.7% |  |
| hive-gateway | 2.8.2 | 218 | 221 | 217 | 0.6% |  |
| apollo-gateway | 2.14.1 | 199 | 205 | 198 | 1.1% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (8198 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (490351 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,260 | 2,334 | 2,189 | 2.4% |  |
| hotchocolate | 16.1.3 | 1,910 | 1,955 | 1,704 | 3.9% |  |
| cosmo | 0.321.1 | 1,060 | 1,083 | 1,058 | 1.0% | non-compatible response (7 across 4/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 497 | 506 | 492 | 1.0% |  |
| hive-gateway | 2.8.2 | 220 | 224 | 217 | 1.1% |  |
| apollo-gateway | 2.14.1 | 208 | 212 | 206 | 0.8% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (31463 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (254880 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 489282      ✗ 0     
     data_received..................: 14 GB   233 MB/s
     data_sent......................: 197 MB  3.2 MB/s
     http_req_blocked...............: avg=24.51µs  min=1µs     med=2.16µs  max=57.95ms  p(90)=3.45µs   p(95)=4.44µs   p(99.9)=5.56ms  
     http_req_connecting............: avg=21.66µs  min=0s      med=0s      max=57.81ms  p(90)=0s       p(95)=0s       p(99.9)=5.33ms  
     http_req_duration..............: avg=86.61ms  min=1.61ms  med=81ms    max=358.88ms p(90)=167.55ms p(95)=181.6ms  p(99.9)=225.44ms
       { expected_response:true }...: avg=86.61ms  min=1.61ms  med=81ms    max=358.88ms p(90)=167.55ms p(95)=181.6ms  p(99.9)=225.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 164094
     http_req_receiving.............: avg=293.47µs min=27.88µs med=55.5µs  max=213.16ms p(90)=198.57µs p(95)=399.06µs p(99.9)=29.95ms 
     http_req_sending...............: avg=75.79µs  min=5.11µs  med=9.55µs  max=44.27ms  p(90)=17.68µs  p(95)=128.67µs p(99.9)=11.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.24ms  min=1.56ms  med=80.67ms max=265.8ms  p(90)=166.98ms p(95)=180.79ms p(99.9)=222.43ms
     http_reqs......................: 164094  2650.670961/s
     iteration_duration.............: avg=87.41ms  min=2.24ms  med=81.91ms max=391.32ms p(90)=168.03ms p(95)=182.1ms  p(99.9)=226.89ms
     iterations.....................: 163094  2634.517591/s
     success_rate...................: 100.00% ✓ 163094      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 374232      ✗ 0     
     data_received..................: 11 GB   176 MB/s
     data_sent......................: 151 MB  2.4 MB/s
     http_req_blocked...............: avg=14.43µs  min=952ns   med=2.12µs   max=92.51ms  p(90)=3.29µs   p(95)=4.14µs   p(99.9)=1.24ms  
     http_req_connecting............: avg=11.41µs  min=0s      med=0s       max=92.44ms  p(90)=0s       p(95)=0s       p(99.9)=1.16ms  
     http_req_duration..............: avg=113.2ms  min=2.4ms   med=104.19ms max=833.71ms p(90)=220.89ms p(95)=251.75ms p(99.9)=517.67ms
       { expected_response:true }...: avg=113.2ms  min=2.4ms   med=104.19ms max=833.71ms p(90)=220.89ms p(95)=251.75ms p(99.9)=517.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 125744
     http_req_receiving.............: avg=1.68ms   min=52.47µs med=117.41µs max=435.6ms  p(90)=1.3ms    p(95)=3.85ms   p(99.9)=172.93ms
     http_req_sending...............: avg=57.86µs  min=5.26µs  med=9.29µs   max=210.95ms p(90)=16.27µs  p(95)=116.4µs  p(99.9)=7.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.46ms min=2.3ms   med=103.05ms max=833.62ms p(90)=218.34ms p(95)=246.33ms p(99.9)=473.04ms
     http_reqs......................: 125744  2002.389755/s
     iteration_duration.............: avg=114.37ms min=3.7ms   med=105.54ms max=833.89ms p(90)=221.51ms p(95)=252.61ms p(99.9)=518.49ms
     iterations.....................: 124744  1986.465419/s
     success_rate...................: 100.00% ✓ 124744      ✗ 0     
     vus............................: 95      min=0         max=500 
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

     checks.........................: 100.00% ✓ 214443      ✗ 0    
     data_received..................: 6.4 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=5.59µs   min=990ns  med=2.18µs   max=18.94ms  p(90)=3.64µs   p(95)=4.56µs   p(99.9)=486.86µs
     http_req_connecting............: avg=2.7µs    min=0s     med=0s       max=18.89ms  p(90)=0s       p(95)=0s       p(99.9)=439.32µs
     http_req_duration..............: avg=196.54ms min=2.05ms med=196.35ms max=620.67ms p(90)=364.72ms p(95)=392.03ms p(99.9)=530.35ms
       { expected_response:true }...: avg=196.54ms min=2.05ms med=196.35ms max=620.67ms p(90)=364.72ms p(95)=392.03ms p(99.9)=530.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72481
     http_req_receiving.............: avg=77.51µs  min=29.8µs med=59.05µs  max=195.56ms p(90)=93.7µs   p(95)=107.61µs p(99.9)=1.45ms  
     http_req_sending...............: avg=30.61µs  min=5.1µs  med=10.02µs  max=131.6ms  p(90)=15.78µs  p(95)=19.41µs  p(99.9)=3.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.44ms min=1.99ms med=196.22ms max=620.61ms p(90)=364.61ms p(95)=391.96ms p(99.9)=530.29ms
     http_reqs......................: 72481   1148.319959/s
     iteration_duration.............: avg=199.52ms min=5.08ms med=199.72ms max=620.81ms p(90)=365.62ms p(95)=392.83ms p(99.9)=530.66ms
     iterations.....................: 71481   1132.476911/s
     success_rate...................: 100.00% ✓ 71481       ✗ 0    
     vus............................: 1       min=0         max=494
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

     checks.........................: 100.00% ✓ 96687      ✗ 0    
     data_received..................: 2.9 GB  45 MB/s
     data_sent......................: 40 MB   615 kB/s
     http_req_blocked...............: avg=9.18µs   min=1.19µs  med=2.61µs   max=7.72ms   p(90)=4.36µs   p(95)=5.42µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=5.38µs   min=0s      med=0s       max=7.65ms   p(90)=0s       p(95)=0s       p(99.9)=1.63ms  
     http_req_duration..............: avg=432.02ms min=3.96ms  med=401.08ms max=1.7s     p(90)=852.47ms p(95)=929.48ms p(99.9)=1.35s   
       { expected_response:true }...: avg=432.02ms min=3.96ms  med=401.08ms max=1.7s     p(90)=852.47ms p(95)=929.48ms p(99.9)=1.35s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33229
     http_req_receiving.............: avg=88.44µs  min=33.16µs med=75.06µs  max=107.78ms p(90)=112.38µs p(95)=126.41µs p(99.9)=927.48µs
     http_req_sending...............: avg=27.14µs  min=5.47µs  med=12.63µs  max=63.36ms  p(90)=20.21µs  p(95)=23.57µs  p(99.9)=2.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=431.9ms  min=3.9ms   med=400.98ms max=1.7s     p(90)=852.35ms p(95)=929.16ms p(99.9)=1.35s   
     http_reqs......................: 33229   512.673521/s
     iteration_duration.............: avg=445.65ms min=30.8ms  med=417.25ms max=1.7s     p(90)=855.65ms p(95)=932.09ms p(99.9)=1.36s   
     iterations.....................: 32229   497.245024/s
     success_rate...................: 100.00% ✓ 32229      ✗ 0    
     vus............................: 95      min=0        max=500
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

     checks.........................: 100.00% ✓ 41733      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   263 kB/s
     http_req_blocked...............: avg=15.61µs  min=1.24µs  med=3.53µs   max=14.76ms  p(90)=5.43µs   p(95)=7.24µs   p(99.9)=2.44ms  
     http_req_connecting............: avg=10.29µs  min=0s      med=0s       max=14.48ms  p(90)=0s       p(95)=0s       p(99.9)=2.42ms  
     http_req_duration..............: avg=955.8ms  min=6.18ms  med=849.77ms max=17.56s   p(90)=1.69s    p(95)=1.88s    p(99.9)=15.92s  
       { expected_response:true }...: avg=955.8ms  min=6.18ms  med=849.77ms max=17.56s   p(90)=1.69s    p(95)=1.88s    p(99.9)=15.92s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14911
     http_req_receiving.............: avg=106.95µs min=36.98µs med=98.31µs  max=18.4ms   p(90)=136.42µs p(95)=148.67µs p(99.9)=915.19µs
     http_req_sending...............: avg=46.57µs  min=6.19µs  med=17.66µs  max=137.72ms p(90)=24.13µs  p(95)=28.68µs  p(99.9)=3.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=955.65ms min=6.1ms   med=849.28ms max=17.56s   p(90)=1.69s    p(95)=1.88s    p(99.9)=15.92s  
     http_reqs......................: 14911   218.128779/s
     iteration_duration.............: avg=1.02s    min=41.21ms med=920.58ms max=17.57s   p(90)=1.72s    p(95)=1.9s     p(99.9)=15.92s  
     iterations.....................: 13911   203.500063/s
     success_rate...................: 100.00% ✓ 13911      ✗ 0    
     vus............................: 72      min=0        max=500
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

     checks.........................: 100.00% ✓ 41571      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   246 kB/s
     http_req_blocked...............: avg=15.49µs  min=1.31µs  med=3.22µs   max=4.57ms  p(90)=4.89µs   p(95)=6.67µs   p(99.9)=2.64ms
     http_req_connecting............: avg=10.4µs   min=0s      med=0s       max=4.51ms  p(90)=0s       p(95)=0s       p(99.9)=2.59ms
     http_req_duration..............: avg=466.14ms min=8.52ms  med=526.07ms max=1.39s   p(90)=825.88ms p(95)=883.75ms p(99.9)=1.23s 
       { expected_response:true }...: avg=466.14ms min=8.52ms  med=526.07ms max=1.39s   p(90)=825.88ms p(95)=883.75ms p(99.9)=1.23s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14857
     http_req_receiving.............: avg=100.6µs  min=34.42µs med=88.7µs   max=54.54ms p(90)=127.37µs p(95)=140.13µs p(99.9)=1.06ms
     http_req_sending...............: avg=32.25µs  min=6.02µs  med=16.02µs  max=27.56ms p(90)=22.05µs  p(95)=27.08µs  p(99.9)=3.6ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=466.01ms min=8.41ms  med=525.95ms max=1.39s   p(90)=825.77ms p(95)=883.31ms p(99.9)=1.23s 
     http_reqs......................: 14857   199.978689/s
     iteration_duration.............: avg=499.61ms min=9.23ms  med=552.19ms max=1.39s   p(90)=833.66ms p(95)=891.86ms p(99.9)=1.25s 
     iterations.....................: 13857   186.518455/s
     success_rate...................: 100.00% ✓ 13857      ✗ 0    
     vus............................: 65      min=0        max=495
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

     checks.........................: 100.00% ✓ 417525      ✗ 0     
     data_received..................: 12 GB   198 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=22.98µs  min=1.02µs  med=2.43µs  max=70.3ms   p(90)=4.16µs   p(95)=5.43µs   p(99.9)=2.1ms   
     http_req_connecting............: avg=19.73µs  min=0s      med=0s      max=70.12ms  p(90)=0s       p(95)=0s       p(99.9)=2.03ms  
     http_req_duration..............: avg=101.46ms min=1.6ms   med=95.52ms max=329.62ms p(90)=194.57ms p(95)=213.11ms p(99.9)=271.79ms
       { expected_response:true }...: avg=101.46ms min=1.6ms   med=95.52ms max=329.62ms p(90)=194.57ms p(95)=213.11ms p(99.9)=271.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140175
     http_req_receiving.............: avg=243.92µs min=28.51µs med=60.21µs max=147.42ms p(90)=199.51µs p(95)=428.84µs p(99.9)=25.08ms 
     http_req_sending...............: avg=81.56µs  min=5.23µs  med=10.64µs max=274.28ms p(90)=21.69µs  p(95)=140.13µs p(99.9)=11.31ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.14ms min=1.53ms  med=95.27ms max=309.07ms p(90)=193.95ms p(95)=212.56ms p(99.9)=270.49ms
     http_reqs......................: 140175  2260.151196/s
     iteration_duration.............: avg=102.47ms min=4.96ms  med=96.7ms  max=347.32ms p(90)=195.17ms p(95)=213.67ms p(99.9)=272.34ms
     iterations.....................: 139175  2244.027414/s
     success_rate...................: 100.00% ✓ 139175      ✗ 0     
     vus............................: 58      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 353925      ✗ 0     
     data_received..................: 10 GB   167 MB/s
     data_sent......................: 143 MB  2.3 MB/s
     http_req_blocked...............: avg=20.69µs  min=992ns   med=2.33µs   max=82.55ms  p(90)=3.98µs   p(95)=5.08µs   p(99.9)=2.62ms  
     http_req_connecting............: avg=17.67µs  min=0s      med=0s       max=82.38ms  p(90)=0s       p(95)=0s       p(99.9)=2.39ms  
     http_req_duration..............: avg=119.62ms min=1.78ms  med=107.17ms max=803.84ms p(90)=234ms    p(95)=264.36ms p(99.9)=626.77ms
       { expected_response:true }...: avg=119.62ms min=1.78ms  med=107.17ms max=803.84ms p(90)=234ms    p(95)=264.36ms p(99.9)=626.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118975
     http_req_receiving.............: avg=1.6ms    min=52.48µs med=113.61µs max=323.29ms p(90)=1.59ms   p(95)=4.07ms   p(99.9)=142.44ms
     http_req_sending...............: avg=68.18µs  min=5.28µs  med=9.97µs   max=96.84ms  p(90)=19.55µs  p(95)=121.91µs p(99.9)=8.96ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.94ms min=1.69ms  med=106.05ms max=803.37ms p(90)=231.26ms p(95)=260.12ms p(99.9)=623.24ms
     http_reqs......................: 118975  1910.292625/s
     iteration_duration.............: avg=120.92ms min=3.07ms  med=108.66ms max=804ms    p(90)=234.73ms p(95)=265.18ms p(99.9)=627.25ms
     iterations.....................: 117975  1894.236372/s
     success_rate...................: 100.00% ✓ 117975      ✗ 0     
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

     checks.........................: 100.00% ✓ 196578      ✗ 0    
     data_received..................: 5.8 GB  93 MB/s
     data_sent......................: 80 MB   1.3 MB/s
     http_req_blocked...............: avg=7.28µs   min=1.07µs  med=2.28µs   max=31.98ms  p(90)=3.85µs   p(95)=4.77µs   p(99.9)=732.14µs
     http_req_connecting............: avg=4.2µs    min=0s      med=0s       max=31.92ms  p(90)=0s       p(95)=0s       p(99.9)=637.61µs
     http_req_duration..............: avg=214.6ms  min=2.14ms  med=214.26ms max=666.5ms  p(90)=399.49ms p(95)=430.84ms p(99.9)=580.28ms
       { expected_response:true }...: avg=214.6ms  min=2.14ms  med=214.26ms max=666.5ms  p(90)=399.49ms p(95)=430.84ms p(99.9)=580.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 66526
     http_req_receiving.............: avg=81.52µs  min=30.29µs med=63.98µs  max=143.88ms p(90)=101.23µs p(95)=117.64µs p(99.9)=1.8ms   
     http_req_sending...............: avg=29.85µs  min=5.2µs   med=10.75µs  max=67.18ms  p(90)=17.51µs  p(95)=21.14µs  p(99.9)=3.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=214.48ms min=2.08ms  med=214.17ms max=666.45ms p(90)=399.41ms p(95)=430.71ms p(99.9)=580.21ms
     http_reqs......................: 66526   1060.353723/s
     iteration_duration.............: avg=218.12ms min=4.85ms  med=218.43ms max=666.69ms p(90)=400.59ms p(95)=431.62ms p(99.9)=580.91ms
     iterations.....................: 65526   1044.414786/s
     success_rate...................: 100.00% ✓ 65526       ✗ 0    
     vus............................: 92      min=0         max=500
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

     checks.........................: 100.00% ✓ 94086      ✗ 0    
     data_received..................: 2.8 GB  44 MB/s
     data_sent......................: 39 MB   597 kB/s
     http_req_blocked...............: avg=10.52µs  min=1.1µs   med=2.89µs   max=35.66ms  p(90)=4.71µs   p(95)=5.73µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=6.54µs   min=0s      med=0s       max=35.6ms   p(90)=0s       p(95)=0s       p(99.9)=1.31ms  
     http_req_duration..............: avg=443.5ms  min=4.03ms  med=412.46ms max=1.85s    p(90)=872.99ms p(95)=954.46ms p(99.9)=1.41s   
       { expected_response:true }...: avg=443.5ms  min=4.03ms  med=412.46ms max=1.85s    p(90)=872.99ms p(95)=954.46ms p(99.9)=1.41s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32362
     http_req_receiving.............: avg=89.18µs  min=31.86µs med=80.79µs  max=12.43ms  p(90)=118.64µs p(95)=132.01µs p(99.9)=849.93µs
     http_req_sending...............: avg=32.26µs  min=5.83µs  med=13.6µs   max=107.92ms p(90)=21.36µs  p(95)=24.85µs  p(99.9)=2.87ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=443.38ms min=3.95ms  med=412.34ms max=1.85s    p(90)=872.89ms p(95)=954.36ms p(99.9)=1.41s   
     http_reqs......................: 32362   497.295263/s
     iteration_duration.............: avg=457.87ms min=21.68ms med=431.43ms max=1.86s    p(90)=878.07ms p(95)=958.09ms p(99.9)=1.42s   
     iterations.....................: 31362   481.928621/s
     success_rate...................: 100.00% ✓ 31362      ✗ 0    
     vus............................: 61      min=0        max=498
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

     checks.........................: 100.00% ✓ 42225      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   265 kB/s
     http_req_blocked...............: avg=16.75µs  min=1.22µs  med=3.68µs   max=27.73ms p(90)=5.62µs   p(95)=7.57µs   p(99.9)=2.5ms  
     http_req_connecting............: avg=11.23µs  min=0s      med=0s       max=27.65ms p(90)=0s       p(95)=0s       p(99.9)=2.47ms 
     http_req_duration..............: avg=969.51ms min=6.36ms  med=901.3ms  max=5.56s   p(90)=1.92s    p(95)=2.15s    p(99.9)=5.09s  
       { expected_response:true }...: avg=969.51ms min=6.36ms  med=901.3ms  max=5.56s   p(90)=1.92s    p(95)=2.15s    p(99.9)=5.09s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15075
     http_req_receiving.............: avg=106.91µs min=39.7µs  med=100.96µs max=12.09ms p(90)=139.91µs p(95)=152.62µs p(99.9)=942.3µs
     http_req_sending...............: avg=31.93µs  min=5.67µs  med=18.55µs  max=8.29ms  p(90)=24.76µs  p(95)=30.18µs  p(99.9)=3.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=969.37ms min=6.26ms  med=901.2ms  max=5.56s   p(90)=1.92s    p(95)=2.15s    p(99.9)=5.09s  
     http_reqs......................: 15075   220.630924/s
     iteration_duration.............: avg=1.03s    min=38.67ms med=985.78ms max=5.57s   p(90)=1.94s    p(95)=2.17s    p(99.9)=5.1s   
     iterations.....................: 14075   205.995373/s
     success_rate...................: 100.00% ✓ 14075      ✗ 0    
     vus............................: 70      min=0        max=500
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

     checks.........................: 100.00% ✓ 40824      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   250 kB/s
     http_req_blocked...............: avg=17.26µs  min=1.25µs  med=3.51µs   max=32.58ms p(90)=5.27µs   p(95)=7.02µs  p(99.9)=2.3ms 
     http_req_connecting............: avg=12.01µs  min=0s      med=0s       max=32.52ms p(90)=0s       p(95)=0s      p(99.9)=2.26ms
     http_req_duration..............: avg=997.6ms  min=8.78ms  med=898.28ms max=4.08s   p(90)=2.01s    p(95)=2.17s   p(99.9)=3.6s  
       { expected_response:true }...: avg=997.6ms  min=8.78ms  med=898.28ms max=4.08s   p(90)=2.01s    p(95)=2.17s   p(99.9)=3.6s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14608
     http_req_receiving.............: avg=103.33µs min=34.54µs med=95.89µs  max=10.58ms p(90)=136.96µs p(95)=150µs   p(99.9)=1ms   
     http_req_sending...............: avg=34.81µs  min=5.88µs  med=17.28µs  max=52.89ms p(90)=23.31µs  p(95)=28.51µs p(99.9)=2.23ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=997.46ms min=8.67ms  med=898.16ms max=4.08s   p(90)=2.01s    p(95)=2.17s   p(99.9)=3.6s  
     http_reqs......................: 14608   208.68041/s
     iteration_duration.............: avg=1.07s    min=34.08ms med=999.24ms max=4.08s   p(90)=2.03s    p(95)=2.18s   p(99.9)=3.64s 
     iterations.....................: 13608   194.395059/s
     success_rate...................: 100.00% ✓ 13608      ✗ 0    
     vus............................: 50      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

