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
| fusion-nightly | 16.6.2-p.1 | 1,882 | 1,933 | 1,878 | 1.0% |  |
| fusion-nightly-net11 | 16.6.2-p.1 | 1,873 | 1,940 | 1,864 | 1.4% |  |
| fusion | 16.6.1 | 1,872 | 1,916 | 1,863 | 0.9% |  |
| hive-router | v0.0.84 | 1,824 | 1,895 | 1,817 | 1.5% |  |
| fusion-nightly-fed | 16.6.2-p.1 | 1,782 | 1,842 | 1,772 | 1.3% |  |
| grafbase | 0.53.5 | 1,287 | 1,318 | 1,280 | 1.1% |  |
| cosmo | 0.334.0 | 1,207 | 1,250 | 1,205 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 564 | 583 | 562 | 1.2% |  |
| apollo-router | v2.16.1 | 398 | 416 | 396 | 1.7% |  |
| apollo-gateway | 2.14.3 | 260 | 263 | 259 | 0.5% |  |
| hive-gateway | 2.10.8 | 252 | 260 | 250 | 1.4% |  |
| feddi | 5ff8b6165878 | 17 | 18 | 17 | 3.1% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 688479      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.71µs   min=852ns   med=2.01µs  max=7.48ms   p(90)=3.64µs   p(95)=4.39µs  p(99.9)=27.58µs
     http_req_connecting............: avg=258ns    min=0s      med=0s      max=2.6ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.92ms  min=17.31ms med=25.35ms max=298.28ms p(90)=30.3ms   p(95)=32.09ms p(99.9)=49.13ms
       { expected_response:true }...: avg=25.92ms  min=17.31ms med=25.35ms max=298.28ms p(90)=30.3ms   p(95)=32.09ms p(99.9)=49.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229593
     http_req_receiving.............: avg=291.16µs min=50.31µs med=92µs    max=49.06ms  p(90)=733.87µs p(95)=1.23ms  p(99.9)=7.25ms 
     http_req_sending...............: avg=32.78µs  min=4.46µs  med=8.56µs  max=216.55ms p(90)=18.6µs   p(95)=29.4µs  p(99.9)=1.55ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.59ms  min=17.2ms  med=25.04ms max=297.89ms p(90)=29.92ms  p(95)=31.68ms p(99.9)=47.23ms
     http_reqs......................: 229593  1882.924057/s
     iteration_duration.............: avg=26.13ms  min=17.48ms med=25.55ms max=311.1ms  p(90)=30.51ms  p(95)=32.3ms  p(99.9)=49.64ms
     iterations.....................: 229493  1882.103944/s
     success_rate...................: 100.00% ✓ 229493      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 685077      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.67µs  min=801ns   med=1.93µs  max=7.04ms   p(90)=3.62µs   p(95)=4.34µs  p(99.9)=28.82µs
     http_req_connecting............: avg=253ns   min=0s      med=0s      max=2.93ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.05ms min=17.04ms med=25.49ms max=289.75ms p(90)=30.38ms  p(95)=32.15ms p(99.9)=49.27ms
       { expected_response:true }...: avg=26.05ms min=17.04ms med=25.49ms max=289.75ms p(90)=30.38ms  p(95)=32.15ms p(99.9)=49.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228459
     http_req_receiving.............: avg=256µs   min=48.01µs med=86.01µs max=171ms    p(90)=592.58µs p(95)=1.1ms   p(99.9)=7.18ms 
     http_req_sending...............: avg=33.18µs min=4.25µs  med=8.22µs  max=165.52ms p(90)=18.37µs  p(95)=27.29µs p(99.9)=1.76ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.76ms min=16.92ms med=25.22ms max=289.25ms p(90)=30.03ms  p(95)=31.75ms p(99.9)=47.96ms
     http_reqs......................: 228459  1873.666802/s
     iteration_duration.............: avg=26.26ms min=17.23ms med=25.69ms max=306.68ms p(90)=30.58ms  p(95)=32.35ms p(99.9)=49.68ms
     iterations.....................: 228359  1872.846669/s
     success_rate...................: 100.00% ✓ 228359      ✗ 0     
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

     checks.........................: 100.00% ✓ 684417      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=2.86µs   min=912ns   med=1.98µs  max=9.55ms   p(90)=3.53µs   p(95)=4.26µs  p(99.9)=31.52µs
     http_req_connecting............: avg=364ns    min=0s      med=0s      max=3.29ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.07ms  min=17.37ms med=25.5ms  max=294.12ms p(90)=30.47ms  p(95)=32.27ms p(99.9)=48.14ms
       { expected_response:true }...: avg=26.07ms  min=17.37ms med=25.5ms  max=294.12ms p(90)=30.47ms  p(95)=32.27ms p(99.9)=48.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228239
     http_req_receiving.............: avg=323.18µs min=50.24µs med=96.49µs max=197.62ms p(90)=830.14µs p(95)=1.31ms  p(99.9)=7.66ms 
     http_req_sending...............: avg=31.66µs  min=4.32µs  med=8.54µs  max=146.53ms p(90)=17.83µs  p(95)=28.28µs p(99.9)=1.59ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.72ms  min=17.27ms med=25.17ms max=293.45ms p(90)=30.04ms  p(95)=31.79ms p(99.9)=46.14ms
     http_reqs......................: 228239  1872.042858/s
     iteration_duration.............: avg=26.29ms  min=17.54ms med=25.71ms max=312.26ms p(90)=30.67ms  p(95)=32.47ms p(99.9)=48.42ms
     iterations.....................: 228139  1871.222647/s
     success_rate...................: 100.00% ✓ 228139      ✗ 0     
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

     checks.........................: 100.00% ✓ 667362      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 267 MB  2.2 MB/s
     http_req_blocked...............: avg=2.84µs  min=922ns   med=2.05µs  max=5ms      p(90)=3.49µs  p(95)=4.17µs   p(99.9)=33.3µs 
     http_req_connecting............: avg=412ns   min=0s      med=0s      max=3.67ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.76ms min=18.12ms med=26.34ms max=305.54ms p(90)=30.5ms  p(95)=31.92ms  p(99.9)=46.14ms
       { expected_response:true }...: avg=26.76ms min=18.12ms med=26.34ms max=305.54ms p(90)=30.5ms  p(95)=31.92ms  p(99.9)=46.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 222554
     http_req_receiving.............: avg=71.52µs min=24.93µs med=49.24µs max=127.49ms p(90)=88.22µs p(95)=110.18µs p(99.9)=1.57ms 
     http_req_sending...............: avg=27.38µs min=4.5µs   med=9.01µs  max=156.53ms p(90)=16.76µs p(95)=22.81µs  p(99.9)=1.26ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.66ms min=17.88ms med=26.26ms max=276.37ms p(90)=30.4ms  p(95)=31.81ms  p(99.9)=43.92ms
     http_reqs......................: 222554  1824.843297/s
     iteration_duration.............: avg=26.96ms min=18.61ms med=26.54ms max=314.06ms p(90)=30.7ms  p(95)=32.12ms  p(99.9)=46.5ms 
     iterations.....................: 222454  1824.023341/s
     success_rate...................: 100.00% ✓ 222454      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 651915      ✗ 0     
     data_received..................: 19 GB   156 MB/s
     data_sent......................: 261 MB  2.1 MB/s
     http_req_blocked...............: avg=3.64µs   min=1.02µs  med=2.78µs   max=4.07ms   p(90)=4.54µs   p(95)=5.31µs  p(99.9)=37.6µs 
     http_req_connecting............: avg=459ns    min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.37ms  min=17.85ms med=26.76ms  max=312.87ms p(90)=32.05ms  p(95)=34ms    p(99.9)=51.9ms 
       { expected_response:true }...: avg=27.37ms  min=17.85ms med=26.76ms  max=312.87ms p(90)=32.05ms  p(95)=34ms    p(99.9)=51.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 217405
     http_req_receiving.............: avg=330.54µs min=50.68µs med=104.16µs max=116.36ms p(90)=822.26µs p(95)=1.33ms  p(99.9)=8.44ms 
     http_req_sending...............: avg=35.19µs  min=4.4µs   med=10.59µs  max=153.21ms p(90)=21.12µs  p(95)=66.43µs p(99.9)=1.8ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27ms     min=17.75ms med=26.41ms  max=292.57ms p(90)=31.61ms  p(95)=33.5ms  p(99.9)=50.48ms
     http_reqs......................: 217405  1782.131884/s
     iteration_duration.............: avg=27.6ms   min=18.04ms med=26.98ms  max=323.78ms p(90)=32.26ms  p(95)=34.21ms p(99.9)=52.15ms
     iterations.....................: 217305  1781.312155/s
     success_rate...................: 100.00% ✓ 217305      ✗ 0     
     vus............................: 8       min=0         max=50  
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

     checks.........................: 100.00% ✓ 470856      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 189 MB  1.5 MB/s
     http_req_blocked...............: avg=3.3µs   min=841ns   med=2.14µs  max=3.6ms    p(90)=4.43µs   p(95)=5.4µs    p(99.9)=37.53µs
     http_req_connecting............: avg=615ns   min=0s      med=0s      max=3.55ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.97ms min=17.58ms med=37.71ms max=312.48ms p(90)=44.52ms  p(95)=46.6ms   p(99.9)=60.82ms
       { expected_response:true }...: avg=37.97ms min=17.58ms med=37.71ms max=312.48ms p(90)=44.52ms  p(95)=46.6ms   p(99.9)=60.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157052
     http_req_receiving.............: avg=80.73µs min=27.08µs med=54.2µs  max=18.43ms  p(90)=119.99µs p(95)=162.05µs p(99.9)=1.72ms 
     http_req_sending...............: avg=33.88µs min=4.53µs  med=9.06µs  max=142.62ms p(90)=23.31µs  p(95)=37.91µs  p(99.9)=1.48ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.85ms min=17.5ms  med=37.61ms max=312.22ms p(90)=44.4ms   p(95)=46.47ms  p(99.9)=60.11ms
     http_reqs......................: 157052  1287.484995/s
     iteration_duration.............: avg=38.22ms min=21.74ms med=37.94ms max=331.68ms p(90)=44.74ms  p(95)=46.81ms  p(99.9)=61.37ms
     iterations.....................: 156952  1286.665212/s
     success_rate...................: 100.00% ✓ 156952      ✗ 0     
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

     checks.........................: 100.00% ✓ 441477      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 177 MB  1.5 MB/s
     http_req_blocked...............: avg=3.33µs  min=992ns   med=2.36µs  max=3.94ms   p(90)=4.03µs   p(95)=4.74µs   p(99.9)=38.3µs  
     http_req_connecting............: avg=604ns   min=0s      med=0s      max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.54ms min=18.65ms med=39.91ms max=330.08ms p(90)=48.75ms  p(95)=51.53ms  p(99.9)=66.66ms 
       { expected_response:true }...: avg=40.54ms min=18.65ms med=39.91ms max=330.08ms p(90)=48.75ms  p(95)=51.53ms  p(99.9)=66.66ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 147259
     http_req_receiving.............: avg=76.65µs min=27.34µs med=62.24µs max=137.04ms p(90)=103.51µs p(95)=121.78µs p(99.9)=844.79µs
     http_req_sending...............: avg=23.09µs min=4.64µs  med=11.14µs max=67.02ms  p(90)=18.51µs  p(95)=22.13µs  p(99.9)=937.41µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.44ms min=18.56ms med=39.81ms max=324.27ms p(90)=48.65ms  p(95)=51.42ms  p(99.9)=66.4ms  
     http_reqs......................: 147259  1207.032332/s
     iteration_duration.............: avg=40.76ms min=21.13ms med=40.12ms max=338.78ms p(90)=48.95ms  p(95)=51.73ms  p(99.9)=66.98ms 
     iterations.....................: 147159  1206.212666/s
     success_rate...................: 100.00% ✓ 147159      ✗ 0     
     vus............................: 27      min=0         max=50  
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

     checks.........................: 100.00% ✓ 206631     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 83 MB   678 kB/s
     http_req_blocked...............: avg=4.94µs  min=1.23µs  med=3.22µs  max=3.87ms   p(90)=4.76µs   p(95)=5.44µs   p(99.9)=45.71µs 
     http_req_connecting............: avg=1.45µs  min=0s      med=0s      max=3.83ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.77ms min=20.46ms med=85.36ms max=330.78ms p(90)=107.22ms p(95)=115.44ms p(99.9)=194.9ms 
       { expected_response:true }...: avg=86.77ms min=20.46ms med=85.36ms max=330.78ms p(90)=107.22ms p(95)=115.44ms p(99.9)=194.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 68977
     http_req_receiving.............: avg=87.03µs min=31.66µs med=78.57µs max=35.03ms  p(90)=114.56µs p(95)=128.33µs p(99.9)=662.49µs
     http_req_sending...............: avg=22.77µs min=5.59µs  med=14.79µs max=114.66ms p(90)=21.42µs  p(95)=23.84µs  p(99.9)=624.74µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.66ms min=20.31ms med=85.25ms max=330.45ms p(90)=107.12ms p(95)=115.33ms p(99.9)=194.59ms
     http_reqs......................: 68977   564.329421/s
     iteration_duration.............: avg=87.12ms min=38.14ms med=85.64ms max=340.58ms p(90)=107.48ms p(95)=115.7ms  p(99.9)=196.69ms
     iterations.....................: 68877   563.51128/s
     success_rate...................: 100.00% ✓ 68877      ✗ 0    
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

     checks.........................: 100.00% ✓ 145956     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   479 kB/s
     http_req_blocked...............: avg=5.06µs   min=1.07µs  med=3.09µs   max=3.64ms   p(90)=4.53µs   p(95)=5.09µs   p(99.9)=535.64µs
     http_req_connecting............: avg=1.76µs   min=0s      med=0s       max=3.6ms    p(90)=0s       p(95)=0s       p(99.9)=514.93µs
     http_req_duration..............: avg=122.87ms min=20.51ms med=120.86ms max=345.28ms p(90)=153.88ms p(95)=164.05ms p(99.9)=207.17ms
       { expected_response:true }...: avg=122.87ms min=20.51ms med=120.86ms max=345.28ms p(90)=153.88ms p(95)=164.05ms p(99.9)=207.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48752
     http_req_receiving.............: avg=84.51µs  min=31.67µs med=81.65µs  max=11.19ms  p(90)=112.1µs  p(95)=124.04µs p(99.9)=581.51µs
     http_req_sending...............: avg=30.18µs  min=5.01µs  med=17.12µs  max=131.91ms p(90)=22.51µs  p(95)=24.42µs  p(99.9)=548.91µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.76ms min=20.37ms med=120.76ms max=344.67ms p(90)=153.75ms p(95)=163.91ms p(99.9)=207.06ms
     http_reqs......................: 48752   398.505854/s
     iteration_duration.............: avg=123.35ms min=39.08ms med=121.17ms max=353.42ms p(90)=154.15ms p(95)=164.38ms p(99.9)=209.27ms
     iterations.....................: 48652   397.688439/s
     success_rate...................: 100.00% ✓ 48652      ✗ 0    
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

     checks.........................: 100.00% ✓ 95679      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=6.19µs   min=1.19µs  med=3.2µs    max=3.93ms   p(90)=4.52µs   p(95)=5.07µs   p(99.9)=1.28ms  
     http_req_connecting............: avg=2.78µs   min=0s      med=0s       max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=187.42ms min=23.32ms med=192.99ms max=404.41ms p(90)=201.32ms p(95)=205.13ms p(99.9)=283.58ms
       { expected_response:true }...: avg=187.42ms min=23.32ms med=192.99ms max=404.41ms p(90)=201.32ms p(95)=205.13ms p(99.9)=283.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31993
     http_req_receiving.............: avg=201.79µs min=31.83µs med=87.54µs  max=190.23ms p(90)=118.12µs p(95)=129.98µs p(99.9)=20.06ms 
     http_req_sending...............: avg=23.67µs  min=5.39µs  med=16.98µs  max=38.81ms  p(90)=21.8µs   p(95)=23.79µs  p(99.9)=575.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.2ms  min=23.21ms med=192.88ms max=290.35ms p(90)=201.2ms  p(95)=205.02ms p(99.9)=273.86ms
     http_reqs......................: 31993   260.838906/s
     iteration_duration.............: avg=188.23ms min=29.17ms med=193.27ms max=422.79ms p(90)=201.62ms p(95)=205.44ms p(99.9)=287.53ms
     iterations.....................: 31893   260.023606/s
     success_rate...................: 100.00% ✓ 31893      ✗ 0    
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

     checks.........................: 100.00% ✓ 92376      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   304 kB/s
     http_req_blocked...............: avg=7.52µs   min=1.26µs  med=3.7µs    max=4.14ms   p(90)=5.14µs   p(95)=5.76µs   p(99.9)=1.86ms  
     http_req_connecting............: avg=3.5µs    min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=1.83ms  
     http_req_duration..............: avg=194.1ms  min=18.38ms med=182.23ms max=591.99ms p(90)=230.85ms p(95)=262.35ms p(99.9)=558.08ms
       { expected_response:true }...: avg=194.1ms  min=18.38ms med=182.23ms max=591.99ms p(90)=230.85ms p(95)=262.35ms p(99.9)=558.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30892
     http_req_receiving.............: avg=99.03µs  min=37.44µs med=92.48µs  max=43.98ms  p(90)=123.77µs p(95)=135.91µs p(99.9)=581.98µs
     http_req_sending...............: avg=30.97µs  min=6.32µs  med=18.59µs  max=137.31ms p(90)=23.19µs  p(95)=25.21µs  p(99.9)=460.24µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.97ms min=18.25ms med=182.1ms  max=591.88ms p(90)=230.72ms p(95)=262.27ms p(99.9)=557.98ms
     http_reqs......................: 30892   252.744383/s
     iteration_duration.............: avg=194.95ms min=59.35ms med=182.62ms max=592.35ms p(90)=231.23ms p(95)=263.16ms p(99.9)=558.38ms
     iterations.....................: 30792   251.926228/s
     success_rate...................: 100.00% ✓ 30792      ✗ 0    
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

     checks.........................: 100.00% ✓ 6525      ✗ 0   
     data_received..................: 218 MB  1.7 MB/s
     data_sent......................: 2.7 MB  22 kB/s
     http_req_blocked...............: avg=124.03µs min=1.61µs   med=3.73µs  max=8.36ms  p(90)=5.44µs   p(95)=6.29µs   p(99.9)=7.5ms   
     http_req_connecting............: avg=114.02µs min=0s       med=0s      max=8.31ms  p(90)=0s       p(95)=0s       p(99.9)=7.47ms  
     http_req_duration..............: avg=2.66s    min=43.56ms  med=2.74s   max=4.5s    p(90)=3.4s     p(95)=3.64s    p(99.9)=4.38s   
       { expected_response:true }...: avg=2.66s    min=43.56ms  med=2.74s   max=4.5s    p(90)=3.4s     p(95)=3.64s    p(99.9)=4.38s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2275
     http_req_receiving.............: avg=105.22µs min=38.52µs  med=93.2µs  max=16.19ms p(90)=138.19µs p(95)=155.03µs p(99.9)=341.92µs
     http_req_sending...............: avg=77.52µs  min=8.53µs   med=19.35µs max=24.05ms p(90)=25.22µs  p(95)=30.25µs  p(99.9)=11.41ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.66s    min=43.4ms   med=2.74s   max=4.5s    p(90)=3.4s     p(95)=3.64s    p(99.9)=4.38s   
     http_reqs......................: 2275    17.893407/s
     iteration_duration.............: avg=2.78s    min=412.68ms med=2.77s   max=4.5s    p(90)=3.43s    p(95)=3.65s    p(99.9)=4.38s   
     iterations.....................: 2175    17.106884/s
     success_rate...................: 100.00% ✓ 2175      ✗ 0   
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

