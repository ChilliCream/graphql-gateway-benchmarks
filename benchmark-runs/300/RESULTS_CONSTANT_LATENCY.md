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
| fusion-nightly | 16.6.0-p.6 | 1,886 | 1,931 | 1,880 | 0.9% |  |
| fusion-nightly-net11 | 16.6.0-p.6 | 1,865 | 1,922 | 1,857 | 1.2% |  |
| fusion | 16.5.1 | 1,853 | 1,903 | 1,843 | 1.1% |  |
| hive-router | v0.0.84 | 1,850 | 1,927 | 1,839 | 1.6% |  |
| fusion-nightly-fed | 16.6.0-p.6 | 1,776 | 1,817 | 1,760 | 1.0% |  |
| grafbase | 0.53.5 | 1,280 | 1,314 | 1,273 | 1.0% |  |
| cosmo | 0.334.0 | 1,222 | 1,268 | 1,213 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 556 | 576 | 554 | 1.3% |  |
| apollo-router | v2.16.1 | 411 | 428 | 399 | 2.4% |  |
| apollo-gateway | 2.14.3 | 264 | 268 | 263 | 0.6% |  |
| hive-gateway | 2.10.8 | 257 | 263 | 255 | 0.9% |  |
| feddi | 5ff8b6165878 | 19 | 20 | 19 | 2.6% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 689832      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.81µs   min=842ns   med=1.95µs  max=9.19ms   p(90)=3.55µs   p(95)=4.29µs  p(99.9)=30.84µs
     http_req_connecting............: avg=419ns    min=0s      med=0s      max=3.97ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.87ms  min=16.92ms med=25.29ms max=293.93ms p(90)=30.23ms  p(95)=31.98ms p(99.9)=49.42ms
       { expected_response:true }...: avg=25.87ms  min=16.92ms med=25.29ms max=293.93ms p(90)=30.23ms  p(95)=31.98ms p(99.9)=49.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230044
     http_req_receiving.............: avg=291.35µs min=49.21µs med=90.74µs max=73.2ms   p(90)=723.89µs p(95)=1.21ms  p(99.9)=8.17ms 
     http_req_sending...............: avg=32.38µs  min=4.45µs  med=8.43µs  max=206.71ms p(90)=19.08µs  p(95)=41.44µs p(99.9)=1.53ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.55ms  min=16.78ms med=24.99ms max=293.29ms p(90)=29.84ms  p(95)=31.57ms p(99.9)=48.02ms
     http_reqs......................: 230044  1886.815013/s
     iteration_duration.............: avg=26.08ms  min=17.25ms med=25.49ms max=316.11ms p(90)=30.43ms  p(95)=32.19ms p(99.9)=49.89ms
     iterations.....................: 229944  1885.994815/s
     success_rate...................: 100.00% ✓ 229944      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 682071      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=3.44µs   min=1µs     med=2.58µs  max=9.23ms   p(90)=4.24µs   p(95)=4.98µs  p(99.9)=36.38µs
     http_req_connecting............: avg=402ns    min=0s      med=0s      max=4.2ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.15ms  min=17.12ms med=25.56ms max=309.45ms p(90)=30.54ms  p(95)=32.43ms p(99.9)=51.78ms
       { expected_response:true }...: avg=26.15ms  min=17.12ms med=25.56ms max=309.45ms p(90)=30.54ms  p(95)=32.43ms p(99.9)=51.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227457
     http_req_receiving.............: avg=326.64µs min=50.51µs med=95.7µs  max=143.18ms p(90)=833.62µs p(95)=1.43ms  p(99.9)=8.84ms 
     http_req_sending...............: avg=36.83µs  min=4.74µs  med=9.81µs  max=150.55ms p(90)=19.83µs  p(95)=60.66µs p(99.9)=1.9ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.79ms  min=17.03ms med=25.21ms max=308.79ms p(90)=30.09ms  p(95)=31.92ms p(99.9)=49.72ms
     http_reqs......................: 227457  1865.681062/s
     iteration_duration.............: avg=26.38ms  min=17.32ms med=25.77ms max=327.92ms p(90)=30.75ms  p(95)=32.64ms p(99.9)=52.18ms
     iterations.....................: 227357  1864.860827/s
     success_rate...................: 100.00% ✓ 227357      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 677796      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=3.34µs   min=972ns   med=2.55µs  max=4.15ms   p(90)=4.14µs   p(95)=4.85µs  p(99.9)=39.44µs
     http_req_connecting............: avg=407ns    min=0s      med=0s      max=4.11ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.32ms  min=16.95ms med=25.69ms max=298.87ms p(90)=30.82ms  p(95)=32.78ms p(99.9)=51.37ms
       { expected_response:true }...: avg=26.32ms  min=16.95ms med=25.69ms max=298.87ms p(90)=30.82ms  p(95)=32.78ms p(99.9)=51.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226032
     http_req_receiving.............: avg=328.88µs min=51.56µs med=99.9µs  max=227.86ms p(90)=813.95µs p(95)=1.32ms  p(99.9)=9.32ms 
     http_req_sending...............: avg=37.2µs   min=4.67µs  med=9.8µs   max=187.39ms p(90)=19.2µs   p(95)=39.74µs p(99.9)=1.8ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.96ms  min=16.82ms med=25.34ms max=296.46ms p(90)=30.39ms  p(95)=32.29ms p(99.9)=49.73ms
     http_reqs......................: 226032  1853.565982/s
     iteration_duration.............: avg=26.54ms  min=17.22ms med=25.9ms  max=317.57ms p(90)=31.03ms  p(95)=32.99ms p(99.9)=51.76ms
     iterations.....................: 225932  1852.745937/s
     success_rate...................: 100.00% ✓ 225932      ✗ 0     
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

     checks.........................: 100.00% ✓ 676611      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=3.38µs  min=932ns   med=2.63µs  max=4.2ms    p(90)=4.26µs  p(95)=4.98µs   p(99.9)=35.79µs
     http_req_connecting............: avg=374ns   min=0s      med=0s      max=4.15ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.37ms min=18.16ms med=25.92ms max=298.95ms p(90)=30.1ms  p(95)=31.55ms  p(99.9)=48.55ms
       { expected_response:true }...: avg=26.37ms min=18.16ms med=25.92ms max=298.95ms p(90)=30.1ms  p(95)=31.55ms  p(99.9)=48.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 225637
     http_req_receiving.............: avg=79µs    min=26.41µs med=54.31µs max=108.75ms p(90)=96.16µs p(95)=122.08µs p(99.9)=2.13ms 
     http_req_sending...............: avg=32.51µs min=4.73µs  med=10.47µs max=135.32ms p(90)=18.21µs p(95)=26µs     p(99.9)=1.42ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.26ms min=18.02ms med=25.83ms max=289.56ms p(90)=29.99ms p(95)=31.42ms  p(99.9)=47.35ms
     http_reqs......................: 225637  1850.203484/s
     iteration_duration.............: avg=26.59ms min=18.58ms med=26.13ms max=308.24ms p(90)=30.31ms p(95)=31.76ms  p(99.9)=49.09ms
     iterations.....................: 225537  1849.383492/s
     success_rate...................: 100.00% ✓ 225537      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 649752      ✗ 0     
     data_received..................: 19 GB   156 MB/s
     data_sent......................: 260 MB  2.1 MB/s
     http_req_blocked...............: avg=3.06µs   min=892ns   med=2.12µs  max=6.77ms   p(90)=3.91µs   p(95)=4.62µs  p(99.9)=34.97µs
     http_req_connecting............: avg=472ns    min=0s      med=0s      max=4.13ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.47ms  min=18.21ms med=26.92ms max=312.66ms p(90)=32.15ms  p(95)=34.03ms p(99.9)=50.4ms 
       { expected_response:true }...: avg=27.47ms  min=18.21ms med=26.92ms max=312.66ms p(90)=32.15ms  p(95)=34.03ms p(99.9)=50.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 216684
     http_req_receiving.............: avg=303.86µs min=49.6µs  med=94.79µs max=77.25ms  p(90)=765.57µs p(95)=1.27ms  p(99.9)=7.99ms 
     http_req_sending...............: avg=31.08µs  min=4.63µs  med=8.76µs  max=126.74ms p(90)=19.16µs  p(95)=32.52µs p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.13ms  min=18.02ms med=26.6ms  max=272.98ms p(90)=31.75ms  p(95)=33.59ms p(99.9)=49.04ms
     http_reqs......................: 216684  1776.371175/s
     iteration_duration.............: avg=27.69ms  min=18.48ms med=27.13ms max=323.73ms p(90)=32.37ms  p(95)=34.23ms p(99.9)=50.93ms
     iterations.....................: 216584  1775.551377/s
     success_rate...................: 100.00% ✓ 216584      ✗ 0     
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

     checks.........................: 100.00% ✓ 468216      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 188 MB  1.5 MB/s
     http_req_blocked...............: avg=3.88µs  min=992ns   med=3.03µs  max=3.5ms    p(90)=5.29µs   p(95)=6.27µs   p(99.9)=45.45µs
     http_req_connecting............: avg=365ns   min=0s      med=0s      max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.16ms min=18.2ms  med=37.85ms max=318.88ms p(90)=44.99ms  p(95)=47.18ms  p(99.9)=63.87ms
       { expected_response:true }...: avg=38.16ms min=18.2ms  med=37.85ms max=318.88ms p(90)=44.99ms  p(95)=47.18ms  p(99.9)=63.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156172
     http_req_receiving.............: avg=96.3µs  min=27.81µs med=62.9µs  max=176.2ms  p(90)=134.29µs p(95)=185.73µs p(99.9)=2.33ms 
     http_req_sending...............: avg=36.96µs min=4.76µs  med=11.52µs max=175.29ms p(90)=25.55µs  p(95)=78.16µs  p(99.9)=2.04ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.03ms min=18.05ms med=37.73ms max=304.54ms p(90)=44.86ms  p(95)=47.03ms  p(99.9)=62.7ms 
     http_reqs......................: 156172  1280.077239/s
     iteration_duration.............: avg=38.43ms min=21.72ms med=38.09ms max=326.19ms p(90)=45.22ms  p(95)=47.4ms   p(99.9)=64.42ms
     iterations.....................: 156072  1279.257581/s
     success_rate...................: 100.00% ✓ 156072      ✗ 0     
     vus............................: 29      min=0         max=50  
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

     checks.........................: 100.00% ✓ 447132      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=4.04µs  min=1.12µs  med=3.06µs  max=4.15ms   p(90)=4.77µs   p(95)=5.51µs   p(99.9)=36.81µs
     http_req_connecting............: avg=653ns   min=0s      med=0s      max=3.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40ms    min=18.71ms med=39.38ms max=298.38ms p(90)=48.06ms  p(95)=50.83ms  p(99.9)=65.3ms 
       { expected_response:true }...: avg=40ms    min=18.71ms med=39.38ms max=298.38ms p(90)=48.06ms  p(95)=50.83ms  p(99.9)=65.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 149144
     http_req_receiving.............: avg=83.82µs min=26.55µs med=67.94µs max=138.17ms p(90)=110.19µs p(95)=128.82µs p(99.9)=1ms    
     http_req_sending...............: avg=28.66µs min=5.09µs  med=12.94µs max=110.51ms p(90)=20.72µs  p(95)=25.1µs   p(99.9)=1.08ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.89ms min=18.48ms med=39.28ms max=297.72ms p(90)=47.94ms  p(95)=50.71ms  p(99.9)=65.05ms
     http_reqs......................: 149144  1222.566858/s
     iteration_duration.............: avg=40.24ms min=22.21ms med=39.6ms  max=329.48ms p(90)=48.28ms  p(95)=51.04ms  p(99.9)=65.74ms
     iterations.....................: 149044  1221.747136/s
     success_rate...................: 100.00% ✓ 149044      ✗ 0     
     vus............................: 14      min=0         max=50  
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

     checks.........................: 100.00% ✓ 203739     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 82 MB   668 kB/s
     http_req_blocked...............: avg=4.33µs  min=1.01µs  med=2.76µs  max=3.96ms   p(90)=4.32µs   p(95)=4.94µs   p(99.9)=46.45µs 
     http_req_connecting............: avg=1.32µs  min=0s      med=0s      max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.01ms min=21.38ms med=84.73ms max=319.82ms p(90)=112.5ms  p(95)=122.13ms p(99.9)=216.59ms
       { expected_response:true }...: avg=88.01ms min=21.38ms med=84.73ms max=319.82ms p(90)=112.5ms  p(95)=122.13ms p(99.9)=216.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68013
     http_req_receiving.............: avg=83.49µs min=28.12µs med=75.11µs max=81.29ms  p(90)=111.79µs p(95)=125.25µs p(99.9)=643.8µs 
     http_req_sending...............: avg=24.36µs min=4.76µs  med=14.22µs max=103.43ms p(90)=20.9µs   p(95)=23.06µs  p(99.9)=619.4µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.9ms  min=21.24ms med=84.62ms max=319.1ms  p(90)=112.39ms p(95)=122.01ms p(99.9)=216.48ms
     http_reqs......................: 68013   556.307785/s
     iteration_duration.............: avg=88.36ms min=38.28ms med=84.98ms max=339ms    p(90)=112.75ms p(95)=122.4ms  p(99.9)=218.5ms 
     iterations.....................: 67913   555.489842/s
     success_rate...................: 100.00% ✓ 67913      ✗ 0    
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

     checks.........................: 100.00% ✓ 150576     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   494 kB/s
     http_req_blocked...............: avg=5.26µs   min=1.05µs  med=3.29µs   max=3.52ms   p(90)=4.78µs   p(95)=5.37µs   p(99.9)=156.77µs
     http_req_connecting............: avg=1.74µs   min=0s      med=0s       max=3.47ms   p(90)=0s       p(95)=0s       p(99.9)=46.66µs 
     http_req_duration..............: avg=119.09ms min=21.22ms med=117.08ms max=329.94ms p(90)=148.56ms p(95)=158.35ms p(99.9)=202.84ms
       { expected_response:true }...: avg=119.09ms min=21.22ms med=117.08ms max=329.94ms p(90)=148.56ms p(95)=158.35ms p(99.9)=202.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50292
     http_req_receiving.............: avg=88.59µs  min=29.47µs med=85.96µs  max=34.39ms  p(90)=116.32µs p(95)=127.88µs p(99.9)=475.24µs
     http_req_sending...............: avg=26.77µs  min=5.36µs  med=17.43µs  max=113.95ms p(90)=22.61µs  p(95)=24.58µs  p(99.9)=601.58µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.98ms min=21.11ms med=116.96ms max=329.14ms p(90)=148.43ms p(95)=158.24ms p(99.9)=202.72ms
     http_reqs......................: 50292   411.058976/s
     iteration_duration.............: avg=119.58ms min=29.1ms  med=117.39ms max=345.43ms p(90)=148.89ms p(95)=158.65ms p(99.9)=206.02ms
     iterations.....................: 50192   410.241632/s
     success_rate...................: 100.00% ✓ 50192      ✗ 0    
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

     checks.........................: 100.00% ✓ 96957      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   317 kB/s
     http_req_blocked...............: avg=6.63µs   min=1.21µs  med=3.25µs   max=3.76ms   p(90)=4.66µs   p(95)=5.23µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=3.11µs   min=0s      med=0s       max=3.72ms   p(90)=0s       p(95)=0s       p(99.9)=1.74ms  
     http_req_duration..............: avg=184.93ms min=23.43ms med=185.02ms max=399.01ms p(90)=197.4ms  p(95)=201.89ms p(99.9)=271.13ms
       { expected_response:true }...: avg=184.93ms min=23.43ms med=185.02ms max=399.01ms p(90)=197.4ms  p(95)=201.89ms p(99.9)=271.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32419
     http_req_receiving.............: avg=100.61µs min=30.03µs med=89.26µs  max=134.82ms p(90)=119.94µs p(95)=131.93µs p(99.9)=516.59µs
     http_req_sending...............: avg=33.88µs  min=5.36µs  med=18.33µs  max=141.09ms p(90)=23.24µs  p(95)=25.19µs  p(99.9)=498.9µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.8ms  min=23.26ms med=184.92ms max=395.04ms p(90)=197.28ms p(95)=201.75ms p(99.9)=270.46ms
     http_reqs......................: 32419   264.344383/s
     iteration_duration.............: avg=185.74ms min=44.06ms med=185.55ms max=408.35ms p(90)=197.69ms p(95)=202.21ms p(99.9)=273.46ms
     iterations.....................: 32319   263.528983/s
     success_rate...................: 100.00% ✓ 32319      ✗ 0    
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

     checks.........................: 100.00% ✓ 93972      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   309 kB/s
     http_req_blocked...............: avg=7.29µs   min=1.19µs  med=3.88µs   max=4.28ms   p(90)=5.36µs   p(95)=6.01µs   p(99.9)=1.44ms  
     http_req_connecting............: avg=3.1µs    min=0s      med=0s       max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=190.77ms min=18.41ms med=177.62ms max=688.24ms p(90)=227.48ms p(95)=259.36ms p(99.9)=574.92ms
       { expected_response:true }...: avg=190.77ms min=18.41ms med=177.62ms max=688.24ms p(90)=227.48ms p(95)=259.36ms p(99.9)=574.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31424
     http_req_receiving.............: avg=98.92µs  min=35.88µs med=91.38µs  max=69.66ms  p(90)=123.67µs p(95)=136.6µs  p(99.9)=618.27µs
     http_req_sending...............: avg=34µs     min=6.02µs  med=19.19µs  max=92.47ms  p(90)=24.34µs  p(95)=26.41µs  p(99.9)=649.25µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.64ms min=18.23ms med=177.5ms  max=688.11ms p(90)=227.35ms p(95)=259.22ms p(99.9)=574.79ms
     http_reqs......................: 31424   257.371822/s
     iteration_duration.............: avg=191.63ms min=39.78ms med=178.11ms max=688.51ms p(90)=227.82ms p(95)=261.02ms p(99.9)=575.25ms
     iterations.....................: 31324   256.552792/s
     success_rate...................: 100.00% ✓ 31324      ✗ 0    
     vus............................: 46      min=0        max=50 
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

     checks.........................: 100.00% ✓ 7134      ✗ 0   
     data_received..................: 237 MB  1.9 MB/s
     data_sent......................: 3.0 MB  24 kB/s
     http_req_blocked...............: avg=116.09µs min=1.34µs   med=3.82µs  max=9.27ms  p(90)=5.61µs   p(95)=6.55µs  p(99.9)=8.44ms  
     http_req_connecting............: avg=110.53µs min=0s       med=0s      max=9.22ms  p(90)=0s       p(95)=0s      p(99.9)=8.39ms  
     http_req_duration..............: avg=2.43s    min=38.51ms  med=2.51s   max=4.03s   p(90)=3.14s    p(95)=3.3s    p(99.9)=3.82s   
       { expected_response:true }...: avg=2.43s    min=38.51ms  med=2.51s   max=4.03s   p(90)=3.14s    p(95)=3.3s    p(99.9)=3.82s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2478
     http_req_receiving.............: avg=112.13µs min=35.25µs  med=99.95µs max=11.39ms p(90)=138.73µs p(95)=156.5µs p(99.9)=777.79µs
     http_req_sending...............: avg=73.69µs  min=6.38µs   med=20.06µs max=27.32ms p(90)=25.99µs  p(95)=32.06µs p(99.9)=4.55ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=2.43s    min=38.31ms  med=2.51s   max=4.03s   p(90)=3.14s    p(95)=3.3s    p(99.9)=3.82s   
     http_reqs......................: 2478    19.605592/s
     iteration_duration.............: avg=2.53s    min=477.96ms med=2.54s   max=4.03s   p(90)=3.15s    p(95)=3.31s   p(99.9)=3.84s   
     iterations.....................: 2378    18.814405/s
     success_rate...................: 100.00% ✓ 2378      ✗ 0   
     vus............................: 28      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

