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
| hive-router | v0.0.43 | 3,035 | 3,234 | 3,016 | 2.5% |  |
| hotchocolate | 16.1.0-p.1.2 | 2,150 | 2,190 | 2,128 | 0.9% |  |
| grafbase | 0.53.2 | 2,096 | 2,151 | 2,071 | 1.4% |  |
| cosmo | 0.298.0 | 1,249 | 1,259 | 1,244 | 0.5% | non-compatible response (6 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 617 | 617 | 617 | 0.0% |  |
| apollo-router | v2.12.1 | 420 | 427 | 411 | 1.2% |  |
| hive-gateway | 2.5.14 | 268 | 274 | 266 | 1.2% |  |
| apollo-gateway | 2.13.3 | 247 | 249 | 244 | 0.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,349 | 2,483 | 2,312 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.2 | 1,935 | 2,013 | 1,924 | 1.5% |  |
| grafbase | 0.53.2 | 1,539 | 1,567 | 1,520 | 1.0% |  |
| cosmo | 0.298.0 | 1,202 | 1,219 | 1,199 | 0.8% | non-compatible response (7 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 576 | 590 | 567 | 1.4% |  |
| apollo-router | v2.12.1 | 389 | 400 | 382 | 1.6% |  |
| hive-gateway | 2.5.14 | 256 | 262 | 253 | 1.3% |  |
| apollo-gateway | 2.13.3 | 237 | 241 | 236 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1094343     ✗ 0     
     data_received..................: 32 GB   266 MB/s
     data_sent......................: 439 MB  3.6 MB/s
     http_req_blocked...............: avg=3µs      min=1.04µs  med=2.32µs  max=20.71ms  p(90)=3.59µs  p(95)=4.25µs   p(99.9)=37.19µs
     http_req_connecting............: avg=183ns    min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.2ms   min=1.65ms  med=15.07ms max=290.13ms p(90)=24.26ms p(95)=28.83ms  p(99.9)=53.17ms
       { expected_response:true }...: avg=16.2ms   min=1.65ms  med=15.07ms max=290.13ms p(90)=24.26ms p(95)=28.83ms  p(99.9)=53.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 364881
     http_req_receiving.............: avg=156.97µs min=27.48µs med=48.24µs max=100.07ms p(90)=101.7µs p(95)=299.61µs p(99.9)=16.9ms 
     http_req_sending...............: avg=63.96µs  min=5.1µs   med=9.25µs  max=93.53ms  p(90)=15.84µs p(95)=124.57µs p(99.9)=15.48ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.98ms  min=1.58ms  med=14.91ms max=289.72ms p(90)=23.9ms  p(95)=28.27ms  p(99.9)=51.27ms
     http_reqs......................: 364881  3035.309737/s
     iteration_duration.............: avg=16.43ms  min=2.19ms  med=15.29ms max=331.83ms p(90)=24.5ms  p(95)=29.12ms  p(99.9)=55ms   
     iterations.....................: 364781  3034.477874/s
     success_rate...................: 100.00% ✓ 364781      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 775599      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 311 MB  2.6 MB/s
     http_req_blocked...............: avg=3.11µs   min=1.03µs  med=2.43µs   max=15.7ms   p(90)=3.67µs   p(95)=4.31µs   p(99.9)=37.77µs 
     http_req_connecting............: avg=151ns    min=0s      med=0s       max=1.93ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.96ms  min=2.42ms  med=14.65ms  max=327.53ms p(90)=51.27ms  p(95)=69.83ms  p(99.9)=166.44ms
       { expected_response:true }...: avg=22.96ms  min=2.42ms  med=14.65ms  max=327.53ms p(90)=51.27ms  p(95)=69.83ms  p(99.9)=166.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 258633
     http_req_receiving.............: avg=661.82µs min=51.34µs med=109.46µs max=156.37ms p(90)=983.51µs p(95)=1.55ms   p(99.9)=59.21ms 
     http_req_sending...............: avg=46.62µs  min=5.29µs  med=10.06µs  max=246.06ms p(90)=17.26µs  p(95)=116.26µs p(99.9)=3.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.25ms  min=2.31ms  med=14.14ms  max=326.92ms p(90)=49.92ms  p(95)=68.49ms  p(99.9)=164.88ms
     http_reqs......................: 258633  2150.010943/s
     iteration_duration.............: avg=23.2ms   min=3.17ms  med=14.87ms  max=364.59ms p(90)=51.52ms  p(95)=70.08ms  p(99.9)=167.56ms
     iterations.....................: 258533  2149.179645/s
     success_rate...................: 100.00% ✓ 258533      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 755967      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 303 MB  2.5 MB/s
     http_req_blocked...............: avg=3.79µs   min=992ns   med=2.67µs  max=18.67ms  p(90)=4.26µs   p(95)=5.11µs   p(99.9)=43.9µs 
     http_req_connecting............: avg=411ns    min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.55ms  min=1.92ms  med=23.28ms max=316.05ms p(90)=28.63ms  p(95)=31.41ms  p(99.9)=54.27ms
       { expected_response:true }...: avg=23.55ms  min=1.92ms  med=23.28ms max=316.05ms p(90)=28.63ms  p(95)=31.41ms  p(99.9)=54.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 252089
     http_req_receiving.............: avg=123.26µs min=29.35µs med=58.82µs max=35.28ms  p(90)=105.47µs p(95)=237.71µs p(99.9)=11.2ms 
     http_req_sending...............: avg=50.64µs  min=5.28µs  med=10.97µs max=190.14ms p(90)=19.1µs   p(95)=125.03µs p(99.9)=4.46ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.37ms  min=1.85ms  med=23.16ms max=296.29ms p(90)=28.41ms  p(95)=31.08ms  p(99.9)=53.55ms
     http_reqs......................: 252089  2096.373881/s
     iteration_duration.............: avg=23.8ms   min=3.54ms  med=23.5ms  max=346.47ms p(90)=28.86ms  p(95)=31.67ms  p(99.9)=54.95ms
     iterations.....................: 251989  2095.54228/s
     success_rate...................: 100.00% ✓ 251989      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 450534      ✗ 0     
     data_received..................: 13 GB   110 MB/s
     data_sent......................: 181 MB  1.5 MB/s
     http_req_blocked...............: avg=3.33µs  min=1µs     med=2.34µs  max=4.17ms   p(90)=3.64µs  p(95)=4.25µs   p(99.9)=34.41µs
     http_req_connecting............: avg=688ns   min=0s      med=0s      max=4.13ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.71ms min=2.13ms  med=39.12ms max=311.62ms p(90)=56.21ms p(95)=61.4ms   p(99.9)=85.19ms
       { expected_response:true }...: avg=39.71ms min=2.13ms  med=39.12ms max=311.62ms p(90)=56.21ms p(95)=61.4ms   p(99.9)=85.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150278
     http_req_receiving.............: avg=80.28µs min=29.55µs med=60.41µs max=51.73ms  p(90)=95.96µs p(95)=114.31µs p(99.9)=1.92ms 
     http_req_sending...............: avg=25.14µs min=5.36µs  med=10.46µs max=56.45ms  p(90)=15.62µs p(95)=19.74µs  p(99.9)=1.27ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.6ms  min=2.06ms  med=39.02ms max=311.04ms p(90)=56.1ms  p(95)=61.3ms   p(99.9)=84.94ms
     http_reqs......................: 150278  1249.321674/s
     iteration_duration.............: avg=39.94ms min=4.13ms  med=39.33ms max=343.3ms  p(90)=56.41ms p(95)=61.6ms   p(99.9)=85.69ms
     iterations.....................: 150178  1248.490334/s
     success_rate...................: 100.00% ✓ 150178      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 223008     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   742 kB/s
     http_req_blocked...............: avg=4.2µs   min=1.16µs  med=2.48µs  max=4.13ms   p(90)=3.84µs  p(95)=4.37µs   p(99.9)=43.6µs  
     http_req_connecting............: avg=1.37µs  min=0s      med=0s      max=4.09ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.41ms min=3.86ms  med=78.07ms max=364.93ms p(90)=97.25ms p(95)=106.63ms p(99.9)=197.69ms
       { expected_response:true }...: avg=80.41ms min=3.86ms  med=78.07ms max=364.93ms p(90)=97.25ms p(95)=106.63ms p(99.9)=197.69ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74436
     http_req_receiving.............: avg=77.9µs  min=30.96µs med=67.84µs max=47.78ms  p(90)=99.64µs p(95)=111.81µs p(99.9)=956.15µs
     http_req_sending...............: avg=19.13µs min=5.5µs   med=11.89µs max=136.34ms p(90)=17.12µs p(95)=19.47µs  p(99.9)=621.25µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.31ms min=3.74ms  med=77.98ms max=360.88ms p(90)=97.16ms p(95)=106.52ms p(99.9)=197.45ms
     http_reqs......................: 74436   617.681438/s
     iteration_duration.............: avg=80.73ms min=11.85ms med=78.28ms max=374.23ms p(90)=97.47ms p(95)=106.86ms p(99.9)=199.14ms
     iterations.....................: 74336   616.851623/s
     success_rate...................: 100.00% ✓ 74336      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 151971     ✗ 0    
     data_received..................: 4.5 GB  37 MB/s
     data_sent......................: 61 MB   505 kB/s
     http_req_blocked...............: avg=5.33µs   min=1.18µs  med=3.3µs    max=4.13ms   p(90)=4.75µs   p(95)=5.32µs   p(99.9)=169.02µs
     http_req_connecting............: avg=1.81µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=16.46µs 
     http_req_duration..............: avg=117.96ms min=5.81ms  med=117.81ms max=358.88ms p(90)=142.12ms p(95)=149.3ms  p(99.9)=183.49ms
       { expected_response:true }...: avg=117.96ms min=5.81ms  med=117.81ms max=358.88ms p(90)=142.12ms p(95)=149.3ms  p(99.9)=183.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50757
     http_req_receiving.............: avg=90.8µs   min=32.36µs med=85.9µs   max=26.61ms  p(90)=117.09µs p(95)=129.13µs p(99.9)=773.9µs 
     http_req_sending...............: avg=32.67µs  min=5.58µs  med=16.16µs  max=209.07ms p(90)=21.33µs  p(95)=23.16µs  p(99.9)=962.99µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.84ms min=5.65ms  med=117.7ms  max=357.73ms p(90)=142.02ms p(95)=149.18ms p(99.9)=183.07ms
     http_reqs......................: 50757   420.500149/s
     iteration_duration.............: avg=118.47ms min=25.89ms med=118.1ms  max=368.96ms p(90)=142.4ms  p(95)=149.58ms p(99.9)=185.56ms
     iterations.....................: 50657   419.671692/s
     success_rate...................: 100.00% ✓ 50657      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 96870      ✗ 0    
     data_received..................: 2.8 GB  24 MB/s
     data_sent......................: 39 MB   322 kB/s
     http_req_blocked...............: avg=6.59µs   min=1.22µs  med=3.12µs   max=4.24ms   p(90)=4.45µs   p(95)=5.02µs   p(99.9)=1.58ms  
     http_req_connecting............: avg=3.25µs   min=0s      med=0s       max=4.19ms   p(90)=0s       p(95)=0s       p(99.9)=1.55ms  
     http_req_duration..............: avg=185.07ms min=5.66ms  med=168.86ms max=607.42ms p(90)=209.12ms p(95)=266.38ms p(99.9)=547.69ms
       { expected_response:true }...: avg=185.07ms min=5.66ms  med=168.86ms max=607.42ms p(90)=209.12ms p(95)=266.38ms p(99.9)=547.69ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32390
     http_req_receiving.............: avg=100.56µs min=36.23µs med=89.64µs  max=58.98ms  p(90)=121.53µs p(95)=133.55µs p(99.9)=600.73µs
     http_req_sending...............: avg=23.41µs  min=6.26µs  med=16.19µs  max=40.13ms  p(90)=21.49µs  p(95)=23.51µs  p(99.9)=643.2µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.95ms min=5.57ms  med=168.75ms max=607.34ms p(90)=209.03ms p(95)=266.28ms p(99.9)=547.62ms
     http_reqs......................: 32390   268.128855/s
     iteration_duration.............: avg=185.91ms min=26.04ms med=169.19ms max=607.6ms  p(90)=209.59ms p(95)=269.82ms p(99.9)=547.93ms
     iterations.....................: 32290   267.301041/s
     success_rate...................: 100.00% ✓ 32290      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 89433      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   297 kB/s
     http_req_blocked...............: avg=6.34µs   min=1.27µs  med=2.95µs   max=4.1ms    p(90)=4.14µs   p(95)=4.64µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=3.22µs   min=0s      med=0s       max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=200.48ms min=8.29ms  med=187.95ms max=434.73ms p(90)=257.61ms p(95)=262.68ms p(99.9)=333.28ms
       { expected_response:true }...: avg=200.48ms min=8.29ms  med=187.95ms max=434.73ms p(90)=257.61ms p(95)=262.68ms p(99.9)=333.28ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29911
     http_req_receiving.............: avg=194.44µs min=35.2µs  med=85.64µs  max=188.19ms p(90)=116.54µs p(95)=128.05µs p(99.9)=35.38ms 
     http_req_sending...............: avg=42.51µs  min=6.15µs  med=14.93µs  max=190.16ms p(90)=19.95µs  p(95)=21.63µs  p(99.9)=850.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.25ms min=8.2ms   med=187.81ms max=354.11ms p(90)=257.48ms p(95)=262.55ms p(99.9)=327.52ms
     http_reqs......................: 29911   247.065512/s
     iteration_duration.............: avg=201.4ms  min=13.79ms med=188.34ms max=456.59ms p(90)=257.89ms p(95)=262.93ms p(99.9)=335.36ms
     iterations.....................: 29811   246.239509/s
     success_rate...................: 100.00% ✓ 29811      ✗ 0    
     vus............................: 36      min=36       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 847341      ✗ 0     
     data_received..................: 25 GB   206 MB/s
     data_sent......................: 340 MB  2.8 MB/s
     http_req_blocked...............: avg=4.03µs   min=992ns   med=2.51µs  max=137.72ms p(90)=4.13µs   p(95)=4.97µs   p(99.9)=40.77µs
     http_req_connecting............: avg=352ns    min=0s      med=0s      max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.99ms  min=1.84ms  med=20.5ms  max=301.23ms p(90)=29.16ms  p(95)=32.35ms  p(99.9)=53.91ms
       { expected_response:true }...: avg=20.99ms  min=1.84ms  med=20.5ms  max=301.23ms p(90)=29.16ms  p(95)=32.35ms  p(99.9)=53.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 282547
     http_req_receiving.............: avg=122.74µs min=28.33µs med=56.2µs  max=205.55ms p(90)=109.23µs p(95)=279.19µs p(99.9)=9.28ms 
     http_req_sending...............: avg=56.66µs  min=5.49µs  med=10.45µs max=169.2ms  p(90)=19.29µs  p(95)=130.58µs p(99.9)=6.4ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.81ms  min=1.74ms  med=20.35ms max=300.61ms p(90)=28.94ms  p(95)=32.05ms  p(99.9)=52.89ms
     http_reqs......................: 282547  2349.923073/s
     iteration_duration.............: avg=21.23ms  min=3.15ms  med=20.72ms max=342.75ms p(90)=29.38ms  p(95)=32.61ms  p(99.9)=54.63ms
     iterations.....................: 282447  2349.09138/s
     success_rate...................: 100.00% ✓ 282447      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 697887      ✗ 0     
     data_received..................: 20 GB   170 MB/s
     data_sent......................: 280 MB  2.3 MB/s
     http_req_blocked...............: avg=3.4µs    min=1.05µs  med=2.57µs   max=14.72ms  p(90)=4.09µs  p(95)=4.85µs   p(99.9)=36.52µs 
     http_req_connecting............: avg=212ns    min=0s      med=0s       max=2.69ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.54ms  min=1.84ms  med=17.33ms  max=577.3ms  p(90)=54ms    p(95)=71.27ms  p(99.9)=209.9ms 
       { expected_response:true }...: avg=25.54ms  min=1.84ms  med=17.33ms  max=577.3ms  p(90)=54ms    p(95)=71.27ms  p(99.9)=209.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 232729
     http_req_receiving.............: avg=703.87µs min=51.28µs med=111.79µs max=160.9ms  p(90)=1.16ms  p(95)=1.87ms   p(99.9)=56.44ms 
     http_req_sending...............: avg=48.85µs  min=5.34µs  med=10.64µs  max=234.45ms p(90)=19.58µs p(95)=118.86µs p(99.9)=2.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.78ms  min=1.73ms  med=16.74ms  max=577.21ms p(90)=52.68ms p(95)=69.73ms  p(99.9)=203.08ms
     http_reqs......................: 232729  1935.577802/s
     iteration_duration.............: avg=25.78ms  min=2.78ms  med=17.56ms  max=577.45ms p(90)=54.23ms p(95)=71.51ms  p(99.9)=212.82ms
     iterations.....................: 232629  1934.746114/s
     success_rate...................: 100.00% ✓ 232629      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 555345      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 223 MB  1.8 MB/s
     http_req_blocked...............: avg=4.08µs   min=962ns   med=2.82µs  max=15.09ms  p(90)=5.24µs   p(95)=6.36µs   p(99.9)=49.21µs
     http_req_connecting............: avg=591ns    min=0s      med=0s      max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.12ms  min=2.44ms  med=31.21ms max=319.62ms p(90)=42.81ms  p(95)=47.63ms  p(99.9)=84.87ms
       { expected_response:true }...: avg=32.12ms  min=2.44ms  med=31.21ms max=319.62ms p(90)=42.81ms  p(95)=47.63ms  p(99.9)=84.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 185215
     http_req_receiving.............: avg=118.33µs min=29.01µs med=65.31µs max=95.15ms  p(90)=139.65µs p(95)=284.54µs p(99.9)=6.27ms 
     http_req_sending...............: avg=51.04µs  min=5.52µs  med=11.42µs max=269.92ms p(90)=25.55µs  p(95)=141.01µs p(99.9)=3.22ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.95ms  min=2.32ms  med=31.06ms max=307.82ms p(90)=42.62ms  p(95)=47.37ms  p(99.9)=83.99ms
     http_reqs......................: 185215  1539.537793/s
     iteration_duration.............: avg=32.4ms   min=4.27ms  med=31.46ms max=330.57ms p(90)=43.07ms  p(95)=47.89ms  p(99.9)=85.35ms
     iterations.....................: 185115  1538.706577/s
     success_rate...................: 100.00% ✓ 185115      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 433707      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=4.03µs  min=1.02µs  med=2.93µs  max=4.88ms   p(90)=4.54µs   p(95)=5.24µs   p(99.9)=38.66µs
     http_req_connecting............: avg=757ns   min=0s      med=0s      max=4.83ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.23ms min=2.28ms  med=40.72ms max=353.58ms p(90)=57.79ms  p(95)=63.08ms  p(99.9)=88.96ms
       { expected_response:true }...: avg=41.23ms min=2.28ms  med=40.72ms max=353.58ms p(90)=57.79ms  p(95)=63.08ms  p(99.9)=88.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144669
     http_req_receiving.............: avg=90.9µs  min=29.24µs med=68.55µs max=195.21ms p(90)=108.61µs p(95)=128.87µs p(99.9)=2ms    
     http_req_sending...............: avg=28.17µs min=5.38µs  med=12.48µs max=64.07ms  p(90)=19.63µs  p(95)=23.81µs  p(99.9)=1.4ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.11ms min=2.17ms  med=40.61ms max=352.92ms p(90)=57.67ms  p(95)=62.94ms  p(99.9)=88.41ms
     http_reqs......................: 144669  1202.564491/s
     iteration_duration.............: avg=41.49ms min=3.98ms  med=40.94ms max=363.07ms p(90)=58.01ms  p(95)=63.3ms   p(99.9)=89.39ms
     iterations.....................: 144569  1201.733238/s
     success_rate...................: 100.00% ✓ 144569      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 208224     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   693 kB/s
     http_req_blocked...............: avg=4.67µs   min=1.15µs  med=3µs     max=4.43ms   p(90)=4.57µs   p(95)=5.15µs   p(99.9)=50.21µs 
     http_req_connecting............: avg=1.42µs   min=0s      med=0s      max=4.4ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.09ms  min=4.06ms  med=91.36ms max=316.85ms p(90)=119.88ms p(95)=131.69ms p(99.9)=235.74ms
       { expected_response:true }...: avg=86.09ms  min=4.06ms  med=91.36ms max=316.85ms p(90)=119.88ms p(95)=131.69ms p(99.9)=235.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69508
     http_req_receiving.............: avg=104.56µs min=32.18µs med=78.4µs  max=228.76ms p(90)=112.97µs p(95)=126.05µs p(99.9)=1.02ms  
     http_req_sending...............: avg=22.95µs  min=5.6µs   med=13.86µs max=166.45ms p(90)=20.48µs  p(95)=22.7µs   p(99.9)=724.66µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.96ms  min=3.93ms  med=91.25ms max=316.08ms p(90)=119.77ms p(95)=131.53ms p(99.9)=234.54ms
     http_reqs......................: 69508   576.702923/s
     iteration_duration.............: avg=86.45ms  min=16.18ms med=91.6ms  max=356.81ms p(90)=120.16ms p(95)=131.99ms p(99.9)=237.1ms 
     iterations.....................: 69408   575.873231/s
     success_rate...................: 100.00% ✓ 69408      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 140952     ✗ 0    
     data_received..................: 4.1 GB  34 MB/s
     data_sent......................: 57 MB   468 kB/s
     http_req_blocked...............: avg=5.8µs    min=1.18µs  med=3.33µs   max=4.04ms   p(90)=4.77µs   p(95)=5.33µs   p(99.9)=326.44µs
     http_req_connecting............: avg=2.22µs   min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=278.68µs
     http_req_duration..............: avg=127.22ms min=6.05ms  med=124.79ms max=329.46ms p(90)=168.72ms p(95)=181.63ms p(99.9)=229.78ms
       { expected_response:true }...: avg=127.22ms min=6.05ms  med=124.79ms max=329.46ms p(90)=168.72ms p(95)=181.63ms p(99.9)=229.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47084
     http_req_receiving.............: avg=91.97µs  min=31.32µs med=85.63µs  max=61.41ms  p(90)=116.62µs p(95)=128.17µs p(99.9)=728.38µs
     http_req_sending...............: avg=31.8µs   min=5.77µs  med=16.56µs  max=181.88ms p(90)=21.63µs  p(95)=23.4µs   p(99.9)=607.63µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=127.1ms  min=5.91ms  med=124.68ms max=328.82ms p(90)=168.59ms p(95)=181.52ms p(99.9)=229.59ms
     http_reqs......................: 47084   389.905269/s
     iteration_duration.............: avg=127.74ms min=22.92ms med=125.1ms  max=343.22ms p(90)=169.03ms p(95)=181.94ms p(99.9)=232.92ms
     iterations.....................: 46984   389.077163/s
     success_rate...................: 100.00% ✓ 46984      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 92682      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 37 MB   308 kB/s
     http_req_blocked...............: avg=6.95µs   min=1.2µs   med=3.19µs   max=4.26ms   p(90)=4.49µs   p(95)=5µs      p(99.9)=1.9ms   
     http_req_connecting............: avg=3.55µs   min=0s      med=0s       max=4.21ms   p(90)=0s       p(95)=0s       p(99.9)=1.85ms  
     http_req_duration..............: avg=193.43ms min=6.02ms  med=176.21ms max=626.31ms p(90)=230.95ms p(95)=390.79ms p(99.9)=553.41ms
       { expected_response:true }...: avg=193.43ms min=6.02ms  med=176.21ms max=626.31ms p(90)=230.95ms p(95)=390.79ms p(99.9)=553.41ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30994
     http_req_receiving.............: avg=103.81µs min=35.63µs med=92.64µs  max=87.14ms  p(90)=123.65µs p(95)=136.83µs p(99.9)=647.58µs
     http_req_sending...............: avg=30.85µs  min=5.42µs  med=16.62µs  max=103.55ms p(90)=21.63µs  p(95)=23.48µs  p(99.9)=486.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.3ms  min=5.88ms  med=176.1ms  max=626.16ms p(90)=230.82ms p(95)=390.67ms p(99.9)=553.32ms
     http_reqs......................: 30994   256.458999/s
     iteration_duration.............: avg=194.31ms min=45.38ms med=176.57ms max=626.55ms p(90)=231.41ms p(95)=391.94ms p(99.9)=553.61ms
     iterations.....................: 30894   255.631551/s
     success_rate...................: 100.00% ✓ 30894      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 86028      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=6.87µs   min=1.16µs  med=3.3µs    max=4.33ms   p(90)=4.58µs   p(95)=5.08µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=3.35µs   min=0s      med=0s       max=4.29ms   p(90)=0s       p(95)=0s       p(99.9)=1.36ms  
     http_req_duration..............: avg=208.39ms min=8.8ms   med=207.45ms max=438.44ms p(90)=234.83ms p(95)=241.34ms p(99.9)=313.35ms
       { expected_response:true }...: avg=208.39ms min=8.8ms   med=207.45ms max=438.44ms p(90)=234.83ms p(95)=241.34ms p(99.9)=313.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28776
     http_req_receiving.............: avg=235.94µs min=35.28µs med=93.1µs   max=247.27ms p(90)=124.89µs p(95)=137.22µs p(99.9)=7.76ms  
     http_req_sending...............: avg=31.98µs  min=5.94µs  med=16.81µs  max=211.31ms p(90)=21.59µs  p(95)=23.38µs  p(99.9)=751.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.12ms min=8.65ms  med=207.18ms max=317.14ms p(90)=234.66ms p(95)=241.08ms p(99.9)=309.29ms
     http_reqs......................: 28776   237.593963/s
     iteration_duration.............: avg=209.36ms min=38.96ms med=207.92ms max=450.89ms p(90)=235.11ms p(95)=241.65ms p(99.9)=314.49ms
     iterations.....................: 28676   236.768296/s
     success_rate...................: 100.00% ✓ 28676      ✗ 0    
     vus............................: 42      min=42       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

