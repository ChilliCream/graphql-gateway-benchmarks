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
| hive-router | v0.0.72 | 2,800 | 2,898 | 2,775 | 1.5% |  |
| fusion-nightly | 16.3.0-p.2 | 2,123 | 2,162 | 2,111 | 0.8% |  |
| fusion | 16.2.3 | 2,049 | 2,090 | 2,029 | 0.9% |  |
| cosmo | 0.326.0 | 1,105 | 1,127 | 1,102 | 0.8% |  |
| hive-gateway-router-runtime | 2.9.0 | 509 | 515 | 501 | 0.9% |  |
| hive-gateway | 2.9.0 | 215 | 218 | 204 | 1.9% |  |
| apollo-gateway | 2.14.1 | 200 | 206 | 199 | 1.1% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (10774 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (452448 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.72 | 2,321 | 2,392 | 2,263 | 1.9% | non-compatible response (3 across 1/9 runs) |
| fusion-nightly | 16.3.0-p.2 | 1,957 | 2,016 | 1,942 | 1.3% |  |
| fusion | 16.2.3 | 1,910 | 1,970 | 1,888 | 1.4% |  |
| cosmo | 0.326.0 | 1,074 | 1,098 | 1,067 | 1.0% |  |
| hive-gateway-router-runtime | 2.9.0 | 485 | 496 | 480 | 1.2% |  |
| hive-gateway | 2.9.0 | 220 | 224 | 216 | 1.3% |  |
| apollo-gateway | 2.14.1 | 206 | 210 | 203 | 1.1% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (24434 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (259955 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 517449      ✗ 0     
     data_received..................: 15 GB   246 MB/s
     data_sent......................: 208 MB  3.4 MB/s
     http_req_blocked...............: avg=31.27µs  min=922ns   med=2.29µs  max=83.74ms  p(90)=3.83µs   p(95)=4.98µs   p(99.9)=4.93ms  
     http_req_connecting............: avg=28.09µs  min=0s      med=0s      max=83.55ms  p(90)=0s       p(95)=0s       p(99.9)=4.7ms   
     http_req_duration..............: avg=81.87ms  min=1.65ms  med=75.14ms max=322.82ms p(90)=159.16ms p(95)=179.76ms p(99.9)=247.27ms
       { expected_response:true }...: avg=81.87ms  min=1.65ms  med=75.14ms max=322.82ms p(90)=159.16ms p(95)=179.76ms p(99.9)=247.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 173483
     http_req_receiving.............: avg=575.39µs min=28.01µs med=55.19µs max=151ms    p(90)=262.12µs p(95)=432.55µs p(99.9)=56.72ms 
     http_req_sending...............: avg=92.8µs   min=5.15µs  med=10µs    max=142.76ms p(90)=18.78µs  p(95)=132.92µs p(99.9)=14.15ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.2ms   min=1.59ms  med=74.83ms max=321.62ms p(90)=157.83ms p(95)=176.98ms p(99.9)=243.08ms
     http_reqs......................: 173483  2800.168254/s
     iteration_duration.............: avg=82.64ms  min=2.01ms  med=75.98ms max=341.7ms  p(90)=159.74ms p(95)=180.4ms  p(99.9)=248.78ms
     iterations.....................: 172483  2784.027374/s
     success_rate...................: 100.00% ✓ 172483      ✗ 0     
     vus............................: 55      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.3.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 395502      ✗ 0     
     data_received..................: 12 GB   186 MB/s
     data_sent......................: 160 MB  2.6 MB/s
     http_req_blocked...............: avg=16.96µs  min=982ns   med=2.27µs   max=64.96ms  p(90)=3.81µs   p(95)=4.99µs   p(99.9)=2.03ms  
     http_req_connecting............: avg=13.86µs  min=0s      med=0s       max=64.88ms  p(90)=0s       p(95)=0s       p(99.9)=2ms     
     http_req_duration..............: avg=107.09ms min=2.26ms  med=99.74ms  max=621.11ms p(90)=208.37ms p(95)=235.18ms p(99.9)=396.17ms
       { expected_response:true }...: avg=107.09ms min=2.26ms  med=99.74ms  max=621.11ms p(90)=208.37ms p(95)=235.18ms p(99.9)=396.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 132834
     http_req_receiving.............: avg=1.95ms   min=51.06µs med=271.59µs max=195.39ms p(90)=3.02ms   p(95)=7.07ms   p(99.9)=108.62ms
     http_req_sending...............: avg=69.53µs  min=5.4µs   med=9.76µs   max=51.34ms  p(90)=19.43µs  p(95)=121.16µs p(99.9)=9.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.07ms min=2.18ms  med=97.96ms  max=621.02ms p(90)=205.29ms p(95)=231ms    p(99.9)=376.25ms
     http_reqs......................: 132834  2123.533613/s
     iteration_duration.............: avg=108.19ms min=3.67ms  med=100.99ms max=621.35ms p(90)=209.11ms p(95)=235.99ms p(99.9)=397.47ms
     iterations.....................: 131834  2107.547242/s
     success_rate...................: 100.00% ✓ 131834      ✗ 0     
     vus............................: 84      min=0         max=492 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.2.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 382614      ✗ 0     
     data_received..................: 11 GB   180 MB/s
     data_sent......................: 154 MB  2.5 MB/s
     http_req_blocked...............: avg=17.86µs  min=1µs     med=2.24µs   max=97.34ms  p(90)=3.82µs   p(95)=4.93µs   p(99.9)=1.23ms  
     http_req_connecting............: avg=14.92µs  min=0s      med=0s       max=97.16ms  p(90)=0s       p(95)=0s       p(99.9)=1.17ms  
     http_req_duration..............: avg=110.7ms  min=2.4ms   med=98.73ms  max=623.4ms  p(90)=223.43ms p(95)=264.15ms p(99.9)=465.97ms
       { expected_response:true }...: avg=110.7ms  min=2.4ms   med=98.73ms  max=623.4ms  p(90)=223.43ms p(95)=264.15ms p(99.9)=465.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128538
     http_req_receiving.............: avg=3.62ms   min=52.18µs med=149.05µs max=295.69ms p(90)=4.77ms   p(95)=13.5ms   p(99.9)=172.62ms
     http_req_sending...............: avg=72.48µs  min=5.36µs  med=9.82µs   max=76.15ms  p(90)=19.31µs  p(95)=119.82µs p(99.9)=10.6ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107ms    min=2.27ms  med=96.53ms  max=595.04ms p(90)=215.32ms p(95)=251.57ms p(99.9)=420.78ms
     http_reqs......................: 128538  2049.582037/s
     iteration_duration.............: avg=111.87ms min=3.42ms  med=100.13ms max=623.62ms p(90)=224.29ms p(95)=265ms    p(99.9)=466.76ms
     iterations.....................: 127538  2033.636698/s
     success_rate...................: 100.00% ✓ 127538      ✗ 0     
     vus............................: 90      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.326.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 204501      ✗ 0    
     data_received..................: 6.1 GB  97 MB/s
     data_sent......................: 83 MB   1.3 MB/s
     http_req_blocked...............: avg=6.54µs   min=1.11µs  med=2.7µs    max=9.2ms    p(90)=4.32µs   p(95)=5.26µs   p(99.9)=745.34µs
     http_req_connecting............: avg=3.13µs   min=0s      med=0s       max=9.15ms   p(90)=0s       p(95)=0s       p(99.9)=644.78µs
     http_req_duration..............: avg=206.35ms min=2.08ms  med=206.1ms  max=543.05ms p(90)=383.59ms p(95)=409.84ms p(99.9)=485.42ms
       { expected_response:true }...: avg=206.35ms min=2.08ms  med=206.1ms  max=543.05ms p(90)=383.59ms p(95)=409.84ms p(99.9)=485.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69167
     http_req_receiving.............: avg=118.35µs min=30.65µs med=66.22µs  max=193.39ms p(90)=102µs    p(95)=116.59µs p(99.9)=1.88ms  
     http_req_sending...............: avg=32.74µs  min=5.68µs  med=11.69µs  max=212.48ms p(90)=18.04µs  p(95)=21.78µs  p(99.9)=3.5ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.2ms  min=2.02ms  med=205.83ms max=542.98ms p(90)=383.5ms  p(95)=409.77ms p(99.9)=485.35ms
     http_reqs......................: 69167   1105.434225/s
     iteration_duration.............: avg=209.62ms min=4.5ms   med=210.09ms max=543.23ms p(90)=384.53ms p(95)=410.61ms p(99.9)=485.64ms
     iterations.....................: 68167   1089.452121/s
     success_rate...................: 100.00% ✓ 68167       ✗ 0    
     vus............................: 83      min=0         max=496
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 96180      ✗ 0    
     data_received..................: 2.9 GB  45 MB/s
     data_sent......................: 40 MB   612 kB/s
     http_req_blocked...............: avg=8.62µs   min=1.11µs  med=2.92µs   max=7.39ms  p(90)=4.67µs   p(95)=5.69µs   p(99.9)=1.15ms  
     http_req_connecting............: avg=4.68µs   min=0s      med=0s       max=7.33ms  p(90)=0s       p(95)=0s       p(99.9)=998.67µs
     http_req_duration..............: avg=434.17ms min=3.94ms  med=402.47ms max=1.78s   p(90)=852.88ms p(95)=920.19ms p(99.9)=1.35s   
       { expected_response:true }...: avg=434.17ms min=3.94ms  med=402.47ms max=1.78s   p(90)=852.88ms p(95)=920.19ms p(99.9)=1.35s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33060
     http_req_receiving.............: avg=86.87µs  min=32.47µs med=76.19µs  max=45.57ms p(90)=112.98µs p(95)=127.41µs p(99.9)=923.61µs
     http_req_sending...............: avg=34.02µs  min=5.57µs  med=13.41µs  max=87.36ms p(90)=20.49µs  p(95)=23.97µs  p(99.9)=2.99ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=434.05ms min=3.87ms  med=402.4ms  max=1.78s   p(90)=852.79ms p(95)=920.09ms p(99.9)=1.35s   
     http_reqs......................: 33060   509.811948/s
     iteration_duration.............: avg=447.92ms min=17.41ms med=419.65ms max=1.78s   p(90)=856.76ms p(95)=923.86ms p(99.9)=1.37s   
     iterations.....................: 32060   494.391139/s
     success_rate...................: 100.00% ✓ 32060      ✗ 0    
     vus............................: 15      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 41643      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   259 kB/s
     http_req_blocked...............: avg=16.79µs  min=1.3µs   med=3.65µs   max=21.66ms p(90)=5.54µs   p(95)=7.43µs   p(99.9)=2.59ms 
     http_req_connecting............: avg=11.28µs  min=0s      med=0s       max=21.6ms  p(90)=0s       p(95)=0s       p(99.9)=2.54ms 
     http_req_duration..............: avg=970.68ms min=6.54ms  med=848.52ms max=17.82s  p(90)=1.73s    p(95)=1.9s     p(99.9)=14.53s 
       { expected_response:true }...: avg=970.68ms min=6.54ms  med=848.52ms max=17.82s  p(90)=1.73s    p(95)=1.9s     p(99.9)=14.53s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14881
     http_req_receiving.............: avg=137.74µs min=34.64µs med=99.11µs  max=24.08ms p(90)=139.19µs p(95)=152.64µs p(99.9)=18.69ms
     http_req_sending...............: avg=34.57µs  min=6.47µs  med=17.87µs  max=49.8ms  p(90)=24.22µs  p(95)=29.37µs  p(99.9)=3.07ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=970.51ms min=6.43ms  med=848.41ms max=17.82s  p(90)=1.73s    p(95)=1.9s     p(99.9)=14.53s 
     http_reqs......................: 14881   215.346492/s
     iteration_duration.............: avg=1.04s    min=26.84ms med=925.32ms max=17.83s  p(90)=1.75s    p(95)=1.93s    p(99.9)=14.57s 
     iterations.....................: 13881   200.875254/s
     success_rate...................: 100.00% ✓ 13881      ✗ 0    
     vus............................: 41      min=0        max=500
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

     checks.........................: 100.00% ✓ 41874      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   247 kB/s
     http_req_blocked...............: avg=17.95µs  min=1.21µs  med=3.38µs   max=21.65ms p(90)=5.04µs   p(95)=6.6µs    p(99.9)=2.84ms
     http_req_connecting............: avg=12.79µs  min=0s      med=0s       max=21.59ms p(90)=0s       p(95)=0s       p(99.9)=2.75ms
     http_req_duration..............: avg=478.33ms min=8.62ms  med=565.61ms max=1.35s   p(90)=829.1ms  p(95)=879.46ms p(99.9)=1.23s 
       { expected_response:true }...: avg=478.33ms min=8.62ms  med=565.61ms max=1.35s   p(90)=829.1ms  p(95)=879.46ms p(99.9)=1.23s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14958
     http_req_receiving.............: avg=109.96µs min=33.71µs med=91.19µs  max=86.72ms p(90)=130.75µs p(95)=144µs    p(99.9)=1.12ms
     http_req_sending...............: avg=37.01µs  min=5.71µs  med=16.5µs   max=70.51ms p(90)=22.74µs  p(95)=27.82µs  p(99.9)=2.93ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=478.18ms min=8.53ms  med=565.52ms max=1.35s   p(90)=828.9ms  p(95)=879.35ms p(99.9)=1.23s 
     http_reqs......................: 14958   200.797509/s
     iteration_duration.............: avg=512.49ms min=9.49ms  med=600.39ms max=1.36s   p(90)=835.66ms p(95)=884.95ms p(99.9)=1.24s 
     iterations.....................: 13958   187.373421/s
     success_rate...................: 100.00% ✓ 13958      ✗ 0    
     vus............................: 70      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 429117      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=27.43µs  min=992ns   med=2.85µs  max=65.99ms  p(90)=4.88µs   p(95)=6.2µs    p(99.9)=9.41ms  
     http_req_connecting............: avg=23.6µs   min=0s      med=0s      max=65.93ms  p(90)=0s       p(95)=0s       p(99.9)=8.98ms  
     http_req_duration..............: avg=98.7ms   min=1.62ms  med=92.33ms max=307.94ms p(90)=191.41ms p(95)=207.95ms p(99.9)=261.83ms
       { expected_response:true }...: avg=98.7ms   min=1.62ms  med=92.33ms max=307.94ms p(90)=191.41ms p(95)=207.95ms p(99.9)=261.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144039
     http_req_receiving.............: avg=338.99µs min=28.46µs med=61.64µs max=105.77ms p(90)=200.49µs p(95)=441.13µs p(99.9)=38.54ms 
     http_req_sending...............: avg=91.05µs  min=5.27µs  med=11.65µs max=151.07ms p(90)=23.02µs  p(95)=142.23µs p(99.9)=12.99ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.27ms  min=1.56ms  med=92.03ms max=297.95ms p(90)=190.68ms p(95)=206.91ms p(99.9)=259.51ms
     http_reqs......................: 144039  2321.951899/s
     iteration_duration.............: avg=99.69ms  min=4.22ms  med=93.41ms max=356.85ms p(90)=192.03ms p(95)=208.57ms p(99.9)=262.83ms
     iterations.....................: 143039  2305.831599/s
     success_rate...................: 100.00% ✓ 143039      ✗ 0     
     vus............................: 59      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.3.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 362046     ✗ 0     
     data_received..................: 11 GB   172 MB/s
     data_sent......................: 146 MB  2.4 MB/s
     http_req_blocked...............: avg=15.24µs  min=1.03µs  med=2.45µs   max=43.89ms  p(90)=4.21µs   p(95)=5.45µs   p(99.9)=1.16ms  
     http_req_connecting............: avg=12.06µs  min=0s      med=0s       max=43.7ms   p(90)=0s       p(95)=0s       p(99.9)=1.11ms  
     http_req_duration..............: avg=116.96ms min=1.67ms  med=110.61ms max=564.13ms p(90)=224.28ms p(95)=246ms    p(99.9)=365.25ms
       { expected_response:true }...: avg=116.96ms min=1.67ms  med=110.61ms max=564.13ms p(90)=224.28ms p(95)=246ms    p(99.9)=365.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 121682
     http_req_receiving.............: avg=1.75ms   min=52.25µs med=333.44µs max=193.12ms p(90)=3.12ms   p(95)=5.85ms   p(99.9)=85.17ms 
     http_req_sending...............: avg=64.69µs  min=5.1µs   med=10.23µs  max=202.31ms p(90)=20.46µs  p(95)=120.47µs p(99.9)=8.55ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.15ms min=1.59ms  med=108.78ms max=512.99ms p(90)=221.9ms  p(95)=242.96ms p(99.9)=356.51ms
     http_reqs......................: 121682  1957.35232/s
     iteration_duration.............: avg=118.22ms min=3.24ms  med=112.08ms max=564.38ms p(90)=224.96ms p(95)=246.65ms p(99.9)=365.9ms 
     iterations.....................: 120682  1941.26652/s
     success_rate...................: 100.00% ✓ 120682     ✗ 0     
     vus............................: 64      min=0        max=496 
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.2.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 353367      ✗ 0     
     data_received..................: 10 GB   167 MB/s
     data_sent......................: 143 MB  2.3 MB/s
     http_req_blocked...............: avg=16.11µs  min=962ns   med=2.34µs   max=58.15ms  p(90)=4.17µs   p(95)=5.34µs   p(99.9)=2.92ms  
     http_req_connecting............: avg=12.78µs  min=0s      med=0s       max=58.08ms  p(90)=0s       p(95)=0s       p(99.9)=2.81ms  
     http_req_duration..............: avg=119.8ms  min=1.76ms  med=112.11ms max=835.07ms p(90)=234.06ms p(95)=266.49ms p(99.9)=485.28ms
       { expected_response:true }...: avg=119.8ms  min=1.76ms  med=112.11ms max=835.07ms p(90)=234.06ms p(95)=266.49ms p(99.9)=485.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118789
     http_req_receiving.............: avg=2.63ms   min=52.45µs med=159.24µs max=325.62ms p(90)=4.08ms   p(95)=9.62ms   p(99.9)=145.32ms
     http_req_sending...............: avg=61.92µs  min=5.11µs  med=9.94µs   max=60.54ms  p(90)=19.6µs   p(95)=113.48µs p(99.9)=8.57ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.1ms  min=1.68ms  med=109.38ms max=834.96ms p(90)=229.3ms  p(95)=259.05ms p(99.9)=443.3ms 
     http_reqs......................: 118789  1910.194519/s
     iteration_duration.............: avg=121.12ms min=3.09ms  med=113.91ms max=835.3ms  p(90)=234.88ms p(95)=267.32ms p(99.9)=486.11ms
     iterations.....................: 117789  1894.113952/s
     success_rate...................: 100.00% ✓ 117789      ✗ 0     
     vus............................: 68      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 199446      ✗ 0    
     data_received..................: 5.9 GB  94 MB/s
     data_sent......................: 81 MB   1.3 MB/s
     http_req_blocked...............: avg=7.17µs   min=1.08µs  med=2.48µs   max=22.32ms  p(90)=4.2µs    p(95)=5.16µs   p(99.9)=874.98µs
     http_req_connecting............: avg=3.95µs   min=0s      med=0s       max=22.26ms  p(90)=0s       p(95)=0s       p(99.9)=806.35µs
     http_req_duration..............: avg=211.53ms min=2.23ms  med=210.56ms max=687.61ms p(90)=391.23ms p(95)=419.76ms p(99.9)=566.49ms
       { expected_response:true }...: avg=211.53ms min=2.23ms  med=210.56ms max=687.61ms p(90)=391.23ms p(95)=419.76ms p(99.9)=566.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 67482
     http_req_receiving.............: avg=94.22µs  min=30.72µs med=69.44µs  max=107.67ms p(90)=109.64µs p(95)=125.58µs p(99.9)=2.35ms  
     http_req_sending...............: avg=36.93µs  min=5.33µs  med=11.71µs  max=168.77ms p(90)=18.95µs  p(95)=22.74µs  p(99.9)=4.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.4ms  min=2.15ms  med=210.45ms max=687.49ms p(90)=391.08ms p(95)=419.66ms p(99.9)=566.41ms
     http_reqs......................: 67482   1074.517627/s
     iteration_duration.............: avg=214.97ms min=4.96ms  med=214.32ms max=687.81ms p(90)=392.16ms p(95)=420.54ms p(99.9)=567.47ms
     iterations.....................: 66482   1058.594601/s
     success_rate...................: 100.00% ✓ 66482       ✗ 0    
     vus............................: 95      min=0         max=500
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 92043      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   583 kB/s
     http_req_blocked...............: avg=11.73µs  min=1.11µs  med=3.22µs   max=39.61ms  p(90)=4.99µs   p(95)=5.93µs   p(99.9)=1.76ms  
     http_req_connecting............: avg=7.38µs   min=0s      med=0s       max=39.53ms  p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=453.3ms  min=4.06ms  med=423.39ms max=1.84s    p(90)=892.38ms p(95)=974.65ms p(99.9)=1.44s   
       { expected_response:true }...: avg=453.3ms  min=4.06ms  med=423.39ms max=1.84s    p(90)=892.38ms p(95)=974.65ms p(99.9)=1.44s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31681
     http_req_receiving.............: avg=100.47µs min=32.3µs  med=82.64µs  max=109.57ms p(90)=119.9µs  p(95)=133.96µs p(99.9)=920.89µs
     http_req_sending...............: avg=30.73µs  min=6µs     med=14.53µs  max=106.28ms p(90)=22.02µs  p(95)=25.38µs  p(99.9)=2.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=453.17ms min=3.99ms  med=423.33ms max=1.84s    p(90)=892.18ms p(95)=974.29ms p(99.9)=1.44s   
     http_reqs......................: 31681   485.676556/s
     iteration_duration.............: avg=468.3ms  min=19.67ms med=441.57ms max=1.85s    p(90)=897.89ms p(95)=978.84ms p(99.9)=1.45s   
     iterations.....................: 30681   470.346341/s
     success_rate...................: 100.00% ✓ 30681      ✗ 0    
     vus............................: 66      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42231      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   265 kB/s
     http_req_blocked...............: avg=14.65µs  min=1.21µs  med=3.79µs   max=5.22ms p(90)=5.68µs   p(95)=7.43µs   p(99.9)=2.13ms
     http_req_connecting............: avg=9.04µs   min=0s      med=0s       max=5.18ms p(90)=0s       p(95)=0s       p(99.9)=2.08ms
     http_req_duration..............: avg=969ms    min=6.34ms  med=879.97ms max=5.79s  p(90)=1.92s    p(95)=2.18s    p(99.9)=4.9s  
       { expected_response:true }...: avg=969ms    min=6.34ms  med=879.97ms max=5.79s  p(90)=1.92s    p(95)=2.18s    p(99.9)=4.9s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15077
     http_req_receiving.............: avg=107.12µs min=37.42µs med=100.37µs max=3.58ms p(90)=139.28µs p(95)=151.88µs p(99.9)=1.47ms
     http_req_sending...............: avg=33.16µs  min=6.37µs  med=18.72µs  max=25.6ms p(90)=24.91µs  p(95)=30.77µs  p(99.9)=2.67ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=968.86ms min=6.23ms  med=879.85ms max=5.78s  p(90)=1.92s    p(95)=2.18s    p(99.9)=4.9s  
     http_reqs......................: 15077   220.637405/s
     iteration_duration.............: avg=1.03s    min=27.58ms med=960.17ms max=5.79s  p(90)=1.94s    p(95)=2.19s    p(99.9)=4.94s 
     iterations.....................: 14077   206.003366/s
     success_rate...................: 100.00% ✓ 14077      ✗ 0    
     vus............................: 78      min=0        max=500
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

     checks.........................: 100.00% ✓ 40425      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   248 kB/s
     http_req_blocked...............: avg=18.8µs   min=1.14µs  med=3.64µs   max=49.42ms  p(90)=5.48µs   p(95)=7.2µs    p(99.9)=2.45ms 
     http_req_connecting............: avg=13.24µs  min=0s      med=0s       max=49.34ms  p(90)=0s       p(95)=0s       p(99.9)=2.42ms 
     http_req_duration..............: avg=1s       min=8.79ms  med=909.65ms max=4.1s     p(90)=2.05s    p(95)=2.19s    p(99.9)=3.56s  
       { expected_response:true }...: avg=1s       min=8.79ms  med=909.65ms max=4.1s     p(90)=2.05s    p(95)=2.19s    p(99.9)=3.56s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14475
     http_req_receiving.............: avg=314.76µs min=33.87µs med=100.36µs max=184.37ms p(90)=141.47µs p(95)=154.38µs p(99.9)=98.04ms
     http_req_sending...............: avg=33.5µs   min=5.78µs  med=18.2µs   max=50.12ms  p(90)=24.48µs  p(95)=29.71µs  p(99.9)=2.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=1s       min=8.68ms  med=909.53ms max=4.1s     p(90)=2.05s    p(95)=2.19s    p(99.9)=3.56s  
     http_reqs......................: 14475   206.522474/s
     iteration_duration.............: avg=1.08s    min=22.12ms med=998.68ms max=4.11s    p(90)=2.06s    p(95)=2.2s     p(99.9)=3.59s  
     iterations.....................: 13475   192.254946/s
     success_rate...................: 100.00% ✓ 13475      ✗ 0    
     vus............................: 59      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

