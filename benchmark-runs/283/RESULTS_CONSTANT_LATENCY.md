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
| fusion-nightly | 16.5.0-p.18 | 1,856 | 1,908 | 1,853 | 1.0% |  |
| hive-router | v0.0.78 | 1,846 | 1,907 | 1,837 | 1.2% |  |
| fusion-nightly-net11 | 16.5.0-p.18 | 1,835 | 1,889 | 1,827 | 1.2% |  |
| fusion | 16.4.0 | 1,830 | 1,884 | 1,824 | 1.2% |  |
| fusion-nightly-fed | 16.5.0-p.18 | 1,747 | 1,793 | 1,731 | 1.2% |  |
| grafbase | 0.53.5 | 1,321 | 1,355 | 1,309 | 1.2% |  |
| cosmo | 0.329.0 | 1,160 | 1,207 | 1,152 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.2 | 544 | 568 | 542 | 1.6% |  |
| apollo-router | v2.16.0 | 432 | 449 | 431 | 1.4% |  |
| apollo-gateway | 2.14.2 | 261 | 264 | 260 | 0.5% |  |
| hive-gateway | 2.10.2 | 259 | 267 | 257 | 1.5% |  |
| feddi | 5ff8b6165878 | 22 | 23 | 21 | 3.2% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 678795      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=3.33µs   min=1.03µs  med=2.69µs   max=8.01ms   p(90)=4.35µs   p(95)=5.09µs  p(99.9)=38.1µs 
     http_req_connecting............: avg=208ns    min=0s      med=0s       max=2.36ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.27ms  min=17.36ms med=25.66ms  max=309ms    p(90)=30.8ms   p(95)=32.72ms p(99.9)=50.33ms
       { expected_response:true }...: avg=26.27ms  min=17.36ms med=25.66ms  max=309ms    p(90)=30.8ms   p(95)=32.72ms p(99.9)=50.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226365
     http_req_receiving.............: avg=341.29µs min=51.16µs med=102.98µs max=211.79ms p(90)=848.44µs p(95)=1.36ms  p(99.9)=9.01ms 
     http_req_sending...............: avg=35.39µs  min=4.85µs  med=10.14µs  max=115.65ms p(90)=19.7µs   p(95)=43.45µs p(99.9)=1.83ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.9ms   min=17.25ms med=25.31ms  max=308.17ms p(90)=30.35ms  p(95)=32.22ms p(99.9)=48.46ms
     http_reqs......................: 226365  1856.349585/s
     iteration_duration.............: avg=26.5ms   min=17.56ms med=25.88ms  max=321.47ms p(90)=31.01ms  p(95)=32.93ms p(99.9)=50.77ms
     iterations.....................: 226265  1855.529516/s
     success_rate...................: 100.00% ✓ 226265      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 675030      ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=3.43µs  min=891ns   med=2.52µs  max=8.15ms   p(90)=4.39µs  p(95)=5.17µs   p(99.9)=36.66µs
     http_req_connecting............: avg=435ns   min=0s      med=0s      max=3.75ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.43ms min=17.58ms med=25.97ms max=299.65ms p(90)=30.18ms p(95)=31.63ms  p(99.9)=48.31ms
       { expected_response:true }...: avg=26.43ms min=17.58ms med=25.97ms max=299.65ms p(90)=30.18ms p(95)=31.63ms  p(99.9)=48.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 225110
     http_req_receiving.............: avg=77.78µs min=24.34µs med=51.93µs max=219.23ms p(90)=97.04µs p(95)=125.48µs p(99.9)=1.96ms 
     http_req_sending...............: avg=33.56µs min=4.24µs  med=9.97µs  max=223.67ms p(90)=19.36µs p(95)=27.69µs  p(99.9)=1.44ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.32ms min=17.29ms med=25.87ms max=295.88ms p(90)=30.06ms p(95)=31.51ms  p(99.9)=47.16ms
     http_reqs......................: 225110  1846.000277/s
     iteration_duration.............: avg=26.65ms min=18.34ms med=26.17ms max=309.75ms p(90)=30.38ms p(95)=31.84ms  p(99.9)=48.65ms
     iterations.....................: 225010  1845.180234/s
     success_rate...................: 100.00% ✓ 225010      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 670941      ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=3.39µs   min=1µs     med=2.55µs  max=5.43ms   p(90)=4.16µs   p(95)=4.91µs  p(99.9)=32.61µs
     http_req_connecting............: avg=447ns    min=0s      med=0s      max=3.78ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.59ms  min=17.06ms med=26.02ms max=302.86ms p(90)=31.01ms  p(95)=32.86ms p(99.9)=51.36ms
       { expected_response:true }...: avg=26.59ms  min=17.06ms med=26.02ms max=302.86ms p(90)=31.01ms  p(95)=32.86ms p(99.9)=51.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223747
     http_req_receiving.............: avg=361.69µs min=51.71µs med=101.5µs max=38.54ms  p(90)=967.28µs p(95)=1.52ms  p(99.9)=8.82ms 
     http_req_sending...............: avg=33.58µs  min=4.63µs  med=9.51µs  max=146.68ms p(90)=18.39µs  p(95)=34.86µs p(99.9)=1.67ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.2ms   min=16.92ms med=25.64ms max=302.34ms p(90)=30.52ms  p(95)=32.33ms p(99.9)=49.34ms
     http_reqs......................: 223747  1835.16409/s
     iteration_duration.............: avg=26.81ms  min=17.27ms med=26.22ms max=315.13ms p(90)=31.22ms  p(95)=33.08ms p(99.9)=51.85ms
     iterations.....................: 223647  1834.343894/s
     success_rate...................: 100.00% ✓ 223647      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.4.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 669090      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 268 MB  2.2 MB/s
     http_req_blocked...............: avg=2.83µs   min=902ns   med=2.01µs   max=5.5ms    p(90)=3.62µs   p(95)=4.32µs  p(99.9)=27.16µs
     http_req_connecting............: avg=412ns    min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.67ms  min=17.81ms med=26.09ms  max=296.49ms p(90)=31.21ms  p(95)=33.1ms  p(99.9)=50.23ms
       { expected_response:true }...: avg=26.67ms  min=17.81ms med=26.09ms  max=296.49ms p(90)=31.21ms  p(95)=33.1ms  p(99.9)=50.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223130
     http_req_receiving.............: avg=340.41µs min=50.86µs med=100.19µs max=27.57ms  p(90)=881.02µs p(95)=1.36ms  p(99.9)=8.11ms 
     http_req_sending...............: avg=29.99µs  min=4.67µs  med=8.7µs    max=81.56ms  p(90)=18.17µs  p(95)=26.98µs p(99.9)=1.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.3ms   min=17.62ms med=25.73ms  max=296.29ms p(90)=30.77ms  p(95)=32.61ms p(99.9)=48.9ms 
     http_reqs......................: 223130  1830.023852/s
     iteration_duration.............: avg=26.89ms  min=17.99ms med=26.29ms  max=315.97ms p(90)=31.41ms  p(95)=33.3ms  p(99.9)=50.6ms 
     iterations.....................: 223030  1829.203692/s
     success_rate...................: 100.00% ✓ 223030      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 639111      ✗ 0     
     data_received..................: 19 GB   153 MB/s
     data_sent......................: 256 MB  2.1 MB/s
     http_req_blocked...............: avg=2.79µs   min=861ns   med=2.04µs  max=5.92ms   p(90)=3.82µs   p(95)=4.56µs  p(99.9)=30.51µs
     http_req_connecting............: avg=297ns    min=0s      med=0s      max=3.1ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.93ms  min=18.27ms med=27.37ms max=305.43ms p(90)=32.71ms  p(95)=34.57ms p(99.9)=51.2ms 
       { expected_response:true }...: avg=27.93ms  min=18.27ms med=27.37ms max=305.43ms p(90)=32.71ms  p(95)=34.57ms p(99.9)=51.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 213137
     http_req_receiving.............: avg=332.02µs min=49.26µs med=99.18µs max=42.16ms  p(90)=863.32µs p(95)=1.38ms  p(99.9)=7.81ms 
     http_req_sending...............: avg=30.26µs  min=4.57µs  med=8.72µs  max=127.71ms p(90)=19.11µs  p(95)=28.3µs  p(99.9)=1.43ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.57ms  min=18.14ms med=27.03ms max=304.99ms p(90)=32.28ms  p(95)=34.1ms  p(99.9)=49.25ms
     http_reqs......................: 213137  1747.391994/s
     iteration_duration.............: avg=28.15ms  min=18.63ms med=27.58ms max=323.45ms p(90)=32.91ms  p(95)=34.77ms p(99.9)=51.74ms
     iterations.....................: 213037  1746.57215/s
     success_rate...................: 100.00% ✓ 213037      ✗ 0     
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

     checks.........................: 100.00% ✓ 483321      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 194 MB  1.6 MB/s
     http_req_blocked...............: avg=4.26µs  min=1.01µs  med=3.03µs  max=3.55ms   p(90)=5.43µs  p(95)=6.45µs   p(99.9)=50.18µs
     http_req_connecting............: avg=664ns   min=0s      med=0s      max=3.51ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=36.96ms min=18.32ms med=36.6ms  max=320.58ms p(90)=43.54ms p(95)=45.63ms  p(99.9)=64.96ms
       { expected_response:true }...: avg=36.96ms min=18.32ms med=36.6ms  max=320.58ms p(90)=43.54ms p(95)=45.63ms  p(99.9)=64.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 161207
     http_req_receiving.............: avg=92.56µs min=27.12µs med=61.94µs max=53.56ms  p(90)=130.9µs p(95)=180.71µs p(99.9)=2.23ms 
     http_req_sending...............: avg=38.34µs min=4.75µs  med=11.53µs max=132.4ms  p(90)=25.63µs p(95)=81.86µs  p(99.9)=2.25ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=36.83ms min=18.13ms med=36.48ms max=320.07ms p(90)=43.4ms  p(95)=45.49ms  p(99.9)=63.98ms
     http_reqs......................: 161207  1321.414404/s
     iteration_duration.............: avg=37.23ms min=19.98ms med=36.85ms max=334.12ms p(90)=43.77ms p(95)=45.86ms  p(99.9)=65.36ms
     iterations.....................: 161107  1320.594703/s
     success_rate...................: 100.00% ✓ 161107      ✗ 0     
     vus............................: 28      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 424308      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.94µs  min=1.1µs   med=2.9µs   max=4.36ms   p(90)=4.46µs   p(95)=5.17µs  p(99.9)=39.38µs 
     http_req_connecting............: avg=714ns   min=0s      med=0s      max=4.31ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=42.16ms min=18.44ms med=41.56ms max=324.24ms p(90)=50.99ms  p(95)=54.07ms p(99.9)=69.6ms  
       { expected_response:true }...: avg=42.16ms min=18.44ms med=41.56ms max=324.24ms p(90)=50.99ms  p(95)=54.07ms p(99.9)=69.6ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 141536
     http_req_receiving.............: avg=81.74µs min=28.55µs med=68.02µs max=41.11ms  p(90)=109.95µs p(95)=128.7µs p(99.9)=958.61µs
     http_req_sending...............: avg=27.97µs min=5.25µs  med=12.83µs max=124.93ms p(90)=20.09µs  p(95)=24.07µs p(99.9)=913.42µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=42.05ms min=18.29ms med=41.46ms max=323.68ms p(90)=50.89ms  p(95)=53.95ms p(99.9)=69.09ms 
     http_reqs......................: 141536  1160.158849/s
     iteration_duration.............: avg=42.41ms min=22.78ms med=41.78ms max=331.65ms p(90)=51.21ms  p(95)=54.29ms p(99.9)=70.02ms 
     iterations.....................: 141436  1159.339158/s
     success_rate...................: 100.00% ✓ 141436      ✗ 0     
     vus............................: 19      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 199236     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 80 MB   653 kB/s
     http_req_blocked...............: avg=5.21µs  min=1.23µs  med=3.38µs  max=3.64ms   p(90)=4.99µs   p(95)=5.67µs   p(99.9)=51.1µs  
     http_req_connecting............: avg=1.55µs  min=0s      med=0s      max=3.6ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=89.99ms min=20.67ms med=88.64ms max=333.61ms p(90)=106.86ms p(95)=116.13ms p(99.9)=207.03ms
       { expected_response:true }...: avg=89.99ms min=20.67ms med=88.64ms max=333.61ms p(90)=106.86ms p(95)=116.13ms p(99.9)=207.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 66512
     http_req_receiving.............: avg=86.03µs min=30.27µs med=78.6µs  max=16.34ms  p(90)=114.57µs p(95)=128.95µs p(99.9)=696.29µs
     http_req_sending...............: avg=29.09µs min=6µs     med=15.85µs max=164.47ms p(90)=22.46µs  p(95)=24.75µs  p(99.9)=616.29µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.87ms min=20.57ms med=88.54ms max=332.93ms p(90)=106.74ms p(95)=116.02ms p(99.9)=206.81ms
     http_reqs......................: 66512   544.021006/s
     iteration_duration.............: avg=90.35ms min=41.58ms med=88.9ms  max=342.2ms  p(90)=107.12ms p(95)=116.41ms p(99.9)=208.23ms
     iterations.....................: 66412   543.203077/s
     success_rate...................: 100.00% ✓ 66412      ✗ 0    
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

     checks.........................: 100.00% ✓ 158463     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 64 MB   520 kB/s
     http_req_blocked...............: avg=6.13µs   min=1.48µs  med=3.88µs   max=4.56ms   p(90)=5.54µs   p(95)=6.16µs   p(99.9)=71.83µs 
     http_req_connecting............: avg=1.98µs   min=0s      med=0s       max=4.52ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=113.15ms min=20.59ms med=111.34ms max=357.54ms p(90)=141.04ms p(95)=150.54ms p(99.9)=189.66ms
       { expected_response:true }...: avg=113.15ms min=20.59ms med=111.34ms max=357.54ms p(90)=141.04ms p(95)=150.54ms p(99.9)=189.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52921
     http_req_receiving.............: avg=90.2µs   min=31.93µs med=83.66µs  max=122.79ms p(90)=116.08µs p(95)=128.95µs p(99.9)=574.34µs
     http_req_sending...............: avg=30.55µs  min=5.42µs  med=17.82µs  max=109.44ms p(90)=23.64µs  p(95)=25.77µs  p(99.9)=615.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=113.03ms min=20.42ms med=111.22ms max=356.94ms p(90)=140.91ms p(95)=150.37ms p(99.9)=189.55ms
     http_reqs......................: 52921   432.661675/s
     iteration_duration.............: avg=113.61ms min=34.15ms med=111.66ms max=364.81ms p(90)=141.34ms p(95)=150.88ms p(99.9)=192.46ms
     iterations.....................: 52821   431.844114/s
     success_rate...................: 100.00% ✓ 52821      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 95937      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   314 kB/s
     http_req_blocked...............: avg=6.16µs   min=1.15µs  med=3.24µs   max=3.38ms   p(90)=4.66µs   p(95)=5.24µs   p(99.9)=1.34ms  
     http_req_connecting............: avg=2.67µs   min=0s      med=0s       max=3.34ms   p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=186.91ms min=23.49ms med=184.52ms max=425.63ms p(90)=212.45ms p(95)=217.63ms p(99.9)=289.23ms
       { expected_response:true }...: avg=186.91ms min=23.49ms med=184.52ms max=425.63ms p(90)=212.45ms p(95)=217.63ms p(99.9)=289.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32079
     http_req_receiving.............: avg=95.86µs  min=32.11µs med=88.76µs  max=139.77ms p(90)=119.53µs p(95)=131.87µs p(99.9)=478.2µs 
     http_req_sending...............: avg=31.63µs  min=5.39µs  med=17.54µs  max=102.94ms p(90)=22.09µs  p(95)=23.88µs  p(99.9)=616.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.78ms min=23.35ms med=184.39ms max=424.89ms p(90)=212.34ms p(95)=217.51ms p(99.9)=287.68ms
     http_reqs......................: 32079   261.506415/s
     iteration_duration.............: avg=187.72ms min=48.92ms med=185.3ms  max=432.66ms p(90)=212.75ms p(95)=217.94ms p(99.9)=294.68ms
     iterations.....................: 31979   260.69122/s
     success_rate...................: 100.00% ✓ 31979      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94650      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   311 kB/s
     http_req_blocked...............: avg=6.72µs   min=1.41µs  med=3.76µs   max=3.43ms   p(90)=5.28µs   p(95)=5.9µs    p(99.9)=1.33ms  
     http_req_connecting............: avg=2.69µs   min=0s      med=0s       max=3.39ms   p(90)=0s       p(95)=0s       p(99.9)=1.31ms  
     http_req_duration..............: avg=189.44ms min=18.45ms med=177.32ms max=714.42ms p(90)=223.43ms p(95)=252.69ms p(99.9)=607.44ms
       { expected_response:true }...: avg=189.44ms min=18.45ms med=177.32ms max=714.42ms p(90)=223.43ms p(95)=252.69ms p(99.9)=607.44ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31650
     http_req_receiving.............: avg=100.87µs min=35.03µs med=93.59µs  max=53.92ms  p(90)=126.66µs p(95)=140.94µs p(99.9)=633.54µs
     http_req_sending...............: avg=29.43µs  min=6.43µs  med=19.58µs  max=110.12ms p(90)=24.7µs   p(95)=26.78µs  p(99.9)=457.03µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.31ms min=18.35ms med=177.2ms  max=714.33ms p(90)=223.29ms p(95)=252.44ms p(99.9)=607.32ms
     http_reqs......................: 31650   259.192094/s
     iteration_duration.............: avg=190.28ms min=30.92ms med=177.72ms max=714.69ms p(90)=223.8ms  p(95)=254.41ms p(99.9)=607.88ms
     iterations.....................: 31550   258.373162/s
     success_rate...................: 100.00% ✓ 31550      ✗ 0    
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

     checks.........................: 100.00% ✓ 8136      ✗ 0   
     data_received..................: 269 MB  2.1 MB/s
     data_sent......................: 3.4 MB  27 kB/s
     http_req_blocked...............: avg=37.63µs min=1.24µs   med=3.18µs  max=3.74ms  p(90)=4.63µs  p(95)=5.42µs  p(99.9)=3.42ms  
     http_req_connecting............: avg=33.63µs min=0s       med=0s      max=3.7ms   p(90)=0s      p(95)=0s      p(99.9)=3.4ms   
     http_req_duration..............: avg=2.15s   min=38.34ms  med=2.21s   max=3.74s   p(90)=2.85s   p(95)=3.05s   p(99.9)=3.67s   
       { expected_response:true }...: avg=2.15s   min=38.34ms  med=2.21s   max=3.74s   p(90)=2.85s   p(95)=3.05s   p(99.9)=3.67s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2812
     http_req_receiving.............: avg=98.47µs min=34.28µs  med=91.73µs max=5.62ms  p(90)=133.9µs p(95)=152.3µs p(99.9)=600.22µs
     http_req_sending...............: avg=60.5µs  min=5.86µs   med=17.84µs max=29.88ms p(90)=22.71µs p(95)=26.22µs p(99.9)=10.39ms 
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s      p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=2.15s   min=38.09ms  med=2.21s   max=3.74s   p(90)=2.85s   p(95)=3.05s   p(99.9)=3.67s   
     http_reqs......................: 2812    22.166059/s
     iteration_duration.............: avg=2.23s   min=284.43ms med=2.24s   max=3.74s   p(90)=2.86s   p(95)=3.07s   p(99.9)=3.67s   
     iterations.....................: 2712    21.377792/s
     success_rate...................: 100.00% ✓ 2712      ✗ 0   
     vus............................: 40      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

