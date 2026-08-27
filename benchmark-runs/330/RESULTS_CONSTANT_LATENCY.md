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
| fusion-nightly | 16.6.2-p.8 | 1,885 | 1,939 | 1,873 | 1.2% |  |
| fusion | 16.6.1 | 1,873 | 1,922 | 1,864 | 1.0% |  |
| fusion-nightly-net11 | 16.6.2-p.8 | 1,870 | 1,915 | 1,859 | 1.0% |  |
| hive-router | v0.0.84 | 1,822 | 1,891 | 1,811 | 1.4% |  |
| fusion-nightly-fed | 16.6.2-p.8 | 1,799 | 1,851 | 1,791 | 1.1% |  |
| grafbase | 0.53.5 | 1,320 | 1,340 | 1,313 | 0.6% |  |
| cosmo | 0.334.0 | 1,214 | 1,257 | 1,207 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 559 | 577 | 553 | 1.3% |  |
| apollo-router | v2.16.1 | 395 | 416 | 392 | 2.0% |  |
| apollo-gateway | 2.14.3 | 268 | 271 | 266 | 0.5% |  |
| hive-gateway | 2.10.8 | 261 | 267 | 258 | 1.1% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 20 | 2.5% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 689328      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.82µs   min=871ns   med=1.94µs  max=7.83ms   p(90)=3.52µs   p(95)=4.21µs  p(99.9)=28µs   
     http_req_connecting............: avg=427ns    min=0s      med=0s      max=4.13ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.89ms  min=17.18ms med=25.32ms max=287.5ms  p(90)=30.21ms  p(95)=31.98ms p(99.9)=48.6ms 
       { expected_response:true }...: avg=25.89ms  min=17.18ms med=25.32ms max=287.5ms  p(90)=30.21ms  p(95)=31.98ms p(99.9)=48.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 229876
     http_req_receiving.............: avg=316.91µs min=49.53µs med=93.74µs max=169.46ms p(90)=807.91µs p(95)=1.3ms   p(99.9)=8.18ms 
     http_req_sending...............: avg=32.32µs  min=4.46µs  med=8.23µs  max=132.8ms  p(90)=17.68µs  p(95)=29.93µs p(99.9)=1.61ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.54ms  min=17.1ms  med=24.99ms max=280.36ms p(90)=29.79ms  p(95)=31.53ms p(99.9)=47ms   
     http_reqs......................: 229876  1885.345076/s
     iteration_duration.............: avg=26.1ms   min=17.37ms med=25.52ms max=308.54ms p(90)=30.41ms  p(95)=32.18ms p(99.9)=49.07ms
     iterations.....................: 229776  1884.524919/s
     success_rate...................: 100.00% ✓ 229776      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 685038      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.02µs   min=892ns   med=2.14µs  max=3.78ms   p(90)=3.89µs   p(95)=4.6µs   p(99.9)=36.83µs
     http_req_connecting............: avg=444ns    min=0s      med=0s      max=3.72ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.05ms  min=16.99ms med=25.45ms max=315.06ms p(90)=30.49ms  p(95)=32.3ms  p(99.9)=51.17ms
       { expected_response:true }...: avg=26.05ms  min=16.99ms med=25.45ms max=315.06ms p(90)=30.49ms  p(95)=32.3ms  p(99.9)=51.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228446
     http_req_receiving.............: avg=304.98µs min=50.35µs med=94.57µs max=224.04ms p(90)=751.53µs p(95)=1.25ms  p(99.9)=8.04ms 
     http_req_sending...............: avg=31.89µs  min=4.43µs  med=8.69µs  max=147.01ms p(90)=18.9µs   p(95)=32.59µs p(99.9)=1.59ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.71ms  min=16.9ms  med=25.13ms max=287.61ms p(90)=30.08ms  p(95)=31.86ms p(99.9)=49.83ms
     http_reqs......................: 228446  1873.389592/s
     iteration_duration.............: avg=26.26ms  min=17.2ms  med=25.66ms max=323.63ms p(90)=30.69ms  p(95)=32.51ms p(99.9)=51.57ms
     iterations.....................: 228346  1872.569534/s
     success_rate...................: 100.00% ✓ 228346      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 683796      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=2.83µs   min=862ns   med=1.95µs  max=3.79ms   p(90)=3.67µs   p(95)=4.4µs   p(99.9)=29.17µs
     http_req_connecting............: avg=451ns    min=0s      med=0s      max=3.75ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.1ms   min=17.14ms med=25.55ms max=298.71ms p(90)=30.43ms  p(95)=32.18ms p(99.9)=50.75ms
       { expected_response:true }...: avg=26.1ms   min=17.14ms med=25.55ms max=298.71ms p(90)=30.43ms  p(95)=32.18ms p(99.9)=50.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228032
     http_req_receiving.............: avg=254.72µs min=48.92µs med=86.2µs  max=88.99ms  p(90)=589.57µs p(95)=1.12ms  p(99.9)=6.86ms 
     http_req_sending...............: avg=33.58µs  min=4.33µs  med=8.31µs  max=272.99ms p(90)=18.84µs  p(95)=30.26µs p(99.9)=1.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.81ms  min=16.98ms med=25.28ms max=281.77ms p(90)=30.08ms  p(95)=31.79ms p(99.9)=49.08ms
     http_reqs......................: 228032  1870.269727/s
     iteration_duration.............: avg=26.31ms  min=17.39ms med=25.75ms max=322.33ms p(90)=30.63ms  p(95)=32.38ms p(99.9)=51.22ms
     iterations.....................: 227932  1869.449549/s
     success_rate...................: 100.00% ✓ 227932      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 666534      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 267 MB  2.2 MB/s
     http_req_blocked...............: avg=3.51µs  min=1.03µs  med=2.71µs  max=5.58ms   p(90)=4.37µs  p(95)=5.12µs   p(99.9)=35.8µs 
     http_req_connecting............: avg=398ns   min=0s      med=0s      max=3.57ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.77ms min=17.63ms med=26.33ms max=294.57ms p(90)=30.59ms p(95)=32.06ms  p(99.9)=48.13ms
       { expected_response:true }...: avg=26.77ms min=17.63ms med=26.33ms max=294.57ms p(90)=30.59ms p(95)=32.06ms  p(99.9)=48.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 222278
     http_req_receiving.............: avg=77.83µs min=26.1µs  med=53.32µs max=123.12ms p(90)=95.82µs p(95)=122.56µs p(99.9)=1.96ms 
     http_req_sending...............: avg=30.84µs min=4.88µs  med=10.51µs max=155.09ms p(90)=18.42µs p(95)=26.06µs  p(99.9)=1.33ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.66ms min=17.58ms med=26.24ms max=293.77ms p(90)=30.48ms p(95)=31.94ms  p(99.9)=46.75ms
     http_reqs......................: 222278  1822.734529/s
     iteration_duration.............: avg=26.99ms min=19.08ms med=26.54ms max=306.1ms  p(90)=30.8ms  p(95)=32.28ms  p(99.9)=48.58ms
     iterations.....................: 222178  1821.914504/s
     success_rate...................: 100.00% ✓ 222178      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 658311      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 264 MB  2.2 MB/s
     http_req_blocked...............: avg=2.66µs   min=921ns   med=2.07µs  max=1.96ms   p(90)=3.77µs   p(95)=4.54µs  p(99.9)=29.49µs
     http_req_connecting............: avg=178ns    min=0s      med=0s      max=1.55ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.12ms  min=18.17ms med=26.52ms max=307.41ms p(90)=31.72ms  p(95)=33.62ms p(99.9)=50.06ms
       { expected_response:true }...: avg=27.12ms  min=18.17ms med=26.52ms max=307.41ms p(90)=31.72ms  p(95)=33.62ms p(99.9)=50.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 219537
     http_req_receiving.............: avg=335.54µs min=50.83µs med=96.95µs max=253.03ms p(90)=786.87µs p(95)=1.27ms  p(99.9)=9.05ms 
     http_req_sending...............: avg=30.07µs  min=4.65µs  med=8.79µs  max=35.41ms  p(90)=18.71µs  p(95)=28.18µs p(99.9)=1.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.75ms  min=17.8ms  med=26.19ms max=172.5ms  p(90)=31.32ms  p(95)=33.19ms p(99.9)=49.18ms
     http_reqs......................: 219537  1799.690626/s
     iteration_duration.............: avg=27.33ms  min=18.46ms med=26.73ms max=316.21ms p(90)=31.92ms  p(95)=33.82ms p(99.9)=50.57ms
     iterations.....................: 219437  1798.87086/s
     success_rate...................: 100.00% ✓ 219437      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 482871      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 194 MB  1.6 MB/s
     http_req_blocked...............: avg=3.46µs  min=831ns   med=2.22µs  max=3.7ms    p(90)=4.77µs   p(95)=5.73µs   p(99.9)=42.32µs
     http_req_connecting............: avg=609ns   min=0s      med=0s      max=3.65ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.02ms min=18.29ms med=36.74ms max=297.76ms p(90)=43.6ms   p(95)=45.64ms  p(99.9)=60.39ms
       { expected_response:true }...: avg=37.02ms min=18.29ms med=36.74ms max=297.76ms p(90)=43.6ms   p(95)=45.64ms  p(99.9)=60.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 161057
     http_req_receiving.............: avg=85.63µs min=27.08µs med=54.1µs  max=136.24ms p(90)=121.19µs p(95)=166.02µs p(99.9)=2.38ms 
     http_req_sending...............: avg=34.05µs min=4.41µs  med=9.38µs  max=114.3ms  p(90)=24.44µs  p(95)=56.74µs  p(99.9)=2.19ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=36.9ms  min=18.18ms med=36.63ms max=297.42ms p(90)=43.47ms  p(95)=45.5ms   p(99.9)=59.54ms
     http_reqs......................: 161057  1320.273057/s
     iteration_duration.............: avg=37.26ms min=20.93ms med=36.98ms max=311.92ms p(90)=43.82ms  p(95)=45.86ms  p(99.9)=60.89ms
     iterations.....................: 160957  1319.453302/s
     success_rate...................: 100.00% ✓ 160957      ✗ 0     
     vus............................: 4       min=0         max=50  
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

     checks.........................: 100.00% ✓ 444219      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=3.51µs  min=982ns   med=2.43µs  max=4.27ms   p(90)=4.13µs   p(95)=4.83µs   p(99.9)=37.88µs 
     http_req_connecting............: avg=741ns   min=0s      med=0s      max=4.22ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.28ms min=18.67ms med=39.63ms max=315.18ms p(90)=48.41ms  p(95)=51.2ms   p(99.9)=66.2ms  
       { expected_response:true }...: avg=40.28ms min=18.67ms med=39.63ms max=315.18ms p(90)=48.41ms  p(95)=51.2ms   p(99.9)=66.2ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 148173
     http_req_receiving.............: avg=79.62µs min=26.3µs  med=63.29µs max=153.71ms p(90)=105.28µs p(95)=122.91µs p(99.9)=818.7µs 
     http_req_sending...............: avg=28.45µs min=4.62µs  med=11.07µs max=248.98ms p(90)=18.84µs  p(95)=22.63µs  p(99.9)=923.89µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.17ms min=18.52ms med=39.53ms max=314.63ms p(90)=48.31ms  p(95)=51.09ms  p(99.9)=65.63ms 
     http_reqs......................: 148173  1214.478325/s
     iteration_duration.............: avg=40.51ms min=22.36ms med=39.84ms max=326.97ms p(90)=48.62ms  p(95)=51.4ms   p(99.9)=66.58ms 
     iterations.....................: 148073  1213.658689/s
     success_rate...................: 100.00% ✓ 148073      ✗ 0     
     vus............................: 39      min=0         max=50  
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

     checks.........................: 100.00% ✓ 204864     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 82 MB   672 kB/s
     http_req_blocked...............: avg=5.02µs  min=1.28µs  med=3.32µs  max=4.11ms   p(90)=4.94µs   p(95)=5.65µs   p(99.9)=53.63µs 
     http_req_connecting............: avg=1.38µs  min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.52ms min=20.4ms  med=86.41ms max=319.85ms p(90)=103.83ms p(95)=113.03ms p(99.9)=199.94ms
       { expected_response:true }...: avg=87.52ms min=20.4ms  med=86.41ms max=319.85ms p(90)=103.83ms p(95)=113.03ms p(99.9)=199.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68388
     http_req_receiving.............: avg=93.31µs min=32µs    med=77.18µs max=102.08ms p(90)=114.31µs p(95)=128.86µs p(99.9)=683.18µs
     http_req_sending...............: avg=26.41µs min=5.74µs  med=15.53µs max=109.82ms p(90)=22.17µs  p(95)=24.57µs  p(99.9)=630.41µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.4ms  min=20.24ms med=86.3ms  max=319.43ms p(90)=103.72ms p(95)=112.91ms p(99.9)=199.65ms
     http_reqs......................: 68388   559.458896/s
     iteration_duration.............: avg=87.87ms min=33.01ms med=86.67ms max=335.76ms p(90)=104.1ms  p(95)=113.29ms p(99.9)=200.74ms
     iterations.....................: 68288   558.64083/s
     success_rate...................: 100.00% ✓ 68288      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 144909     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   475 kB/s
     http_req_blocked...............: avg=5.39µs   min=1.07µs  med=3.01µs   max=4.16ms   p(90)=4.42µs   p(95)=5.01µs   p(99.9)=827.31µs
     http_req_connecting............: avg=2.15µs   min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=791.39µs
     http_req_duration..............: avg=123.77ms min=21.4ms  med=121.83ms max=346.7ms  p(90)=155.29ms p(95)=165.23ms p(99.9)=211.78ms
       { expected_response:true }...: avg=123.77ms min=21.4ms  med=121.83ms max=346.7ms  p(90)=155.29ms p(95)=165.23ms p(99.9)=211.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48403
     http_req_receiving.............: avg=89.29µs  min=29.74µs med=81.42µs  max=200.52ms p(90)=112.67µs p(95)=124.88µs p(99.9)=467.96µs
     http_req_sending...............: avg=30.61µs  min=5.49µs  med=16.35µs  max=195.53ms p(90)=21.63µs  p(95)=23.48µs  p(99.9)=471.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.65ms min=21.26ms med=121.72ms max=346.52ms p(90)=155.15ms p(95)=165.11ms p(99.9)=210.91ms
     http_reqs......................: 48403   395.58096/s
     iteration_duration.............: avg=124.25ms min=42.21ms med=122.13ms max=358.38ms p(90)=155.56ms p(95)=165.53ms p(99.9)=212.89ms
     iterations.....................: 48303   394.763694/s
     success_rate...................: 100.00% ✓ 48303      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 98337      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   322 kB/s
     http_req_blocked...............: avg=6.94µs   min=1.46µs  med=3.78µs   max=4.23ms   p(90)=5.34µs   p(95)=5.93µs   p(99.9)=1.23ms  
     http_req_connecting............: avg=2.84µs   min=0s      med=0s       max=4.19ms   p(90)=0s       p(95)=0s       p(99.9)=1.2ms   
     http_req_duration..............: avg=182.36ms min=23.65ms med=183.13ms max=404.22ms p(90)=193.36ms p(95)=197.25ms p(99.9)=265.23ms
       { expected_response:true }...: avg=182.36ms min=23.65ms med=183.13ms max=404.22ms p(90)=193.36ms p(95)=197.25ms p(99.9)=265.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32879
     http_req_receiving.............: avg=99.99µs  min=33.96µs med=89.8µs   max=106.83ms p(90)=122.72µs p(95)=136.08µs p(99.9)=595.32µs
     http_req_sending...............: avg=36.97µs  min=6.98µs  med=19.08µs  max=106.52ms p(90)=24.31µs  p(95)=26.4µs   p(99.9)=568.23µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.22ms min=23.49ms med=183ms    max=404.07ms p(90)=193.24ms p(95)=197.12ms p(99.9)=265.03ms
     http_reqs......................: 32879   268.030504/s
     iteration_duration.............: avg=183.17ms min=66.19ms med=183.55ms max=419.23ms p(90)=193.67ms p(95)=197.55ms p(99.9)=266.69ms
     iterations.....................: 32779   267.215301/s
     success_rate...................: 100.00% ✓ 32779      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 95418      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   314 kB/s
     http_req_blocked...............: avg=6.87µs   min=1.36µs  med=3.85µs   max=3.56ms   p(90)=5.41µs   p(95)=6.04µs   p(99.9)=1.31ms  
     http_req_connecting............: avg=2.74µs   min=0s      med=0s       max=3.52ms   p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=187.92ms min=17.98ms med=175.34ms max=630.08ms p(90)=224.63ms p(95)=259.65ms p(99.9)=560.84ms
       { expected_response:true }...: avg=187.92ms min=17.98ms med=175.34ms max=630.08ms p(90)=224.63ms p(95)=259.65ms p(99.9)=560.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31906
     http_req_receiving.............: avg=99.23µs  min=36.52µs med=90.94µs  max=99.42ms  p(90)=122.61µs p(95)=135.06µs p(99.9)=841.04µs
     http_req_sending...............: avg=41.6µs   min=6.9µs   med=19.2µs   max=151.71ms p(90)=24.35µs  p(95)=26.44µs  p(99.9)=604.59µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.78ms min=17.84ms med=175.22ms max=629.99ms p(90)=224.49ms p(95)=259.41ms p(99.9)=560.72ms
     http_reqs......................: 31906   261.192356/s
     iteration_duration.............: avg=188.77ms min=40.32ms med=175.76ms max=630.3ms  p(90)=224.99ms p(95)=261.6ms  p(99.9)=561.21ms
     iterations.....................: 31806   260.373726/s
     success_rate...................: 100.00% ✓ 31806      ✗ 0    
     vus............................: 45      min=0        max=50 
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

     checks.........................: 100.00% ✓ 7425      ✗ 0   
     data_received..................: 247 MB  1.9 MB/s
     data_sent......................: 3.1 MB  24 kB/s
     http_req_blocked...............: avg=100.87µs min=1.49µs   med=3.84µs  max=7.78ms   p(90)=5.56µs   p(95)=6.49µs   p(99.9)=7.47ms  
     http_req_connecting............: avg=95.38µs  min=0s       med=0s      max=7.74ms   p(90)=0s       p(95)=0s       p(99.9)=7.45ms  
     http_req_duration..............: avg=2.36s    min=37.49ms  med=2.45s   max=4.76s    p(90)=3.11s    p(95)=3.3s     p(99.9)=4.11s   
       { expected_response:true }...: avg=2.36s    min=37.49ms  med=2.45s   max=4.76s    p(90)=3.11s    p(95)=3.3s     p(99.9)=4.11s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2575
     http_req_receiving.............: avg=105.35µs min=35.78µs  med=99.65µs max=797.97µs p(90)=145.77µs p(95)=162.88µs p(99.9)=359.68µs
     http_req_sending...............: avg=76.38µs  min=6.13µs   med=20.01µs max=18.32ms  p(90)=25.89µs  p(95)=31.06µs  p(99.9)=8.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.36s    min=37.39ms  med=2.45s   max=4.76s    p(90)=3.11s    p(95)=3.3s     p(99.9)=4.11s   
     http_reqs......................: 2575    20.293201/s
     iteration_duration.............: avg=2.45s    min=785.46ms med=2.48s   max=4.77s    p(90)=3.11s    p(95)=3.3s     p(99.9)=4.12s   
     iterations.....................: 2475    19.505115/s
     success_rate...................: 100.00% ✓ 2475      ✗ 0   
     vus............................: 48      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

