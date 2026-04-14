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
| hive-router | v0.0.43 | 1,598 | 1,604 | 1,591 | 0.4% |  |
| hotchocolate | 16.1.0-p.1.2 | 1,447 | 1,457 | 1,439 | 0.5% |  |
| cosmo | 0.298.0 | 1,158 | 1,172 | 1,152 | 0.6% | non-compatible response (3 across 2/9 runs) |
| grafbase | 0.53.2 | 1,142 | 1,163 | 1,138 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.14 | 577 | 592 | 572 | 1.2% |  |
| apollo-router | v2.12.1 | 391 | 401 | 388 | 1.2% |  |
| hive-gateway | 2.5.14 | 261 | 266 | 257 | 1.2% |  |
| apollo-gateway | 2.13.3 | 232 | 235 | 231 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 585096      ✗ 0     
     data_received..................: 17 GB   140 MB/s
     data_sent......................: 235 MB  1.9 MB/s
     http_req_blocked...............: avg=3.12µs  min=942ns   med=2.17µs  max=4.05ms   p(90)=4.01µs   p(95)=4.97µs   p(99.9)=34.69µs
     http_req_connecting............: avg=454ns   min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.52ms min=14.02ms med=30.28ms max=335.67ms p(90)=36.19ms  p(95)=38.07ms  p(99.9)=54.6ms 
       { expected_response:true }...: avg=30.52ms min=14.02ms med=30.28ms max=335.67ms p(90)=36.19ms  p(95)=38.07ms  p(99.9)=54.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 195132
     http_req_receiving.............: avg=88.46µs min=26.64µs med=51.7µs  max=117.73ms p(90)=103.31µs p(95)=154.57µs p(99.9)=2.41ms 
     http_req_sending...............: avg=35.67µs min=4.92µs  med=9.38µs  max=302.49ms p(90)=19.81µs  p(95)=78.4µs   p(99.9)=1.78ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.39ms min=13.84ms med=30.17ms max=218.58ms p(90)=36.07ms  p(95)=37.93ms  p(99.9)=53.31ms
     http_reqs......................: 195132  1598.556088/s
     iteration_duration.............: avg=30.75ms min=14.22ms med=30.5ms  max=348.2ms  p(90)=36.4ms   p(95)=38.28ms  p(99.9)=55.24ms
     iterations.....................: 195032  1597.73687/s
     success_rate...................: 100.00% ✓ 195032      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 529512      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.2µs    min=972ns   med=2.05µs  max=4.81ms   p(90)=3.89µs  p(95)=4.73µs   p(99.9)=35.1µs 
     http_req_connecting............: avg=626ns    min=0s      med=0s      max=4.77ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.75ms  min=14.16ms med=32.58ms max=488.22ms p(90)=41.34ms p(95)=44.9ms   p(99.9)=91.15ms
       { expected_response:true }...: avg=33.75ms  min=14.16ms med=32.58ms max=488.22ms p(90)=41.34ms p(95)=44.9ms   p(99.9)=91.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176604
     http_req_receiving.............: avg=800.41µs min=50.03µs med=111.6µs max=119.62ms p(90)=2.34ms  p(95)=3.5ms    p(99.9)=16.82ms
     http_req_sending...............: avg=39.68µs  min=5.08µs  med=9.04µs  max=255.08ms p(90)=20.05µs p(95)=103.88µs p(99.9)=2.7ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.91ms  min=13.51ms med=31.78ms max=487.7ms  p(90)=40.18ms p(95)=43.61ms  p(99.9)=83.03ms
     http_reqs......................: 176604  1447.517333/s
     iteration_duration.............: avg=33.98ms  min=14.36ms med=32.8ms  max=488.46ms p(90)=41.55ms p(95)=45.13ms  p(99.9)=96.59ms
     iterations.....................: 176504  1446.697693/s
     success_rate...................: 100.00% ✓ 176504      ✗ 0     
     vus............................: 33      min=0         max=50  
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

     checks.........................: 100.00% ✓ 423924      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.52µs  min=1.03µs  med=2.35µs  max=4.58ms   p(90)=4.12µs   p(95)=4.89µs   p(99.9)=39.71µs
     http_req_connecting............: avg=752ns   min=0s      med=0s      max=4.54ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.21ms min=18.24ms med=41.62ms max=322.62ms p(90)=51.28ms  p(95)=54.38ms  p(99.9)=70.98ms
       { expected_response:true }...: avg=42.21ms min=18.24ms med=41.62ms max=322.62ms p(90)=51.28ms  p(95)=54.38ms  p(99.9)=70.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141408
     http_req_receiving.............: avg=88.91µs min=28.16µs med=62.83µs max=138.04ms p(90)=110.65µs p(95)=138.14µs p(99.9)=1.85ms 
     http_req_sending...............: avg=26.9µs  min=5.27µs  med=10.63µs max=125.94ms p(90)=18.9µs   p(95)=23.91µs  p(99.9)=1.34ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.09ms min=18.08ms med=41.52ms max=321.9ms  p(90)=51.16ms  p(95)=54.25ms  p(99.9)=70.5ms 
     http_reqs......................: 141408  1158.727792/s
     iteration_duration.............: avg=42.45ms min=20.58ms med=41.83ms max=365.55ms p(90)=51.48ms  p(95)=54.59ms  p(99.9)=71.6ms 
     iterations.....................: 141308  1157.90837/s
     success_rate...................: 100.00% ✓ 141308      ✗ 0     
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

     checks.........................: 100.00% ✓ 418029      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.71µs   min=931ns   med=2.28µs  max=4.39ms   p(90)=4.81µs   p(95)=5.91µs   p(99.9)=40.85µs
     http_req_connecting............: avg=767ns    min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.78ms  min=15.64ms med=42.35ms max=335.48ms p(90)=52.03ms  p(95)=55.12ms  p(99.9)=75.51ms
       { expected_response:true }...: avg=42.78ms  min=15.64ms med=42.35ms max=335.48ms p(90)=52.03ms  p(95)=55.12ms  p(99.9)=75.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139443
     http_req_receiving.............: avg=128.64µs min=29µs    med=58.96µs max=225.62ms p(90)=132.98µs p(95)=212.77µs p(99.9)=4.02ms 
     http_req_sending...............: avg=35.65µs  min=5.27µs  med=9.94µs  max=42.29ms  p(90)=24.68µs  p(95)=113.48µs p(99.9)=2.08ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.62ms  min=15.48ms med=42.22ms max=130.13ms p(90)=51.88ms  p(95)=54.96ms  p(99.9)=74.9ms 
     http_reqs......................: 139443  1142.530235/s
     iteration_duration.............: avg=43.05ms  min=17.39ms med=42.59ms max=383ms    p(90)=52.27ms  p(95)=55.36ms  p(99.9)=76.1ms 
     iterations.....................: 139343  1141.710883/s
     success_rate...................: 100.00% ✓ 139343      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 212028     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   694 kB/s
     http_req_blocked...............: avg=5.02µs  min=1.18µs  med=3.31µs  max=4.13ms   p(90)=4.98µs   p(95)=5.67µs   p(99.9)=52.05µs 
     http_req_connecting............: avg=1.45µs  min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.56ms min=22.24ms med=87.05ms max=348.97ms p(90)=107.36ms p(95)=114.29ms p(99.9)=210.3ms 
       { expected_response:true }...: avg=84.56ms min=22.24ms med=87.05ms max=348.97ms p(90)=107.36ms p(95)=114.29ms p(99.9)=210.3ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 70776
     http_req_receiving.............: avg=88.37µs min=31.82µs med=80.02µs max=16.59ms  p(90)=117.04µs p(95)=132.06µs p(99.9)=898.6µs 
     http_req_sending...............: avg=30.87µs min=5.8µs   med=14.66µs max=139.02ms p(90)=21.66µs  p(95)=24.19µs  p(99.9)=789.59µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.44ms min=22.05ms med=86.94ms max=348.23ms p(90)=107.25ms p(95)=114.16ms p(99.9)=209.97ms
     http_reqs......................: 70776   577.91716/s
     iteration_duration.............: avg=84.91ms min=29.81ms med=87.31ms max=371.55ms p(90)=107.59ms p(95)=114.59ms p(99.9)=212.31ms
     iterations.....................: 70676   577.100617/s
     success_rate...................: 100.00% ✓ 70676      ✗ 0    
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

     checks.........................: 100.00% ✓ 143682     ✗ 0    
     data_received..................: 4.2 GB  34 MB/s
     data_sent......................: 58 MB   471 kB/s
     http_req_blocked...............: avg=5.75µs   min=1.13µs  med=3.39µs   max=3.78ms   p(90)=4.97µs   p(95)=5.58µs   p(99.9)=299.86µs
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=212.67µs
     http_req_duration..............: avg=124.81ms min=20.64ms med=122.91ms max=373ms    p(90)=155.48ms p(95)=165.71ms p(99.9)=211.02ms
       { expected_response:true }...: avg=124.81ms min=20.64ms med=122.91ms max=373ms    p(90)=155.48ms p(95)=165.71ms p(99.9)=211.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47994
     http_req_receiving.............: avg=94.32µs  min=29.56µs med=86.68µs  max=133.54ms p(90)=119.69µs p(95)=133.37µs p(99.9)=698.73µs
     http_req_sending...............: avg=25.07µs  min=5.6µs   med=16.45µs  max=194.53ms p(90)=22.12µs  p(95)=24.2µs   p(99.9)=582.56µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.69ms min=20.45ms med=122.8ms  max=372.54ms p(90)=155.36ms p(95)=165.58ms p(99.9)=209.55ms
     http_reqs......................: 47994   391.820074/s
     iteration_duration.............: avg=125.31ms min=28.01ms med=123.21ms max=394.64ms p(90)=155.76ms p(95)=166.01ms p(99.9)=216.15ms
     iterations.....................: 47894   391.00368/s
     success_rate...................: 100.00% ✓ 47894      ✗ 0    
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

     checks.........................: 100.00% ✓ 95568      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   314 kB/s
     http_req_blocked...............: avg=13.44µs  min=1.18µs  med=3.45µs   max=10.1ms   p(90)=5µs      p(95)=5.61µs   p(99.9)=5.27ms  
     http_req_connecting............: avg=9.65µs   min=0s      med=0s       max=10.08ms  p(90)=0s       p(95)=0s       p(99.9)=5.24ms  
     http_req_duration..............: avg=187.6ms  min=18.94ms med=173.31ms max=586.42ms p(90)=225.59ms p(95)=392.18ms p(99.9)=521.19ms
       { expected_response:true }...: avg=187.6ms  min=18.94ms med=173.31ms max=586.42ms p(90)=225.59ms p(95)=392.18ms p(99.9)=521.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31956
     http_req_receiving.............: avg=102.46µs min=35.76µs med=96.62µs  max=29.16ms  p(90)=130.63µs p(95)=144.21µs p(99.9)=534.82µs
     http_req_sending...............: avg=27.04µs  min=5.96µs  med=17.76µs  max=109.37ms p(90)=23.07µs  p(95)=24.96µs  p(99.9)=1.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.47ms min=18.79ms med=173.17ms max=586.34ms p(90)=225.46ms p(95)=392.08ms p(99.9)=521.07ms
     http_reqs......................: 31956   261.346682/s
     iteration_duration.............: avg=188.43ms min=44.58ms med=173.72ms max=586.58ms p(90)=226.02ms p(95)=393.03ms p(99.9)=521.46ms
     iterations.....................: 31856   260.528849/s
     success_rate...................: 100.00% ✓ 31856      ✗ 0    
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

     checks.........................: 100.00% ✓ 85368      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   279 kB/s
     http_req_blocked...............: avg=7.31µs   min=1.22µs  med=3.22µs   max=4.42ms   p(90)=4.54µs   p(95)=5.13µs   p(99.9)=2.1ms   
     http_req_connecting............: avg=3.91µs   min=0s      med=0s       max=4.37ms   p(90)=0s       p(95)=0s       p(99.9)=2.07ms  
     http_req_duration..............: avg=210.05ms min=22.64ms med=203.73ms max=440.77ms p(90)=238.23ms p(95)=246.03ms p(99.9)=322.68ms
       { expected_response:true }...: avg=210.05ms min=22.64ms med=203.73ms max=440.77ms p(90)=238.23ms p(95)=246.03ms p(99.9)=322.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28556
     http_req_receiving.............: avg=95.31µs  min=33.8µs  med=90.71µs  max=3.7ms    p(90)=124.29µs p(95)=137.48µs p(99.9)=529.98µs
     http_req_sending...............: avg=43.08µs  min=5.81µs  med=16.47µs  max=193.72ms p(90)=21.76µs  p(95)=23.75µs  p(99.9)=626.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.91ms min=22.47ms med=203.62ms max=439.74ms p(90)=238.1ms  p(95)=245.89ms p(99.9)=322.31ms
     http_reqs......................: 28556   232.360302/s
     iteration_duration.............: avg=211.02ms min=64.71ms med=204.02ms max=460.99ms p(90)=238.56ms p(95)=246.32ms p(99.9)=332.26ms
     iterations.....................: 28456   231.546602/s
     success_rate...................: 100.00% ✓ 28456      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

