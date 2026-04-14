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
| hive-router | v0.0.43 | 1,593 | 1,625 | 1,583 | 0.8% |  |
| hotchocolate | 16.1.0-p.1.2 | 1,443 | 1,455 | 1,429 | 0.6% |  |
| cosmo | 0.298.0 | 1,162 | 1,177 | 1,151 | 0.8% | non-compatible response (2 across 2/9 runs) |
| grafbase | 0.53.2 | 1,144 | 1,160 | 1,139 | 0.6% |  |
| hive-gateway-router-runtime | 2.5.14 | 583 | 598 | 578 | 1.1% |  |
| apollo-router | v2.12.1 | 392 | 401 | 388 | 1.1% |  |
| hive-gateway | 2.5.14 | 265 | 270 | 264 | 0.9% |  |
| apollo-gateway | 2.13.3 | 238 | 240 | 238 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 582849      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 234 MB  1.9 MB/s
     http_req_blocked...............: avg=3.44µs  min=982ns   med=2.41µs  max=4.19ms   p(90)=4.27µs   p(95)=5.25µs   p(99.9)=38.13µs
     http_req_connecting............: avg=528ns   min=0s      med=0s      max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.63ms min=13.8ms  med=30.39ms max=330.47ms p(90)=36.29ms  p(95)=38.3ms   p(99.9)=57.17ms
       { expected_response:true }...: avg=30.63ms min=13.8ms  med=30.39ms max=330.47ms p(90)=36.29ms  p(95)=38.3ms   p(99.9)=57.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194383
     http_req_receiving.............: avg=96.49µs min=26.86µs med=53.23µs max=212.89ms p(90)=106.13µs p(95)=161.02µs p(99.9)=2.98ms 
     http_req_sending...............: avg=38.18µs min=4.87µs  med=9.89µs  max=222.83ms p(90)=20.28µs  p(95)=82.75µs  p(99.9)=1.99ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.49ms min=13.63ms med=30.28ms max=329.84ms p(90)=36.16ms  p(95)=38.14ms  p(99.9)=55.75ms
     http_reqs......................: 194383  1593.284652/s
     iteration_duration.............: avg=30.87ms min=14.04ms med=30.61ms max=350.52ms p(90)=36.51ms  p(95)=38.51ms  p(99.9)=57.43ms
     iterations.....................: 194283  1592.464989/s
     success_rate...................: 100.00% ✓ 194283      ✗ 0     
     vus............................: 37      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 528057      ✗ 0     
     data_received..................: 15 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.27µs   min=1µs     med=2.33µs   max=3.98ms   p(90)=4.03µs  p(95)=4.87µs   p(99.9)=34.44µs
     http_req_connecting............: avg=471ns    min=0s      med=0s       max=3.95ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.83ms  min=14.73ms med=32.6ms   max=476.66ms p(90)=41.46ms p(95)=45.06ms  p(99.9)=90.14ms
       { expected_response:true }...: avg=33.83ms  min=14.73ms med=32.6ms   max=476.66ms p(90)=41.46ms p(95)=45.06ms  p(99.9)=90.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176119
     http_req_receiving.............: avg=751.79µs min=50.93µs med=113.64µs max=176.37ms p(90)=2.16ms  p(95)=3.3ms    p(99.9)=16.23ms
     http_req_sending...............: avg=39.77µs  min=5.17µs  med=9.65µs   max=152.41ms p(90)=20.33µs p(95)=105.44µs p(99.9)=2.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.04ms  min=13.92ms med=31.84ms  max=475.77ms p(90)=40.42ms p(95)=43.92ms  p(99.9)=83.45ms
     http_reqs......................: 176119  1443.561604/s
     iteration_duration.............: avg=34.07ms  min=14.91ms med=32.82ms  max=476.91ms p(90)=41.68ms p(95)=45.29ms  p(99.9)=91.74ms
     iterations.....................: 176019  1442.741953/s
     success_rate...................: 100.00% ✓ 176019      ✗ 0     
     vus............................: 34      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 425199      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.67µs  min=1.04µs  med=2.52µs  max=4.42ms   p(90)=4.16µs   p(95)=4.92µs   p(99.9)=40.88µs
     http_req_connecting............: avg=767ns   min=0s      med=0s      max=4.38ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.09ms min=18ms    med=41.47ms max=337.42ms p(90)=51.2ms   p(95)=54.34ms  p(99.9)=71.89ms
       { expected_response:true }...: avg=42.09ms min=18ms    med=41.47ms max=337.42ms p(90)=51.2ms   p(95)=54.34ms  p(99.9)=71.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141833
     http_req_receiving.............: avg=86.68µs min=28.48µs med=63.69µs max=125.39ms p(90)=108.78µs p(95)=136.51µs p(99.9)=1.78ms 
     http_req_sending...............: avg=25.97µs min=5.02µs  med=10.83µs max=32.02ms  p(90)=18.69µs  p(95)=23.93µs  p(99.9)=1.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.97ms min=17.89ms med=41.36ms max=336.57ms p(90)=51.07ms  p(95)=54.21ms  p(99.9)=71.6ms 
     http_reqs......................: 141833  1162.109676/s
     iteration_duration.............: avg=42.33ms min=20.53ms med=41.68ms max=356.55ms p(90)=51.41ms  p(95)=54.55ms  p(99.9)=72.47ms
     iterations.....................: 141733  1161.290326/s
     success_rate...................: 100.00% ✓ 141733      ✗ 0     
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

     checks.........................: 100.00% ✓ 418764      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.71µs   min=932ns   med=2.25µs  max=4.2ms    p(90)=4.65µs  p(95)=5.81µs   p(99.9)=44.54µs
     http_req_connecting............: avg=811ns    min=0s      med=0s      max=4.13ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.71ms  min=17.45ms med=42.24ms max=337.86ms p(90)=51.91ms p(95)=55.11ms  p(99.9)=78.2ms 
       { expected_response:true }...: avg=42.71ms  min=17.45ms med=42.24ms max=337.86ms p(90)=51.91ms p(95)=55.11ms  p(99.9)=78.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 139688
     http_req_receiving.............: avg=120.07µs min=29µs    med=58.53µs max=234.81ms p(90)=129.3µs p(95)=193.29µs p(99.9)=3.74ms 
     http_req_sending...............: avg=35.21µs  min=5.24µs  med=9.91µs  max=62.67ms  p(90)=23.4µs  p(95)=103.54µs p(99.9)=1.94ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.56ms  min=17.31ms med=42.11ms max=243.61ms p(90)=51.76ms p(95)=54.95ms  p(99.9)=77.45ms
     http_reqs......................: 139688  1144.850241/s
     iteration_duration.............: avg=42.98ms  min=18.32ms med=42.48ms max=374.82ms p(90)=52.14ms p(95)=55.34ms  p(99.9)=78.51ms
     iterations.....................: 139588  1144.030665/s
     success_rate...................: 100.00% ✓ 139588      ✗ 0     
     vus............................: 48      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 214020     ✗ 0    
     data_received..................: 6.3 GB  51 MB/s
     data_sent......................: 86 MB   701 kB/s
     http_req_blocked...............: avg=7.72µs  min=1.15µs  med=3.18µs  max=9.94ms   p(90)=4.84µs   p(95)=5.53µs   p(99.9)=48.78µs 
     http_req_connecting............: avg=4.05µs  min=0s      med=0s      max=9.79ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.77ms min=19.02ms med=81.87ms max=342.28ms p(90)=96.87ms  p(95)=104.02ms p(99.9)=200.29ms
       { expected_response:true }...: avg=83.77ms min=19.02ms med=81.87ms max=342.28ms p(90)=96.87ms  p(95)=104.02ms p(99.9)=200.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71440
     http_req_receiving.............: avg=90.5µs  min=31.48µs med=78.63µs max=92.71ms  p(90)=114.41µs p(95)=129.05µs p(99.9)=1.09ms  
     http_req_sending...............: avg=25.36µs min=5.43µs  med=14.35µs max=114.5ms  p(90)=21.11µs  p(95)=23.59µs  p(99.9)=965.42µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.65ms min=18.86ms med=81.77ms max=322.04ms p(90)=96.76ms  p(95)=103.87ms p(99.9)=199.93ms
     http_reqs......................: 71440   583.729542/s
     iteration_duration.............: avg=84.11ms min=34.57ms med=82.12ms max=375.46ms p(90)=97.12ms  p(95)=104.28ms p(99.9)=201.56ms
     iterations.....................: 71340   582.912451/s
     success_rate...................: 100.00% ✓ 71340      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 143820     ✗ 0    
     data_received..................: 4.2 GB  34 MB/s
     data_sent......................: 58 MB   471 kB/s
     http_req_blocked...............: avg=5.67µs   min=1.21µs  med=3.33µs   max=4ms      p(90)=4.88µs   p(95)=5.52µs   p(99.9)=184.91µs
     http_req_connecting............: avg=2.13µs   min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=111.21µs
     http_req_duration..............: avg=124.71ms min=20.83ms med=122.8ms  max=354.18ms p(90)=155.58ms p(95)=165.4ms  p(99.9)=211.99ms
       { expected_response:true }...: avg=124.71ms min=20.83ms med=122.8ms  max=354.18ms p(90)=155.58ms p(95)=165.4ms  p(99.9)=211.99ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48040
     http_req_receiving.............: avg=93.26µs  min=31.55µs med=85.48µs  max=79.41ms  p(90)=118.74µs p(95)=132.28µs p(99.9)=909.36µs
     http_req_sending...............: avg=26.58µs  min=5.65µs  med=15.66µs  max=146.22ms p(90)=21.71µs  p(95)=23.9µs   p(99.9)=689.33µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.59ms min=20.67ms med=122.69ms max=353.55ms p(90)=155.46ms p(95)=165.27ms p(99.9)=211.32ms
     http_reqs......................: 48040   392.22602/s
     iteration_duration.............: avg=125.19ms min=46.63ms med=123.11ms max=382.28ms p(90)=155.84ms p(95)=165.71ms p(99.9)=215.34ms
     iterations.....................: 47940   391.409562/s
     success_rate...................: 100.00% ✓ 47940      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 96858      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   318 kB/s
     http_req_blocked...............: avg=7.14µs   min=1.28µs  med=3.81µs   max=4.09ms   p(90)=5.48µs   p(95)=6.11µs   p(99.9)=1.3ms   
     http_req_connecting............: avg=3.1µs    min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=1.27ms  
     http_req_duration..............: avg=185.08ms min=18.59ms med=172.51ms max=546.64ms p(90)=212.94ms p(95)=388.47ms p(99.9)=509.57ms
       { expected_response:true }...: avg=185.08ms min=18.59ms med=172.51ms max=546.64ms p(90)=212.94ms p(95)=388.47ms p(99.9)=509.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32386
     http_req_receiving.............: avg=105.24µs min=35.3µs  med=99.97µs  max=33.94ms  p(90)=134.01µs p(95)=148.42µs p(99.9)=536.21µs
     http_req_sending...............: avg=32.38µs  min=5.84µs  med=18.82µs  max=101.66ms p(90)=24.29µs  p(95)=26.32µs  p(99.9)=675.51µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.94ms min=18.41ms med=172.38ms max=546.46ms p(90)=212.79ms p(95)=388.33ms p(99.9)=509.47ms
     http_reqs......................: 32386   265.043458/s
     iteration_duration.............: avg=185.92ms min=46.5ms  med=172.9ms  max=546.98ms p(90)=213.38ms p(95)=389.82ms p(99.9)=509.96ms
     iterations.....................: 32286   264.225069/s
     success_rate...................: 100.00% ✓ 32286      ✗ 0    
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

     checks.........................: 100.00% ✓ 87705      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=6.13µs   min=1.25µs  med=3.56µs   max=2.85ms   p(90)=5.07µs   p(95)=5.73µs   p(99.9)=1.08ms  
     http_req_connecting............: avg=2.32µs   min=0s      med=0s       max=2.81ms   p(90)=0s       p(95)=0s       p(99.9)=1.03ms  
     http_req_duration..............: avg=204.4ms  min=23.43ms med=204.05ms max=402.97ms p(90)=232.6ms  p(95)=238.99ms p(99.9)=305.52ms
       { expected_response:true }...: avg=204.4ms  min=23.43ms med=204.05ms max=402.97ms p(90)=232.6ms  p(95)=238.99ms p(99.9)=305.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29335
     http_req_receiving.............: avg=105.96µs min=35.26µs med=95.5µs   max=106.36ms p(90)=129.6µs  p(95)=142.92µs p(99.9)=720.58µs
     http_req_sending...............: avg=25.91µs  min=5.64µs  med=17.79µs  max=51.56ms  p(90)=23.32µs  p(95)=25.42µs  p(99.9)=736.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.27ms min=23.31ms med=203.91ms max=402.61ms p(90)=232.48ms p(95)=238.83ms p(99.9)=304.98ms
     http_reqs......................: 29335   238.758232/s
     iteration_duration.............: avg=205.34ms min=54.91ms med=204.48ms max=438.63ms p(90)=232.92ms p(95)=239.37ms p(99.9)=308.01ms
     iterations.....................: 29235   237.944329/s
     success_rate...................: 100.00% ✓ 29235      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

