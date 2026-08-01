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
| fusion-nightly | 16.6.0-p.11 | 1,897 | 1,945 | 1,889 | 0.9% |  |
| fusion | 16.5.1 | 1,864 | 1,909 | 1,860 | 0.9% |  |
| fusion-nightly-net11 | 16.6.0-p.11 | 1,851 | 1,902 | 1,844 | 1.1% |  |
| hive-router | v0.0.84 | 1,848 | 1,916 | 1,841 | 1.4% |  |
| fusion-nightly-fed | 16.6.0-p.11 | 1,774 | 1,829 | 1,767 | 1.1% |  |
| grafbase | 0.53.5 | 1,290 | 1,325 | 1,282 | 1.1% |  |
| cosmo | 0.334.0 | 1,189 | 1,223 | 1,173 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 562 | 580 | 560 | 1.2% |  |
| apollo-router | v2.16.1 | 399 | 413 | 393 | 1.7% |  |
| hive-gateway | 2.10.8 | 264 | 271 | 261 | 1.3% |  |
| apollo-gateway | 2.14.3 | 259 | 263 | 256 | 0.7% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 19 | 3.3% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 693663      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=2.81µs   min=902ns   med=1.96µs  max=3.56ms   p(90)=3.55µs   p(95)=4.31µs  p(99.9)=30.95µs
     http_req_connecting............: avg=440ns    min=0s      med=0s      max=3.53ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.73ms  min=17.28ms med=25.16ms max=306.94ms p(90)=30.03ms  p(95)=31.78ms p(99.9)=48.59ms
       { expected_response:true }...: avg=25.73ms  min=17.28ms med=25.16ms max=306.94ms p(90)=30.03ms  p(95)=31.78ms p(99.9)=48.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 231321
     http_req_receiving.............: avg=316.48µs min=49.59µs med=91.24µs max=268.03ms p(90)=742.49µs p(95)=1.23ms  p(99.9)=8.62ms 
     http_req_sending...............: avg=31µs     min=4.59µs  med=8.5µs   max=52.44ms  p(90)=18.57µs  p(95)=31.14µs p(99.9)=1.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.38ms  min=17.21ms med=24.85ms max=195.36ms p(90)=29.63ms  p(95)=31.31ms p(99.9)=46.75ms
     http_reqs......................: 231321  1897.039158/s
     iteration_duration.............: avg=25.94ms  min=17.45ms med=25.36ms max=334.3ms  p(90)=30.23ms  p(95)=31.98ms p(99.9)=49.02ms
     iterations.....................: 231221  1896.219068/s
     success_rate...................: 100.00% ✓ 231221      ✗ 0     
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

     checks.........................: 100.00% ✓ 681762      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=2.84µs   min=861ns   med=2µs     max=6.01ms   p(90)=3.5µs    p(95)=4.21µs  p(99.9)=32.11µs
     http_req_connecting............: avg=404ns    min=0s      med=0s      max=3.87ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.18ms  min=17.51ms med=25.59ms max=308.49ms p(90)=30.6ms   p(95)=32.47ms p(99.9)=49.32ms
       { expected_response:true }...: avg=26.18ms  min=17.51ms med=25.59ms max=308.49ms p(90)=30.6ms   p(95)=32.47ms p(99.9)=49.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227354
     http_req_receiving.............: avg=317.79µs min=51.37µs med=96.65µs max=166.82ms p(90)=796.32µs p(95)=1.26ms  p(99.9)=7.99ms 
     http_req_sending...............: avg=31.72µs  min=4.62µs  med=8.52µs  max=145.77ms p(90)=17.89µs  p(95)=30.7µs  p(99.9)=1.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.83ms  min=17.4ms  med=25.26ms max=304.91ms p(90)=30.19ms  p(95)=32.02ms p(99.9)=47.55ms
     http_reqs......................: 227354  1864.69584/s
     iteration_duration.............: avg=26.39ms  min=17.77ms med=25.79ms max=319.6ms  p(90)=30.8ms   p(95)=32.67ms p(99.9)=49.64ms
     iterations.....................: 227254  1863.875668/s
     success_rate...................: 100.00% ✓ 227254      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 676821      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=2.93µs   min=912ns   med=2.07µs  max=8.11ms   p(90)=3.7µs    p(95)=4.41µs  p(99.9)=32.24µs
     http_req_connecting............: avg=406ns    min=0s      med=0s      max=3.6ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.37ms  min=17.24ms med=25.79ms max=299.87ms p(90)=30.73ms  p(95)=32.54ms p(99.9)=50.72ms
       { expected_response:true }...: avg=26.37ms  min=17.24ms med=25.79ms max=299.87ms p(90)=30.73ms  p(95)=32.54ms p(99.9)=50.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 225707
     http_req_receiving.............: avg=339.77µs min=50.04µs med=94.62µs max=191.95ms p(90)=899.09µs p(95)=1.43ms  p(99.9)=8.65ms 
     http_req_sending...............: avg=31.94µs  min=4.43µs  med=8.55µs  max=148.66ms p(90)=18.22µs  p(95)=39.64µs p(99.9)=1.55ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26ms     min=17.17ms med=25.44ms max=288.41ms p(90)=30.29ms  p(95)=32.05ms p(99.9)=49.19ms
     http_reqs......................: 225707  1851.122559/s
     iteration_duration.............: avg=26.58ms  min=17.43ms med=26ms    max=317.44ms p(90)=30.94ms  p(95)=32.75ms p(99.9)=51.18ms
     iterations.....................: 225607  1850.302415/s
     success_rate...................: 100.00% ✓ 225607      ✗ 0     
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

     checks.........................: 100.00% ✓ 675948      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=2.93µs  min=852ns   med=2.06µs  max=6.52ms   p(90)=3.77µs  p(95)=4.48µs   p(99.9)=30.21µs
     http_req_connecting............: avg=446ns   min=0s      med=0s      max=4.29ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.4ms  min=17.66ms med=25.96ms max=296.03ms p(90)=30.19ms p(95)=31.61ms  p(99.9)=47.9ms 
       { expected_response:true }...: avg=26.4ms  min=17.66ms med=25.96ms max=296.03ms p(90)=30.19ms p(95)=31.61ms  p(99.9)=47.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 225416
     http_req_receiving.............: avg=72.75µs min=25.12µs med=49.46µs max=65.96ms  p(90)=92.88µs p(95)=118.16µs p(99.9)=1.74ms 
     http_req_sending...............: avg=28.89µs min=4.53µs  med=9.16µs  max=132.44ms p(90)=18.43µs p(95)=25.04µs  p(99.9)=1.33ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.3ms  min=17.61ms med=25.87ms max=295.27ms p(90)=30.08ms p(95)=31.49ms  p(99.9)=45.86ms
     http_reqs......................: 225416  1848.376505/s
     iteration_duration.............: avg=26.62ms min=17.86ms med=26.16ms max=310.56ms p(90)=30.39ms p(95)=31.82ms  p(99.9)=48.34ms
     iterations.....................: 225316  1847.556521/s
     success_rate...................: 100.00% ✓ 225316      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 648951      ✗ 0     
     data_received..................: 19 GB   156 MB/s
     data_sent......................: 260 MB  2.1 MB/s
     http_req_blocked...............: avg=3.28µs   min=912ns   med=2.45µs   max=3.7ms    p(90)=4.14µs   p(95)=4.85µs  p(99.9)=33.86µs
     http_req_connecting............: avg=468ns    min=0s      med=0s       max=3.68ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.5ms   min=18.25ms med=26.89ms  max=311.74ms p(90)=32.28ms  p(95)=34.2ms  p(99.9)=51.6ms 
       { expected_response:true }...: avg=27.5ms   min=18.25ms med=26.89ms  max=311.74ms p(90)=32.28ms  p(95)=34.2ms  p(99.9)=51.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 216417
     http_req_receiving.............: avg=342.16µs min=51.84µs med=103.97µs max=192.4ms  p(90)=875.86µs p(95)=1.37ms  p(99.9)=8.36ms 
     http_req_sending...............: avg=34.74µs  min=4.69µs  med=9.74µs   max=172.92ms p(90)=19.65µs  p(95)=39.15µs p(99.9)=1.59ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.12ms  min=18.02ms med=26.53ms  max=299.06ms p(90)=31.81ms  p(95)=33.72ms p(99.9)=49.61ms
     http_reqs......................: 216417  1774.339962/s
     iteration_duration.............: avg=27.72ms  min=18.46ms med=27.1ms   max=320.14ms p(90)=32.48ms  p(95)=34.4ms  p(99.9)=52.05ms
     iterations.....................: 216317  1773.520091/s
     success_rate...................: 100.00% ✓ 216317      ✗ 0     
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

     checks.........................: 100.00% ✓ 471870      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 189 MB  1.6 MB/s
     http_req_blocked...............: avg=3.41µs  min=872ns   med=2.2µs   max=3.79ms   p(90)=4.61µs   p(95)=5.64µs   p(99.9)=38µs   
     http_req_connecting............: avg=630ns   min=0s      med=0s      max=3.73ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.88ms min=18.45ms med=37.57ms max=309.57ms p(90)=44.55ms  p(95)=46.68ms  p(99.9)=61.92ms
       { expected_response:true }...: avg=37.88ms min=18.45ms med=37.57ms max=309.57ms p(90)=44.55ms  p(95)=46.68ms  p(99.9)=61.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157390
     http_req_receiving.............: avg=83.68µs min=26.54µs med=54.98µs max=32.74ms  p(90)=121.29µs p(95)=167.66µs p(99.9)=1.91ms 
     http_req_sending...............: avg=31.86µs min=4.55µs  med=9.29µs  max=145.18ms p(90)=23.7µs   p(95)=56.89µs  p(99.9)=1.76ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.77ms min=18.37ms med=37.46ms max=309.06ms p(90)=44.43ms  p(95)=46.55ms  p(99.9)=60.96ms
     http_reqs......................: 157390  1290.172158/s
     iteration_duration.............: avg=38.14ms min=19.66ms med=37.8ms  max=320.67ms p(90)=44.77ms  p(95)=46.9ms   p(99.9)=62.43ms
     iterations.....................: 157290  1289.352429/s
     success_rate...................: 100.00% ✓ 157290      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 434994      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=3.36µs  min=912ns   med=2.42µs  max=3.91ms   p(90)=4.05µs   p(95)=4.75µs   p(99.9)=35.82µs 
     http_req_connecting............: avg=621ns   min=0s      med=0s      max=3.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.14ms min=18.8ms  med=40.53ms max=300.51ms p(90)=49.66ms  p(95)=52.57ms  p(99.9)=67.16ms 
       { expected_response:true }...: avg=41.14ms min=18.8ms  med=40.53ms max=300.51ms p(90)=49.66ms  p(95)=52.57ms  p(99.9)=67.16ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 145098
     http_req_receiving.............: avg=78.63µs min=27.05µs med=64.27µs max=94.22ms  p(90)=107.36µs p(95)=125.34µs p(99.9)=800.04µs
     http_req_sending...............: avg=23.56µs min=4.7µs   med=10.82µs max=127.68ms p(90)=18.29µs  p(95)=22.01µs  p(99.9)=794.65µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.04ms min=18.7ms  med=40.44ms max=300.13ms p(90)=49.57ms  p(95)=52.46ms  p(99.9)=66.81ms 
     http_reqs......................: 145098  1189.50603/s
     iteration_duration.............: avg=41.37ms min=23.22ms med=40.74ms max=321.24ms p(90)=49.87ms  p(95)=52.77ms  p(99.9)=67.46ms 
     iterations.....................: 144998  1188.686235/s
     success_rate...................: 100.00% ✓ 144998      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 206079     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 83 MB   676 kB/s
     http_req_blocked...............: avg=5.18µs  min=1.25µs  med=3.35µs  max=4.03ms   p(90)=4.99µs   p(95)=5.72µs   p(99.9)=47.71µs 
     http_req_connecting............: avg=1.53µs  min=0s      med=0s      max=4ms      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.98ms min=20.64ms med=85.83ms max=332.25ms p(90)=103.25ms p(95)=112.45ms p(99.9)=204.13ms
       { expected_response:true }...: avg=86.98ms min=20.64ms med=85.83ms max=332.25ms p(90)=103.25ms p(95)=112.45ms p(99.9)=204.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68793
     http_req_receiving.............: avg=87.61µs min=30.69µs med=76.88µs max=126.24ms p(90)=113.76µs p(95)=127.4µs  p(99.9)=699.18µs
     http_req_sending...............: avg=24.01µs min=5.52µs  med=15.6µs  max=77.25ms  p(90)=22.47µs  p(95)=24.84µs  p(99.9)=648.5µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.87ms min=20.49ms med=85.73ms max=331.55ms p(90)=103.14ms p(95)=112.31ms p(99.9)=203.45ms
     http_reqs......................: 68793   562.85897/s
     iteration_duration.............: avg=87.34ms min=32.23ms med=86.1ms  max=344.37ms p(90)=103.51ms p(95)=112.77ms p(99.9)=206.39ms
     iterations.....................: 68693   562.040778/s
     success_rate...................: 100.00% ✓ 68693      ✗ 0    
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

     checks.........................: 100.00% ✓ 146229     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   479 kB/s
     http_req_blocked...............: avg=6.14µs   min=1.35µs  med=3.73µs   max=4.33ms   p(90)=5.25µs   p(95)=5.87µs   p(99.9)=834.64µs
     http_req_connecting............: avg=2.16µs   min=0s      med=0s       max=4.29ms   p(90)=0s       p(95)=0s       p(99.9)=817.78µs
     http_req_duration..............: avg=122.64ms min=21.14ms med=120.68ms max=349.01ms p(90)=153.32ms p(95)=163.91ms p(99.9)=208.65ms
       { expected_response:true }...: avg=122.64ms min=21.14ms med=120.68ms max=349.01ms p(90)=153.32ms p(95)=163.91ms p(99.9)=208.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48843
     http_req_receiving.............: avg=90.51µs  min=33.26µs med=85.61µs  max=70.17ms  p(90)=118.27µs p(95)=130.64µs p(99.9)=503.08µs
     http_req_sending...............: avg=27.66µs  min=5.55µs  med=17.07µs  max=70.32ms  p(90)=22.58µs  p(95)=24.66µs  p(99.9)=569.96µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.52ms min=20.99ms med=120.58ms max=335.97ms p(90)=153.21ms p(95)=163.78ms p(99.9)=208.54ms
     http_reqs......................: 48843   399.259058/s
     iteration_duration.............: avg=123.13ms min=35.74ms med=121.01ms max=357.33ms p(90)=153.64ms p(95)=164.21ms p(99.9)=211.25ms
     iterations.....................: 48743   398.441625/s
     success_rate...................: 100.00% ✓ 48743      ✗ 0    
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

     checks.........................: 100.00% ✓ 96564      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   318 kB/s
     http_req_blocked...............: avg=6.99µs   min=1.43µs  med=3.81µs   max=3.86ms   p(90)=5.41µs   p(95)=6.09µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=2.85µs   min=0s      med=0s       max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=1.36ms  
     http_req_duration..............: avg=185.68ms min=17.63ms med=172.23ms max=671.41ms p(90)=227.79ms p(95)=263.23ms p(99.9)=565.07ms
       { expected_response:true }...: avg=185.68ms min=17.63ms med=172.23ms max=671.41ms p(90)=227.79ms p(95)=263.23ms p(99.9)=565.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32288
     http_req_receiving.............: avg=100.74µs min=35.3µs  med=93.46µs  max=25.89ms  p(90)=125.91µs p(95)=139.1µs  p(99.9)=857.28µs
     http_req_sending...............: avg=27.73µs  min=6.71µs  med=19.48µs  max=91.41ms  p(90)=24.76µs  p(95)=26.86µs  p(99.9)=482.24µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.55ms min=17.52ms med=172.11ms max=671.31ms p(90)=227.65ms p(95)=263.11ms p(99.9)=564.93ms
     http_reqs......................: 32288   264.446669/s
     iteration_duration.............: avg=186.5ms  min=39.05ms med=172.67ms max=671.64ms p(90)=228.24ms p(95)=264.33ms p(99.9)=565.38ms
     iterations.....................: 32188   263.627644/s
     success_rate...................: 100.00% ✓ 32188      ✗ 0    
     vus............................: 41      min=0        max=50 
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

     checks.........................: 100.00% ✓ 95238      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=6.89µs   min=1.41µs  med=3.72µs   max=3.78ms   p(90)=5.18µs   p(95)=5.79µs   p(99.9)=1.37ms  
     http_req_connecting............: avg=2.83µs   min=0s      med=0s       max=3.74ms   p(90)=0s       p(95)=0s       p(99.9)=1.24ms  
     http_req_duration..............: avg=188.27ms min=22.77ms med=174.69ms max=405ms    p(90)=235.75ms p(95)=243.17ms p(99.9)=311.74ms
       { expected_response:true }...: avg=188.27ms min=22.77ms med=174.69ms max=405ms    p(90)=235.75ms p(95)=243.17ms p(99.9)=311.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31846
     http_req_receiving.............: avg=94.91µs  min=36.75µs med=90.15µs  max=6.89ms   p(90)=122.33µs p(95)=135.43µs p(99.9)=576.7µs 
     http_req_sending...............: avg=33.52µs  min=5.85µs  med=18.7µs   max=166.53ms p(90)=23.86µs  p(95)=25.83µs  p(99.9)=825.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.14ms min=22.61ms med=174.58ms max=404.08ms p(90)=235.62ms p(95)=243.06ms p(99.9)=311.51ms
     http_reqs......................: 31846   259.596973/s
     iteration_duration.............: avg=189.1ms  min=43.98ms med=174.99ms max=421.09ms p(90)=236.05ms p(95)=243.48ms p(99.9)=315.04ms
     iterations.....................: 31746   258.78181/s
     success_rate...................: 100.00% ✓ 31746      ✗ 0    
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

     checks.........................: 100.00% ✓ 7623      ✗ 0   
     data_received..................: 253 MB  2.0 MB/s
     data_sent......................: 3.2 MB  25 kB/s
     http_req_blocked...............: avg=49.06µs  min=1.64µs   med=3.93µs   max=5.99ms  p(90)=5.61µs  p(95)=6.46µs  p(99.9)=5.24ms
     http_req_connecting............: avg=42.34µs  min=0s       med=0s       max=5.93ms  p(90)=0s      p(95)=0s      p(99.9)=5.13ms
     http_req_duration..............: avg=2.29s    min=37.36ms  med=2.34s    max=9.64s   p(90)=2.96s   p(95)=3.15s   p(99.9)=8.81s 
       { expected_response:true }...: avg=2.29s    min=37.36ms  med=2.34s    max=9.64s   p(90)=2.96s   p(95)=3.15s   p(99.9)=8.81s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2641
     http_req_receiving.............: avg=113.32µs min=43.11µs  med=100.55µs max=16.82ms p(90)=141.3µs p(95)=158.4µs p(99.9)=1.5ms 
     http_req_sending...............: avg=37.44µs  min=8.1µs    med=19.77µs  max=3.27ms  p(90)=25.6µs  p(95)=28.92µs p(99.9)=2.3ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s      p(90)=0s      p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=2.29s    min=37.25ms  med=2.34s    max=9.64s   p(90)=2.96s   p(95)=3.15s   p(99.9)=8.81s 
     http_reqs......................: 2641    20.856141/s
     iteration_duration.............: avg=2.37s    min=773.94ms med=2.37s    max=9.64s   p(90)=2.97s   p(95)=3.15s   p(99.9)=8.9s  
     iterations.....................: 2541    20.066435/s
     success_rate...................: 100.00% ✓ 2541      ✗ 0   
     vus............................: 24      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

