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
| hive-router | v0.0.74 | 2,981 | 3,168 | 2,968 | 2.4% |  |
| fusion-nightly | 16.4.0-p.14 | 2,144 | 2,205 | 2,137 | 1.1% |  |
| fusion | 16.3.0 | 2,126 | 2,173 | 2,124 | 0.9% |  |
| grafbase | 0.53.5 | 1,981 | 2,070 | 1,962 | 1.8% |  |
| cosmo | 0.326.1 | 1,180 | 1,201 | 1,175 | 0.7% |  |
| hive-gateway-router-runtime | 2.10.0 | 539 | 553 | 537 | 1.1% |  |
| apollo-router | v2.15.1 | 415 | 422 | 403 | 1.7% |  |
| apollo-gateway | 2.14.2 | 243 | 244 | 242 | 0.4% |  |
| hive-gateway | 2.10.0 | 243 | 248 | 242 | 0.8% |  |
| feddi | 77271dc84a06 | 20 | 21 | 19 | 2.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.74 | 2,364 | 2,452 | 2,300 | 2.2% |  |
| fusion-nightly | 16.4.0-p.14 | 2,058 | 2,111 | 2,034 | 1.2% |  |
| fusion | 16.3.0 | 1,966 | 2,031 | 1,953 | 1.3% |  |
| grafbase | 0.53.5 | 1,481 | 1,520 | 1,479 | 1.0% |  |
| cosmo | 0.326.1 | 1,119 | 1,143 | 1,115 | 0.8% |  |
| hive-gateway-router-runtime | 2.10.0 | 517 | 530 | 511 | 1.1% |  |
| apollo-router | v2.15.1 | 403 | 414 | 398 | 1.2% |  |
| apollo-gateway | 2.14.2 | 238 | 240 | 238 | 0.4% |  |
| hive-gateway | 2.10.0 | 238 | 242 | 237 | 0.7% |  |
| feddi | 77271dc84a06 | 20 | 21 | 19 | 2.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1074996     ✗ 0     
     data_received..................: 31 GB   262 MB/s
     data_sent......................: 431 MB  3.6 MB/s
     http_req_blocked...............: avg=3.49µs   min=1.08µs  med=2.48µs  max=113.74ms p(90)=3.9µs   p(95)=4.57µs   p(99.9)=40.38µs
     http_req_connecting............: avg=109ns    min=0s      med=0s      max=1.71ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.49ms  min=1.63ms  med=15.55ms max=332.69ms p(90)=24.28ms p(95)=28.23ms  p(99.9)=51.16ms
       { expected_response:true }...: avg=16.49ms  min=1.63ms  med=15.55ms max=332.69ms p(90)=24.28ms p(95)=28.23ms  p(99.9)=51.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 358432
     http_req_receiving.............: avg=117.12µs min=27.48µs med=48.49µs max=156.29ms p(90)=96.82µs p(95)=219.32µs p(99.9)=12.41ms
     http_req_sending...............: avg=58.44µs  min=4.96µs  med=9.59µs  max=142.45ms p(90)=17.85µs p(95)=116.42µs p(99.9)=8.28ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.31ms  min=1.57ms  med=15.41ms max=326.55ms p(90)=24.05ms p(95)=27.83ms  p(99.9)=48.96ms
     http_reqs......................: 358432  2981.99367/s
     iteration_duration.............: avg=16.73ms  min=2.17ms  med=15.76ms max=342.57ms p(90)=24.52ms p(95)=28.51ms  p(99.9)=52.67ms
     iterations.....................: 358332  2981.161715/s
     success_rate...................: 100.00% ✓ 358332      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 773565      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 310 MB  2.6 MB/s
     http_req_blocked...............: avg=3.12µs  min=1.05µs  med=2.25µs   max=12.04ms  p(90)=3.47µs  p(95)=4.04µs  p(99.9)=31.57µs
     http_req_connecting............: avg=456ns   min=0s      med=0s       max=4.83ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=23.02ms min=2.3ms   med=21.35ms  max=365.51ms p(90)=36.84ms p(95)=42.47ms p(99.9)=76.45ms
       { expected_response:true }...: avg=23.02ms min=2.3ms   med=21.35ms  max=365.51ms p(90)=36.84ms p(95)=42.47ms p(99.9)=76.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 257955
     http_req_receiving.............: avg=891.5µs min=54.76µs med=195.31µs max=90.65ms  p(90)=1.85ms  p(95)=3.27ms  p(99.9)=24.16ms
     http_req_sending...............: avg=42.74µs min=5.33µs  med=9.54µs   max=138.43ms p(90)=16.15µs p(95)=84.17µs p(99.9)=3.66ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=22.08ms min=2.17ms  med=20.43ms  max=364.9ms  p(90)=35.6ms  p(95)=41.08ms p(99.9)=74.67ms
     http_reqs......................: 257955  2144.870957/s
     iteration_duration.............: avg=23.25ms min=4.01ms  med=21.57ms  max=379.46ms p(90)=37.06ms p(95)=42.71ms p(99.9)=77.12ms
     iterations.....................: 257855  2144.039467/s
     success_rate...................: 100.00% ✓ 257855      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 766962      ✗ 0     
     data_received..................: 22 GB   186 MB/s
     data_sent......................: 307 MB  2.6 MB/s
     http_req_blocked...............: avg=2.94µs   min=1.03µs  med=2.08µs   max=13.96ms  p(90)=3.33µs  p(95)=3.92µs  p(99.9)=31.96µs 
     http_req_connecting............: avg=389ns    min=0s      med=0s       max=3.66ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=23.23ms  min=2.37ms  med=19.67ms  max=378.6ms  p(90)=37.59ms p(95)=45.73ms p(99.9)=162.83ms
       { expected_response:true }...: avg=23.23ms  min=2.37ms  med=19.67ms  max=378.6ms  p(90)=37.59ms p(95)=45.73ms p(99.9)=162.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 255754
     http_req_receiving.............: avg=795.77µs min=52.33µs med=101.68µs max=253.99ms p(90)=1.43ms  p(95)=2.92ms  p(99.9)=31.58ms 
     http_req_sending...............: avg=43.59µs  min=5.07µs  med=9.06µs   max=223.27ms p(90)=15.78µs p(95)=76.2µs  p(99.9)=3.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.39ms  min=2.27ms  med=18.93ms  max=377.74ms p(90)=36.25ms p(95)=44.12ms p(99.9)=161.33ms
     http_reqs......................: 255754  2126.251233/s
     iteration_duration.............: avg=23.46ms  min=4.41ms  med=19.89ms  max=378.84ms p(90)=37.82ms p(95)=45.99ms p(99.9)=163.52ms
     iterations.....................: 255654  2125.419867/s
     success_rate...................: 100.00% ✓ 255654      ✗ 0     
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

     checks.........................: 100.00% ✓ 714396      ✗ 0     
     data_received..................: 21 GB   174 MB/s
     data_sent......................: 286 MB  2.4 MB/s
     http_req_blocked...............: avg=3.6µs    min=1.18µs  med=2.94µs  max=6.04ms   p(90)=4.51µs   p(95)=5.32µs   p(99.9)=40.3µs 
     http_req_connecting............: avg=231ns    min=0s      med=0s      max=2.6ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.94ms  min=1.95ms  med=24.69ms max=356.1ms  p(90)=29.65ms  p(95)=31.58ms  p(99.9)=52.36ms
       { expected_response:true }...: avg=24.94ms  min=1.95ms  med=24.69ms max=356.1ms  p(90)=29.65ms  p(95)=31.58ms  p(99.9)=52.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 238232
     http_req_receiving.............: avg=100.02µs min=30.36µs med=59.97µs max=67.46ms  p(90)=100.67µs p(95)=135.72µs p(99.9)=7.57ms 
     http_req_sending...............: avg=43.33µs  min=5.76µs  med=11.89µs max=251.58ms p(90)=19.14µs  p(95)=87.2µs   p(99.9)=2.37ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.79ms  min=1.85ms  med=24.58ms max=355.06ms p(90)=29.5ms   p(95)=31.38ms  p(99.9)=51.13ms
     http_reqs......................: 238232  1981.164876/s
     iteration_duration.............: avg=25.18ms  min=3.98ms  med=24.91ms max=374.72ms p(90)=29.88ms  p(95)=31.82ms  p(99.9)=52.9ms 
     iterations.....................: 238132  1980.333264/s
     success_rate...................: 100.00% ✓ 238132      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 425538      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.77µs  min=1.26µs  med=2.73µs  max=3.99ms   p(90)=4.12µs  p(95)=4.77µs   p(99.9)=35.42µs
     http_req_connecting............: avg=728ns   min=0s      med=0s      max=3.95ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.04ms min=2.09ms  med=41.58ms max=336.82ms p(90)=59.38ms p(95)=64.61ms  p(99.9)=91.51ms
       { expected_response:true }...: avg=42.04ms min=2.09ms  med=41.58ms max=336.82ms p(90)=59.38ms p(95)=64.61ms  p(99.9)=91.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141946
     http_req_receiving.............: avg=79.5µs  min=28.88µs med=64.03µs max=92.68ms  p(90)=99.42µs p(95)=114.88µs p(99.9)=1.43ms 
     http_req_sending...............: avg=31.1µs  min=5.69µs  med=12.01µs max=272.01ms p(90)=18.17µs p(95)=22.56µs  p(99.9)=1.13ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.93ms min=2.03ms  med=41.47ms max=306.06ms p(90)=59.27ms p(95)=64.49ms  p(99.9)=91.33ms
     http_reqs......................: 141946  1180.210112/s
     iteration_duration.............: avg=42.29ms min=4.26ms  med=41.79ms max=348.34ms p(90)=59.59ms p(95)=64.81ms  p(99.9)=92.07ms
     iterations.....................: 141846  1179.378662/s
     success_rate...................: 100.00% ✓ 141846      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 194823     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   648 kB/s
     http_req_blocked...............: avg=4.69µs  min=1.2µs   med=2.69µs  max=4.85ms   p(90)=4.08µs   p(95)=4.68µs   p(99.9)=43.67µs 
     http_req_connecting............: avg=1.72µs  min=0s      med=0s      max=4.8ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.02ms min=4.16ms  med=89.99ms max=378.75ms p(90)=114.13ms p(95)=125.91ms p(99.9)=212.06ms
       { expected_response:true }...: avg=92.02ms min=4.16ms  med=89.99ms max=378.75ms p(90)=114.13ms p(95)=125.91ms p(99.9)=212.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65041
     http_req_receiving.............: avg=90.86µs min=31.47µs med=72.35µs max=100.54ms p(90)=107.85µs p(95)=120.84µs p(99.9)=1.34ms  
     http_req_sending...............: avg=25.53µs min=5.65µs  med=14.25µs max=100.58ms p(90)=20.59µs  p(95)=22.84µs  p(99.9)=700.04µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.91ms min=4.06ms  med=89.88ms max=378.2ms  p(90)=114.01ms p(95)=125.78ms p(99.9)=210.37ms
     http_reqs......................: 65041   539.634846/s
     iteration_duration.............: avg=92.4ms  min=21.02ms med=90.22ms max=396.58ms p(90)=114.36ms p(95)=126.18ms p(99.9)=215.16ms
     iterations.....................: 64941   538.805162/s
     success_rate...................: 100.00% ✓ 64941      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 150174     ✗ 0    
     data_received..................: 4.4 GB  37 MB/s
     data_sent......................: 60 MB   499 kB/s
     http_req_blocked...............: avg=5.46µs   min=1.27µs  med=2.97µs   max=4.19ms   p(90)=4.36µs   p(95)=4.93µs   p(99.9)=254.1µs 
     http_req_connecting............: avg=2.19µs   min=0s      med=0s       max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=63.23µs 
     http_req_duration..............: avg=119.43ms min=5.02ms  med=119.17ms max=381.89ms p(90)=144.18ms p(95)=151.66ms p(99.9)=189.09ms
       { expected_response:true }...: avg=119.43ms min=5.02ms  med=119.17ms max=381.89ms p(90)=144.18ms p(95)=151.66ms p(99.9)=189.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50158
     http_req_receiving.............: avg=83.24µs  min=31.23µs med=71.99µs  max=112.08ms p(90)=104.72µs p(95)=116.46µs p(99.9)=1.3ms   
     http_req_sending...............: avg=23.95µs  min=6.24µs  med=15µs     max=70.2ms   p(90)=20.16µs  p(95)=22.14µs  p(99.9)=630.59µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.32ms min=4.91ms  med=119.07ms max=381.13ms p(90)=144.08ms p(95)=151.56ms p(99.9)=188.58ms
     http_reqs......................: 50158   415.761074/s
     iteration_duration.............: avg=119.89ms min=38.49ms med=119.42ms max=401.85ms p(90)=144.42ms p(95)=151.9ms  p(99.9)=189.99ms
     iterations.....................: 50058   414.932171/s
     success_rate...................: 100.00% ✓ 50058      ✗ 0    
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

     checks.........................: 100.00% ✓ 88116      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=7.11µs   min=1.35µs  med=3.21µs   max=4.62ms   p(90)=4.47µs   p(95)=5.01µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=3.64µs   min=0s      med=0s       max=4.58ms   p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=203.49ms min=8.78ms  med=209.43ms max=457.65ms p(90)=228.82ms p(95)=233.04ms p(99.9)=307.48ms
       { expected_response:true }...: avg=203.49ms min=8.78ms  med=209.43ms max=457.65ms p(90)=228.82ms p(95)=233.04ms p(99.9)=307.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29472
     http_req_receiving.............: avg=106.27µs min=37.15µs med=83.03µs  max=187.67ms p(90)=113.36µs p(95)=123.33µs p(99.9)=1.92ms  
     http_req_sending...............: avg=40.18µs  min=6.67µs  med=16.58µs  max=165.03ms p(90)=21.2µs   p(95)=23.07µs  p(99.9)=657.09µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.34ms min=8.66ms  med=209.31ms max=440.91ms p(90)=228.71ms p(95)=232.91ms p(99.9)=306.19ms
     http_reqs......................: 29472   243.333604/s
     iteration_duration.............: avg=204.43ms min=49.19ms med=209.66ms max=470.65ms p(90)=229.07ms p(95)=233.32ms p(99.9)=311.32ms
     iterations.....................: 29372   242.507961/s
     success_rate...................: 100.00% ✓ 29372      ✗ 0    
     vus............................: 40      min=40       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 88026      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=6.75µs   min=1.26µs  med=2.83µs   max=4.06ms   p(90)=4.23µs   p(95)=4.78µs   p(99.9)=1.87ms  
     http_req_connecting............: avg=3.58µs   min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=203.67ms min=6.37ms  med=190.56ms max=732.42ms p(90)=254.51ms p(95)=313.29ms p(99.9)=605.64ms
       { expected_response:true }...: avg=203.67ms min=6.37ms  med=190.56ms max=732.42ms p(90)=254.51ms p(95)=313.29ms p(99.9)=605.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29442
     http_req_receiving.............: avg=101.4µs  min=36.29µs med=83.04µs  max=170.6ms  p(90)=113.08µs p(95)=123.99µs p(99.9)=1.91ms  
     http_req_sending...............: avg=23.5µs   min=6.15µs  med=15.87µs  max=63.98ms  p(90)=20.9µs   p(95)=22.75µs  p(99.9)=500.07µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.54ms min=6.22ms  med=190.43ms max=732.32ms p(90)=254.35ms p(95)=312.2ms  p(99.9)=605.53ms
     http_reqs......................: 29442   243.285129/s
     iteration_duration.............: avg=204.61ms min=36.28ms med=191.01ms max=732.65ms p(90)=254.94ms p(95)=316.35ms p(99.9)=605.99ms
     iterations.....................: 29342   242.458809/s
     success_rate...................: 100.00% ✓ 29342      ✗ 0    
     vus............................: 13      min=13       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (rust subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 7512      ✗ 0   
     data_received..................: 249 MB  2.0 MB/s
     data_sent......................: 3.1 MB  25 kB/s
     http_req_blocked...............: avg=30.14µs  min=1.57µs   med=3.88µs  max=3.09ms  p(90)=5.48µs   p(95)=6.37µs   p(99.9)=2.96ms
     http_req_connecting............: avg=25.48µs  min=0s       med=0s      max=3.06ms  p(90)=0s       p(95)=0s       p(99.9)=2.93ms
     http_req_duration..............: avg=2.31s    min=27.86ms  med=2.4s    max=4.92s   p(90)=3.03s    p(95)=3.25s    p(99.9)=4.19s 
       { expected_response:true }...: avg=2.31s    min=27.86ms  med=2.4s    max=4.92s   p(90)=3.03s    p(95)=3.25s    p(99.9)=4.19s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2604
     http_req_receiving.............: avg=105.73µs min=35.45µs  med=96.54µs max=4.02ms  p(90)=139.14µs p(95)=154.67µs p(99.9)=2.4ms 
     http_req_sending...............: avg=46.31µs  min=7.21µs   med=19.45µs max=16.36ms p(90)=24.47µs  p(95)=28.32µs  p(99.9)=5.74ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.31s    min=27.76ms  med=2.4s    max=4.92s   p(90)=3.03s    p(95)=3.25s    p(99.9)=4.19s 
     http_reqs......................: 2604    20.692645/s
     iteration_duration.............: avg=2.4s     min=483.34ms med=2.43s   max=4.92s   p(90)=3.05s    p(95)=3.27s    p(99.9)=4.2s  
     iterations.....................: 2504    19.897996/s
     success_rate...................: 100.00% ✓ 2504      ✗ 0   
     vus............................: 28      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 852804      ✗ 0     
     data_received..................: 25 GB   207 MB/s
     data_sent......................: 342 MB  2.8 MB/s
     http_req_blocked...............: avg=4µs      min=1.2µs   med=2.98µs  max=17.68ms  p(90)=4.69µs   p(95)=5.53µs   p(99.9)=42.31µs
     http_req_connecting............: avg=398ns    min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.85ms  min=2.08ms  med=20.43ms max=314.48ms p(90)=28.81ms  p(95)=31.65ms  p(99.9)=53.38ms
       { expected_response:true }...: avg=20.85ms  min=2.08ms  med=20.43ms max=314.48ms p(90)=28.81ms  p(95)=31.65ms  p(99.9)=53.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 284368
     http_req_receiving.............: avg=110.07µs min=28.81µs med=55.76µs max=174.89ms p(90)=103.03µs p(95)=190.31µs p(99.9)=9.45ms 
     http_req_sending...............: avg=52.5µs   min=5.66µs  med=12.03µs max=146.95ms p(90)=21.22µs  p(95)=121.08µs p(99.9)=4.48ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.68ms  min=2ms     med=20.3ms  max=313.45ms p(90)=28.62ms  p(95)=31.38ms  p(99.9)=51.85ms
     http_reqs......................: 284368  2364.776724/s
     iteration_duration.............: avg=21.09ms  min=4.21ms  med=20.66ms max=353.72ms p(90)=29.05ms  p(95)=31.91ms  p(99.9)=54.05ms
     iterations.....................: 284268  2363.945133/s
     success_rate...................: 100.00% ✓ 284268      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 742056      ✗ 0     
     data_received..................: 22 GB   180 MB/s
     data_sent......................: 297 MB  2.5 MB/s
     http_req_blocked...............: avg=4.13µs   min=1.07µs  med=2.56µs   max=17.53ms  p(90)=4.09µs  p(95)=4.77µs  p(99.9)=37.19µs
     http_req_connecting............: avg=1.06µs   min=0s      med=0s       max=9.1ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=23.99ms  min=1.83ms  med=22.34ms  max=317.42ms p(90)=38.31ms p(95)=44.09ms p(99.9)=79.35ms
       { expected_response:true }...: avg=23.99ms  min=1.83ms  med=22.34ms  max=317.42ms p(90)=38.31ms p(95)=44.09ms p(99.9)=79.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 247452
     http_req_receiving.............: avg=964.67µs min=56.15µs med=203.35µs max=203.71ms p(90)=2ms     p(95)=3.44ms  p(99.9)=27.2ms 
     http_req_sending...............: avg=47.46µs  min=5.19µs  med=10.25µs  max=224.16ms p(90)=19.57µs p(95)=94.93µs p(99.9)=3.42ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=22.98ms  min=1.69ms  med=21.35ms  max=297.8ms  p(90)=36.97ms p(95)=42.62ms p(99.9)=77.44ms
     http_reqs......................: 247452  2058.075264/s
     iteration_duration.............: avg=24.24ms  min=3.54ms  med=22.56ms  max=355.52ms p(90)=38.55ms p(95)=44.34ms p(99.9)=80.1ms 
     iterations.....................: 247352  2057.243557/s
     success_rate...................: 100.00% ✓ 247352      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 708921      ✗ 0     
     data_received..................: 21 GB   172 MB/s
     data_sent......................: 284 MB  2.4 MB/s
     http_req_blocked...............: avg=3.3µs    min=942ns   med=2.28µs   max=15.79ms  p(90)=3.8µs   p(95)=4.49µs  p(99.9)=37.92µs 
     http_req_connecting............: avg=275ns    min=0s      med=0s       max=2.98ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.14ms  min=1.96ms  med=20.39ms  max=494.37ms p(90)=41.81ms p(95)=51.9ms  p(99.9)=212.62ms
       { expected_response:true }...: avg=25.14ms  min=1.96ms  med=20.39ms  max=494.37ms p(90)=41.81ms p(95)=51.9ms  p(99.9)=212.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 236407
     http_req_receiving.............: avg=908.69µs min=54.61µs med=112.27µs max=337.94ms p(90)=1.52ms  p(95)=3.14ms  p(99.9)=39.44ms 
     http_req_sending...............: avg=39.65µs  min=5.13µs  med=9.51µs   max=115.54ms p(90)=17.67µs p(95)=73.06µs p(99.9)=2.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=24.19ms  min=1.81ms  med=19.57ms  max=494.28ms p(90)=40.22ms p(95)=50.14ms p(99.9)=210.55ms
     http_reqs......................: 236407  1966.045692/s
     iteration_duration.............: avg=25.37ms  min=3.56ms  med=20.61ms  max=494.58ms p(90)=42.03ms p(95)=52.16ms p(99.9)=213.94ms
     iterations.....................: 236307  1965.214056/s
     success_rate...................: 100.00% ✓ 236307      ✗ 0     
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

     checks.........................: 100.00% ✓ 534441      ✗ 0     
     data_received..................: 16 GB   130 MB/s
     data_sent......................: 214 MB  1.8 MB/s
     http_req_blocked...............: avg=3.51µs   min=1.02µs med=2.32µs  max=4.41ms   p(90)=4.28µs   p(95)=5.29µs   p(99.9)=46.32µs
     http_req_connecting............: avg=599ns    min=0s     med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.41ms  min=2.54ms med=32.86ms max=347.2ms  p(90)=44.25ms  p(95)=47.88ms  p(99.9)=69.14ms
       { expected_response:true }...: avg=33.41ms  min=2.54ms med=32.86ms max=347.2ms  p(90)=44.25ms  p(95)=47.88ms  p(99.9)=69.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178247
     http_req_receiving.............: avg=101.05µs min=30.2µs med=58.22µs max=148.04ms p(90)=129.91µs p(95)=220.69µs p(99.9)=4.7ms  
     http_req_sending...............: avg=41.91µs  min=4.8µs  med=9.89µs  max=33.19ms  p(90)=24.19µs  p(95)=117µs    p(99.9)=3.21ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.26ms  min=2.42ms med=32.74ms max=309.36ms p(90)=44.07ms  p(95)=47.66ms  p(99.9)=68.48ms
     http_reqs......................: 178247  1481.403357/s
     iteration_duration.............: avg=33.67ms  min=7.05ms med=33.09ms max=368.42ms p(90)=44.48ms  p(95)=48.11ms  p(99.9)=69.81ms
     iterations.....................: 178147  1480.572261/s
     success_rate...................: 100.00% ✓ 178147      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 403902      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 162 MB  1.3 MB/s
     http_req_blocked...............: avg=3.8µs   min=1.01µs  med=2.62µs  max=8.33ms   p(90)=4.25µs   p(95)=4.96µs   p(99.9)=34.67µs
     http_req_connecting............: avg=730ns   min=0s      med=0s      max=3.8ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.3ms  min=2.44ms  med=43.77ms max=349.32ms p(90)=61.94ms  p(95)=67.45ms  p(99.9)=92.8ms 
       { expected_response:true }...: avg=44.3ms  min=2.44ms  med=43.77ms max=349.32ms p(90)=61.94ms  p(95)=67.45ms  p(99.9)=92.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 134734
     http_req_receiving.............: avg=86.43µs min=28.79µs med=69.99µs max=84.72ms  p(90)=108.54µs p(95)=125.26µs p(99.9)=1.44ms 
     http_req_sending...............: avg=30.64µs min=5.51µs  med=12.79µs max=149.86ms p(90)=20.05µs  p(95)=24.2µs   p(99.9)=1.13ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=44.18ms min=2.32ms  med=43.66ms max=348.62ms p(90)=61.83ms  p(95)=67.34ms  p(99.9)=92.34ms
     http_reqs......................: 134734  1119.894347/s
     iteration_duration.............: avg=44.56ms min=3.96ms  med=44ms    max=372.47ms p(90)=62.16ms  p(95)=67.68ms  p(99.9)=93.34ms
     iterations.....................: 134634  1119.063158/s
     success_rate...................: 100.00% ✓ 134634      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 187056     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 75 MB   622 kB/s
     http_req_blocked...............: avg=6.05µs  min=1.09µs  med=3µs     max=7.32ms   p(90)=4.49µs   p(95)=5.14µs   p(99.9)=51.76µs 
     http_req_connecting............: avg=2.74µs  min=0s      med=0s      max=7.28ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.86ms min=4.5ms   med=93.12ms max=335.14ms p(90)=118.37ms p(95)=131.43ms p(99.9)=218.58ms
       { expected_response:true }...: avg=95.86ms min=4.5ms   med=93.12ms max=335.14ms p(90)=118.37ms p(95)=131.43ms p(99.9)=218.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62452
     http_req_receiving.............: avg=88.67µs min=31.66µs med=78.46µs max=94.82ms  p(90)=113.61µs p(95)=125.92µs p(99.9)=1.05ms  
     http_req_sending...............: avg=31.46µs min=5.65µs  med=15.29µs max=95.91ms  p(90)=21.37µs  p(95)=23.81µs  p(99.9)=1.12ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.74ms min=4.37ms  med=93.02ms max=334.67ms p(90)=118.26ms p(95)=131.3ms  p(99.9)=217.89ms
     http_reqs......................: 62452   517.838746/s
     iteration_duration.............: avg=96.25ms min=17.32ms med=93.36ms max=350.39ms p(90)=118.63ms p(95)=131.69ms p(99.9)=221.72ms
     iterations.....................: 62352   517.009567/s
     success_rate...................: 100.00% ✓ 62352      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 145779     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   484 kB/s
     http_req_blocked...............: avg=5.29µs   min=1.29µs  med=3.29µs   max=3.62ms   p(90)=4.77µs   p(95)=5.39µs   p(99.9)=227.08µs
     http_req_connecting............: avg=1.7µs    min=0s      med=0s       max=3.59ms   p(90)=0s       p(95)=0s       p(99.9)=120.71µs
     http_req_duration..............: avg=123ms    min=5.93ms  med=120.57ms max=373.99ms p(90)=162.72ms p(95)=174.92ms p(99.9)=230.58ms
       { expected_response:true }...: avg=123ms    min=5.93ms  med=120.57ms max=373.99ms p(90)=162.72ms p(95)=174.92ms p(99.9)=230.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48693
     http_req_receiving.............: avg=96.46µs  min=31.74µs med=85.85µs  max=108.11ms p(90)=116.03µs p(95)=127.15µs p(99.9)=1.08ms  
     http_req_sending...............: avg=30.65µs  min=4.88µs  med=17.88µs  max=107.91ms p(90)=22.83µs  p(95)=24.99µs  p(99.9)=858.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.87ms min=5.81ms  med=120.45ms max=369.31ms p(90)=162.56ms p(95)=174.8ms  p(99.9)=229.77ms
     http_reqs......................: 48693   403.344164/s
     iteration_duration.............: avg=123.51ms min=32.96ms med=120.9ms  max=384.17ms p(90)=163ms    p(95)=175.21ms p(99.9)=233.58ms
     iterations.....................: 48593   402.515823/s
     success_rate...................: 100.00% ✓ 48593      ✗ 0    
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

     checks.........................: 100.00% ✓ 86223      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=7.98µs   min=1.36µs  med=3.61µs   max=4.46ms   p(90)=5.06µs   p(95)=5.65µs   p(99.9)=2.1ms   
     http_req_connecting............: avg=4.12µs   min=0s      med=0s       max=4.42ms   p(90)=0s       p(95)=0s       p(99.9)=2.07ms  
     http_req_duration..............: avg=207.9ms  min=8.96ms  med=211.92ms max=447.12ms p(90)=220.5ms  p(95)=224.5ms  p(99.9)=306.19ms
       { expected_response:true }...: avg=207.9ms  min=8.96ms  med=211.92ms max=447.12ms p(90)=220.5ms  p(95)=224.5ms  p(99.9)=306.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28841
     http_req_receiving.............: avg=101.38µs min=35.79µs med=90.8µs   max=107.46ms p(90)=121.69µs p(95)=133.65µs p(99.9)=846.1µs 
     http_req_sending...............: avg=22.33µs  min=5.95µs  med=18.34µs  max=14.37ms  p(90)=23.19µs  p(95)=25.36µs  p(99.9)=475.67µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.77ms min=8.87ms  med=211.81ms max=446.58ms p(90)=220.39ms p(95)=224.37ms p(99.9)=302.88ms
     http_reqs......................: 28841   238.131595/s
     iteration_duration.............: avg=208.9ms  min=30.04ms med=212.18ms max=474.37ms p(90)=220.76ms p(95)=224.82ms p(99.9)=313.92ms
     iterations.....................: 28741   237.305925/s
     success_rate...................: 100.00% ✓ 28741      ✗ 0    
     vus............................: 47      min=47       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86187      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=7.98µs   min=1.67µs  med=3.81µs   max=4.1ms    p(90)=5.32µs   p(95)=5.93µs   p(99.9)=2.12ms  
     http_req_connecting............: avg=3.74µs   min=0s      med=0s       max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=2.05ms  
     http_req_duration..............: avg=207.98ms min=7.22ms  med=191.38ms max=687.6ms  p(90)=242.63ms p(95)=294.77ms p(99.9)=613.06ms
       { expected_response:true }...: avg=207.98ms min=7.22ms  med=191.38ms max=687.6ms  p(90)=242.63ms p(95)=294.77ms p(99.9)=613.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28829
     http_req_receiving.............: avg=98.33µs  min=38.94µs med=91.2µs   max=26.12ms  p(90)=122.62µs p(95)=134.59µs p(99.9)=1.19ms  
     http_req_sending...............: avg=37.74µs  min=7.01µs  med=19.19µs  max=122.27ms p(90)=24.13µs  p(95)=26.49µs  p(99.9)=695.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.84ms min=7.14ms  med=191.27ms max=687.5ms  p(90)=242.5ms  p(95)=294.64ms p(99.9)=612.97ms
     http_reqs......................: 28829   238.234747/s
     iteration_duration.............: avg=209ms    min=31.75ms med=191.77ms max=687.81ms p(90)=243.05ms p(95)=297.64ms p(99.9)=613.36ms
     iterations.....................: 28729   237.408376/s
     success_rate...................: 100.00% ✓ 28729      ✗ 0    
     vus............................: 11      min=11       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 7500      ✗ 0   
     data_received..................: 249 MB  2.0 MB/s
     data_sent......................: 3.1 MB  25 kB/s
     http_req_blocked...............: avg=66.63µs  min=1.58µs   med=3.84µs  max=9.6ms  p(90)=5.38µs   p(95)=6.2µs    p(99.9)=9.25ms
     http_req_connecting............: avg=57.35µs  min=0s       med=0s      max=9.58ms p(90)=0s       p(95)=0s       p(99.9)=9.22ms
     http_req_duration..............: avg=2.32s    min=32.57ms  med=2.36s   max=15.59s p(90)=3.18s    p(95)=3.37s    p(99.9)=12.42s
       { expected_response:true }...: avg=2.32s    min=32.57ms  med=2.36s   max=15.59s p(90)=3.18s    p(95)=3.37s    p(99.9)=12.42s
     http_req_failed................: 0.00%   ✓ 0         ✗ 2600
     http_req_receiving.............: avg=108.21µs min=38.59µs  med=99.25µs max=3.71ms p(90)=137.73µs p(95)=153.87µs p(99.9)=1.43ms
     http_req_sending...............: avg=40.74µs  min=7.38µs   med=19.87µs max=5.42ms p(90)=25.61µs  p(95)=30.44µs  p(99.9)=2.31ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.32s    min=32.47ms  med=2.35s   max=15.59s p(90)=3.18s    p(95)=3.37s    p(99.9)=12.42s
     http_reqs......................: 2600    20.610204/s
     iteration_duration.............: avg=2.41s    min=390.41ms med=2.39s   max=15.6s  p(90)=3.19s    p(95)=3.38s    p(99.9)=12.45s
     iterations.....................: 2500    19.817504/s
     success_rate...................: 100.00% ✓ 2500      ✗ 0   
     vus............................: 22      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 7.0.0-27-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=120 GB

