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
| fusion | 16.6.6 | 1,880 | 1,936 | 1,872 | 1.1% |  |
| fusion-nightly-net11 | 16.7.0-p.9 | 1,880 | 1,932 | 1,868 | 1.3% |  |
| fusion-nightly | 16.7.0-p.9 | 1,865 | 1,915 | 1,854 | 1.1% |  |
| hive-router | v0.0.84 | 1,830 | 1,894 | 1,800 | 1.7% |  |
| fusion-nightly-fed | 16.7.0-p.9 | 1,798 | 1,849 | 1,783 | 1.2% |  |
| grafbase | 0.53.5 | 1,275 | 1,310 | 1,272 | 1.1% |  |
| cosmo | 0.334.0 | 1,173 | 1,222 | 1,170 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 567 | 586 | 562 | 1.3% |  |
| apollo-router | v2.16.1 | 426 | 450 | 412 | 2.8% |  |
| apollo-gateway | 2.14.3 | 260 | 263 | 257 | 0.7% |  |
| hive-gateway | 2.10.8 | 258 | 263 | 257 | 0.8% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 19 | 3.0% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687600      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=3.01µs   min=881ns   med=2.2µs   max=3.85ms   p(90)=3.84µs   p(95)=4.58µs  p(99.9)=27.4µs 
     http_req_connecting............: avg=438ns    min=0s      med=0s      max=3.8ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.95ms  min=17.07ms med=25.36ms max=316.47ms p(90)=30.3ms   p(95)=32.11ms p(99.9)=49.85ms
       { expected_response:true }...: avg=25.95ms  min=17.07ms med=25.36ms max=316.47ms p(90)=30.3ms   p(95)=32.11ms p(99.9)=49.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229300
     http_req_receiving.............: avg=309.57µs min=51.43µs med=96.38µs max=157.91ms p(90)=769.16µs p(95)=1.27ms  p(99.9)=8.52ms 
     http_req_sending...............: avg=31.57µs  min=4.47µs  med=8.83µs  max=157.64ms p(90)=18.22µs  p(95)=28.18µs p(99.9)=1.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.61ms  min=16.97ms med=25.04ms max=316.03ms p(90)=29.9ms   p(95)=31.67ms p(99.9)=48.16ms
     http_reqs......................: 229300  1880.342488/s
     iteration_duration.............: avg=26.16ms  min=17.21ms med=25.56ms max=327.05ms p(90)=30.5ms   p(95)=32.32ms p(99.9)=50.35ms
     iterations.....................: 229200  1879.522452/s
     success_rate...................: 100.00% ✓ 229200      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687324      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.34µs   min=982ns   med=2.55µs  max=3.87ms   p(90)=4.24µs  p(95)=4.98µs  p(99.9)=38.11µs
     http_req_connecting............: avg=375ns    min=0s      med=0s      max=3.4ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.95ms  min=17.44ms med=25.36ms max=311.24ms p(90)=30.19ms p(95)=32.03ms p(99.9)=51.32ms
       { expected_response:true }...: avg=25.95ms  min=17.44ms med=25.36ms max=311.24ms p(90)=30.19ms p(95)=32.03ms p(99.9)=51.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229208
     http_req_receiving.............: avg=403.12µs min=50.26µs med=95.87µs max=189.85ms p(90)=1.15ms  p(95)=1.92ms  p(99.9)=10.32ms
     http_req_sending...............: avg=35.75µs  min=4.78µs  med=9.88µs  max=76.61ms  p(90)=20.52µs p(95)=69.6µs  p(99.9)=2.32ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.51ms  min=17.32ms med=24.95ms max=293.71ms p(90)=29.6ms  p(95)=31.36ms p(99.9)=48.86ms
     http_reqs......................: 229208  1880.045827/s
     iteration_duration.............: avg=26.17ms  min=17.68ms med=25.57ms max=320.38ms p(90)=30.4ms  p(95)=32.24ms p(99.9)=52.04ms
     iterations.....................: 229108  1879.225592/s
     success_rate...................: 100.00% ✓ 229108      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 682122      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=2.7µs    min=852ns   med=1.92µs  max=3.58ms   p(90)=3.6µs   p(95)=4.33µs  p(99.9)=28.27µs
     http_req_connecting............: avg=368ns    min=0s      med=0s      max=3.54ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.17ms  min=17.38ms med=25.59ms max=300.34ms p(90)=30.59ms p(95)=32.39ms p(99.9)=49.64ms
       { expected_response:true }...: avg=26.17ms  min=17.38ms med=25.59ms max=300.34ms p(90)=30.59ms p(95)=32.39ms p(99.9)=49.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227474
     http_req_receiving.............: avg=323.05µs min=48.96µs med=95.07µs max=202.16ms p(90)=822.5µs p(95)=1.31ms  p(99.9)=8.16ms 
     http_req_sending...............: avg=29.69µs  min=4.34µs  med=8.25µs  max=179ms    p(90)=17.86µs p(95)=26.98µs p(99.9)=1.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.81ms  min=17.13ms med=25.26ms max=295.16ms p(90)=30.17ms p(95)=31.92ms p(99.9)=47.16ms
     http_reqs......................: 227474  1865.532895/s
     iteration_duration.............: avg=26.38ms  min=17.62ms med=25.79ms max=316.71ms p(90)=30.79ms p(95)=32.58ms p(99.9)=50.1ms 
     iterations.....................: 227374  1864.712787/s
     success_rate...................: 100.00% ✓ 227374      ✗ 0     
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

     checks.........................: 100.00% ✓ 669315      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 268 MB  2.2 MB/s
     http_req_blocked...............: avg=2.91µs  min=902ns   med=2.1µs   max=3.69ms   p(90)=3.75µs  p(95)=4.48µs   p(99.9)=31.91µs
     http_req_connecting............: avg=420ns   min=0s      med=0s      max=3.65ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.67ms min=18.01ms med=26.24ms max=299.48ms p(90)=30.41ms p(95)=31.83ms  p(99.9)=46.97ms
       { expected_response:true }...: avg=26.67ms min=18.01ms med=26.24ms max=299.48ms p(90)=30.41ms p(95)=31.83ms  p(99.9)=46.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223205
     http_req_receiving.............: avg=80.24µs min=26.51µs med=50.96µs max=170.64ms p(90)=92.29µs p(95)=116.44µs p(99.9)=1.71ms 
     http_req_sending...............: avg=30.21µs min=4.69µs  med=9.02µs  max=67.46ms  p(90)=17.1µs  p(95)=23.52µs  p(99.9)=1.38ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.56ms min=17.9ms  med=26.15ms max=298.84ms p(90)=30.3ms  p(95)=31.71ms  p(99.9)=45.76ms
     http_reqs......................: 223205  1830.371972/s
     iteration_duration.............: avg=26.88ms min=18.17ms med=26.44ms max=309.82ms p(90)=30.61ms p(95)=32.03ms  p(99.9)=47.25ms
     iterations.....................: 223105  1829.551932/s
     success_rate...................: 100.00% ✓ 223105      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 657969      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 264 MB  2.2 MB/s
     http_req_blocked...............: avg=2.87µs   min=911ns   med=2.07µs  max=3.38ms   p(90)=3.76µs   p(95)=4.5µs   p(99.9)=31.81µs
     http_req_connecting............: avg=400ns    min=0s      med=0s      max=3.33ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.12ms  min=17.49ms med=26.54ms max=295.4ms  p(90)=31.76ms  p(95)=33.62ms p(99.9)=48.74ms
       { expected_response:true }...: avg=27.12ms  min=17.49ms med=26.54ms max=295.4ms  p(90)=31.76ms  p(95)=33.62ms p(99.9)=48.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 219423
     http_req_receiving.............: avg=319.67µs min=50.16µs med=98.91µs max=141.95ms p(90)=817.02µs p(95)=1.29ms  p(99.9)=7.43ms 
     http_req_sending...............: avg=31.72µs  min=4.71µs  med=8.65µs  max=175.14ms p(90)=18.55µs  p(95)=29.15µs p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.77ms  min=17.37ms med=26.21ms max=278.9ms  p(90)=31.34ms  p(95)=33.17ms p(99.9)=47ms   
     http_reqs......................: 219423  1798.872567/s
     iteration_duration.............: avg=27.34ms  min=17.66ms med=26.75ms max=306.04ms p(90)=31.97ms  p(95)=33.82ms p(99.9)=49.08ms
     iterations.....................: 219323  1798.052748/s
     success_rate...................: 100.00% ✓ 219323      ✗ 0     
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

     checks.........................: 100.00% ✓ 466584      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 187 MB  1.5 MB/s
     http_req_blocked...............: avg=4.08µs  min=972ns   med=2.9µs   max=3.79ms   p(90)=5.32µs  p(95)=6.33µs   p(99.9)=44.9µs 
     http_req_connecting............: avg=609ns   min=0s      med=0s      max=3.75ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.3ms  min=18.26ms med=38.11ms max=313.33ms p(90)=45.16ms p(95)=47.33ms  p(99.9)=63.03ms
       { expected_response:true }...: avg=38.3ms  min=18.26ms med=38.11ms max=313.33ms p(90)=45.16ms p(95)=47.33ms  p(99.9)=63.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155628
     http_req_receiving.............: avg=93.15µs min=26.83µs med=60.39µs max=229.94ms p(90)=130.8µs p(95)=183.96µs p(99.9)=2.2ms  
     http_req_sending...............: avg=35.23µs min=4.58µs  med=10.81µs max=88.9ms   p(90)=24.7µs  p(95)=72.96µs  p(99.9)=1.85ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.17ms min=18.11ms med=37.99ms max=312.86ms p(90)=45.04ms p(95)=47.18ms  p(99.9)=61.78ms
     http_reqs......................: 155628  1275.753988/s
     iteration_duration.............: avg=38.56ms min=21.12ms med=38.35ms max=322.32ms p(90)=45.39ms p(95)=47.55ms  p(99.9)=63.66ms
     iterations.....................: 155528  1274.934242/s
     success_rate...................: 100.00% ✓ 155528      ✗ 0     
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

     checks.........................: 100.00% ✓ 429138      ✗ 0     
     data_received..................: 13 GB   103 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.3µs    min=1.03µs  med=2.28µs  max=3.83ms   p(90)=3.95µs   p(95)=4.66µs   p(99.9)=35.62µs 
     http_req_connecting............: avg=669ns    min=0s      med=0s      max=3.79ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.71ms  min=18.61ms med=41.07ms max=303.5ms  p(90)=50.34ms  p(95)=53.32ms  p(99.9)=68.85ms 
       { expected_response:true }...: avg=41.71ms  min=18.61ms med=41.07ms max=303.5ms  p(90)=50.34ms  p(95)=53.32ms  p(99.9)=68.85ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 143146
     http_req_receiving.............: avg=107.16µs min=26.1µs  med=64.13µs max=202.56ms p(90)=108.32µs p(95)=127.36µs p(99.9)=959.3µs 
     http_req_sending...............: avg=22.09µs  min=4.88µs  med=10.47µs max=60.52ms  p(90)=17.71µs  p(95)=21.5µs   p(99.9)=938.28µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.58ms  min=18.56ms med=40.98ms max=154.22ms p(90)=50.23ms  p(95)=53.22ms  p(99.9)=68.44ms 
     http_reqs......................: 143146  1173.263279/s
     iteration_duration.............: avg=41.93ms  min=18.79ms med=41.28ms max=330.45ms p(90)=50.54ms  p(95)=53.53ms  p(99.9)=69.49ms 
     iterations.....................: 143046  1172.443652/s
     success_rate...................: 100.00% ✓ 143046      ✗ 0     
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

     checks.........................: 100.00% ✓ 207696     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 83 MB   681 kB/s
     http_req_blocked...............: avg=5.19µs  min=1.32µs  med=3.49µs  max=3.64ms   p(90)=5.21µs   p(95)=5.92µs   p(99.9)=49.96µs 
     http_req_connecting............: avg=1.41µs  min=0s      med=0s      max=3.6ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.32ms min=20.6ms  med=84.14ms max=336.43ms p(90)=106.29ms p(95)=115.77ms p(99.9)=205.58ms
       { expected_response:true }...: avg=86.32ms min=20.6ms  med=84.14ms max=336.43ms p(90)=106.29ms p(95)=115.77ms p(99.9)=205.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69332
     http_req_receiving.............: avg=88.56µs min=31.78µs med=80.03µs max=86.84ms  p(90)=117.08µs p(95)=131.31µs p(99.9)=697.18µs
     http_req_sending...............: avg=27.42µs min=5.78µs  med=16.64µs max=116.15ms p(90)=23.59µs  p(95)=26.05µs  p(99.9)=661.46µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.2ms  min=20.48ms med=84.02ms max=335.74ms p(90)=106.17ms p(95)=115.64ms p(99.9)=205.23ms
     http_reqs......................: 69332   567.122761/s
     iteration_duration.............: avg=86.68ms min=33.94ms med=84.42ms max=347.9ms  p(90)=106.56ms p(95)=116.06ms p(99.9)=208.67ms
     iterations.....................: 69232   566.30478/s
     success_rate...................: 100.00% ✓ 69232      ✗ 0    
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

     checks.........................: 100.00% ✓ 156090     ✗ 0    
     data_received..................: 4.6 GB  37 MB/s
     data_sent......................: 63 MB   512 kB/s
     http_req_blocked...............: avg=5.86µs   min=1.17µs  med=3.56µs   max=5.08ms   p(90)=5.05µs   p(95)=5.68µs   p(99.9)=154.72µs
     http_req_connecting............: avg=2.04µs   min=0s      med=0s       max=5.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.89ms min=20.78ms med=112.9ms  max=335.58ms p(90)=143.46ms p(95)=152.93ms p(99.9)=193.64ms
       { expected_response:true }...: avg=114.89ms min=20.78ms med=112.9ms  max=335.58ms p(90)=143.46ms p(95)=152.93ms p(99.9)=193.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52130
     http_req_receiving.............: avg=86.55µs  min=25.84µs med=80.02µs  max=88.3ms   p(90)=112.44µs p(95)=124.43µs p(99.9)=515.54µs
     http_req_sending...............: avg=28.61µs  min=5.29µs  med=16.49µs  max=122.79ms p(90)=22.12µs  p(95)=24.2µs   p(99.9)=613.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.78ms min=20.71ms med=112.79ms max=335.3ms  p(90)=143.34ms p(95)=152.8ms  p(99.9)=193.1ms 
     http_reqs......................: 52130   426.27503/s
     iteration_duration.............: avg=115.34ms min=27.05ms med=113.19ms max=344.82ms p(90)=143.77ms p(95)=153.23ms p(99.9)=195.38ms
     iterations.....................: 52030   425.457315/s
     success_rate...................: 100.00% ✓ 52030      ✗ 0    
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

     checks.........................: 100.00% ✓ 95541      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=6.91µs   min=1.49µs  med=3.65µs   max=4.18ms   p(90)=5.13µs   p(95)=5.73µs   p(99.9)=1.31ms  
     http_req_connecting............: avg=2.97µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=1.27ms  
     http_req_duration..............: avg=187.7ms  min=23.39ms med=186.62ms max=393.8ms  p(90)=202.09ms p(95)=207.58ms p(99.9)=281.61ms
       { expected_response:true }...: avg=187.7ms  min=23.39ms med=186.62ms max=393.8ms  p(90)=202.09ms p(95)=207.58ms p(99.9)=281.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31947
     http_req_receiving.............: avg=106.01µs min=36.18µs med=90.51µs  max=165.84ms p(90)=123.77µs p(95)=137.42µs p(99.9)=642.35µs
     http_req_sending...............: avg=37.7µs   min=6.57µs  med=17.82µs  max=117.65ms p(90)=22.91µs  p(95)=24.85µs  p(99.9)=613.48µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.55ms min=23.23ms med=186.49ms max=393.67ms p(90)=201.98ms p(95)=207.44ms p(99.9)=280.53ms
     http_reqs......................: 31947   260.443111/s
     iteration_duration.............: avg=188.52ms min=62.97ms med=186.99ms max=420.55ms p(90)=202.41ms p(95)=207.91ms p(99.9)=285.74ms
     iterations.....................: 31847   259.627876/s
     success_rate...................: 100.00% ✓ 31847      ✗ 0    
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

     checks.........................: 100.00% ✓ 94527      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   311 kB/s
     http_req_blocked...............: avg=6.53µs   min=1.13µs  med=3.33µs   max=3.44ms   p(90)=4.79µs   p(95)=5.42µs   p(99.9)=1.58ms  
     http_req_connecting............: avg=2.95µs   min=0s      med=0s       max=3.41ms   p(90)=0s       p(95)=0s       p(99.9)=1.53ms  
     http_req_duration..............: avg=189.75ms min=18.04ms med=179.09ms max=607.17ms p(90)=220.88ms p(95)=253.36ms p(99.9)=566.68ms
       { expected_response:true }...: avg=189.75ms min=18.04ms med=179.09ms max=607.17ms p(90)=220.88ms p(95)=253.36ms p(99.9)=566.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31609
     http_req_receiving.............: avg=95.36µs  min=31.03µs med=87.72µs  max=93.46ms  p(90)=118.63µs p(95)=130.59µs p(99.9)=825.36µs
     http_req_sending...............: avg=26.33µs  min=5.12µs  med=17.59µs  max=73.12ms  p(90)=22.79µs  p(95)=24.76µs  p(99.9)=596.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.63ms min=17.94ms med=178.97ms max=607.07ms p(90)=220.78ms p(95)=253.13ms p(99.9)=566.6ms 
     http_reqs......................: 31609   258.704812/s
     iteration_duration.............: avg=190.57ms min=46.48ms med=179.5ms  max=607.43ms p(90)=221.3ms  p(95)=254.84ms p(99.9)=566.98ms
     iterations.....................: 31509   257.886359/s
     success_rate...................: 100.00% ✓ 31509      ✗ 0    
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

     checks.........................: 100.00% ✓ 7401      ✗ 0   
     data_received..................: 246 MB  1.9 MB/s
     data_sent......................: 3.1 MB  24 kB/s
     http_req_blocked...............: avg=40.42µs  min=1.55µs   med=3.79µs  max=4.05ms   p(90)=5.44µs   p(95)=6.62µs   p(99.9)=3.63ms  
     http_req_connecting............: avg=36.01µs  min=0s       med=0s      max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=3.6ms   
     http_req_duration..............: avg=2.35s    min=41.09ms  med=2.43s   max=4.33s    p(90)=3.1s     p(95)=3.35s    p(99.9)=4.16s   
       { expected_response:true }...: avg=2.35s    min=41.09ms  med=2.43s   max=4.33s    p(90)=3.1s     p(95)=3.35s    p(99.9)=4.16s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2567
     http_req_receiving.............: avg=103.88µs min=35.5µs   med=98.53µs max=878.97µs p(90)=141.18µs p(95)=158.33µs p(99.9)=513.41µs
     http_req_sending...............: avg=43.14µs  min=6.26µs   med=19.62µs max=16.81ms  p(90)=24.97µs  p(95)=29.77µs  p(99.9)=4.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.35s    min=40.87ms  med=2.43s   max=4.33s    p(90)=3.1s     p(95)=3.35s    p(99.9)=4.16s   
     http_reqs......................: 2567    20.269031/s
     iteration_duration.............: avg=2.44s    min=229.48ms med=2.46s   max=4.33s    p(90)=3.11s    p(95)=3.36s    p(99.9)=4.17s   
     iterations.....................: 2467    19.479431/s
     success_rate...................: 100.00% ✓ 2467      ✗ 0   
     vus............................: 22      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

