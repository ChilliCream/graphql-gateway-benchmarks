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
| hive-router | v0.0.49 | 1,583 | 1,606 | 1,577 | 0.6% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,448 | 1,460 | 1,436 | 0.5% |  |
| cosmo | 0.307.0 | 1,137 | 1,154 | 1,127 | 0.8% | non-compatible response (2 across 2/9 runs) |
| grafbase | 0.53.3 | 1,130 | 1,150 | 1,127 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.25 | 505 | 514 | 498 | 1.1% |  |
| apollo-router | v2.13.1 | 394 | 404 | 391 | 1.1% |  |
| apollo-gateway | 2.13.3 | 235 | 237 | 235 | 0.3% |  |
| hive-gateway | 2.5.25 | 231 | 236 | 229 | 1.1% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 579585      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.3µs   min=972ns   med=2.34µs  max=4.18ms   p(90)=4.05µs   p(95)=4.96µs   p(99.9)=32.52µs
     http_req_connecting............: avg=524ns   min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.8ms  min=13.81ms med=30.55ms max=323ms    p(90)=36.6ms   p(95)=38.55ms  p(99.9)=57.98ms
       { expected_response:true }...: avg=30.8ms  min=13.81ms med=30.55ms max=323ms    p(90)=36.6ms   p(95)=38.55ms  p(99.9)=57.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193295
     http_req_receiving.............: avg=88.63µs min=27.67µs med=52.71µs max=201.9ms  p(90)=104.87µs p(95)=157.39µs p(99.9)=2.92ms 
     http_req_sending...............: avg=35.59µs min=5.25µs  med=9.74µs  max=187.69ms p(90)=19.89µs  p(95)=77.07µs  p(99.9)=1.85ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.68ms min=13.73ms med=30.44ms max=322.5ms  p(90)=36.48ms  p(95)=38.4ms   p(99.9)=56.8ms 
     http_reqs......................: 193295  1583.531734/s
     iteration_duration.............: avg=31.04ms min=14.09ms med=30.77ms max=359ms    p(90)=36.82ms  p(95)=38.77ms  p(99.9)=58.41ms
     iterations.....................: 193195  1582.712504/s
     success_rate...................: 100.00% ✓ 193195      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 530070      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.3µs    min=1.02µs  med=2.26µs   max=4.38ms   p(90)=4.01µs  p(95)=4.91µs   p(99.9)=35.91µs
     http_req_connecting............: avg=562ns    min=0s      med=0s       max=4.35ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.7ms   min=13.76ms med=32.56ms  max=482.21ms p(90)=41.41ms p(95)=44.97ms  p(99.9)=83.24ms
       { expected_response:true }...: avg=33.7ms   min=13.76ms med=32.56ms  max=482.21ms p(90)=41.41ms p(95)=44.97ms  p(99.9)=83.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176790
     http_req_receiving.............: avg=784.12µs min=50.05µs med=112.39µs max=252.91ms p(90)=2.26ms  p(95)=3.4ms    p(99.9)=17.33ms
     http_req_sending...............: avg=38µs     min=5.17µs  med=9.37µs   max=179.58ms p(90)=19.89µs p(95)=102.25µs p(99.9)=2.6ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.88ms  min=13.46ms med=31.75ms  max=481.82ms p(90)=40.33ms p(95)=43.76ms  p(99.9)=81.61ms
     http_reqs......................: 176790  1448.984185/s
     iteration_duration.............: avg=33.95ms  min=14.05ms med=32.78ms  max=482.42ms p(90)=41.63ms p(95)=45.2ms   p(99.9)=83.85ms
     iterations.....................: 176690  1448.164577/s
     success_rate...................: 100.00% ✓ 176690      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 416103      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.54µs  min=1µs     med=2.46µs  max=4.06ms   p(90)=4.06µs   p(95)=4.8µs   p(99.9)=35.42µs
     http_req_connecting............: avg=732ns   min=0s      med=0s      max=4.02ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=43.01ms min=17.71ms med=42.41ms max=347.12ms p(90)=52.32ms  p(95)=55.49ms p(99.9)=70.73ms
       { expected_response:true }...: avg=43.01ms min=17.71ms med=42.41ms max=347.12ms p(90)=52.32ms  p(95)=55.49ms p(99.9)=70.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138801
     http_req_receiving.............: avg=83.77µs min=29.16µs med=63.39µs max=94.75ms  p(90)=106.41µs p(95)=131.1µs p(99.9)=1.62ms 
     http_req_sending...............: avg=27.56µs min=5.08µs  med=10.78µs max=119.27ms p(90)=18.11µs  p(95)=22.7µs  p(99.9)=1.26ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=42.9ms  min=17.55ms med=42.31ms max=346.42ms p(90)=52.21ms  p(95)=55.37ms p(99.9)=70.44ms
     http_reqs......................: 138801  1137.302416/s
     iteration_duration.............: avg=43.25ms min=19.43ms med=42.62ms max=370.46ms p(90)=52.52ms  p(95)=55.7ms  p(99.9)=71.05ms
     iterations.....................: 138701  1136.48304/s
     success_rate...................: 100.00% ✓ 138701      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 413430      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.68µs  min=942ns   med=2.24µs  max=4.24ms   p(90)=4.64µs   p(95)=5.81µs   p(99.9)=46.95µs
     http_req_connecting............: avg=728ns   min=0s      med=0s      max=4.21ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.25ms min=16.64ms med=42.7ms  max=369.42ms p(90)=52.58ms  p(95)=55.81ms  p(99.9)=82.4ms 
       { expected_response:true }...: avg=43.25ms min=16.64ms med=42.7ms  max=369.42ms p(90)=52.58ms  p(95)=55.81ms  p(99.9)=82.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 137910
     http_req_receiving.............: avg=96.79µs min=29.72µs med=59.95µs max=138.48ms p(90)=131.15µs p(95)=213.95µs p(99.9)=2.78ms 
     http_req_sending...............: avg=37.11µs min=5.17µs  med=9.87µs  max=138.37ms p(90)=23.9µs   p(95)=112.55µs p(99.9)=2.16ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.11ms min=16.56ms med=42.58ms max=368.8ms  p(90)=52.44ms  p(95)=55.65ms  p(99.9)=82.2ms 
     http_reqs......................: 137910  1130.310442/s
     iteration_duration.............: avg=43.53ms min=16.82ms med=42.95ms max=381.44ms p(90)=52.81ms  p(95)=56.03ms  p(99.9)=83.31ms
     iterations.....................: 137810  1129.490842/s
     success_rate...................: 100.00% ✓ 137810      ✗ 0     
     vus............................: 36      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 185352     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 74 MB   607 kB/s
     http_req_blocked...............: avg=7.38µs  min=1.13µs  med=3.07µs  max=141.62ms p(90)=4.65µs   p(95)=5.3µs    p(99.9)=51.38µs 
     http_req_connecting............: avg=1.71µs  min=0s      med=0s      max=4.42ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.75ms min=19.45ms med=96.28ms max=370.63ms p(90)=121.71ms p(95)=132.26ms p(99.9)=230.7ms 
       { expected_response:true }...: avg=96.75ms min=19.45ms med=96.28ms max=370.63ms p(90)=121.71ms p(95)=132.26ms p(99.9)=230.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 61884
     http_req_receiving.............: avg=86.55µs min=30µs    med=77.73µs max=49.83ms  p(90)=113.42µs p(95)=127.22µs p(99.9)=837.9µs 
     http_req_sending...............: avg=22.63µs min=5.78µs  med=13.87µs max=144.96ms p(90)=20.36µs  p(95)=22.73µs  p(99.9)=635.92µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.64ms min=19.32ms med=96.17ms max=370.44ms p(90)=121.6ms  p(95)=132.11ms p(99.9)=230.6ms 
     http_reqs......................: 61884   505.164426/s
     iteration_duration.............: avg=97.13ms min=37.46ms med=96.55ms max=382.86ms p(90)=121.96ms p(95)=132.63ms p(99.9)=233.72ms
     iterations.....................: 61784   504.348117/s
     success_rate...................: 100.00% ✓ 61784      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 144735     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   474 kB/s
     http_req_blocked...............: avg=6.18µs   min=1.16µs  med=3.34µs   max=4.41ms   p(90)=4.89µs   p(95)=5.51µs   p(99.9)=430.08µs
     http_req_connecting............: avg=2.63µs   min=0s      med=0s       max=4.36ms   p(90)=0s       p(95)=0s       p(99.9)=401.45µs
     http_req_duration..............: avg=123.9ms  min=21.15ms med=122.21ms max=376.2ms  p(90)=154.19ms p(95)=164.25ms p(99.9)=210.16ms
       { expected_response:true }...: avg=123.9ms  min=21.15ms med=122.21ms max=376.2ms  p(90)=154.19ms p(95)=164.25ms p(99.9)=210.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48345
     http_req_receiving.............: avg=91.92µs  min=31.67µs med=84.47µs  max=81.98ms  p(90)=117.36µs p(95)=129.74µs p(99.9)=636.72µs
     http_req_sending...............: avg=30.62µs  min=5.72µs  med=15.85µs  max=117.38ms p(90)=21.77µs  p(95)=23.92µs  p(99.9)=1.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.78ms min=21.04ms med=122.1ms  max=372.3ms  p(90)=154.07ms p(95)=164.12ms p(99.9)=209ms   
     http_reqs......................: 48345   394.78005/s
     iteration_duration.............: avg=124.39ms min=30.17ms med=122.5ms  max=399.89ms p(90)=154.48ms p(95)=164.56ms p(99.9)=212.36ms
     iterations.....................: 48245   393.963461/s
     success_rate...................: 100.00% ✓ 48245      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86649      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   283 kB/s
     http_req_blocked...............: avg=7.39µs   min=1.24µs  med=3.42µs   max=4.22ms   p(90)=4.86µs   p(95)=5.46µs   p(99.9)=1.9ms   
     http_req_connecting............: avg=3.68µs   min=0s      med=0s       max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=1.86ms  
     http_req_duration..............: avg=206.9ms  min=21.43ms med=212.67ms max=445.29ms p(90)=225.38ms p(95)=231.29ms p(99.9)=309.66ms
       { expected_response:true }...: avg=206.9ms  min=21.43ms med=212.67ms max=445.29ms p(90)=225.38ms p(95)=231.29ms p(99.9)=309.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28983
     http_req_receiving.............: avg=99.93µs  min=34.77µs med=92.53µs  max=79.25ms  p(90)=126.42µs p(95)=140.03µs p(99.9)=558.07µs
     http_req_sending...............: avg=36.47µs  min=5.87µs  med=17.18µs  max=170.51ms p(90)=22.62µs  p(95)=24.56µs  p(99.9)=622.63µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.76ms min=21.29ms med=212.55ms max=444.74ms p(90)=225.25ms p(95)=231.15ms p(99.9)=309.55ms
     http_reqs......................: 28983   235.898904/s
     iteration_duration.............: avg=207.86ms min=44.6ms  med=212.98ms max=466.5ms  p(90)=225.68ms p(95)=231.62ms p(99.9)=315.38ms
     iterations.....................: 28883   235.084983/s
     success_rate...................: 100.00% ✓ 28883      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 84534      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   278 kB/s
     http_req_blocked...............: avg=7.55µs   min=1.25µs  med=3.37µs   max=4.19ms   p(90)=4.77µs   p(95)=5.38µs   p(99.9)=2.13ms  
     http_req_connecting............: avg=3.96µs   min=0s      med=0s       max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=2.1ms   
     http_req_duration..............: avg=212.04ms min=19.06ms med=197.21ms max=646.91ms p(90)=246.52ms p(95)=459.66ms p(99.9)=596.62ms
       { expected_response:true }...: avg=212.04ms min=19.06ms med=197.21ms max=646.91ms p(90)=246.52ms p(95)=459.66ms p(99.9)=596.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28278
     http_req_receiving.............: avg=107.02µs min=36.77µs med=94.31µs  max=104.53ms p(90)=126.84µs p(95)=140.09µs p(99.9)=587.37µs
     http_req_sending...............: avg=27.48µs  min=6.21µs  med=17.33µs  max=67.47ms  p(90)=22.37µs  p(95)=24.17µs  p(99.9)=504.63µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.91ms min=18.89ms med=197.1ms  max=646.84ms p(90)=246.38ms p(95)=459.5ms  p(99.9)=596.51ms
     http_reqs......................: 28278   231.237052/s
     iteration_duration.............: avg=213.04ms min=55.91ms med=197.63ms max=647.09ms p(90)=246.96ms p(95)=460.99ms p(99.9)=596.89ms
     iterations.....................: 28178   230.419324/s
     success_rate...................: 100.00% ✓ 28178      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

