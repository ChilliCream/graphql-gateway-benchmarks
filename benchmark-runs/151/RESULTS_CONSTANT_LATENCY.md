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
| hive-router | v0.0.43 | 1,576 | 1,609 | 1,567 | 1.0% |  |
| hotchocolate | 16.1.0-p.1.5 | 1,462 | 1,476 | 1,453 | 0.5% |  |
| cosmo | 0.298.0 | 1,138 | 1,153 | 1,127 | 0.8% | non-compatible response (2 across 1/9 runs) |
| grafbase | 0.53.2 | 1,136 | 1,151 | 1,123 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.14 | 565 | 583 | 550 | 1.6% |  |
| apollo-router | v2.12.1 | 391 | 400 | 388 | 1.1% |  |
| hive-gateway | 2.5.14 | 260 | 264 | 255 | 1.1% |  |
| apollo-gateway | 2.13.3 | 239 | 240 | 237 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 576909      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=2.91µs  min=951ns   med=2.06µs  max=3.62ms   p(90)=3.87µs  p(95)=4.85µs   p(99.9)=32.15µs
     http_req_connecting............: avg=386ns   min=0s      med=0s      max=3.58ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.95ms min=13.83ms med=30.71ms max=306.31ms p(90)=36.82ms p(95)=38.77ms  p(99.9)=55.05ms
       { expected_response:true }...: avg=30.95ms min=13.83ms med=30.71ms max=306.31ms p(90)=36.82ms p(95)=38.77ms  p(99.9)=55.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192403
     http_req_receiving.............: avg=80.96µs min=26.83µs med=51.75µs max=103.42ms p(90)=100.9µs p(95)=145.83µs p(99.9)=2.21ms 
     http_req_sending...............: avg=31.48µs min=5.06µs  med=9.09µs  max=56.04ms  p(90)=19.35µs p(95)=35.42µs  p(99.9)=1.73ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.84ms min=13.79ms med=30.6ms  max=305.34ms p(90)=36.71ms p(95)=38.64ms  p(99.9)=53.32ms
     http_reqs......................: 192403  1576.009988/s
     iteration_duration.............: avg=31.19ms min=14.02ms med=30.92ms max=346.88ms p(90)=37.03ms p(95)=38.98ms  p(99.9)=55.39ms
     iterations.....................: 192303  1575.190869/s
     success_rate...................: 100.00% ✓ 192303      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 535128      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 214 MB  1.8 MB/s
     http_req_blocked...............: avg=3.28µs  min=981ns   med=1.98µs   max=4.79ms   p(90)=3.68µs  p(95)=4.59µs   p(99.9)=27.77µs
     http_req_connecting............: avg=802ns   min=0s      med=0s       max=4.63ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.39ms min=13.77ms med=32.17ms  max=477.98ms p(90)=40.82ms p(95)=44.49ms  p(99.9)=89.15ms
       { expected_response:true }...: avg=33.39ms min=13.77ms med=32.17ms  max=477.98ms p(90)=40.82ms p(95)=44.49ms  p(99.9)=89.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178476
     http_req_receiving.............: avg=781µs   min=49.88µs med=109.03µs max=94.52ms  p(90)=2.25ms  p(95)=3.44ms   p(99.9)=17.89ms
     http_req_sending...............: avg=39.35µs min=4.83µs  med=8.8µs    max=169.58ms p(90)=19.84µs p(95)=103.56µs p(99.9)=2.61ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.57ms min=13.6ms  med=31.39ms  max=477.13ms p(90)=39.7ms  p(95)=43.19ms  p(99.9)=86.24ms
     http_reqs......................: 178476  1462.903309/s
     iteration_duration.............: avg=33.63ms min=14.07ms med=32.39ms  max=478.22ms p(90)=41.04ms p(95)=44.72ms  p(99.9)=91.8ms 
     iterations.....................: 178376  1462.083645/s
     success_rate...................: 100.00% ✓ 178376      ✗ 0     
     vus............................: 25      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 416388      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.32µs   min=1µs     med=2.12µs  max=4.59ms   p(90)=3.65µs   p(95)=4.42µs   p(99.9)=36.92µs
     http_req_connecting............: avg=830ns    min=0s      med=0s      max=4.55ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43ms     min=15.82ms med=42.38ms max=350.22ms p(90)=52.42ms  p(95)=55.57ms  p(99.9)=72.58ms
       { expected_response:true }...: avg=43ms     min=15.82ms med=42.38ms max=350.22ms p(90)=52.42ms  p(95)=55.57ms  p(99.9)=72.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138896
     http_req_receiving.............: avg=115.95µs min=28.28µs med=61.26µs max=250.13ms p(90)=103.36µs p(95)=128.66µs p(99.9)=1.93ms 
     http_req_sending...............: avg=25.22µs  min=5.04µs  med=9.95µs  max=134.9ms  p(90)=17.53µs  p(95)=22µs     p(99.9)=1.18ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.86ms  min=15.63ms med=42.28ms max=126.65ms p(90)=52.3ms   p(95)=55.44ms  p(99.9)=71.98ms
     http_reqs......................: 138896  1138.230217/s
     iteration_duration.............: avg=43.22ms  min=17.4ms  med=42.58ms max=358.4ms  p(90)=52.61ms  p(95)=55.76ms  p(99.9)=73.06ms
     iterations.....................: 138796  1137.410733/s
     success_rate...................: 100.00% ✓ 138796      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 415839     ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.59µs  min=951ns   med=2.2µs   max=4.53ms   p(90)=4.58µs   p(95)=5.71µs   p(99.9)=42.27µs
     http_req_connecting............: avg=796ns   min=0s      med=0s      max=4.49ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43ms    min=15.04ms med=42.52ms max=335.27ms p(90)=52.44ms  p(95)=55.59ms  p(99.9)=76.14ms
       { expected_response:true }...: avg=43ms    min=15.04ms med=42.52ms max=335.27ms p(90)=52.44ms  p(95)=55.59ms  p(99.9)=76.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 138713
     http_req_receiving.............: avg=94.42µs min=27.33µs med=57.23µs max=174.43ms p(90)=126.74µs p(95)=191.85µs p(99.9)=3.15ms 
     http_req_sending...............: avg=37.8µs  min=5.21µs  med=9.67µs  max=94.58ms  p(90)=23.44µs  p(95)=106.94µs p(99.9)=2.54ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.87ms min=14.92ms med=42.39ms max=335.12ms p(90)=52.29ms  p(95)=55.43ms  p(99.9)=75.59ms
     http_reqs......................: 138713  1136.86365/s
     iteration_duration.............: avg=43.28ms min=15.37ms med=42.76ms max=354.74ms p(90)=52.68ms  p(95)=55.82ms  p(99.9)=76.7ms 
     iterations.....................: 138613  1136.04407/s
     success_rate...................: 100.00% ✓ 138613     ✗ 0     
     vus............................: 50      min=0        max=50  
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 207411     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 83 MB   680 kB/s
     http_req_blocked...............: avg=4.06µs  min=1.19µs  med=3.16µs  max=2.61ms   p(90)=4.77µs   p(95)=5.41µs   p(99.9)=47.13µs 
     http_req_connecting............: avg=634ns   min=0s      med=0s      max=2.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.45ms min=18.75ms med=82.63ms max=360.7ms  p(90)=109.71ms p(95)=118.13ms p(99.9)=218.94ms
       { expected_response:true }...: avg=86.45ms min=18.75ms med=82.63ms max=360.7ms  p(90)=109.71ms p(95)=118.13ms p(99.9)=218.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69237
     http_req_receiving.............: avg=91.21µs min=30.9µs  med=78.23µs max=107.07ms p(90)=114.41µs p(95)=128.72µs p(99.9)=1.06ms  
     http_req_sending...............: avg=25.07µs min=5.58µs  med=14.19µs max=100.04ms p(90)=21.19µs  p(95)=23.61µs  p(99.9)=755.78µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.34ms min=18.63ms med=82.52ms max=360.44ms p(90)=109.61ms p(95)=118ms    p(99.9)=217.73ms
     http_reqs......................: 69237   565.904708/s
     iteration_duration.............: avg=86.79ms min=38.31ms med=82.88ms max=368.72ms p(90)=109.94ms p(95)=118.38ms p(99.9)=220.18ms
     iterations.....................: 69137   565.087364/s
     success_rate...................: 100.00% ✓ 69137      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 143538     ✗ 0    
     data_received..................: 4.2 GB  34 MB/s
     data_sent......................: 58 MB   470 kB/s
     http_req_blocked...............: avg=5.68µs   min=1.11µs  med=3.37µs   max=4.06ms   p(90)=4.93µs   p(95)=5.58µs   p(99.9)=231.03µs
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=122.95µs
     http_req_duration..............: avg=124.93ms min=20.94ms med=122.93ms max=372.2ms  p(90)=155.84ms p(95)=166.44ms p(99.9)=210.48ms
       { expected_response:true }...: avg=124.93ms min=20.94ms med=122.93ms max=372.2ms  p(90)=155.84ms p(95)=166.44ms p(99.9)=210.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47946
     http_req_receiving.............: avg=88.62µs  min=30.13µs med=84.48µs  max=3.59ms   p(90)=117.43µs p(95)=130.05µs p(99.9)=524.55µs
     http_req_sending...............: avg=25.58µs  min=5.66µs  med=16.36µs  max=70.4ms   p(90)=22.32µs  p(95)=24.49µs  p(99.9)=565.92µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.82ms min=20.82ms med=122.83ms max=371.52ms p(90)=155.73ms p(95)=166.33ms p(99.9)=210.38ms
     http_reqs......................: 47946   391.379367/s
     iteration_duration.............: avg=125.43ms min=43.55ms med=123.22ms max=394.34ms p(90)=156.15ms p(95)=166.75ms p(99.9)=214.67ms
     iterations.....................: 47846   390.563075/s
     success_rate...................: 100.00% ✓ 47846      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95295      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=6.73µs   min=1.26µs  med=3.47µs   max=3.94ms   p(90)=4.89µs   p(95)=5.49µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=3.1µs    min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=188.19ms min=18.66ms med=172.25ms max=604.94ms p(90)=231.02ms p(95)=269.56ms p(99.9)=556.59ms
       { expected_response:true }...: avg=188.19ms min=18.66ms med=172.25ms max=604.94ms p(90)=231.02ms p(95)=269.56ms p(99.9)=556.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31865
     http_req_receiving.............: avg=100.71µs min=35.92µs med=91.63µs  max=95.06ms  p(90)=124.47µs p(95)=138.13µs p(99.9)=527.62µs
     http_req_sending...............: avg=27.2µs   min=6.2µs   med=17.53µs  max=104ms    p(90)=22.66µs  p(95)=24.59µs  p(99.9)=499.49µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.06ms min=18.54ms med=172.13ms max=604.84ms p(90)=230.89ms p(95)=269.46ms p(99.9)=556.44ms
     http_reqs......................: 31865   260.560807/s
     iteration_duration.............: avg=189.01ms min=51.69ms med=172.71ms max=605.14ms p(90)=231.35ms p(95)=273.28ms p(99.9)=557.06ms
     iterations.....................: 31765   259.743104/s
     success_rate...................: 100.00% ✓ 31765      ✗ 0    
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

     checks.........................: 100.00% ✓ 88071      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=14.75µs  min=1.32µs  med=3.6µs    max=10.48ms  p(90)=5.08µs   p(95)=5.71µs   p(99.9)=6.17ms  
     http_req_connecting............: avg=10.54µs  min=0s      med=0s       max=10.12ms  p(90)=0s       p(95)=0s       p(99.9)=5.77ms  
     http_req_duration..............: avg=203.58ms min=20.72ms med=202.39ms max=433.46ms p(90)=228.15ms p(95)=234.33ms p(99.9)=304.05ms
       { expected_response:true }...: avg=203.58ms min=20.72ms med=202.39ms max=433.46ms p(90)=228.15ms p(95)=234.33ms p(99.9)=304.05ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29457
     http_req_receiving.............: avg=102.3µs  min=35.13µs med=94.19µs  max=60.99ms  p(90)=128.23µs p(95)=141.82µs p(99.9)=515.48µs
     http_req_sending...............: avg=34µs     min=6.28µs  med=17.91µs  max=136.68ms p(90)=23.22µs  p(95)=25.3µs   p(99.9)=1.25ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.45ms min=20.61ms med=202.26ms max=432.17ms p(90)=228.03ms p(95)=234.19ms p(99.9)=303.59ms
     http_reqs......................: 29457   239.822597/s
     iteration_duration.............: avg=204.51ms min=43.12ms med=202.8ms  max=455.7ms  p(90)=228.44ms p(95)=234.64ms p(99.9)=310.5ms 
     iterations.....................: 29357   239.008452/s
     success_rate...................: 100.00% ✓ 29357      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

