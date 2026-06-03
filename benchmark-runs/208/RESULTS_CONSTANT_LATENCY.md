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
| hive-router | v0.0.49 | 1,577 | 1,605 | 1,566 | 0.8% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,445 | 1,465 | 1,438 | 0.6% |  |
| cosmo | 0.307.0 | 1,137 | 1,153 | 1,126 | 0.9% | non-compatible response (4 across 3/9 runs) |
| grafbase | 0.53.3 | 1,132 | 1,157 | 1,126 | 1.0% |  |
| hive-gateway-router-runtime | 2.5.25 | 504 | 520 | 499 | 1.4% |  |
| apollo-router | v2.13.1 | 393 | 403 | 389 | 1.2% |  |
| apollo-gateway | 2.13.3 | 234 | 237 | 233 | 0.6% |  |
| hive-gateway | 2.5.25 | 232 | 237 | 230 | 1.2% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 577152      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.27µs  min=972ns   med=2.14µs  max=5.8ms    p(90)=4.01µs   p(95)=4.96µs   p(99.9)=35.32µs
     http_req_connecting............: avg=562ns   min=0s      med=0s      max=4.86ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.93ms min=13.25ms med=30.65ms max=320.08ms p(90)=36.84ms  p(95)=38.83ms  p(99.9)=58.94ms
       { expected_response:true }...: avg=30.93ms min=13.25ms med=30.65ms max=320.08ms p(90)=36.84ms  p(95)=38.83ms  p(99.9)=58.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192484
     http_req_receiving.............: avg=84.53µs min=27.45µs med=52.86µs max=112.37ms p(90)=105.78µs p(95)=157.68µs p(99.9)=2.41ms 
     http_req_sending...............: avg=35.7µs  min=4.92µs  med=9.28µs  max=148.5ms  p(90)=19.7µs   p(95)=70.19µs  p(99.9)=1.93ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.81ms min=13.15ms med=30.54ms max=319.52ms p(90)=36.71ms  p(95)=38.69ms  p(99.9)=57.76ms
     http_reqs......................: 192484  1577.239048/s
     iteration_duration.............: avg=31.18ms min=13.54ms med=30.87ms max=354.14ms p(90)=37.06ms  p(95)=39.05ms  p(99.9)=59.54ms
     iterations.....................: 192384  1576.419635/s
     success_rate...................: 100.00% ✓ 192384      ✗ 0     
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

     checks.........................: 100.00% ✓ 528933      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.32µs   min=982ns   med=2.22µs   max=6.51ms   p(90)=3.97µs  p(95)=4.85µs   p(99.9)=33.01µs
     http_req_connecting............: avg=610ns    min=0s      med=0s       max=3.87ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.77ms  min=13.9ms  med=32.65ms  max=488.52ms p(90)=41.49ms p(95)=44.97ms  p(99.9)=79.75ms
       { expected_response:true }...: avg=33.77ms  min=13.9ms  med=32.65ms  max=488.52ms p(90)=41.49ms p(95)=44.97ms  p(99.9)=79.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176411
     http_req_receiving.............: avg=842.32µs min=51.53µs med=117.74µs max=292.91ms p(90)=2.38ms  p(95)=3.61ms   p(99.9)=18.75ms
     http_req_sending...............: avg=43.28µs  min=5.02µs  med=9.33µs   max=266.36ms p(90)=20.36µs p(95)=108.37µs p(99.9)=2.73ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.89ms  min=13.79ms med=31.81ms  max=487.15ms p(90)=40.37ms p(95)=43.68ms  p(99.9)=78.13ms
     http_reqs......................: 176411  1445.900613/s
     iteration_duration.............: avg=34.02ms  min=14.12ms med=32.87ms  max=488.7ms  p(90)=41.71ms p(95)=45.19ms  p(99.9)=80.3ms 
     iterations.....................: 176311  1445.080993/s
     success_rate...................: 100.00% ✓ 176311      ✗ 0     
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

     checks.........................: 100.00% ✓ 416175      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.65µs  min=1.08µs  med=2.55µs  max=4.44ms   p(90)=4.13µs   p(95)=4.89µs   p(99.9)=38.13µs
     http_req_connecting............: avg=736ns   min=0s      med=0s      max=4.4ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43ms    min=19.12ms med=42.39ms max=324.82ms p(90)=52.37ms  p(95)=55.52ms  p(99.9)=72.44ms
       { expected_response:true }...: avg=43ms    min=19.12ms med=42.39ms max=324.82ms p(90)=52.37ms  p(95)=55.52ms  p(99.9)=72.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138825
     http_req_receiving.............: avg=86.99µs min=29.04µs med=64.24µs max=24.81ms  p(90)=108.35µs p(95)=134.91µs p(99.9)=2.04ms 
     http_req_sending...............: avg=30.49µs min=5.5µs   med=11.02µs max=239.74ms p(90)=18.46µs  p(95)=23.45µs  p(99.9)=1.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.89ms min=19.05ms med=42.29ms max=324.3ms  p(90)=52.24ms  p(95)=55.37ms  p(99.9)=71.65ms
     http_reqs......................: 138825  1137.450268/s
     iteration_duration.............: avg=43.24ms min=19.3ms  med=42.6ms  max=360.75ms p(90)=52.57ms  p(95)=55.72ms  p(99.9)=72.85ms
     iterations.....................: 138725  1136.630927/s
     success_rate...................: 100.00% ✓ 138725      ✗ 0     
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

     checks.........................: 100.00% ✓ 414261      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.7µs   min=942ns   med=2.21µs  max=4.13ms   p(90)=4.63µs   p(95)=5.79µs   p(99.9)=47.86µs
     http_req_connecting............: avg=794ns   min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.17ms min=17.18ms med=42.73ms max=320.85ms p(90)=52.46ms  p(95)=55.63ms  p(99.9)=84.92ms
       { expected_response:true }...: avg=43.17ms min=17.18ms med=42.73ms max=320.85ms p(90)=52.46ms  p(95)=55.63ms  p(99.9)=84.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138187
     http_req_receiving.............: avg=96.37µs min=28.32µs med=59.33µs max=80.48ms  p(90)=131.32µs p(95)=204.79µs p(99.9)=3ms    
     http_req_sending...............: avg=38.53µs min=5.14µs  med=9.86µs  max=192.29ms p(90)=24.22µs  p(95)=106.51µs p(99.9)=2.1ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.03ms min=16.54ms med=42.61ms max=320.17ms p(90)=52.31ms  p(95)=55.47ms  p(99.9)=83.5ms 
     http_reqs......................: 138187  1132.433119/s
     iteration_duration.............: avg=43.44ms min=17.43ms med=42.97ms max=347.51ms p(90)=52.69ms  p(95)=55.86ms  p(99.9)=86.39ms
     iterations.....................: 138087  1131.613625/s
     success_rate...................: 100.00% ✓ 138087      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 185154     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 74 MB   606 kB/s
     http_req_blocked...............: avg=4.99µs  min=1.16µs  med=3.05µs  max=4.18ms   p(90)=4.58µs   p(95)=5.22µs   p(99.9)=53.22µs 
     http_req_connecting............: avg=1.7µs   min=0s      med=0s      max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.87ms min=20.56ms med=94.03ms max=368.08ms p(90)=118.12ms p(95)=128.87ms p(99.9)=225.23ms
       { expected_response:true }...: avg=96.87ms min=20.56ms med=94.03ms max=368.08ms p(90)=118.12ms p(95)=128.87ms p(99.9)=225.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61818
     http_req_receiving.............: avg=87.43µs min=31.74µs med=78.47µs max=35.84ms  p(90)=113.39µs p(95)=126.8µs  p(99.9)=893.1µs 
     http_req_sending...............: avg=31.52µs min=5.96µs  med=14.18µs max=253.18ms p(90)=20.7µs   p(95)=23.02µs  p(99.9)=739.91µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.75ms min=20.41ms med=93.92ms max=367.64ms p(90)=118.01ms p(95)=128.72ms p(99.9)=224.98ms
     http_reqs......................: 61818   504.839633/s
     iteration_duration.............: avg=97.24ms min=35.12ms med=94.27ms max=376.02ms p(90)=118.37ms p(95)=129.15ms p(99.9)=227.41ms
     iterations.....................: 61718   504.022978/s
     success_rate...................: 100.00% ✓ 61718      ✗ 0    
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

     checks.........................: 100.00% ✓ 144285     ✗ 0    
     data_received..................: 4.2 GB  34 MB/s
     data_sent......................: 58 MB   472 kB/s
     http_req_blocked...............: avg=5.63µs   min=1.11µs  med=3.26µs   max=3.84ms   p(90)=4.79µs   p(95)=5.39µs   p(99.9)=447.06µs
     http_req_connecting............: avg=2.09µs   min=0s      med=0s       max=3.8ms    p(90)=0s       p(95)=0s       p(99.9)=262.08µs
     http_req_duration..............: avg=124.31ms min=21.86ms med=122.36ms max=360.14ms p(90)=155.22ms p(95)=165.35ms p(99.9)=217.04ms
       { expected_response:true }...: avg=124.31ms min=21.86ms med=122.36ms max=360.14ms p(90)=155.22ms p(95)=165.35ms p(99.9)=217.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48195
     http_req_receiving.............: avg=182.23µs min=31.01µs med=85.53µs  max=217.26ms p(90)=119.08µs p(95)=132.09µs p(99.9)=1.27ms  
     http_req_sending...............: avg=23.69µs  min=5.55µs  med=16.15µs  max=107.23ms p(90)=21.96µs  p(95)=24.13µs  p(99.9)=512.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.1ms  min=21.77ms med=122.24ms max=265.65ms p(90)=154.97ms p(95)=165.1ms  p(99.9)=209.77ms
     http_reqs......................: 48195   393.396342/s
     iteration_duration.............: avg=124.79ms min=29.41ms med=122.66ms max=370.92ms p(90)=155.54ms p(95)=165.67ms p(99.9)=222.32ms
     iterations.....................: 48095   392.580083/s
     success_rate...................: 100.00% ✓ 48095      ✗ 0    
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

     checks.........................: 100.00% ✓ 86001      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   281 kB/s
     http_req_blocked...............: avg=7.38µs   min=1.18µs  med=3.49µs   max=4.09ms   p(90)=5µs      p(95)=5.62µs   p(99.9)=1.85ms  
     http_req_connecting............: avg=3.57µs   min=0s      med=0s       max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=1.81ms  
     http_req_duration..............: avg=208.49ms min=23.94ms med=212.36ms max=427.9ms  p(90)=226.05ms p(95)=231.73ms p(99.9)=305.97ms
       { expected_response:true }...: avg=208.49ms min=23.94ms med=212.36ms max=427.9ms  p(90)=226.05ms p(95)=231.73ms p(99.9)=305.97ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28767
     http_req_receiving.............: avg=101.83µs min=33.49µs med=95.01µs  max=23.82ms  p(90)=128.82µs p(95)=142.3µs  p(99.9)=792.11µs
     http_req_sending...............: avg=43.8µs   min=5.77µs  med=17.68µs  max=129.7ms  p(90)=23.12µs  p(95)=25.03µs  p(99.9)=556.66µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.35ms min=23.81ms med=212.24ms max=427.35ms p(90)=225.92ms p(95)=231.6ms  p(99.9)=305.87ms
     http_reqs......................: 28767   234.069326/s
     iteration_duration.............: avg=209.45ms min=65.65ms med=212.68ms max=447.9ms  p(90)=226.33ms p(95)=232.01ms p(99.9)=315.71ms
     iterations.....................: 28667   233.255653/s
     success_rate...................: 100.00% ✓ 28667      ✗ 0    
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

     checks.........................: 100.00% ✓ 84960      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   279 kB/s
     http_req_blocked...............: avg=7.36µs   min=1.17µs  med=3.62µs   max=3.96ms   p(90)=5.2µs    p(95)=5.82µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=3.48µs   min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=211.05ms min=19.09ms med=195.7ms  max=643.42ms p(90)=245.35ms p(95)=457.6ms  p(99.9)=594.28ms
       { expected_response:true }...: avg=211.05ms min=19.09ms med=195.7ms  max=643.42ms p(90)=245.35ms p(95)=457.6ms  p(99.9)=594.28ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28420
     http_req_receiving.............: avg=110.67µs min=34.06µs med=102.57µs max=63.45ms  p(90)=136.19µs p(95)=150.31µs p(99.9)=539.28µs
     http_req_sending...............: avg=33.28µs  min=6µs     med=18.82µs  max=132.1ms  p(90)=24.14µs  p(95)=26µs     p(99.9)=640.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.9ms  min=18.96ms med=195.57ms max=643.29ms p(90)=245.22ms p(95)=457.54ms p(99.9)=594.17ms
     http_reqs......................: 28420   232.276502/s
     iteration_duration.............: avg=212.04ms min=43.95ms med=196.13ms max=643.69ms p(90)=245.8ms  p(95)=458.28ms p(99.9)=594.53ms
     iterations.....................: 28320   231.459203/s
     success_rate...................: 100.00% ✓ 28320      ✗ 0    
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

