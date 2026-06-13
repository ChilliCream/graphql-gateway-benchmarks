## Overview for: `constant-vus-with-latency`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s** with a simulated **4ms IO delay** on each subgraph request. Only .NET subgraphs are used.


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 1,580 | 1,602 | 1,559 | 0.8% |  |
| hotchocolate | 16.1.3 | 1,457 | 1,468 | 1,446 | 0.6% |  |
| grafbase | 0.53.5 | 1,129 | 1,143 | 1,116 | 0.8% |  |
| hive-gateway-router-runtime | 2.8.2 | 523 | 534 | 515 | 1.4% |  |
| apollo-gateway | 2.14.1 | 238 | 240 | 235 | 0.6% |  |
| hive-gateway | 2.8.2 | 233 | 238 | 231 | 1.2% |  |
| apollo-router | — | — | — | — | — | benchmark run failed |
| cosmo | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 578073      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=2.99µs  min=992ns   med=2.08µs  max=5.57ms   p(90)=3.84µs   p(95)=4.82µs  p(99.9)=35.29µs
     http_req_connecting............: avg=395ns   min=0s      med=0s      max=3.67ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=30.89ms min=14.05ms med=30.62ms max=310.21ms p(90)=36.72ms  p(95)=38.64ms p(99.9)=55.57ms
       { expected_response:true }...: avg=30.89ms min=14.05ms med=30.62ms max=310.21ms p(90)=36.72ms  p(95)=38.64ms p(99.9)=55.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192791
     http_req_receiving.............: avg=85.24µs min=28.06µs med=52.7µs  max=259.49ms p(90)=103.71µs p(95)=151.3µs p(99.9)=2.19ms 
     http_req_sending...............: avg=32.8µs  min=4.97µs  med=9.13µs  max=91.93ms  p(90)=19.37µs  p(95)=57.42µs p(99.9)=1.74ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.77ms min=13.96ms med=30.52ms max=301.86ms p(90)=36.6ms   p(95)=38.5ms  p(99.9)=53.91ms
     http_reqs......................: 192791  1580.228419/s
     iteration_duration.............: avg=31.13ms min=14.18ms med=30.84ms max=350.26ms p(90)=36.93ms  p(95)=38.85ms p(99.9)=55.97ms
     iterations.....................: 192691  1579.40876/s
     success_rate...................: 100.00% ✓ 192691      ✗ 0     
     vus............................: 24      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 533145      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 214 MB  1.8 MB/s
     http_req_blocked...............: avg=3.06µs   min=972ns   med=2µs      max=4.29ms   p(90)=3.54µs  p(95)=4.41µs   p(99.9)=26.43µs
     http_req_connecting............: avg=602ns    min=0s      med=0s       max=4.15ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.51ms  min=13.59ms med=32.3ms   max=1.38s    p(90)=40.71ms p(95)=43.7ms   p(99.9)=95.08ms
       { expected_response:true }...: avg=33.51ms  min=13.59ms med=32.3ms   max=1.38s    p(90)=40.71ms p(95)=43.7ms   p(99.9)=95.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177815
     http_req_receiving.............: avg=756.15µs min=51.53µs med=113.18µs max=147.74ms p(90)=2.17ms  p(95)=3.25ms   p(99.9)=14.83ms
     http_req_sending...............: avg=37.1µs   min=4.94µs  med=8.72µs   max=138.28ms p(90)=18.86µs p(95)=102.01µs p(99.9)=2.7ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.72ms  min=13.46ms med=31.53ms  max=1.37s    p(90)=39.68ms p(95)=42.59ms  p(99.9)=94.35ms
     http_reqs......................: 177815  1457.545984/s
     iteration_duration.............: avg=33.75ms  min=13.81ms med=32.51ms  max=1.38s    p(90)=40.92ms p(95)=43.92ms  p(99.9)=96.02ms
     iterations.....................: 177715  1456.726286/s
     success_rate...................: 100.00% ✓ 177715      ✗ 0     
     vus............................: 24      min=0         max=50  
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

     checks.........................: 100.00% ✓ 412986      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.45µs   min=942ns   med=2.19µs  max=4.51ms   p(90)=4.57µs   p(95)=5.78µs   p(99.9)=47.61µs
     http_req_connecting............: avg=563ns    min=0s      med=0s      max=3.41ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.3ms   min=16.79ms med=42.85ms max=347.75ms p(90)=52.6ms   p(95)=55.87ms  p(99.9)=80.69ms
       { expected_response:true }...: avg=43.3ms   min=16.79ms med=42.85ms max=347.75ms p(90)=52.6ms   p(95)=55.87ms  p(99.9)=80.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137762
     http_req_receiving.............: avg=100.01µs min=29.27µs med=58.53µs max=224.02ms p(90)=130.28µs p(95)=206.8µs  p(99.9)=3.13ms 
     http_req_sending...............: avg=38.22µs  min=5.13µs  med=9.66µs  max=169.95ms p(90)=23.35µs  p(95)=111.36µs p(99.9)=2.15ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.16ms  min=16.74ms med=42.73ms max=347.1ms  p(90)=52.46ms  p(95)=55.71ms  p(99.9)=80.12ms
     http_reqs......................: 137762  1129.180423/s
     iteration_duration.............: avg=43.57ms  min=16.97ms med=43.09ms max=357.95ms p(90)=52.83ms  p(95)=56.1ms   p(99.9)=81.36ms
     iterations.....................: 137662  1128.360763/s
     success_rate...................: 100.00% ✓ 137662      ✗ 0     
     vus............................: 27      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 192057     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   629 kB/s
     http_req_blocked...............: avg=4.54µs   min=1.08µs  med=2.85µs  max=3.7ms    p(90)=4.49µs   p(95)=5.13µs   p(99.9)=48.46µs 
     http_req_connecting............: avg=1.36µs   min=0s      med=0s      max=3.19ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.38ms  min=20.88ms med=90.89ms max=356.54ms p(90)=118.24ms p(95)=128.1ms  p(99.9)=234.24ms
       { expected_response:true }...: avg=93.38ms  min=20.88ms med=90.89ms max=356.54ms p(90)=118.24ms p(95)=128.1ms  p(99.9)=234.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64119
     http_req_receiving.............: avg=127.11µs min=30.74µs med=77.08µs max=174.35ms p(90)=113.97µs p(95)=127.65µs p(99.9)=1.11ms  
     http_req_sending...............: avg=20.97µs  min=5.09µs  med=13.17µs max=86.87ms  p(90)=20.34µs  p(95)=22.73µs  p(99.9)=714.61µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.23ms  min=20.7ms  med=90.79ms max=263.37ms p(90)=118.12ms p(95)=127.97ms p(99.9)=228.71ms
     http_reqs......................: 64119   523.632925/s
     iteration_duration.............: avg=93.73ms  min=31.18ms med=91.15ms max=381.01ms p(90)=118.49ms p(95)=128.39ms p(99.9)=235.29ms
     iterations.....................: 64019   522.816267/s
     success_rate...................: 100.00% ✓ 64019      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 87498      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=6.21µs   min=1.13µs  med=3.45µs   max=3.39ms   p(90)=4.93µs   p(95)=5.54µs   p(99.9)=1.06ms  
     http_req_connecting............: avg=2.55µs   min=0s      med=0s       max=3.36ms   p(90)=0s       p(95)=0s       p(99.9)=1.03ms  
     http_req_duration..............: avg=204.91ms min=22.79ms med=203.4ms  max=409.88ms p(90)=236.08ms p(95)=242.22ms p(99.9)=319.98ms
       { expected_response:true }...: avg=204.91ms min=22.79ms med=203.4ms  max=409.88ms p(90)=236.08ms p(95)=242.22ms p(99.9)=319.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29266
     http_req_receiving.............: avg=99.4µs   min=34.07µs med=93.76µs  max=27.17ms  p(90)=127.55µs p(95)=141.45µs p(99.9)=588.16µs
     http_req_sending...............: avg=30.37µs  min=6.06µs  med=17.77µs  max=87.53ms  p(90)=23.08µs  p(95)=25.07µs  p(99.9)=1.01ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.78ms min=22.6ms  med=203.26ms max=408.7ms  p(90)=235.95ms p(95)=242.09ms p(99.9)=319.84ms
     http_reqs......................: 29266   238.154717/s
     iteration_duration.............: avg=205.85ms min=57.97ms med=203.81ms max=441ms    p(90)=236.38ms p(95)=242.54ms p(99.9)=324.89ms
     iterations.....................: 29166   237.340958/s
     success_rate...................: 100.00% ✓ 29166      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 85458      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   280 kB/s
     http_req_blocked...............: avg=7.12µs   min=1.31µs  med=3.46µs   max=3.97ms   p(90)=4.87µs   p(95)=5.47µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=3.48µs   min=0s      med=0s       max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=1.65ms  
     http_req_duration..............: avg=209.89ms min=19.2ms  med=197.53ms max=730.98ms p(90)=267.87ms p(95)=313.96ms p(99.9)=649.08ms
       { expected_response:true }...: avg=209.89ms min=19.2ms  med=197.53ms max=730.98ms p(90)=267.87ms p(95)=313.96ms p(99.9)=649.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28586
     http_req_receiving.............: avg=110.74µs min=34.19µs med=95.27µs  max=102.97ms p(90)=127.39µs p(95)=141.1µs  p(99.9)=591.96µs
     http_req_sending...............: avg=26.89µs  min=6.18µs  med=17.5µs   max=60.08ms  p(90)=22.59µs  p(95)=24.46µs  p(99.9)=613.94µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.75ms min=19.03ms med=197.4ms  max=730.89ms p(90)=267.75ms p(95)=313.43ms p(99.9)=648.96ms
     http_reqs......................: 28586   233.452197/s
     iteration_duration.............: avg=210.86ms min=50.19ms med=198.09ms max=731.15ms p(90)=268.33ms p(95)=315.87ms p(99.9)=649.32ms
     iterations.....................: 28486   232.63553/s
     success_rate...................: 100.00% ✓ 28486      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

