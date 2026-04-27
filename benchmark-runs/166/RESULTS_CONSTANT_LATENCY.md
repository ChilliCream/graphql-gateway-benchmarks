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
| hive-router | v0.0.49 | 1,580 | 1,602 | 1,569 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,456 | 1,471 | 1,444 | 0.6% |  |
| cosmo | 0.307.0 | 1,150 | 1,166 | 1,145 | 0.7% | non-compatible response (3 across 2/9 runs) |
| grafbase | 0.53.3 | 1,123 | 1,147 | 1,118 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.25 | 519 | 533 | 510 | 1.3% |  |
| apollo-router | v2.13.1 | 368 | 386 | 360 | 2.4% |  |
| hive-gateway | 2.5.25 | 245 | 249 | 242 | 0.9% |  |
| apollo-gateway | 2.13.3 | 233 | 235 | 232 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 578460      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.1µs   min=992ns   med=2.1µs   max=4.57ms   p(90)=3.97µs   p(95)=4.93µs   p(99.9)=30.4µs 
     http_req_connecting............: avg=498ns   min=0s      med=0s      max=4.52ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.87ms min=14.38ms med=30.6ms  max=318.41ms p(90)=36.66ms  p(95)=38.58ms  p(99.9)=58.35ms
       { expected_response:true }...: avg=30.87ms min=14.38ms med=30.6ms  max=318.41ms p(90)=36.66ms  p(95)=38.58ms  p(99.9)=58.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192920
     http_req_receiving.............: avg=82.94µs min=27.27µs med=52.81µs max=25.26ms  p(90)=104.12µs p(95)=153.95µs p(99.9)=2.49ms 
     http_req_sending...............: avg=34.89µs min=4.95µs  med=9.28µs  max=265.49ms p(90)=20.01µs  p(95)=59.28µs  p(99.9)=1.77ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.75ms min=14.32ms med=30.5ms  max=317.81ms p(90)=36.53ms  p(95)=38.43ms  p(99.9)=57.2ms 
     http_reqs......................: 192920  1580.961273/s
     iteration_duration.............: avg=31.11ms min=14.61ms med=30.82ms max=356.77ms p(90)=36.87ms  p(95)=38.8ms   p(99.9)=58.86ms
     iterations.....................: 192820  1580.141783/s
     success_rate...................: 100.00% ✓ 192820      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 532947      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 214 MB  1.8 MB/s
     http_req_blocked...............: avg=3.09µs   min=982ns   med=2.03µs   max=4ms      p(90)=3.7µs   p(95)=4.6µs    p(99.9)=28.06µs
     http_req_connecting............: avg=568ns    min=0s      med=0s       max=3.95ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.52ms  min=13.98ms med=32.39ms  max=480.06ms p(90)=41.21ms p(95)=44.74ms  p(99.9)=78.81ms
       { expected_response:true }...: avg=33.52ms  min=13.98ms med=32.39ms  max=480.06ms p(90)=41.21ms p(95)=44.74ms  p(99.9)=78.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177749
     http_req_receiving.............: avg=773.79µs min=50.12µs med=113.25µs max=278.47ms p(90)=2.15ms  p(95)=3.26ms   p(99.9)=15.09ms
     http_req_sending...............: avg=36.06µs  min=4.59µs  med=8.97µs   max=50.09ms  p(90)=19.96µs p(95)=105.34µs p(99.9)=2.65ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.71ms  min=13.9ms  med=31.63ms  max=479.83ms p(90)=40.19ms p(95)=43.61ms  p(99.9)=77.98ms
     http_reqs......................: 177749  1456.627799/s
     iteration_duration.............: avg=33.76ms  min=14.16ms med=32.6ms   max=480.29ms p(90)=41.43ms p(95)=44.96ms  p(99.9)=79.54ms
     iterations.....................: 177649  1455.808313/s
     success_rate...................: 100.00% ✓ 177649      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 420786      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.24µs  min=981ns   med=2.14µs  max=3.91ms   p(90)=3.76µs   p(95)=4.53µs   p(99.9)=39.08µs
     http_req_connecting............: avg=697ns   min=0s      med=0s      max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.54ms min=15.59ms med=41.94ms max=351.79ms p(90)=51.75ms  p(95)=54.87ms  p(99.9)=72.57ms
       { expected_response:true }...: avg=42.54ms min=15.59ms med=41.94ms max=351.79ms p(90)=51.75ms  p(95)=54.87ms  p(99.9)=72.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140362
     http_req_receiving.............: avg=87.26µs min=28.46µs med=61.49µs max=173.48ms p(90)=105.56µs p(95)=131.46µs p(99.9)=1.95ms 
     http_req_sending...............: avg=24.34µs min=5.24µs  med=10.12µs max=59.71ms  p(90)=17.75µs  p(95)=22.3µs   p(99.9)=1.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.43ms min=15.53ms med=41.83ms max=336.5ms  p(90)=51.64ms  p(95)=54.75ms  p(99.9)=71.93ms
     http_reqs......................: 140362  1150.109049/s
     iteration_duration.............: avg=42.77ms min=15.78ms med=42.14ms max=362.12ms p(90)=51.95ms  p(95)=55.07ms  p(99.9)=73.28ms
     iterations.....................: 140262  1149.289661/s
     success_rate...................: 100.00% ✓ 140262      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 410841      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 165 MB  1.3 MB/s
     http_req_blocked...............: avg=3.53µs  min=992ns   med=2.23µs  max=4.28ms   p(90)=4.63µs   p(95)=5.76µs   p(99.9)=46.55µs
     http_req_connecting............: avg=688ns   min=0s      med=0s      max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.53ms min=15.66ms med=43.1ms  max=326.98ms p(90)=52.95ms  p(95)=56.07ms  p(99.9)=80.97ms
       { expected_response:true }...: avg=43.53ms min=15.66ms med=43.1ms  max=326.98ms p(90)=52.95ms  p(95)=56.07ms  p(99.9)=80.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137047
     http_req_receiving.............: avg=97.29µs min=29.28µs med=58.72µs max=209.54ms p(90)=130.55µs p(95)=205.03µs p(99.9)=3ms    
     http_req_sending...............: avg=40.88µs min=5.16µs  med=9.76µs  max=253.42ms p(90)=23.95µs  p(95)=109.83µs p(99.9)=2.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.39ms min=15.51ms med=42.98ms max=326.53ms p(90)=52.8ms   p(95)=55.9ms   p(99.9)=79.77ms
     http_reqs......................: 137047  1123.254451/s
     iteration_duration.............: avg=43.8ms  min=17.75ms med=43.34ms max=354.33ms p(90)=53.18ms  p(95)=56.3ms   p(99.9)=81.61ms
     iterations.....................: 136947  1122.434839/s
     success_rate...................: 100.00% ✓ 136947      ✗ 0     
     vus............................: 42      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 190692     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   624 kB/s
     http_req_blocked...............: avg=4.77µs  min=1.08µs  med=2.76µs  max=4ms      p(90)=4.38µs   p(95)=4.99µs   p(99.9)=51.58µs 
     http_req_connecting............: avg=1.71µs  min=0s      med=0s      max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.04ms min=21.21ms med=91.42ms max=365.76ms p(90)=113.2ms  p(95)=122.91ms p(99.9)=222.35ms
       { expected_response:true }...: avg=94.04ms min=21.21ms med=91.42ms max=365.76ms p(90)=113.2ms  p(95)=122.91ms p(99.9)=222.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63664
     http_req_receiving.............: avg=87.01µs min=30.45µs med=76.2µs  max=39.65ms  p(90)=113.78µs p(95)=127.95µs p(99.9)=924.76µs
     http_req_sending...............: avg=26.25µs min=5.43µs  med=13.32µs max=138.83ms p(90)=20.3µs   p(95)=22.68µs  p(99.9)=734.86µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.93ms min=21.05ms med=91.32ms max=365.36ms p(90)=113.1ms  p(95)=122.77ms p(99.9)=221.92ms
     http_reqs......................: 63664   519.785119/s
     iteration_duration.............: avg=94.41ms min=40.15ms med=91.67ms max=375.74ms p(90)=113.45ms p(95)=123.3ms  p(99.9)=223.59ms
     iterations.....................: 63564   518.968668/s
     success_rate...................: 100.00% ✓ 63564      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 135135     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   443 kB/s
     http_req_blocked...............: avg=5.68µs   min=1.2µs   med=3.24µs   max=3.97ms   p(90)=4.7µs    p(95)=5.28µs   p(99.9)=418.95µs
     http_req_connecting............: avg=2.23µs   min=0s      med=0s       max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=293.04µs
     http_req_duration..............: avg=132.71ms min=21.52ms med=130.62ms max=393.24ms p(90)=166.04ms p(95)=177.6ms  p(99.9)=234.04ms
       { expected_response:true }...: avg=132.71ms min=21.52ms med=130.62ms max=393.24ms p(90)=166.04ms p(95)=177.6ms  p(99.9)=234.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45145
     http_req_receiving.............: avg=92.63µs  min=31.46µs med=84.63µs  max=86.99ms  p(90)=117.07µs p(95)=129.63µs p(99.9)=773.21µs
     http_req_sending...............: avg=24.05µs  min=6.08µs  med=16.11µs  max=93.34ms  p(90)=21.8µs   p(95)=23.81µs  p(99.9)=640.79µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=132.59ms min=21.4ms  med=130.52ms max=392.28ms p(90)=165.92ms p(95)=177.49ms p(99.9)=232.9ms 
     http_reqs......................: 45145   368.530514/s
     iteration_duration.............: avg=133.23ms min=42.55ms med=130.93ms max=405.25ms p(90)=166.32ms p(95)=177.92ms p(99.9)=236.64ms
     iterations.....................: 45045   367.714188/s
     success_rate...................: 100.00% ✓ 45045      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 89904      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   295 kB/s
     http_req_blocked...............: avg=7.07µs   min=1.22µs  med=3.38µs   max=4.38ms   p(90)=4.76µs   p(95)=5.35µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=3.43µs   min=0s      med=0s       max=4.33ms   p(90)=0s       p(95)=0s       p(99.9)=1.47ms  
     http_req_duration..............: avg=199.4ms  min=18.73ms med=183.8ms  max=700.26ms p(90)=263.23ms p(95)=385.45ms p(99.9)=584.22ms
       { expected_response:true }...: avg=199.4ms  min=18.73ms med=183.8ms  max=700.26ms p(90)=263.23ms p(95)=385.45ms p(99.9)=584.22ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30068
     http_req_receiving.............: avg=103.52µs min=34.84µs med=94.99µs  max=58.99ms  p(90)=128.39µs p(95)=142.37µs p(99.9)=634.27µs
     http_req_sending...............: avg=37.73µs  min=6.57µs  med=17.81µs  max=194.14ms p(90)=23.03µs  p(95)=25.02µs  p(99.9)=461.16µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.26ms min=18.58ms med=183.65ms max=700.13ms p(90)=263.12ms p(95)=385.34ms p(99.9)=584.08ms
     http_reqs......................: 30068   245.990625/s
     iteration_duration.............: avg=200.31ms min=48.39ms med=184.2ms  max=700.52ms p(90)=263.75ms p(95)=389.71ms p(99.9)=584.57ms
     iterations.....................: 29968   245.172511/s
     success_rate...................: 100.00% ✓ 29968      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 85749      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   280 kB/s
     http_req_blocked...............: avg=7.18µs   min=1.25µs  med=3.41µs   max=4ms      p(90)=4.84µs   p(95)=5.43µs   p(99.9)=1.87ms  
     http_req_connecting............: avg=3.52µs   min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=1.78ms  
     http_req_duration..............: avg=209.13ms min=22.94ms med=209ms    max=450.82ms p(90)=222.62ms p(95)=228.29ms p(99.9)=300.82ms
       { expected_response:true }...: avg=209.13ms min=22.94ms med=209ms    max=450.82ms p(90)=222.62ms p(95)=228.29ms p(99.9)=300.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28683
     http_req_receiving.............: avg=104.33µs min=36.09µs med=93.84µs  max=93.57ms  p(90)=127.83µs p(95)=142.24µs p(99.9)=888.62µs
     http_req_sending...............: avg=30.56µs  min=6.29µs  med=17.69µs  max=154.68ms p(90)=23.07µs  p(95)=25.17µs  p(99.9)=655.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.99ms min=22.74ms med=208.88ms max=439ms    p(90)=222.49ms p(95)=228.15ms p(99.9)=300.72ms
     http_reqs......................: 28683   233.395249/s
     iteration_duration.............: avg=210.09ms min=61.11ms med=209.31ms max=470.83ms p(90)=222.93ms p(95)=228.61ms p(99.9)=325.16ms
     iterations.....................: 28583   232.581544/s
     success_rate...................: 100.00% ✓ 28583      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

