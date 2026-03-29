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
| hive-router | v0.0.42 | 1,582 | 1,606 | 1,572 | 0.8% |  |
| hotchocolate | 16.0.0-rc.1.21 | 1,459 | 1,479 | 1,448 | 0.7% |  |
| cosmo | 0.295.0 | 1,174 | 1,187 | 1,165 | 0.7% | non-compatible response (2 across 2/9 runs) |
| grafbase | 0.53.2 | 1,125 | 1,151 | 1,122 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.11 | 574 | 589 | 571 | 1.1% |  |
| apollo-router | v2.12.0 | 386 | 405 | 379 | 2.3% |  |
| hive-gateway | 2.5.11 | 268 | 273 | 266 | 0.9% |  |
| apollo-gateway | 2.13.3 | 236 | 239 | 236 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 578733      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.45µs  min=982ns   med=2.42µs  max=4.13ms   p(90)=4.3µs    p(95)=5.25µs   p(99.9)=37.14µs
     http_req_connecting............: avg=527ns   min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.86ms min=14.61ms med=30.59ms max=336.01ms p(90)=36.66ms  p(95)=38.59ms  p(99.9)=57.66ms
       { expected_response:true }...: avg=30.86ms min=14.61ms med=30.59ms max=336.01ms p(90)=36.66ms  p(95)=38.59ms  p(99.9)=57.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193011
     http_req_receiving.............: avg=87.2µs  min=27.93µs med=54.49µs max=58.77ms  p(90)=107.42µs p(95)=157.53µs p(99.9)=2.8ms  
     http_req_sending...............: avg=34.21µs min=5.02µs  med=9.89µs  max=157.51ms p(90)=20.68µs  p(95)=63.44µs  p(99.9)=1.77ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.73ms min=14.53ms med=30.49ms max=335.42ms p(90)=36.54ms  p(95)=38.44ms  p(99.9)=55.92ms
     http_reqs......................: 193011  1582.004501/s
     iteration_duration.............: avg=31.09ms min=14.85ms med=30.82ms max=352.51ms p(90)=36.88ms  p(95)=38.81ms  p(99.9)=57.96ms
     iterations.....................: 192911  1581.184857/s
     success_rate...................: 100.00% ✓ 192911      ✗ 0     
     vus............................: 46      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.21)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 534066      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 214 MB  1.8 MB/s
     http_req_blocked...............: avg=3.35µs   min=992ns   med=2.28µs   max=4.13ms   p(90)=4.13µs  p(95)=5.04µs   p(99.9)=37.59µs
     http_req_connecting............: avg=564ns    min=0s      med=0s       max=4.09ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.44ms  min=14.22ms med=32.5ms   max=484.37ms p(90)=40.84ms p(95)=43.65ms  p(99.9)=97.58ms
       { expected_response:true }...: avg=33.44ms  min=14.22ms med=32.5ms   max=484.37ms p(90)=40.84ms p(95)=43.65ms  p(99.9)=97.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178122
     http_req_receiving.............: avg=757.78µs min=50.52µs med=113.33µs max=206.69ms p(90)=2.19ms  p(95)=3.34ms   p(99.9)=15.7ms 
     http_req_sending...............: avg=38.28µs  min=5.12µs  med=9.44µs   max=155.29ms p(90)=20.67µs p(95)=106.44µs p(99.9)=2.49ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.65ms  min=14.03ms med=31.72ms  max=481.91ms p(90)=39.83ms p(95)=42.5ms   p(99.9)=96.59ms
     http_reqs......................: 178122  1459.804879/s
     iteration_duration.............: avg=33.69ms  min=14.53ms med=32.72ms  max=484.57ms p(90)=41.06ms p(95)=43.87ms  p(99.9)=98.19ms
     iterations.....................: 178022  1458.985326/s
     success_rate...................: 100.00% ✓ 178022      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.295.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 429621      ✗ 0     
     data_received..................: 13 GB   103 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.53µs  min=1.06µs  med=2.48µs  max=4.18ms   p(90)=4.18µs   p(95)=4.98µs   p(99.9)=39.9µs 
     http_req_connecting............: avg=640ns   min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.65ms min=19.26ms med=41.04ms max=355.26ms p(90)=50.59ms  p(95)=53.65ms  p(99.9)=70.95ms
       { expected_response:true }...: avg=41.65ms min=19.26ms med=41.04ms max=355.26ms p(90)=50.59ms  p(95)=53.65ms  p(99.9)=70.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143307
     http_req_receiving.............: avg=91.2µs  min=26.6µs  med=63.63µs max=187.06ms p(90)=109.82µs p(95)=136.89µs p(99.9)=1.91ms 
     http_req_sending...............: avg=28.44µs min=5.19µs  med=10.88µs max=217.5ms  p(90)=19.12µs  p(95)=24.28µs  p(99.9)=1.33ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.53ms min=19.18ms med=40.93ms max=286.68ms p(90)=50.47ms  p(95)=53.52ms  p(99.9)=69.98ms
     http_reqs......................: 143307  1174.251169/s
     iteration_duration.............: avg=41.89ms min=19.74ms med=41.25ms max=371.38ms p(90)=50.79ms  p(95)=53.85ms  p(99.9)=71.27ms
     iterations.....................: 143207  1173.431773/s
     success_rate...................: 100.00% ✓ 143207      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 411852      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=4.23µs  min=972ns   med=2.2µs   max=8.26ms   p(90)=4.55µs   p(95)=5.67µs   p(99.9)=42.74µs
     http_req_connecting............: avg=1.32µs  min=0s      med=0s      max=7.91ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.42ms min=16.71ms med=42.97ms max=323.61ms p(90)=52.74ms  p(95)=56.09ms  p(99.9)=81.39ms
       { expected_response:true }...: avg=43.42ms min=16.71ms med=42.97ms max=323.61ms p(90)=52.74ms  p(95)=56.09ms  p(99.9)=81.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137384
     http_req_receiving.............: avg=98.07µs min=29.17µs med=59.3µs  max=149.08ms p(90)=132.18µs p(95)=214.85µs p(99.9)=2.84ms 
     http_req_sending...............: avg=37.34µs min=4.94µs  med=9.85µs  max=181.53ms p(90)=23.95µs  p(95)=111.71µs p(99.9)=2.13ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.29ms min=16.65ms med=42.84ms max=299.5ms  p(90)=52.6ms   p(95)=55.93ms  p(99.9)=80.9ms 
     http_reqs......................: 137384  1125.757983/s
     iteration_duration.............: avg=43.7ms  min=16.9ms  med=43.21ms max=336.53ms p(90)=52.97ms  p(95)=56.32ms  p(99.9)=81.98ms
     iterations.....................: 137284  1124.938558/s
     success_rate...................: 100.00% ✓ 137284      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 210471     ✗ 0    
     data_received..................: 6.2 GB  50 MB/s
     data_sent......................: 84 MB   689 kB/s
     http_req_blocked...............: avg=4.95µs  min=1.2µs   med=3.2µs   max=4.04ms   p(90)=4.83µs   p(95)=5.52µs   p(99.9)=47.91µs 
     http_req_connecting............: avg=1.45µs  min=0s      med=0s      max=4ms      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.19ms min=18.76ms med=82.87ms max=365.69ms p(90)=101.33ms p(95)=108.64ms p(99.9)=211.18ms
       { expected_response:true }...: avg=85.19ms min=18.76ms med=82.87ms max=365.69ms p(90)=101.33ms p(95)=108.64ms p(99.9)=211.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70257
     http_req_receiving.............: avg=89.84µs min=30.9µs  med=78.78µs max=97.39ms  p(90)=115.66µs p(95)=130.6µs  p(99.9)=1ms     
     http_req_sending...............: avg=23.95µs min=5.66µs  med=14.18µs max=84.1ms   p(90)=21.28µs  p(95)=23.95µs  p(99.9)=770.55µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.08ms min=18.6ms  med=82.75ms max=365.04ms p(90)=101.2ms  p(95)=108.53ms p(99.9)=210.74ms
     http_reqs......................: 70257   574.02847/s
     iteration_duration.............: avg=85.53ms min=32.12ms med=83.11ms max=381.62ms p(90)=101.56ms p(95)=108.9ms  p(99.9)=213.36ms
     iterations.....................: 70157   573.211429/s
     success_rate...................: 100.00% ✓ 70157      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 141726     ✗ 0    
     data_received..................: 4.1 GB  34 MB/s
     data_sent......................: 57 MB   464 kB/s
     http_req_blocked...............: avg=5.86µs   min=1.12µs  med=3.38µs   max=4.16ms   p(90)=4.92µs   p(95)=5.56µs   p(99.9)=854.24µs
     http_req_connecting............: avg=2.2µs    min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=688.14µs
     http_req_duration..............: avg=126.52ms min=21.53ms med=124.71ms max=365.35ms p(90)=157.84ms p(95)=168.64ms p(99.9)=217.02ms
       { expected_response:true }...: avg=126.52ms min=21.53ms med=124.71ms max=365.35ms p(90)=157.84ms p(95)=168.64ms p(99.9)=217.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47342
     http_req_receiving.............: avg=96.95µs  min=31.23µs med=86.89µs  max=164.43ms p(90)=120.34µs p(95)=133.86µs p(99.9)=742.23µs
     http_req_sending...............: avg=31.12µs  min=5.69µs  med=16.42µs  max=207.04ms p(90)=22.14µs  p(95)=24.16µs  p(99.9)=646.58µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=126.39ms min=21.35ms med=124.6ms  max=360.88ms p(90)=157.73ms p(95)=168.53ms p(99.9)=216.53ms
     http_reqs......................: 47342   386.539226/s
     iteration_duration.............: avg=127.03ms min=33.58ms med=125.01ms max=378.67ms p(90)=158.17ms p(95)=168.94ms p(99.9)=221.09ms
     iterations.....................: 47242   385.722743/s
     success_rate...................: 100.00% ✓ 47242      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98373      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   323 kB/s
     http_req_blocked...............: avg=6.84µs   min=1.21µs  med=3.62µs   max=3.99ms   p(90)=5.25µs   p(95)=5.9µs    p(99.9)=1.4ms   
     http_req_connecting............: avg=2.93µs   min=0s      med=0s       max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=182.27ms min=15.68ms med=170.52ms max=589.5ms  p(90)=207.65ms p(95)=350.64ms p(99.9)=518.02ms
       { expected_response:true }...: avg=182.27ms min=15.68ms med=170.52ms max=589.5ms  p(90)=207.65ms p(95)=350.64ms p(99.9)=518.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32891
     http_req_receiving.............: avg=113.13µs min=33.64µs med=98.06µs  max=127.91ms p(90)=133µs    p(95)=147.17µs p(99.9)=803.29µs
     http_req_sending...............: avg=33.72µs  min=5.71µs  med=18.36µs  max=124.66ms p(90)=23.79µs  p(95)=25.76µs  p(99.9)=599.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.12ms min=15.53ms med=170.38ms max=589.37ms p(90)=207.53ms p(95)=347.46ms p(99.9)=517.87ms
     http_reqs......................: 32891   268.98125/s
     iteration_duration.............: avg=183.08ms min=54ms    med=170.88ms max=589.85ms p(90)=207.98ms p(95)=358.18ms p(99.9)=518.4ms 
     iterations.....................: 32791   268.163454/s
     success_rate...................: 100.00% ✓ 32791      ✗ 0    
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

     checks.........................: 100.00% ✓ 86772      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   284 kB/s
     http_req_blocked...............: avg=7.46µs   min=1.26µs  med=3.53µs   max=4.39ms   p(90)=5.07µs   p(95)=5.68µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=3.59µs   min=0s      med=0s       max=4.35ms   p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=206.58ms min=21.97ms med=209.19ms max=430.52ms p(90)=221.64ms p(95)=229.26ms p(99.9)=298.02ms
       { expected_response:true }...: avg=206.58ms min=21.97ms med=209.19ms max=430.52ms p(90)=221.64ms p(95)=229.26ms p(99.9)=298.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29024
     http_req_receiving.............: avg=114.24µs min=31.46µs med=96.41µs  max=136.83ms p(90)=130.6µs  p(95)=144.69µs p(99.9)=678.32µs
     http_req_sending...............: avg=33.19µs  min=6µs     med=18.04µs  max=100.35ms p(90)=23.55µs  p(95)=25.63µs  p(99.9)=545.42µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.43ms min=21.8ms  med=209.07ms max=387.12ms p(90)=221.5ms  p(95)=229.1ms  p(99.9)=297.89ms
     http_reqs......................: 29024   236.211898/s
     iteration_duration.............: avg=207.53ms min=54.75ms med=209.47ms max=446.2ms  p(90)=221.95ms p(95)=229.65ms p(99.9)=304.7ms 
     iterations.....................: 28924   235.398048/s
     success_rate...................: 100.00% ✓ 28924      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

