## Overview for: `constant-vus-with-latency`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 11 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 10 runs are measured. Results are ranked by **median RPS** across the 10 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s** with a simulated **4ms IO delay** on each subgraph request. Only .NET subgraphs are used.


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 1,596 | 1,596 | 1,585 | 0.5% |  |
| cosmo | 0.291.0 | 1,185 | 1,185 | 1,180 | 0.3% |  |
| grafbase | 0.53.2 | 1,174 | 1,174 | 1,163 | 0.7% |  |
| hotchocolate | 16.0.0-p.11.47 | 1,070 | 1,070 | 1,068 | 0.1% |  |
| hive-gateway-router-runtime | 2.5.6 | 504 | 504 | 498 | 0.8% |  |
| apollo-router | v2.12.0 | 405 | 405 | 402 | 0.5% |  |
| hive-gateway | 2.5.6 | 259 | 259 | 259 | 0.0% |  |
| apollo-gateway | 2.13.2 | 234 | 234 | 234 | 0.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 584907      ✗ 0     
     data_received..................: 17 GB   140 MB/s
     data_sent......................: 234 MB  1.9 MB/s
     http_req_blocked...............: avg=3.35µs  min=1.01µs  med=2.38µs  max=4.51ms   p(90)=4.08µs   p(95)=4.94µs   p(99.9)=37.42µs
     http_req_connecting............: avg=520ns   min=0s      med=0s      max=4.46ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.52ms min=13.74ms med=30.28ms max=334.57ms p(90)=36.2ms   p(95)=38.04ms  p(99.9)=54.81ms
       { expected_response:true }...: avg=30.52ms min=13.74ms med=30.28ms max=334.57ms p(90)=36.2ms   p(95)=38.04ms  p(99.9)=54.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 195069
     http_req_receiving.............: avg=81.98µs min=27.05µs med=54.08µs max=147.23ms p(90)=102.42µs p(95)=147.57µs p(99.9)=2.03ms 
     http_req_sending...............: avg=30.52µs min=5.02µs  med=9.93µs  max=70.4ms   p(90)=19.5µs   p(95)=38.35µs  p(99.9)=1.45ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.41ms min=13.65ms med=30.17ms max=334.08ms p(90)=36.09ms  p(95)=37.91ms  p(99.9)=53.42ms
     http_reqs......................: 195069  1596.505268/s
     iteration_duration.............: avg=30.76ms min=13.97ms med=30.5ms  max=359.62ms p(90)=36.42ms  p(95)=38.25ms  p(99.9)=55.36ms
     iterations.....................: 194969  1595.686837/s
     success_rate...................: 100.00% ✓ 194969      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 433524      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=3.59µs  min=1.08µs  med=2.47µs  max=4.31ms   p(90)=4.07µs   p(95)=4.82µs   p(99.9)=35.37µs
     http_req_connecting............: avg=730ns   min=0s      med=0s      max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.28ms min=18.9ms  med=40.73ms max=329.14ms p(90)=50.01ms  p(95)=52.95ms  p(99.9)=68.01ms
       { expected_response:true }...: avg=41.28ms min=18.9ms  med=40.73ms max=329.14ms p(90)=50.01ms  p(95)=52.95ms  p(99.9)=68.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144608
     http_req_receiving.............: avg=84.22µs min=28.74µs med=62.5µs  max=112.48ms p(90)=106.73µs p(95)=133.44µs p(99.9)=1.65ms 
     http_req_sending...............: avg=27.23µs min=5.11µs  med=11µs    max=124.26ms p(90)=18.83µs  p(95)=23.6µs   p(99.9)=1.02ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.17ms min=18.82ms med=40.63ms max=328.48ms p(90)=49.89ms  p(95)=52.84ms  p(99.9)=67.57ms
     http_reqs......................: 144608  1185.148888/s
     iteration_duration.............: avg=41.51ms min=19.06ms med=40.94ms max=364.63ms p(90)=50.21ms  p(95)=53.14ms  p(99.9)=68.31ms
     iterations.....................: 144508  1184.329329/s
     success_rate...................: 100.00% ✓ 144508      ✗ 0     
     vus............................: 47      min=0         max=50  
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

     checks.........................: 100.00% ✓ 429453      ✗ 0     
     data_received..................: 13 GB   103 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.88µs  min=962ns   med=2.32µs  max=16.12ms  p(90)=4.69µs   p(95)=5.82µs   p(99.9)=40.58µs
     http_req_connecting............: avg=847ns   min=0s      med=0s      max=4.76ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.63ms min=16.75ms med=41.2ms  max=349.07ms p(90)=50.2ms   p(95)=53.25ms  p(99.9)=79.16ms
       { expected_response:true }...: avg=41.63ms min=16.75ms med=41.2ms  max=349.07ms p(90)=50.2ms   p(95)=53.25ms  p(99.9)=79.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143251
     http_req_receiving.............: avg=98.19µs min=29.54µs med=61.55µs max=306.68ms p(90)=131.56µs p(95)=204.9µs  p(99.9)=2.73ms 
     http_req_sending...............: avg=35.24µs min=5.24µs  med=10.18µs max=143.77ms p(90)=23.69µs  p(95)=110.57µs p(99.9)=1.86ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.5ms  min=16.67ms med=41.08ms max=339.22ms p(90)=50.04ms  p(95)=53.1ms   p(99.9)=78.92ms
     http_reqs......................: 143251  1174.16866/s
     iteration_duration.............: avg=41.9ms  min=17.14ms med=41.44ms max=359.36ms p(90)=50.43ms  p(95)=53.48ms  p(99.9)=79.77ms
     iterations.....................: 143151  1173.349002/s
     success_rate...................: 100.00% ✓ 143151      ✗ 0     
     vus............................: 49      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.47)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 397536      ✗ 0     
     data_received..................: 12 GB   94 MB/s
     data_sent......................: 159 MB  1.3 MB/s
     http_req_blocked...............: avg=3.51µs   min=992ns   med=2.34µs   max=3.93ms   p(90)=3.93µs  p(95)=4.64µs  p(99.9)=38.82µs 
     http_req_connecting............: avg=727ns    min=0s      med=0s       max=3.89ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=45.02ms  min=29.44ms med=44.29ms  max=321.87ms p(90)=51.65ms p(95)=54.14ms p(99.9)=106.63ms
       { expected_response:true }...: avg=45.02ms  min=29.44ms med=44.29ms  max=321.87ms p(90)=51.65ms p(95)=54.14ms p(99.9)=106.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 132612
     http_req_receiving.............: avg=424.81µs min=51.21µs med=115.22µs max=123.88ms p(90)=1.15ms  p(95)=1.75ms  p(99.9)=8.53ms  
     http_req_sending...............: avg=28.7µs   min=5.26µs  med=10.01µs  max=156.81ms p(90)=19.18µs p(95)=24.72µs p(99.9)=1.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=44.56ms  min=29.35ms med=43.85ms  max=321.01ms p(90)=51.09ms p(95)=53.57ms p(99.9)=105.88ms
     http_reqs......................: 132612  1070.420821/s
     iteration_duration.............: avg=45.27ms  min=29.58ms med=44.52ms  max=368.06ms p(90)=51.86ms p(95)=54.36ms p(99.9)=107.33ms
     iterations.....................: 132512  1069.613639/s
     success_rate...................: 100.00% ✓ 132512      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 185037     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 74 MB   606 kB/s
     http_req_blocked...............: avg=4.72µs  min=1.14µs  med=2.83µs  max=3.99ms   p(90)=4.31µs   p(95)=4.87µs   p(99.9)=53.69µs 
     http_req_connecting............: avg=1.62µs  min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.91ms min=18.64ms med=94.74ms max=370.4ms  p(90)=113.49ms p(95)=121.87ms p(99.9)=224.39ms
       { expected_response:true }...: avg=96.91ms min=18.64ms med=94.74ms max=370.4ms  p(90)=113.49ms p(95)=121.87ms p(99.9)=224.39ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61779
     http_req_receiving.............: avg=84.89µs min=31.39µs med=74.35µs max=151.73ms p(90)=109.12µs p(95)=122.39µs p(99.9)=786.3µs 
     http_req_sending...............: avg=26.61µs min=5.52µs  med=13.54µs max=117.95ms p(90)=19.77µs  p(95)=21.88µs  p(99.9)=625.29µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.8ms  min=18.5ms  med=94.63ms max=369.65ms p(90)=113.4ms  p(95)=121.75ms p(99.9)=224.14ms
     http_reqs......................: 61779   504.176054/s
     iteration_duration.............: avg=97.29ms min=39.96ms med=94.97ms max=389.23ms p(90)=113.72ms p(95)=122.14ms p(99.9)=226.61ms
     iterations.....................: 61679   503.359958/s
     success_rate...................: 100.00% ✓ 61679      ✗ 0    
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

     checks.........................: 100.00% ✓ 148488     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 60 MB   486 kB/s
     http_req_blocked...............: avg=5.46µs   min=1.25µs  med=3.23µs   max=4.06ms   p(90)=4.65µs   p(95)=5.23µs   p(99.9)=108.78µs
     http_req_connecting............: avg=2.06µs   min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=76.1µs  
     http_req_duration..............: avg=120.77ms min=22.09ms med=118.97ms max=368.13ms p(90)=150.09ms p(95)=160.05ms p(99.9)=203.57ms
       { expected_response:true }...: avg=120.77ms min=22.09ms med=118.97ms max=368.13ms p(90)=150.09ms p(95)=160.05ms p(99.9)=203.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49596
     http_req_receiving.............: avg=92.18µs  min=31µs    med=81.08µs  max=126.33ms p(90)=114.15µs p(95)=126.33µs p(99.9)=786.86µs
     http_req_sending...............: avg=26.84µs  min=5.61µs  med=15.55µs  max=161.06ms p(90)=20.99µs  p(95)=23.06µs  p(99.9)=600.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.65ms min=21.95ms med=118.85ms max=367.57ms p(90)=149.99ms p(95)=159.92ms p(99.9)=203.05ms
     http_reqs......................: 49596   405.013102/s
     iteration_duration.............: avg=121.24ms min=36.9ms  med=119.25ms max=379.57ms p(90)=150.36ms p(95)=160.36ms p(99.9)=205.57ms
     iterations.....................: 49496   404.196477/s
     success_rate...................: 100.00% ✓ 49496      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94914      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=6.32µs   min=1.25µs  med=3.27µs   max=4.14ms   p(90)=4.62µs   p(95)=5.17µs   p(99.9)=1.07ms  
     http_req_connecting............: avg=2.77µs   min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=998.01µs
     http_req_duration..............: avg=188.94ms min=18.12ms med=177.77ms max=557.56ms p(90)=218.41ms p(95)=276.4ms  p(99.9)=522.45ms
       { expected_response:true }...: avg=188.94ms min=18.12ms med=177.77ms max=557.56ms p(90)=218.41ms p(95)=276.4ms  p(99.9)=522.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31738
     http_req_receiving.............: avg=99.55µs  min=31.99µs med=87.59µs  max=119.69ms p(90)=119.44µs p(95)=132.32µs p(99.9)=803.19µs
     http_req_sending...............: avg=29.52µs  min=5.57µs  med=16.35µs  max=58.71ms  p(90)=21.34µs  p(95)=23.18µs  p(99.9)=849.86µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.81ms min=17.9ms  med=177.67ms max=557.45ms p(90)=218.3ms  p(95)=273.23ms p(99.9)=522.34ms
     http_reqs......................: 31738   259.736673/s
     iteration_duration.............: avg=189.75ms min=45.92ms med=178.11ms max=557.79ms p(90)=218.76ms p(95)=284.27ms p(99.9)=522.78ms
     iterations.....................: 31638   258.918295/s
     success_rate...................: 100.00% ✓ 31638      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86190      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   282 kB/s
     http_req_blocked...............: avg=7.03µs   min=1.27µs  med=3.32µs   max=4.09ms   p(90)=4.63µs   p(95)=5.19µs   p(99.9)=1.79ms  
     http_req_connecting............: avg=3.54µs   min=0s      med=0s       max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=1.76ms  
     http_req_duration..............: avg=208.04ms min=21.26ms med=213.94ms max=428.18ms p(90)=227.17ms p(95)=234.34ms p(99.9)=304.93ms
       { expected_response:true }...: avg=208.04ms min=21.26ms med=213.94ms max=428.18ms p(90)=227.17ms p(95)=234.34ms p(99.9)=304.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28830
     http_req_receiving.............: avg=94.11µs  min=34.32µs med=89.36µs  max=3.12ms   p(90)=121.78µs p(95)=134.33µs p(99.9)=605.02µs
     http_req_sending...............: avg=26.79µs  min=6.15µs  med=16.42µs  max=46.25ms  p(90)=21.39µs  p(95)=23.33µs  p(99.9)=571.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.92ms min=21.14ms med=213.82ms max=427.56ms p(90)=227.06ms p(95)=234.23ms p(99.9)=304.85ms
     http_reqs......................: 28830   234.659821/s
     iteration_duration.............: avg=208.96ms min=67.74ms med=214.21ms max=437.23ms p(90)=227.44ms p(95)=234.63ms p(99.9)=309.2ms 
     iterations.....................: 28730   233.845877/s
     success_rate...................: 100.00% ✓ 28730      ✗ 0    
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

