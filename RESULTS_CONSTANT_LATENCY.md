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
| fusion | 16.6.2 | 1,885 | 1,929 | 1,882 | 0.9% |  |
| fusion-nightly | 16.7.0-p.2 | 1,877 | 1,928 | 1,871 | 1.0% |  |
| hive-router | v0.0.84 | 1,857 | 1,915 | 1,846 | 1.3% |  |
| fusion-nightly-net11 | 16.7.0-p.2 | 1,852 | 1,907 | 1,845 | 1.2% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 1,796 | 1,859 | 1,785 | 1.3% |  |
| grafbase | 0.53.5 | 1,306 | 1,341 | 1,301 | 1.1% |  |
| cosmo | 0.334.0 | 1,153 | 1,204 | 1,147 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 573 | 590 | 568 | 1.2% |  |
| apollo-router | v2.16.1 | 397 | 417 | 393 | 2.1% |  |
| apollo-gateway | 2.14.3 | 265 | 269 | 263 | 0.7% |  |
| hive-gateway | 2.10.8 | 263 | 271 | 262 | 1.2% |  |
| feddi | 5ff8b6165878 | 17 | 17 | 16 | 2.0% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 689412      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.94µs   min=931ns   med=2.02µs  max=6.07ms   p(90)=3.77µs   p(95)=4.49µs  p(99.9)=30.47µs
     http_req_connecting............: avg=458ns    min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.88ms  min=17.1ms  med=25.31ms max=276.36ms p(90)=30.27ms  p(95)=32.02ms p(99.9)=48.51ms
       { expected_response:true }...: avg=25.88ms  min=17.1ms  med=25.31ms max=276.36ms p(90)=30.27ms  p(95)=32.02ms p(99.9)=48.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229904
     http_req_receiving.............: avg=303.16µs min=50.12µs med=91.35µs max=136.84ms p(90)=776.59µs p(95)=1.27ms  p(99.9)=7.53ms 
     http_req_sending...............: avg=29.58µs  min=4.68µs  med=8.47µs  max=141.87ms p(90)=18.53µs  p(95)=29.68µs p(99.9)=1.51ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.55ms  min=16.98ms med=24.99ms max=275.77ms p(90)=29.85ms  p(95)=31.59ms p(99.9)=46.67ms
     http_reqs......................: 229904  1885.742626/s
     iteration_duration.............: avg=26.09ms  min=17.31ms med=25.51ms max=307ms    p(90)=30.47ms  p(95)=32.22ms p(99.9)=49.06ms
     iterations.....................: 229804  1884.922395/s
     success_rate...................: 100.00% ✓ 229804      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 686523      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.81µs   min=872ns   med=1.97µs  max=8.21ms   p(90)=3.52µs   p(95)=4.21µs  p(99.9)=26.6µs 
     http_req_connecting............: avg=414ns    min=0s      med=0s      max=3.54ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.99ms  min=17.27ms med=25.41ms max=295.35ms p(90)=30.42ms  p(95)=32.22ms p(99.9)=49.03ms
       { expected_response:true }...: avg=25.99ms  min=17.27ms med=25.41ms max=295.35ms p(90)=30.42ms  p(95)=32.22ms p(99.9)=49.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228941
     http_req_receiving.............: avg=320.06µs min=49.54µs med=94.43µs max=146.65ms p(90)=820.63µs p(95)=1.31ms  p(99.9)=8.49ms 
     http_req_sending...............: avg=30.98µs  min=4.51µs  med=8.45µs  max=161.68ms p(90)=17.52µs  p(95)=27.23µs p(99.9)=1.5ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.64ms  min=17.14ms med=25.09ms max=294.91ms p(90)=29.99ms  p(95)=31.75ms p(99.9)=47.44ms
     http_reqs......................: 228941  1877.465985/s
     iteration_duration.............: avg=26.21ms  min=17.5ms  med=25.62ms max=306.86ms p(90)=30.62ms  p(95)=32.42ms p(99.9)=49.4ms 
     iterations.....................: 228841  1876.64592/s
     success_rate...................: 100.00% ✓ 228841      ✗ 0     
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

     checks.........................: 100.00% ✓ 679470      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=3µs     min=921ns   med=2.12µs  max=3.84ms   p(90)=3.9µs   p(95)=4.63µs  p(99.9)=31.69µs
     http_req_connecting............: avg=470ns   min=0s      med=0s      max=3.8ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.27ms min=18.09ms med=25.84ms max=296.68ms p(90)=29.96ms p(95)=31.34ms p(99.9)=46.51ms
       { expected_response:true }...: avg=26.27ms min=18.09ms med=25.84ms max=296.68ms p(90)=29.96ms p(95)=31.34ms p(99.9)=46.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226590
     http_req_receiving.............: avg=71.18µs min=24.58µs med=49.74µs max=47.89ms  p(90)=93.51µs p(95)=119µs   p(99.9)=1.48ms 
     http_req_sending...............: avg=29.43µs min=4.19µs  med=9.07µs  max=95.97ms  p(90)=17.98µs p(95)=25.34µs p(99.9)=1.33ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.17ms min=18ms    med=25.75ms max=296.24ms p(90)=29.86ms p(95)=31.22ms p(99.9)=45.16ms
     http_reqs......................: 226590  1857.966222/s
     iteration_duration.............: avg=26.48ms min=18.43ms med=26.04ms max=306.91ms p(90)=30.16ms p(95)=31.54ms p(99.9)=46.83ms
     iterations.....................: 226490  1857.146253/s
     success_rate...................: 100.00% ✓ 226490      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 677166      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=3.4µs    min=1.02µs  med=2.58µs  max=4.2ms    p(90)=4.27µs   p(95)=5.01µs  p(99.9)=34.76µs
     http_req_connecting............: avg=441ns    min=0s      med=0s      max=4.16ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.35ms  min=16.8ms  med=25.75ms max=321.67ms p(90)=30.78ms  p(95)=32.65ms p(99.9)=51.18ms
       { expected_response:true }...: avg=26.35ms  min=16.8ms  med=25.75ms max=321.67ms p(90)=30.78ms  p(95)=32.65ms p(99.9)=51.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 225822
     http_req_receiving.............: avg=310.54µs min=51.75µs med=93.85µs max=278.84ms p(90)=673.75µs p(95)=1.21ms  p(99.9)=8.93ms 
     http_req_sending...............: avg=33.64µs  min=4.69µs  med=9.76µs  max=26.36ms  p(90)=19.47µs  p(95)=43.19µs p(99.9)=1.78ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26ms     min=16.71ms med=25.45ms max=62.06ms  p(90)=30.4ms   p(95)=32.23ms p(99.9)=48.77ms
     http_reqs......................: 225822  1852.112118/s
     iteration_duration.............: avg=26.57ms  min=16.98ms med=25.96ms max=335.64ms p(90)=30.98ms  p(95)=32.86ms p(99.9)=51.66ms
     iterations.....................: 225722  1851.291953/s
     success_rate...................: 100.00% ✓ 225722      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 656988      ✗ 0     
     data_received..................: 19 GB   157 MB/s
     data_sent......................: 263 MB  2.2 MB/s
     http_req_blocked...............: avg=3.54µs   min=1.03µs  med=2.67µs  max=6.27ms   p(90)=4.37µs   p(95)=5.13µs  p(99.9)=36.15µs
     http_req_connecting............: avg=458ns    min=0s      med=0s      max=4.47ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.16ms  min=17.92ms med=26.55ms max=307.45ms p(90)=31.82ms  p(95)=33.74ms p(99.9)=51.19ms
       { expected_response:true }...: avg=27.16ms  min=17.92ms med=26.55ms max=307.45ms p(90)=31.82ms  p(95)=33.74ms p(99.9)=51.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 219096
     http_req_receiving.............: avg=313.24µs min=51.56µs med=99.33µs max=93.15ms  p(90)=776.45µs p(95)=1.3ms   p(99.9)=8.68ms 
     http_req_sending...............: avg=36.21µs  min=4.73µs  med=10.22µs max=151.17ms p(90)=20.31µs  p(95)=40.46µs p(99.9)=1.77ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.81ms  min=17.73ms med=26.22ms max=300.87ms p(90)=31.42ms  p(95)=33.29ms p(99.9)=50.12ms
     http_reqs......................: 219096  1796.032871/s
     iteration_duration.............: avg=27.39ms  min=18.08ms med=26.77ms max=317.23ms p(90)=32.04ms  p(95)=33.96ms p(99.9)=51.67ms
     iterations.....................: 218996  1795.213124/s
     success_rate...................: 100.00% ✓ 218996      ✗ 0     
     vus............................: 12      min=0         max=50  
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

     checks.........................: 100.00% ✓ 477819      ✗ 0     
     data_received..................: 14 GB   114 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=4.12µs  min=1.02µs  med=3µs     max=3.66ms   p(90)=5.37µs   p(95)=6.39µs   p(99.9)=47.42µs
     http_req_connecting............: avg=575ns   min=0s      med=0s      max=3.62ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.39ms min=18.32ms med=37.03ms max=306.68ms p(90)=44.11ms  p(95)=46.2ms   p(99.9)=66.91ms
       { expected_response:true }...: avg=37.39ms min=18.32ms med=37.03ms max=306.68ms p(90)=44.11ms  p(95)=46.2ms   p(99.9)=66.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159373
     http_req_receiving.............: avg=94.88µs min=26.95µs med=62.4µs  max=107.08ms p(90)=133.81µs p(95)=184.41µs p(99.9)=2.55ms 
     http_req_sending...............: avg=38.08µs min=4.67µs  med=11.35µs max=99.84ms  p(90)=25.7µs   p(95)=68.74µs  p(99.9)=2.28ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.26ms min=18.22ms med=36.91ms max=306.2ms  p(90)=43.97ms  p(95)=46.05ms  p(99.9)=66.34ms
     http_reqs......................: 159373  1306.325435/s
     iteration_duration.............: avg=37.66ms min=21.38ms med=37.28ms max=320.45ms p(90)=44.34ms  p(95)=46.43ms  p(99.9)=67.51ms
     iterations.....................: 159273  1305.505769/s
     success_rate...................: 100.00% ✓ 159273      ✗ 0     
     vus............................: 35      min=0         max=50  
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

     checks.........................: 100.00% ✓ 421806      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.92µs  min=1.15µs  med=2.92µs  max=4.09ms   p(90)=4.57µs   p(95)=5.31µs   p(99.9)=36.51µs 
     http_req_connecting............: avg=685ns   min=0s      med=0s      max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.42ms min=18.89ms med=41.77ms max=306.3ms  p(90)=51.34ms  p(95)=54.44ms  p(99.9)=70.7ms  
       { expected_response:true }...: avg=42.42ms min=18.89ms med=41.77ms max=306.3ms  p(90)=51.34ms  p(95)=54.44ms  p(99.9)=70.7ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 140702
     http_req_receiving.............: avg=85.47µs min=28.55µs med=72.16µs max=77.91ms  p(90)=114.39µs p(95)=133.83µs p(99.9)=952.98µs
     http_req_sending...............: avg=26.56µs min=5.38µs  med=12.81µs max=123.84ms p(90)=19.83µs  p(95)=23.8µs   p(99.9)=914.14µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=42.31ms min=18.79ms med=41.66ms max=306.06ms p(90)=51.23ms  p(95)=54.32ms  p(99.9)=70.46ms 
     http_reqs......................: 140702  1153.260813/s
     iteration_duration.............: avg=42.66ms min=22.97ms med=41.99ms max=325.7ms  p(90)=51.55ms  p(95)=54.66ms  p(99.9)=71.18ms 
     iterations.....................: 140602  1152.441165/s
     success_rate...................: 100.00% ✓ 140602      ✗ 0     
     vus............................: 36      min=0         max=50  
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

     checks.........................: 100.00% ✓ 209886     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   689 kB/s
     http_req_blocked...............: avg=5.06µs   min=1.21µs  med=3.44µs  max=3.87ms   p(90)=5.13µs   p(95)=5.84µs   p(99.9)=51.89µs 
     http_req_connecting............: avg=1.33µs   min=0s      med=0s      max=3.83ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.41ms  min=20.45ms med=86.63ms max=312.84ms p(90)=108.94ms p(95)=117.12ms p(99.9)=202.53ms
       { expected_response:true }...: avg=85.41ms  min=20.45ms med=86.63ms max=312.84ms p(90)=108.94ms p(95)=117.12ms p(99.9)=202.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70062
     http_req_receiving.............: avg=117.63µs min=31.28µs med=76.33µs max=198.42ms p(90)=113.96µs p(95)=128.4µs  p(99.9)=703.86µs
     http_req_sending...............: avg=25.94µs  min=5.37µs  med=15.3µs  max=128.75ms p(90)=22.57µs  p(95)=25.07µs  p(99.9)=683.23µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.26ms  min=20.36ms med=86.51ms max=312.21ms p(90)=108.82ms p(95)=116.95ms p(99.9)=200.29ms
     http_reqs......................: 70062   573.238651/s
     iteration_duration.............: avg=85.76ms  min=35.81ms med=86.9ms  max=339.28ms p(90)=109.21ms p(95)=117.41ms p(99.9)=204.62ms
     iterations.....................: 69962   572.420463/s
     success_rate...................: 100.00% ✓ 69962      ✗ 0    
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

     checks.........................: 100.00% ✓ 145644     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 58 MB   478 kB/s
     http_req_blocked...............: avg=4.07µs   min=1.12µs  med=3.07µs   max=2.14ms   p(90)=4.51µs   p(95)=5.1µs    p(99.9)=91.85µs 
     http_req_connecting............: avg=806ns    min=0s      med=0s       max=2.09ms   p(90)=0s       p(95)=0s       p(99.9)=56.64µs 
     http_req_duration..............: avg=123.14ms min=21.21ms med=121.04ms max=350.62ms p(90)=154.02ms p(95)=164.3ms  p(99.9)=210.17ms
       { expected_response:true }...: avg=123.14ms min=21.21ms med=121.04ms max=350.62ms p(90)=154.02ms p(95)=164.3ms  p(99.9)=210.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48648
     http_req_receiving.............: avg=86.61µs  min=31.32µs med=82.63µs  max=54.83ms  p(90)=113.87µs p(95)=126.34µs p(99.9)=554.33µs
     http_req_sending...............: avg=25.45µs  min=5.25µs  med=16.28µs  max=77.35ms  p(90)=21.63µs  p(95)=23.52µs  p(99.9)=486.31µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.02ms min=21.07ms med=120.94ms max=350.27ms p(90)=153.9ms  p(95)=164.17ms p(99.9)=209.95ms
     http_reqs......................: 48648   397.659502/s
     iteration_duration.............: avg=123.62ms min=40.97ms med=121.37ms max=359.2ms  p(90)=154.34ms p(95)=164.62ms p(99.9)=211.71ms
     iterations.....................: 48548   396.84208/s
     success_rate...................: 100.00% ✓ 48548      ✗ 0    
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

     checks.........................: 100.00% ✓ 97578      ✗ 0    
     data_received..................: 2.9 GB  23 MB/s
     data_sent......................: 39 MB   319 kB/s
     http_req_blocked...............: avg=7.08µs   min=1.48µs  med=3.78µs   max=3.45ms   p(90)=5.32µs   p(95)=5.93µs   p(99.9)=1.57ms  
     http_req_connecting............: avg=2.97µs   min=0s      med=0s       max=3.41ms   p(90)=0s       p(95)=0s       p(99.9)=1.54ms  
     http_req_duration..............: avg=183.77ms min=23.28ms med=183.19ms max=365.28ms p(90)=211.52ms p(95)=217.09ms p(99.9)=281.81ms
       { expected_response:true }...: avg=183.77ms min=23.28ms med=183.19ms max=365.28ms p(90)=211.52ms p(95)=217.09ms p(99.9)=281.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32626
     http_req_receiving.............: avg=95.73µs  min=34.56µs med=90.33µs  max=22.45ms  p(90)=122µs    p(95)=135.21µs p(99.9)=559.15µs
     http_req_sending...............: avg=27.5µs   min=6.7µs   med=18.62µs  max=66.45ms  p(90)=23.75µs  p(95)=25.67µs  p(99.9)=567.9µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.65ms min=23.18ms med=183.07ms max=364.59ms p(90)=211.41ms p(95)=216.97ms p(99.9)=281.68ms
     http_reqs......................: 32626   265.960063/s
     iteration_duration.............: avg=184.57ms min=55.49ms med=183.55ms max=377.88ms p(90)=211.83ms p(95)=217.44ms p(99.9)=283.13ms
     iterations.....................: 32526   265.144885/s
     success_rate...................: 100.00% ✓ 32526      ✗ 0    
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

     checks.........................: 100.00% ✓ 96159      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   316 kB/s
     http_req_blocked...............: avg=7.36µs   min=1.53µs  med=3.88µs   max=3.92ms   p(90)=5.41µs   p(95)=6.05µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=3.18µs   min=0s      med=0s       max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=186.46ms min=18.01ms med=169.34ms max=626.27ms p(90)=236.92ms p(95)=270.37ms p(99.9)=570.01ms
       { expected_response:true }...: avg=186.46ms min=18.01ms med=169.34ms max=626.27ms p(90)=236.92ms p(95)=270.37ms p(99.9)=570.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32153
     http_req_receiving.............: avg=101.21µs min=36µs    med=93.86µs  max=73.87ms  p(90)=126.31µs p(95)=141.07µs p(99.9)=815.07µs
     http_req_sending...............: avg=32.19µs  min=7.15µs  med=19.51µs  max=53.45ms  p(90)=24.67µs  p(95)=26.88µs  p(99.9)=560.83µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.32ms min=17.83ms med=169.21ms max=626.18ms p(90)=236.79ms p(95)=270.21ms p(99.9)=569.91ms
     http_reqs......................: 32153   263.476542/s
     iteration_duration.............: avg=187.28ms min=44.07ms med=169.76ms max=626.54ms p(90)=237.29ms p(95)=271.78ms p(99.9)=570.27ms
     iterations.....................: 32053   262.657095/s
     success_rate...................: 100.00% ✓ 32053      ✗ 0    
     vus............................: 22      min=0        max=50 
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

     checks.........................: 100.00% ✓ 6276      ✗ 0   
     data_received..................: 210 MB  1.6 MB/s
     data_sent......................: 2.6 MB  21 kB/s
     http_req_blocked...............: avg=137.05µs min=1.32µs   med=3.15µs  max=8.74ms   p(90)=4.79µs   p(95)=5.74µs   p(99.9)=8ms     
     http_req_connecting............: avg=128.47µs min=0s       med=0s      max=8.68ms   p(90)=0s       p(95)=0s       p(99.9)=7.85ms  
     http_req_duration..............: avg=2.77s    min=38.39ms  med=2.9s    max=4.51s    p(90)=3.54s    p(95)=3.78s    p(99.9)=4.41s   
       { expected_response:true }...: avg=2.77s    min=38.39ms  med=2.9s    max=4.51s    p(90)=3.54s    p(95)=3.78s    p(99.9)=4.41s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2192
     http_req_receiving.............: avg=99.18µs  min=34.4µs   med=94.49µs max=688.36µs p(90)=138.01µs p(95)=155.85µs p(99.9)=355.02µs
     http_req_sending...............: avg=66.16µs  min=6.21µs   med=18.49µs max=21.9ms   p(90)=23.7µs   p(95)=28.51µs  p(99.9)=12.14ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.77s    min=38.28ms  med=2.9s    max=4.51s    p(90)=3.54s    p(95)=3.78s    p(99.9)=4.41s   
     http_reqs......................: 2192    17.160431/s
     iteration_duration.............: avg=2.9s     min=498.12ms med=2.93s   max=4.51s    p(90)=3.55s    p(95)=3.79s    p(99.9)=4.41s   
     iterations.....................: 2092    16.377565/s
     success_rate...................: 100.00% ✓ 2092      ✗ 0   
     vus............................: 29      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

