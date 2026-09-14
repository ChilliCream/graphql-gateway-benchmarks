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
| fusion | 16.6.6 | 1,894 | 1,942 | 1,889 | 1.0% |  |
| fusion-nightly-net11 | 16.7.0-p.6 | 1,869 | 1,938 | 1,861 | 1.6% |  |
| fusion-nightly | 16.7.0-p.6 | 1,859 | 1,915 | 1,852 | 1.1% |  |
| hive-router | v0.0.84 | 1,833 | 1,902 | 1,821 | 1.4% |  |
| fusion-nightly-fed | 16.7.0-p.6 | 1,812 | 1,872 | 1,803 | 1.2% |  |
| grafbase | 0.53.5 | 1,287 | 1,313 | 1,274 | 1.0% |  |
| cosmo | 0.334.0 | 1,203 | 1,248 | 1,199 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 569 | 586 | 568 | 1.1% |  |
| apollo-router | v2.16.1 | 428 | 446 | 426 | 1.8% |  |
| apollo-gateway | 2.14.3 | 263 | 266 | 262 | 0.5% |  |
| hive-gateway | 2.10.8 | 255 | 265 | 254 | 1.5% |  |
| feddi | 5ff8b6165878 | 19 | 19 | 18 | 2.8% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 692511      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=2.98µs   min=852ns   med=2µs     max=9.29ms   p(90)=3.85µs   p(95)=4.58µs  p(99.9)=31.89µs
     http_req_connecting............: avg=378ns    min=0s      med=0s      max=3.46ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.77ms  min=17.63ms med=25.18ms max=312.82ms p(90)=30.12ms  p(95)=31.96ms p(99.9)=48.35ms
       { expected_response:true }...: avg=25.77ms  min=17.63ms med=25.18ms max=312.82ms p(90)=30.12ms  p(95)=31.96ms p(99.9)=48.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230937
     http_req_receiving.............: avg=290.87µs min=48.4µs  med=93.65µs max=26.79ms  p(90)=724.32µs p(95)=1.2ms   p(99.9)=7.25ms 
     http_req_sending...............: avg=30.81µs  min=4.07µs  med=8.59µs  max=173.12ms p(90)=18.83µs  p(95)=29.55µs p(99.9)=1.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.45ms  min=17.36ms med=24.87ms max=312.08ms p(90)=29.74ms  p(95)=31.53ms p(99.9)=46.98ms
     http_reqs......................: 230937  1894.007176/s
     iteration_duration.............: avg=25.98ms  min=17.8ms  med=25.39ms max=332.99ms p(90)=30.33ms  p(95)=32.16ms p(99.9)=48.91ms
     iterations.....................: 230837  1893.187036/s
     success_rate...................: 100.00% ✓ 230837      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 683343      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=2.78µs   min=852ns   med=1.93µs  max=3.91ms   p(90)=3.56µs  p(95)=4.26µs  p(99.9)=27.33µs
     http_req_connecting............: avg=437ns    min=0s      med=0s      max=3.86ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.11ms  min=17.4ms  med=25.55ms max=295.85ms p(90)=30.29ms p(95)=32.08ms p(99.9)=49.97ms
       { expected_response:true }...: avg=26.11ms  min=17.4ms  med=25.55ms max=295.85ms p(90)=30.29ms p(95)=32.08ms p(99.9)=49.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227881
     http_req_receiving.............: avg=409.08µs min=50.71µs med=93.1µs  max=43.08ms  p(90)=1.18ms  p(95)=1.89ms  p(99.9)=10.46ms
     http_req_sending...............: avg=32µs     min=4.53µs  med=8.29µs  max=120.97ms p(90)=18.08µs p(95)=29.71µs p(99.9)=1.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.67ms  min=17.29ms med=25.14ms max=295.33ms p(90)=29.68ms p(95)=31.39ms p(99.9)=48.08ms
     http_reqs......................: 227881  1869.029469/s
     iteration_duration.............: avg=26.33ms  min=17.57ms med=25.75ms max=307.12ms p(90)=30.49ms p(95)=32.28ms p(99.9)=50.27ms
     iterations.....................: 227781  1868.209291/s
     success_rate...................: 100.00% ✓ 227781      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 679890      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=3.68µs  min=1µs     med=2.58µs  max=65.62ms  p(90)=4.24µs   p(95)=4.98µs  p(99.9)=36.39µs
     http_req_connecting............: avg=418ns   min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.23ms min=17.29ms med=25.6ms  max=293.6ms  p(90)=30.76ms  p(95)=32.69ms p(99.9)=51.5ms 
       { expected_response:true }...: avg=26.23ms min=17.29ms med=25.6ms  max=293.6ms  p(90)=30.76ms  p(95)=32.69ms p(99.9)=51.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 226730
     http_req_receiving.............: avg=327.7µs min=51.89µs med=99.47µs max=63.6ms   p(90)=829.93µs p(95)=1.35ms  p(99.9)=8.76ms 
     http_req_sending...............: avg=32.3µs  min=4.54µs  med=9.75µs  max=52.74ms  p(90)=19.38µs  p(95)=43.48µs p(99.9)=1.61ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.87ms min=17.2ms  med=25.25ms max=293.32ms p(90)=30.34ms  p(95)=32.22ms p(99.9)=49.55ms
     http_reqs......................: 226730  1859.375087/s
     iteration_duration.............: avg=26.46ms min=17.45ms med=25.81ms max=319.88ms p(90)=30.97ms  p(95)=32.9ms  p(99.9)=52.09ms
     iterations.....................: 226630  1858.555003/s
     success_rate...................: 100.00% ✓ 226630      ✗ 0     
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

     checks.........................: 100.00% ✓ 670566      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=2.85µs  min=942ns   med=2.08µs  max=4.03ms   p(90)=3.63µs  p(95)=4.34µs   p(99.9)=33.99µs
     http_req_connecting............: avg=407ns   min=0s      med=0s      max=3.99ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.63ms min=18.05ms med=26.21ms max=308.55ms p(90)=30.34ms p(95)=31.74ms  p(99.9)=46.82ms
       { expected_response:true }...: avg=26.63ms min=18.05ms med=26.21ms max=308.55ms p(90)=30.34ms p(95)=31.74ms  p(99.9)=46.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223622
     http_req_receiving.............: avg=71.77µs min=25.75µs med=50.1µs  max=25.23ms  p(90)=88.86µs p(95)=111.93µs p(99.9)=1.81ms 
     http_req_sending...............: avg=27.73µs min=4.45µs  med=8.89µs  max=123.67ms p(90)=15.97µs p(95)=22.39µs  p(99.9)=1.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.53ms min=17.95ms med=26.13ms max=307.96ms p(90)=30.24ms p(95)=31.61ms  p(99.9)=44.86ms
     http_reqs......................: 223622  1833.848927/s
     iteration_duration.............: avg=26.83ms min=18.75ms med=26.4ms  max=314.74ms p(90)=30.54ms p(95)=31.93ms  p(99.9)=47.14ms
     iterations.....................: 223522  1833.028861/s
     success_rate...................: 100.00% ✓ 223522      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 662997      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 266 MB  2.2 MB/s
     http_req_blocked...............: avg=2.82µs   min=902ns   med=1.98µs  max=4.08ms   p(90)=3.72µs   p(95)=4.47µs  p(99.9)=29.06µs
     http_req_connecting............: avg=401ns    min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.92ms  min=17.82ms med=26.34ms max=312.28ms p(90)=31.47ms  p(95)=33.33ms p(99.9)=50.11ms
       { expected_response:true }...: avg=26.92ms  min=17.82ms med=26.34ms max=312.28ms p(90)=31.47ms  p(95)=33.33ms p(99.9)=50.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 221099
     http_req_receiving.............: avg=304.37µs min=51.16µs med=95.38µs max=140.41ms p(90)=760.93µs p(95)=1.26ms  p(99.9)=8.16ms 
     http_req_sending...............: avg=31.82µs  min=4.34µs  med=8.65µs  max=183.12ms p(90)=19.36µs  p(95)=33.74µs p(99.9)=1.55ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.58ms  min=17.71ms med=26.02ms max=297.1ms  p(90)=31.07ms  p(95)=32.88ms p(99.9)=48.81ms
     http_reqs......................: 221099  1812.701416/s
     iteration_duration.............: avg=27.14ms  min=18.02ms med=26.54ms max=320.83ms p(90)=31.68ms  p(95)=33.54ms p(99.9)=50.39ms
     iterations.....................: 220999  1811.881557/s
     success_rate...................: 100.00% ✓ 220999      ✗ 0     
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

     checks.........................: 100.00% ✓ 470847      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 189 MB  1.5 MB/s
     http_req_blocked...............: avg=3.37µs  min=882ns   med=2.22µs  max=4.19ms   p(90)=4.5µs   p(95)=5.47µs   p(99.9)=38.19µs
     http_req_connecting............: avg=584ns   min=0s      med=0s      max=4.15ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.96ms min=17.61ms med=37.69ms max=311.24ms p(90)=44.57ms p(95)=46.63ms  p(99.9)=61.25ms
       { expected_response:true }...: avg=37.96ms min=17.61ms med=37.69ms max=311.24ms p(90)=44.57ms p(95)=46.63ms  p(99.9)=61.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157049
     http_req_receiving.............: avg=84.18µs min=27.19µs med=54.8µs  max=139.27ms p(90)=122.2µs p(95)=167.22µs p(99.9)=2ms    
     http_req_sending...............: avg=31.38µs min=4.7µs   med=9.34µs  max=39.47ms  p(90)=22.96µs p(95)=42.2µs   p(99.9)=1.87ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.85ms min=17.46ms med=37.59ms max=310.64ms p(90)=44.45ms p(95)=46.48ms  p(99.9)=60.65ms
     http_reqs......................: 157049  1287.416424/s
     iteration_duration.............: avg=38.22ms min=21.65ms med=37.93ms max=327.25ms p(90)=44.79ms p(95)=46.85ms  p(99.9)=61.54ms
     iterations.....................: 156949  1286.596669/s
     success_rate...................: 100.00% ✓ 156949      ✗ 0     
     vus............................: 1       min=0         max=50  
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

     checks.........................: 100.00% ✓ 440088      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 176 MB  1.4 MB/s
     http_req_blocked...............: avg=3.49µs  min=1.02µs  med=2.44µs  max=4.28ms   p(90)=4.16µs   p(95)=4.9µs    p(99.9)=37.72µs 
     http_req_connecting............: avg=686ns   min=0s      med=0s      max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.66ms min=18.63ms med=40.02ms max=309.49ms p(90)=48.88ms  p(95)=51.76ms  p(99.9)=66.57ms 
       { expected_response:true }...: avg=40.66ms min=18.63ms med=40.02ms max=309.49ms p(90)=48.88ms  p(95)=51.76ms  p(99.9)=66.57ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 146796
     http_req_receiving.............: avg=77.58µs min=25.67µs med=63.86µs max=41.6ms   p(90)=105.64µs p(95)=123.01µs p(99.9)=949.63µs
     http_req_sending...............: avg=25.95µs min=4.77µs  med=11.4µs  max=206.5ms  p(90)=19.27µs  p(95)=23.02µs  p(99.9)=955.78µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.55ms min=18.48ms med=39.92ms max=296.64ms p(90)=48.78ms  p(95)=51.65ms  p(99.9)=66.21ms 
     http_reqs......................: 146796  1203.132081/s
     iteration_duration.............: avg=40.89ms min=20.21ms med=40.23ms max=318.73ms p(90)=49.09ms  p(95)=51.97ms  p(99.9)=66.97ms 
     iterations.....................: 146696  1202.312486/s
     success_rate...................: 100.00% ✓ 146696      ✗ 0     
     vus............................: 44      min=0         max=50  
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

     checks.........................: 100.00% ✓ 208746     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   685 kB/s
     http_req_blocked...............: avg=5.34µs  min=1.28µs  med=3.52µs  max=4.35ms   p(90)=5.27µs   p(95)=6.02µs   p(99.9)=51.8µs  
     http_req_connecting............: avg=1.52µs  min=0s      med=0s      max=4.3ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.88ms min=21.22ms med=84.85ms max=344.68ms p(90)=101.53ms p(95)=110.22ms p(99.9)=192.87ms
       { expected_response:true }...: avg=85.88ms min=21.22ms med=84.85ms max=344.68ms p(90)=101.53ms p(95)=110.22ms p(99.9)=192.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69682
     http_req_receiving.............: avg=90.15µs min=31.66µs med=80.67µs max=111.96ms p(90)=117.43µs p(95)=131.57µs p(99.9)=637.19µs
     http_req_sending...............: avg=23.98µs min=5.59µs  med=16.09µs max=94.47ms  p(90)=23.12µs  p(95)=25.6µs   p(99.9)=663.36µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.77ms min=21.07ms med=84.74ms max=343.96ms p(90)=101.42ms p(95)=110.1ms  p(99.9)=192.75ms
     http_reqs......................: 69682   569.903221/s
     iteration_duration.............: avg=86.24ms min=29.75ms med=85.12ms max=353.87ms p(90)=101.78ms p(95)=110.51ms p(99.9)=193.92ms
     iterations.....................: 69582   569.085358/s
     success_rate...................: 100.00% ✓ 69582      ✗ 0    
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

     checks.........................: 100.00% ✓ 157047     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   515 kB/s
     http_req_blocked...............: avg=5.09µs   min=1.1µs   med=3.25µs   max=3.41ms   p(90)=4.76µs   p(95)=5.36µs   p(99.9)=148.94µs
     http_req_connecting............: avg=1.58µs   min=0s      med=0s       max=3.37ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.18ms min=21.13ms med=112.4ms  max=326.91ms p(90)=142.23ms p(95)=151.56ms p(99.9)=195.83ms
       { expected_response:true }...: avg=114.18ms min=21.13ms med=112.4ms  max=326.91ms p(90)=142.23ms p(95)=151.56ms p(99.9)=195.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52449
     http_req_receiving.............: avg=90.98µs  min=29.42µs med=85.79µs  max=51.09ms  p(90)=117.63µs p(95)=131.2µs  p(99.9)=546.69µs
     http_req_sending...............: avg=22.93µs  min=5.47µs  med=17.66µs  max=50.97ms  p(90)=22.87µs  p(95)=24.87µs  p(99.9)=560.76µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.07ms min=20.99ms med=112.29ms max=326.26ms p(90)=142.12ms p(95)=151.47ms p(99.9)=195.16ms
     http_reqs......................: 52449   428.767139/s
     iteration_duration.............: avg=114.64ms min=36.8ms  med=112.71ms max=347.63ms p(90)=142.53ms p(95)=151.89ms p(99.9)=198.71ms
     iterations.....................: 52349   427.949645/s
     success_rate...................: 100.00% ✓ 52349      ✗ 0    
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

     checks.........................: 100.00% ✓ 96813      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   317 kB/s
     http_req_blocked...............: avg=7.09µs   min=1.49µs  med=3.62µs   max=4.28ms   p(90)=5.18µs   p(95)=5.82µs   p(99.9)=1.6ms   
     http_req_connecting............: avg=3.12µs   min=0s      med=0s       max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=1.5ms   
     http_req_duration..............: avg=185.19ms min=23.38ms med=181.57ms max=359.54ms p(90)=209.64ms p(95)=214.54ms p(99.9)=283.64ms
       { expected_response:true }...: avg=185.19ms min=23.38ms med=181.57ms max=359.54ms p(90)=209.64ms p(95)=214.54ms p(99.9)=283.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32371
     http_req_receiving.............: avg=101.67µs min=37.86µs med=91.3µs   max=72.44ms  p(90)=124.5µs  p(95)=138.33µs p(99.9)=579.52µs
     http_req_sending...............: avg=26.66µs  min=7.01µs  med=18.35µs  max=43.97ms  p(90)=23.75µs  p(95)=25.84µs  p(99.9)=613.95µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.06ms min=23.26ms med=181.46ms max=358.52ms p(90)=209.52ms p(95)=214.42ms p(99.9)=282.92ms
     http_reqs......................: 32371   263.972439/s
     iteration_duration.............: avg=186ms    min=57.43ms med=181.89ms max=385.62ms p(90)=209.94ms p(95)=214.85ms p(99.9)=284.98ms
     iterations.....................: 32271   263.15698/s
     success_rate...................: 100.00% ✓ 32271      ✗ 0    
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

     checks.........................: 100.00% ✓ 93630      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 38 MB   307 kB/s
     http_req_blocked...............: avg=6.76µs   min=1.32µs  med=3.72µs   max=3.48ms   p(90)=5.23µs   p(95)=5.87µs   p(99.9)=1.37ms  
     http_req_connecting............: avg=2.76µs   min=0s      med=0s       max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=191.57ms min=18.56ms med=178.68ms max=626.9ms  p(90)=230.8ms  p(95)=261.68ms p(99.9)=571.12ms
       { expected_response:true }...: avg=191.57ms min=18.56ms med=178.68ms max=626.9ms  p(90)=230.8ms  p(95)=261.68ms p(99.9)=571.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31310
     http_req_receiving.............: avg=102.09µs min=36.92µs med=92.75µs  max=54.64ms  p(90)=124.22µs p(95)=137.02µs p(99.9)=813.24µs
     http_req_sending...............: avg=33.74µs  min=5.88µs  med=18.76µs  max=102.25ms p(90)=23.7µs   p(95)=25.81µs  p(99.9)=540.12µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.43ms min=18.46ms med=178.55ms max=626.79ms p(90)=230.65ms p(95)=261.37ms p(99.9)=571.01ms
     http_reqs......................: 31310   255.996754/s
     iteration_duration.............: avg=192.4ms  min=65.5ms  med=179.12ms max=627.18ms p(90)=231.21ms p(95)=262.89ms p(99.9)=571.42ms
     iterations.....................: 31210   255.179134/s
     success_rate...................: 100.00% ✓ 31210      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 7137      ✗ 0   
     data_received..................: 237 MB  1.9 MB/s
     data_sent......................: 3.0 MB  23 kB/s
     http_req_blocked...............: avg=36.21µs min=1.19µs   med=3.25µs  max=7.86ms p(90)=4.74µs   p(95)=5.5µs    p(99.9)=3.24ms  
     http_req_connecting............: avg=27.75µs min=0s       med=0s      max=3.25ms p(90)=0s       p(95)=0s       p(99.9)=3.08ms  
     http_req_duration..............: avg=2.44s   min=40.51ms  med=2.52s   max=13.35s p(90)=3.22s    p(95)=3.42s    p(99.9)=11.7s   
       { expected_response:true }...: avg=2.44s   min=40.51ms  med=2.52s   max=13.35s p(90)=3.22s    p(95)=3.42s    p(99.9)=11.7s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2479
     http_req_receiving.............: avg=96.91µs min=39.02µs  med=93.09µs max=2.79ms p(90)=129.28µs p(95)=143.64µs p(99.9)=472.35µs
     http_req_sending...............: avg=30.01µs min=5.91µs   med=17.82µs max=2.46ms p(90)=23.03µs  p(95)=26.95µs  p(99.9)=1.34ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.44s   min=40.37ms  med=2.52s   max=13.35s p(90)=3.22s    p(95)=3.42s    p(99.9)=11.7s   
     http_reqs......................: 2479    19.463996/s
     iteration_duration.............: avg=2.55s   min=307.85ms med=2.54s   max=13.36s p(90)=3.23s    p(95)=3.42s    p(99.9)=11.71s  
     iterations.....................: 2379    18.678841/s
     success_rate...................: 100.00% ✓ 2379      ✗ 0   
     vus............................: 20      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

