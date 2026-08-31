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
| fusion | 16.6.2 | 1,898 | 1,942 | 1,889 | 0.9% |  |
| fusion-nightly | 16.7.0-p.1 | 1,889 | 1,936 | 1,874 | 1.0% |  |
| fusion-nightly-net11 | 16.7.0-p.1 | 1,872 | 1,927 | 1,867 | 1.1% |  |
| hive-router | v0.0.84 | 1,823 | 1,897 | 1,802 | 1.8% |  |
| fusion-nightly-fed | 16.7.0-p.1 | 1,794 | 1,842 | 1,785 | 1.0% |  |
| grafbase | 0.53.5 | 1,276 | 1,305 | 1,269 | 1.0% |  |
| cosmo | 0.334.0 | 1,216 | 1,260 | 1,213 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 563 | 582 | 558 | 1.3% |  |
| apollo-router | v2.16.1 | 399 | 415 | 394 | 1.9% |  |
| apollo-gateway | 2.14.3 | 265 | 268 | 264 | 0.4% |  |
| hive-gateway | 2.10.8 | 263 | 272 | 262 | 1.3% |  |
| feddi | 5ff8b6165878 | 22 | 23 | 21 | 3.0% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 693981      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=2.93µs   min=912ns   med=2.04µs  max=6.63ms   p(90)=3.8µs    p(95)=4.55µs  p(99.9)=33.9µs 
     http_req_connecting............: avg=409ns    min=0s      med=0s      max=3.42ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.71ms  min=16.54ms med=25.11ms max=314.55ms p(90)=30.04ms  p(95)=31.88ms p(99.9)=49.81ms
       { expected_response:true }...: avg=25.71ms  min=16.54ms med=25.11ms max=314.55ms p(90)=30.04ms  p(95)=31.88ms p(99.9)=49.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 231427
     http_req_receiving.............: avg=296.43µs min=46.9µs  med=91.36µs max=245.62ms p(90)=728.26µs p(95)=1.22ms  p(99.9)=8.64ms 
     http_req_sending...............: avg=32.45µs  min=4.63µs  med=8.57µs  max=98.75ms  p(90)=18.52µs  p(95)=32.97µs p(99.9)=1.65ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.38ms  min=16.42ms med=24.8ms  max=314.29ms p(90)=29.65ms  p(95)=31.46ms p(99.9)=48.36ms
     http_reqs......................: 231427  1898.083806/s
     iteration_duration.............: avg=25.92ms  min=16.86ms med=25.32ms max=340.98ms p(90)=30.24ms  p(95)=32.09ms p(99.9)=50.15ms
     iterations.....................: 231327  1897.263641/s
     success_rate...................: 100.00% ✓ 231327      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 690936      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=3.44µs   min=1.02µs  med=2.65µs  max=3.4ms    p(90)=4.35µs   p(95)=5.09µs  p(99.9)=35.33µs
     http_req_connecting............: avg=414ns    min=0s      med=0s      max=3.35ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.82ms  min=17.29ms med=25.19ms max=310.03ms p(90)=30.24ms  p(95)=32.13ms p(99.9)=51.37ms
       { expected_response:true }...: avg=25.82ms  min=17.29ms med=25.19ms max=310.03ms p(90)=30.24ms  p(95)=32.13ms p(99.9)=51.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230412
     http_req_receiving.............: avg=311.67µs min=49.44µs med=93.73µs max=179.4ms  p(90)=742.61µs p(95)=1.26ms  p(99.9)=9.22ms 
     http_req_sending...............: avg=33.49µs  min=4.84µs  med=9.89µs  max=24.61ms  p(90)=19.32µs  p(95)=43.23µs p(99.9)=1.78ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.47ms  min=17.17ms med=24.87ms max=235.37ms p(90)=29.84ms  p(95)=31.69ms p(99.9)=50.12ms
     http_reqs......................: 230412  1889.750364/s
     iteration_duration.............: avg=26.04ms  min=17.51ms med=25.4ms  max=322.4ms  p(90)=30.45ms  p(95)=32.35ms p(99.9)=51.79ms
     iterations.....................: 230312  1888.930202/s
     success_rate...................: 100.00% ✓ 230312      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 684438      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=2.89µs   min=831ns   med=2.04µs  max=3.79ms   p(90)=3.86µs   p(95)=4.62µs  p(99.9)=28.12µs
     http_req_connecting............: avg=411ns    min=0s      med=0s      max=3.75ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.07ms  min=16.88ms med=25.5ms  max=297.71ms p(90)=30.41ms  p(95)=32.18ms p(99.9)=49.67ms
       { expected_response:true }...: avg=26.07ms  min=16.88ms med=25.5ms  max=297.71ms p(90)=30.41ms  p(95)=32.18ms p(99.9)=49.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228246
     http_req_receiving.............: avg=255.32µs min=49.13µs med=87.37µs max=174.87ms p(90)=581.97µs p(95)=1.1ms   p(99.9)=6.9ms  
     http_req_sending...............: avg=31.37µs  min=4.61µs  med=8.48µs  max=156.61ms p(90)=18.61µs  p(95)=29.06µs p(99.9)=1.55ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.78ms  min=16.66ms med=25.23ms max=296.6ms  p(90)=30.07ms  p(95)=31.8ms  p(99.9)=48.03ms
     http_reqs......................: 228246  1872.120292/s
     iteration_duration.............: avg=26.29ms  min=17.07ms med=25.71ms max=320.52ms p(90)=30.61ms  p(95)=32.39ms p(99.9)=50.1ms 
     iterations.....................: 228146  1871.300072/s
     success_rate...................: 100.00% ✓ 228146      ✗ 0     
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

     checks.........................: 100.00% ✓ 666801      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 267 MB  2.2 MB/s
     http_req_blocked...............: avg=3.37µs  min=1.04µs  med=2.57µs  max=5.8ms    p(90)=4.16µs  p(95)=4.88µs   p(99.9)=34.86µs
     http_req_connecting............: avg=416ns   min=0s      med=0s      max=3.55ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.77ms min=17.88ms med=26.33ms max=302.04ms p(90)=30.53ms p(95)=31.99ms  p(99.9)=48.39ms
       { expected_response:true }...: avg=26.77ms min=17.88ms med=26.33ms max=302.04ms p(90)=30.53ms p(95)=31.99ms  p(99.9)=48.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 222367
     http_req_receiving.............: avg=76.42µs min=25µs    med=52.51µs max=164.13ms p(90)=93.27µs p(95)=117.37µs p(99.9)=1.84ms 
     http_req_sending...............: avg=30.13µs min=4.99µs  med=10.71µs max=32.17ms  p(90)=18.78µs p(95)=25.85µs  p(99.9)=1.39ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.66ms min=17.74ms med=26.24ms max=301.42ms p(90)=30.42ms p(95)=31.86ms  p(99.9)=46.92ms
     http_reqs......................: 222367  1823.515609/s
     iteration_duration.............: avg=26.98ms min=18.62ms med=26.54ms max=311.14ms p(90)=30.74ms p(95)=32.2ms   p(99.9)=48.63ms
     iterations.....................: 222267  1822.695561/s
     success_rate...................: 100.00% ✓ 222267      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 656316      ✗ 0     
     data_received..................: 19 GB   157 MB/s
     data_sent......................: 263 MB  2.2 MB/s
     http_req_blocked...............: avg=2.94µs   min=892ns   med=2.06µs  max=4.74ms   p(90)=3.68µs   p(95)=4.39µs  p(99.9)=30.37µs
     http_req_connecting............: avg=478ns    min=0s      med=0s      max=4.67ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.2ms   min=18.25ms med=26.59ms max=290.56ms p(90)=31.84ms  p(95)=33.75ms p(99.9)=52.1ms 
       { expected_response:true }...: avg=27.2ms   min=18.25ms med=26.59ms max=290.56ms p(90)=31.84ms  p(95)=33.75ms p(99.9)=52.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 218872
     http_req_receiving.............: avg=309.84µs min=50.92µs med=98.37µs max=97.09ms  p(90)=784.15µs p(95)=1.25ms  p(99.9)=7.5ms  
     http_req_sending...............: avg=29.69µs  min=4.7µs   med=8.91µs  max=47.15ms  p(90)=18.96µs  p(95)=28.28µs p(99.9)=1.49ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.86ms  min=18.07ms med=26.26ms max=289.78ms p(90)=31.44ms  p(95)=33.3ms  p(99.9)=50.44ms
     http_reqs......................: 218872  1794.332689/s
     iteration_duration.............: avg=27.42ms  min=18.56ms med=26.8ms  max=325.64ms p(90)=32.05ms  p(95)=33.95ms p(99.9)=52.38ms
     iterations.....................: 218772  1793.51288/s
     success_rate...................: 100.00% ✓ 218772      ✗ 0     
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

     checks.........................: 100.00% ✓ 466995      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 187 MB  1.5 MB/s
     http_req_blocked...............: avg=3.27µs  min=862ns   med=2.11µs  max=3.27ms   p(90)=4.48µs   p(95)=5.43µs  p(99.9)=35.73µs
     http_req_connecting............: avg=568ns   min=0s      med=0s      max=3.22ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=38.28ms min=18.14ms med=38ms    max=311.83ms p(90)=45.05ms  p(95)=47.13ms p(99.9)=61.43ms
       { expected_response:true }...: avg=38.28ms min=18.14ms med=38ms    max=311.83ms p(90)=45.05ms  p(95)=47.13ms p(99.9)=61.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155765
     http_req_receiving.............: avg=81.96µs min=27.17µs med=54.76µs max=80.64ms  p(90)=123.08µs p(95)=165.4µs p(99.9)=1.59ms 
     http_req_sending...............: avg=30.57µs min=4.44µs  med=9.03µs  max=82.61ms  p(90)=23.17µs  p(95)=40.32µs p(99.9)=1.72ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=38.17ms min=18ms    med=37.89ms max=311.27ms p(90)=44.94ms  p(95)=47.01ms p(99.9)=60.6ms 
     http_reqs......................: 155765  1276.768418/s
     iteration_duration.............: avg=38.53ms min=20.54ms med=38.23ms max=326.01ms p(90)=45.26ms  p(95)=47.34ms p(99.9)=61.92ms
     iterations.....................: 155665  1275.948742/s
     success_rate...................: 100.00% ✓ 155665      ✗ 0     
     vus............................: 24      min=0         max=50  
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

     checks.........................: 100.00% ✓ 444897      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=3.7µs   min=1.08µs  med=2.82µs  max=3.43ms   p(90)=4.5µs    p(95)=5.22µs   p(99.9)=34.99µs 
     http_req_connecting............: avg=569ns   min=0s      med=0s      max=3.4ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.21ms min=18.68ms med=39.59ms max=303.89ms p(90)=48.3ms   p(95)=51.11ms  p(99.9)=65.8ms  
       { expected_response:true }...: avg=40.21ms min=18.68ms med=39.59ms max=303.89ms p(90)=48.3ms   p(95)=51.11ms  p(99.9)=65.8ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 148399
     http_req_receiving.............: avg=81.6µs  min=27.16µs med=64.16µs max=176.98ms p(90)=105.17µs p(95)=123.64µs p(99.9)=895.86µs
     http_req_sending...............: avg=31.31µs min=5.06µs  med=12.23µs max=180.86ms p(90)=19.84µs  p(95)=24.03µs  p(99.9)=1.02ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.1ms  min=18.41ms med=39.49ms max=302.82ms p(90)=48.2ms   p(95)=51ms     p(99.9)=65.3ms  
     http_reqs......................: 148399  1216.378731/s
     iteration_duration.............: avg=40.45ms min=23.08ms med=39.81ms max=317.43ms p(90)=48.51ms  p(95)=51.32ms  p(99.9)=66.03ms 
     iterations.....................: 148299  1215.559063/s
     success_rate...................: 100.00% ✓ 148299      ✗ 0     
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

     checks.........................: 100.00% ✓ 206256     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 83 MB   676 kB/s
     http_req_blocked...............: avg=5.1µs    min=1.17µs  med=3.41µs  max=3.6ms    p(90)=5.07µs   p(95)=5.78µs   p(99.9)=50.25µs 
     http_req_connecting............: avg=1.32µs   min=0s      med=0s      max=3.54ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.92ms  min=20.81ms med=85.05ms max=341.2ms  p(90)=105.15ms p(95)=113.75ms p(99.9)=200.91ms
       { expected_response:true }...: avg=86.92ms  min=20.81ms med=85.05ms max=341.2ms  p(90)=105.15ms p(95)=113.75ms p(99.9)=200.91ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68852
     http_req_receiving.............: avg=100.29µs min=32.66µs med=80.7µs  max=193.98ms p(90)=117.12µs p(95)=131.03µs p(99.9)=710.41µs
     http_req_sending...............: avg=24.5µs   min=5.4µs   med=16.01µs max=86.36ms  p(90)=22.53µs  p(95)=24.94µs  p(99.9)=642.72µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.8ms   min=20.67ms med=84.93ms max=317.26ms p(90)=105.02ms p(95)=113.64ms p(99.9)=200.72ms
     http_reqs......................: 68852   563.114534/s
     iteration_duration.............: avg=87.27ms  min=25.37ms med=85.31ms max=348.13ms p(90)=105.43ms p(95)=114.06ms p(99.9)=201.81ms
     iterations.....................: 68752   562.296672/s
     success_rate...................: 100.00% ✓ 68752      ✗ 0    
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

     checks.........................: 100.00% ✓ 146460     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   480 kB/s
     http_req_blocked...............: avg=5.57µs   min=1.06µs  med=3.14µs   max=3.83ms   p(90)=4.58µs   p(95)=5.16µs   p(99.9)=893.59µs
     http_req_connecting............: avg=2.2µs    min=0s      med=0s       max=3.79ms   p(90)=0s       p(95)=0s       p(99.9)=762.47µs
     http_req_duration..............: avg=122.44ms min=21.49ms med=120.36ms max=342.53ms p(90)=153.25ms p(95)=163.52ms p(99.9)=206.85ms
       { expected_response:true }...: avg=122.44ms min=21.49ms med=120.36ms max=342.53ms p(90)=153.25ms p(95)=163.52ms p(99.9)=206.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48920
     http_req_receiving.............: avg=88.18µs  min=30.88µs med=85.35µs  max=22.1ms   p(90)=116.21µs p(95)=128.39µs p(99.9)=568.11µs
     http_req_sending...............: avg=21.76µs  min=5.34µs  med=16.74µs  max=38.41ms  p(90)=22.1µs   p(95)=24.06µs  p(99.9)=499.58µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.33ms min=21.35ms med=120.26ms max=323.74ms p(90)=153.13ms p(95)=163.39ms p(99.9)=206.75ms
     http_reqs......................: 48920   399.872204/s
     iteration_duration.............: avg=122.93ms min=46.92ms med=120.67ms max=352.91ms p(90)=153.54ms p(95)=163.85ms p(99.9)=209.61ms
     iterations.....................: 48820   399.054804/s
     success_rate...................: 100.00% ✓ 48820      ✗ 0    
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

     checks.........................: 100.00% ✓ 97269      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   318 kB/s
     http_req_blocked...............: avg=6.81µs   min=1.11µs  med=3.63µs   max=3.97ms   p(90)=5.19µs   p(95)=5.78µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=2.89µs   min=0s      med=0s       max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=184.34ms min=23.49ms med=185.51ms max=389.18ms p(90)=207.03ms p(95)=212.31ms p(99.9)=278.16ms
       { expected_response:true }...: avg=184.34ms min=23.49ms med=185.51ms max=389.18ms p(90)=207.03ms p(95)=212.31ms p(99.9)=278.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32523
     http_req_receiving.............: avg=97.66µs  min=32.83µs med=91.75µs  max=38.4ms   p(90)=123.88µs p(95)=137.62µs p(99.9)=502.69µs
     http_req_sending...............: avg=33.38µs  min=5.33µs  med=18.3µs   max=173.35ms p(90)=23.39µs  p(95)=25.25µs  p(99.9)=541.63µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.21ms min=23.34ms med=185.35ms max=388.96ms p(90)=206.9ms  p(95)=212.17ms p(99.9)=277.44ms
     http_reqs......................: 32523   265.160697/s
     iteration_duration.............: avg=185.15ms min=40.62ms med=186.11ms max=401.31ms p(90)=207.33ms p(95)=212.61ms p(99.9)=281.84ms
     iterations.....................: 32423   264.345394/s
     success_rate...................: 100.00% ✓ 32423      ✗ 0    
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

     checks.........................: 100.00% ✓ 96282      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   317 kB/s
     http_req_blocked...............: avg=6.93µs   min=1.23µs  med=3.57µs   max=3.74ms   p(90)=5.15µs   p(95)=5.85µs   p(99.9)=1.62ms  
     http_req_connecting............: avg=3.06µs   min=0s      med=0s       max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=186.22ms min=17.83ms med=174.11ms max=643.4ms  p(90)=221.4ms  p(95)=251.7ms  p(99.9)=566.36ms
       { expected_response:true }...: avg=186.22ms min=17.83ms med=174.11ms max=643.4ms  p(90)=221.4ms  p(95)=251.7ms  p(99.9)=566.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32194
     http_req_receiving.............: avg=102.48µs min=32.41µs med=93.91µs  max=80.22ms  p(90)=125.74µs p(95)=138.87µs p(99.9)=765.66µs
     http_req_sending...............: avg=27.84µs  min=5.96µs  med=18.68µs  max=65.8ms   p(90)=23.69µs  p(95)=25.64µs  p(99.9)=442.43µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.09ms min=17.67ms med=174ms    max=643.1ms  p(90)=221.27ms p(95)=251.57ms p(99.9)=566.2ms 
     http_reqs......................: 32194   263.725845/s
     iteration_duration.............: avg=187.05ms min=35.72ms med=174.52ms max=643.67ms p(90)=221.77ms p(95)=253.18ms p(99.9)=566.72ms
     iterations.....................: 32094   262.906668/s
     success_rate...................: 100.00% ✓ 32094      ✗ 0    
     vus............................: 37      min=0        max=50 
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

     checks.........................: 100.00% ✓ 8280      ✗ 0   
     data_received..................: 274 MB  2.2 MB/s
     data_sent......................: 3.4 MB  27 kB/s
     http_req_blocked...............: avg=117.82µs min=1.22µs   med=3.41µs  max=10.49ms  p(90)=5.06µs   p(95)=5.89µs   p(99.9)=9.44ms  
     http_req_connecting............: avg=112.05µs min=0s       med=0s      max=10.46ms  p(90)=0s       p(95)=0s       p(99.9)=9.42ms  
     http_req_duration..............: avg=2.11s    min=38.1ms   med=2.15s   max=3.81s    p(90)=2.73s    p(95)=2.88s    p(99.9)=3.46s   
       { expected_response:true }...: avg=2.11s    min=38.1ms   med=2.15s   max=3.81s    p(90)=2.73s    p(95)=2.88s    p(99.9)=3.46s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2860
     http_req_receiving.............: avg=101.25µs min=34.12µs  med=97.39µs max=960.98µs p(90)=134.58µs p(95)=150.42µs p(99.9)=421.22µs
     http_req_sending...............: avg=38.99µs  min=5.76µs   med=19.15µs max=4.43ms   p(90)=24.45µs  p(95)=28.34µs  p(99.9)=2.2ms   
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.11s    min=37.99ms  med=2.15s   max=3.81s    p(90)=2.73s    p(95)=2.88s    p(99.9)=3.46s   
     http_reqs......................: 2860    22.613038/s
     iteration_duration.............: avg=2.19s    min=368.43ms med=2.17s   max=3.81s    p(90)=2.74s    p(95)=2.89s    p(99.9)=3.46s   
     iterations.....................: 2760    21.822372/s
     success_rate...................: 100.00% ✓ 2760      ✗ 0   
     vus............................: 33      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

