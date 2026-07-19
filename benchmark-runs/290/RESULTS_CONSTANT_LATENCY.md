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
| hive-router | v0.0.83 | 1,868 | 1,924 | 1,862 | 1.1% |  |
| fusion-nightly | 16.5.1-p.2 | 1,859 | 1,907 | 1,854 | 1.0% |  |
| fusion | 16.5.0 | 1,857 | 1,905 | 1,846 | 1.1% |  |
| fusion-nightly-net11 | 16.5.1-p.2 | 1,845 | 1,898 | 1,831 | 1.2% |  |
| fusion-nightly-fed | 16.5.1-p.2 | 1,747 | 1,795 | 1,738 | 1.1% |  |
| grafbase | 0.53.5 | 1,286 | 1,319 | 1,277 | 1.1% |  |
| cosmo | 0.331.1 | 1,234 | 1,276 | 1,229 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.4 | 570 | 591 | 568 | 1.3% |  |
| apollo-router | v2.16.0 | 400 | 417 | 397 | 1.9% |  |
| hive-gateway | 2.10.4 | 266 | 271 | 262 | 1.1% |  |
| apollo-gateway | 2.14.2 | 260 | 264 | 259 | 0.7% |  |
| feddi | 5ff8b6165878 | 22 | 22 | 21 | 2.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 683031      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.09µs  min=901ns   med=2.21µs  max=4.18ms   p(90)=4.11µs  p(95)=4.84µs   p(99.9)=34.18µs
     http_req_connecting............: avg=434ns   min=0s      med=0s      max=4.13ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.13ms min=18.11ms med=25.7ms  max=312.51ms p(90)=29.77ms p(95)=31.17ms  p(99.9)=46.44ms
       { expected_response:true }...: avg=26.13ms min=18.11ms med=25.7ms  max=312.51ms p(90)=29.77ms p(95)=31.17ms  p(99.9)=46.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227777
     http_req_receiving.............: avg=70.56µs min=24.39µs med=47.97µs max=63.81ms  p(90)=91.56µs p(95)=117.35µs p(99.9)=1.69ms 
     http_req_sending...............: avg=30.5µs  min=4.22µs  med=9.15µs  max=127.24ms p(90)=18.2µs  p(95)=24.95µs  p(99.9)=1.35ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.03ms min=17.98ms med=25.61ms max=311.87ms p(90)=29.67ms p(95)=31.06ms  p(99.9)=45.05ms
     http_reqs......................: 227777  1868.037401/s
     iteration_duration.............: avg=26.34ms min=18.36ms med=25.9ms  max=336.16ms p(90)=29.98ms p(95)=31.37ms  p(99.9)=46.82ms
     iterations.....................: 227677  1867.217284/s
     success_rate...................: 100.00% ✓ 227677      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 680016      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=3.42µs   min=951ns   med=2.52µs  max=7.48ms   p(90)=4.14µs   p(95)=4.88µs  p(99.9)=36.46µs
     http_req_connecting............: avg=469ns    min=0s      med=0s      max=4.57ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.24ms  min=17.33ms med=25.63ms max=312.61ms p(90)=30.71ms  p(95)=32.62ms p(99.9)=50.68ms
       { expected_response:true }...: avg=26.24ms  min=17.33ms med=25.63ms max=312.61ms p(90)=30.71ms  p(95)=32.62ms p(99.9)=50.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226772
     http_req_receiving.............: avg=334.37µs min=51µs    med=98.9µs  max=155.07ms p(90)=861.14µs p(95)=1.37ms  p(99.9)=8.64ms 
     http_req_sending...............: avg=34.03µs  min=4.68µs  med=9.47µs  max=158.89ms p(90)=18.23µs  p(95)=34.56µs p(99.9)=1.91ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.87ms  min=17.2ms  med=25.27ms max=306.5ms  p(90)=30.27ms  p(95)=32.12ms p(99.9)=49.53ms
     http_reqs......................: 226772  1859.749809/s
     iteration_duration.............: avg=26.46ms  min=17.52ms med=25.84ms max=321ms    p(90)=30.92ms  p(95)=32.83ms p(99.9)=51.35ms
     iterations.....................: 226672  1858.929713/s
     success_rate...................: 100.00% ✓ 226672      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 679176      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=2.8µs    min=911ns   med=1.96µs  max=4.24ms   p(90)=3.51µs   p(95)=4.24µs  p(99.9)=26.26µs
     http_req_connecting............: avg=439ns    min=0s      med=0s      max=4.2ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.28ms  min=17.43ms med=25.71ms max=311.44ms p(90)=30.71ms  p(95)=32.52ms p(99.9)=49.52ms
       { expected_response:true }...: avg=26.28ms  min=17.43ms med=25.71ms max=311.44ms p(90)=30.71ms  p(95)=32.52ms p(99.9)=49.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226492
     http_req_receiving.............: avg=336.03µs min=51.57µs med=98.75µs max=197.66ms p(90)=860.27µs p(95)=1.33ms  p(99.9)=8ms    
     http_req_sending...............: avg=32.64µs  min=4.65µs  med=8.5µs   max=197.44ms p(90)=17.55µs  p(95)=26.49µs p(99.9)=1.53ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.91ms  min=17.34ms med=25.36ms max=310.86ms p(90)=30.26ms  p(95)=32.05ms p(99.9)=47.48ms
     http_reqs......................: 226492  1857.424489/s
     iteration_duration.............: avg=26.49ms  min=17.6ms  med=25.91ms max=323.14ms p(90)=30.9ms   p(95)=32.72ms p(99.9)=50.09ms
     iterations.....................: 226392  1856.604405/s
     success_rate...................: 100.00% ✓ 226392      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 674907      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 270 MB  2.2 MB/s
     http_req_blocked...............: avg=3.2µs    min=1µs     med=2.53µs   max=3.21ms   p(90)=4.11µs  p(95)=4.84µs  p(99.9)=34.56µs
     http_req_connecting............: avg=309ns    min=0s      med=0s       max=3.17ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.43ms  min=17.37ms med=25.84ms  max=284.77ms p(90)=30.84ms p(95)=32.72ms p(99.9)=50.5ms 
       { expected_response:true }...: avg=26.43ms  min=17.37ms med=25.84ms  max=284.77ms p(90)=30.84ms p(95)=32.72ms p(99.9)=50.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 225069
     http_req_receiving.............: avg=349.76µs min=51.52µs med=100.54µs max=110.3ms  p(90)=923.6µs p(95)=1.48ms  p(99.9)=9.05ms 
     http_req_sending...............: avg=34.56µs  min=4.6µs   med=9.75µs   max=78.54ms  p(90)=19.17µs p(95)=46.53µs p(99.9)=1.88ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.05ms  min=17.17ms med=25.47ms  max=284.16ms p(90)=30.38ms p(95)=32.18ms p(99.9)=48.28ms
     http_reqs......................: 225069  1845.930758/s
     iteration_duration.............: avg=26.66ms  min=17.7ms  med=26.05ms  max=320.78ms p(90)=31.05ms p(95)=32.93ms p(99.9)=50.92ms
     iterations.....................: 224969  1845.110595/s
     success_rate...................: 100.00% ✓ 224969      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 639054      ✗ 0     
     data_received..................: 19 GB   153 MB/s
     data_sent......................: 256 MB  2.1 MB/s
     http_req_blocked...............: avg=3.01µs   min=941ns   med=2.09µs   max=3.71ms   p(90)=3.9µs    p(95)=4.67µs  p(99.9)=28.59µs
     http_req_connecting............: avg=479ns    min=0s      med=0s       max=3.67ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.93ms  min=18.3ms  med=27.34ms  max=292.25ms p(90)=32.74ms  p(95)=34.66ms p(99.9)=51.21ms
       { expected_response:true }...: avg=27.93ms  min=18.3ms  med=27.34ms  max=292.25ms p(90)=32.74ms  p(95)=34.66ms p(99.9)=51.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 213118
     http_req_receiving.............: avg=346.98µs min=52.25µs med=102.63µs max=158.66ms p(90)=890.61µs p(95)=1.4ms   p(99.9)=8.92ms 
     http_req_sending...............: avg=33.54µs  min=4.45µs  med=8.8µs    max=143.84ms p(90)=19.38µs  p(95)=31.07µs p(99.9)=1.65ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.55ms  min=17.71ms med=26.98ms  max=291.84ms p(90)=32.28ms  p(95)=34.15ms p(99.9)=49.49ms
     http_reqs......................: 213118  1747.11842/s
     iteration_duration.............: avg=28.15ms  min=18.51ms med=27.54ms  max=307.1ms  p(90)=32.94ms  p(95)=34.87ms p(99.9)=51.42ms
     iterations.....................: 213018  1746.298631/s
     success_rate...................: 100.00% ✓ 213018      ✗ 0     
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

     checks.........................: 100.00% ✓ 470388      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 189 MB  1.5 MB/s
     http_req_blocked...............: avg=3.37µs  min=832ns   med=2.13µs  max=3.93ms   p(90)=4.48µs   p(95)=5.48µs   p(99.9)=43.26µs
     http_req_connecting............: avg=635ns   min=0s      med=0s      max=3.88ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.01ms min=18.48ms med=37.75ms max=317.86ms p(90)=44.73ms  p(95)=46.84ms  p(99.9)=61.15ms
       { expected_response:true }...: avg=38.01ms min=18.48ms med=37.75ms max=317.86ms p(90)=44.73ms  p(95)=46.84ms  p(99.9)=61.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156896
     http_req_receiving.............: avg=85.74µs min=26.29µs med=53.97µs max=239.59ms p(90)=120.69µs p(95)=163.46µs p(99.9)=1.91ms 
     http_req_sending...............: avg=35.73µs min=4.46µs  med=8.96µs  max=231.77ms p(90)=23.64µs  p(95)=40.77µs  p(99.9)=1.63ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.89ms min=18.33ms med=37.64ms max=317.56ms p(90)=44.61ms  p(95)=46.72ms  p(99.9)=60.14ms
     http_reqs......................: 156896  1286.194291/s
     iteration_duration.............: avg=38.25ms min=20.53ms med=37.98ms max=329.03ms p(90)=44.94ms  p(95)=47.06ms  p(99.9)=61.71ms
     iterations.....................: 156796  1285.374516/s
     success_rate...................: 100.00% ✓ 156796      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 451416      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 181 MB  1.5 MB/s
     http_req_blocked...............: avg=5.09µs  min=1.03µs  med=2.96µs  max=9.3ms    p(90)=4.65µs   p(95)=5.41µs   p(99.9)=38.29µs
     http_req_connecting............: avg=1.76µs  min=0s      med=0s      max=9.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.61ms min=17.9ms  med=38.99ms max=304.89ms p(90)=47.48ms  p(95)=50.21ms  p(99.9)=64.76ms
       { expected_response:true }...: avg=39.61ms min=17.9ms  med=38.99ms max=304.89ms p(90)=47.48ms  p(95)=50.21ms  p(99.9)=64.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150572
     http_req_receiving.............: avg=84.08µs min=26.99µs med=68.11µs max=107.92ms p(90)=110.76µs p(95)=130.01µs p(99.9)=1.1ms  
     http_req_sending...............: avg=35.37µs min=5.07µs  med=13.43µs max=240.1ms  p(90)=21.3µs   p(95)=25.67µs  p(99.9)=1.3ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.49ms min=17.77ms med=38.88ms max=304.36ms p(90)=47.36ms  p(95)=50.08ms  p(99.9)=64.17ms
     http_reqs......................: 150572  1234.31639/s
     iteration_duration.............: avg=39.86ms min=22.55ms med=39.21ms max=324.07ms p(90)=47.71ms  p(95)=50.43ms  p(99.9)=65.07ms
     iterations.....................: 150472  1233.496638/s
     success_rate...................: 100.00% ✓ 150472      ✗ 0     
     vus............................: 7       min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 208962     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   685 kB/s
     http_req_blocked...............: avg=7.29µs  min=1.11µs  med=3.5µs   max=9ms      p(90)=5.13µs   p(95)=5.83µs   p(99.9)=47.64µs 
     http_req_connecting............: avg=3.26µs  min=0s      med=0s      max=8.76ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.78ms min=20.63ms med=84.56ms max=319.62ms p(90)=100.82ms p(95)=108.76ms p(99.9)=196.99ms
       { expected_response:true }...: avg=85.78ms min=20.63ms med=84.56ms max=319.62ms p(90)=100.82ms p(95)=108.76ms p(99.9)=196.99ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69754
     http_req_receiving.............: avg=87.68µs min=31.29µs med=78.88µs max=64.05ms  p(90)=115.68µs p(95)=130.23µs p(99.9)=672.26µs
     http_req_sending...............: avg=29.19µs min=4.95µs  med=15.92µs max=121.42ms p(90)=22.54µs  p(95)=24.96µs  p(99.9)=696.56µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.66ms min=20.48ms med=84.45ms max=319.15ms p(90)=100.7ms  p(95)=108.65ms p(99.9)=196.78ms
     http_reqs......................: 69754   570.682271/s
     iteration_duration.............: avg=86.14ms min=40.5ms  med=84.82ms max=337.52ms p(90)=101.09ms p(95)=109.04ms p(99.9)=198.74ms
     iterations.....................: 69654   569.864136/s
     success_rate...................: 100.00% ✓ 69654      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 146532     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   480 kB/s
     http_req_blocked...............: avg=5.29µs   min=1.11µs  med=2.85µs   max=3.68ms   p(90)=4.25µs   p(95)=4.81µs   p(99.9)=453.34µs
     http_req_connecting............: avg=2.22µs   min=0s      med=0s       max=3.64ms   p(90)=0s       p(95)=0s       p(99.9)=432.32µs
     http_req_duration..............: avg=122.39ms min=21.16ms med=120.44ms max=323.48ms p(90)=153.11ms p(95)=163.27ms p(99.9)=207.26ms
       { expected_response:true }...: avg=122.39ms min=21.16ms med=120.44ms max=323.48ms p(90)=153.11ms p(95)=163.27ms p(99.9)=207.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48944
     http_req_receiving.............: avg=84.73µs  min=30.96µs med=81.4µs   max=18.52ms  p(90)=114.03µs p(95)=126.23µs p(99.9)=470.23µs
     http_req_sending...............: avg=25.78µs  min=5.49µs  med=15.95µs  max=82.73ms  p(90)=21.35µs  p(95)=23.17µs  p(99.9)=509.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.28ms min=20.98ms med=120.32ms max=322.87ms p(90)=153.01ms p(95)=163.16ms p(99.9)=207.15ms
     http_reqs......................: 48944   400.082451/s
     iteration_duration.............: avg=122.87ms min=44.97ms med=120.75ms max=344.4ms  p(90)=153.38ms p(95)=163.58ms p(99.9)=211.39ms
     iterations.....................: 48844   399.265022/s
     success_rate...................: 100.00% ✓ 48844      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 97311      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=7.06µs   min=1.35µs  med=3.89µs   max=4.04ms   p(90)=5.5µs    p(95)=6.17µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=2.84µs   min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=184.26ms min=18.4ms  med=173.21ms max=583.73ms p(90)=214.33ms p(95)=247.04ms p(99.9)=546.95ms
       { expected_response:true }...: avg=184.26ms min=18.4ms  med=173.21ms max=583.73ms p(90)=214.33ms p(95)=247.04ms p(99.9)=546.95ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32537
     http_req_receiving.............: avg=102.82µs min=37.82µs med=94.2µs   max=64.45ms  p(90)=127.24µs p(95)=141.9µs  p(99.9)=742.34µs
     http_req_sending...............: avg=32.63µs  min=7.21µs  med=19.64µs  max=88.49ms  p(90)=24.85µs  p(95)=26.9µs   p(99.9)=573.1µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.12ms min=18.24ms med=173.08ms max=583.6ms  p(90)=214.17ms p(95)=246.73ms p(99.9)=546.86ms
     http_reqs......................: 32537   266.497201/s
     iteration_duration.............: avg=185.07ms min=61.47ms med=173.63ms max=584ms    p(90)=214.67ms p(95)=248.68ms p(99.9)=547.22ms
     iterations.....................: 32437   265.678143/s
     success_rate...................: 100.00% ✓ 32437      ✗ 0    
     vus............................: 40      min=0        max=50 
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

     checks.........................: 100.00% ✓ 95595      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=6.16µs   min=1.16µs  med=3.14µs   max=3.65ms   p(90)=4.52µs   p(95)=5.08µs   p(99.9)=1.37ms  
     http_req_connecting............: avg=2.78µs   min=0s      med=0s       max=3.61ms   p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=187.58ms min=23.16ms med=186.13ms max=404.36ms p(90)=216.74ms p(95)=223.98ms p(99.9)=297.09ms
       { expected_response:true }...: avg=187.58ms min=23.16ms med=186.13ms max=404.36ms p(90)=216.74ms p(95)=223.98ms p(99.9)=297.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31965
     http_req_receiving.............: avg=91.26µs  min=29.28µs med=87.83µs  max=8.11ms   p(90)=118.62µs p(95)=130.49µs p(99.9)=510.44µs
     http_req_sending...............: avg=33.59µs  min=5.35µs  med=17.49µs  max=102.43ms p(90)=22.21µs  p(95)=24.04µs  p(99.9)=607.23µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.45ms min=23.01ms med=186.02ms max=403.73ms p(90)=216.63ms p(95)=223.86ms p(99.9)=296.98ms
     http_reqs......................: 31965   260.618412/s
     iteration_duration.............: avg=188.4ms  min=52.95ms med=186.8ms  max=413.75ms p(90)=217.06ms p(95)=224.35ms p(99.9)=298.39ms
     iterations.....................: 31865   259.803087/s
     success_rate...................: 100.00% ✓ 31865      ✗ 0    
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

     checks.........................: 100.00% ✓ 8091      ✗ 0   
     data_received..................: 268 MB  2.1 MB/s
     data_sent......................: 3.4 MB  27 kB/s
     http_req_blocked...............: avg=35.97µs  min=1.13µs  med=3.32µs  max=3.62ms  p(90)=4.94µs   p(95)=5.75µs   p(99.9)=3.34ms  
     http_req_connecting............: avg=32.01µs  min=0s      med=0s      max=3.58ms  p(90)=0s       p(95)=0s       p(99.9)=3.31ms  
     http_req_duration..............: avg=2.16s    min=37.99ms med=2.16s   max=5.06s   p(90)=2.82s    p(95)=3.11s    p(99.9)=4.11s   
       { expected_response:true }...: avg=2.16s    min=37.99ms med=2.16s   max=5.06s   p(90)=2.82s    p(95)=3.11s    p(99.9)=4.11s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2797
     http_req_receiving.............: avg=103.33µs min=29.45µs med=98.43µs max=2.13ms  p(90)=135.62µs p(95)=150.18µs p(99.9)=725.22µs
     http_req_sending...............: avg=60.68µs  min=5.46µs  med=19.39µs max=22.36ms p(90)=24.59µs  p(95)=28.58µs  p(99.9)=13.27ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.16s    min=37.83ms med=2.16s   max=5.06s   p(90)=2.82s    p(95)=3.11s    p(99.9)=4.1s    
     http_reqs......................: 2797    22.170531/s
     iteration_duration.............: avg=2.24s    min=1.04s   med=2.18s   max=5.06s   p(90)=2.84s    p(95)=3.12s    p(99.9)=4.12s   
     iterations.....................: 2697    21.377877/s
     success_rate...................: 100.00% ✓ 2697      ✗ 0   
     vus............................: 18      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

