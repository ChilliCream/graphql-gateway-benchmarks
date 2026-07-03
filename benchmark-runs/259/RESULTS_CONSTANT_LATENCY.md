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
| fusion | 16.3.0 | 1,778 | 1,809 | 1,774 | 0.7% |  |
| hive-router | v0.0.74 | 1,771 | 1,825 | 1,765 | 1.1% |  |
| fusion-nightly | 16.4.0-p.14 | 1,741 | 1,780 | 1,731 | 1.0% |  |
| grafbase | 0.53.5 | 1,203 | 1,225 | 1,196 | 0.8% |  |
| cosmo | 0.326.1 | 1,109 | 1,130 | 1,103 | 0.8% |  |
| hive-gateway-router-runtime | 2.10.0 | 494 | 507 | 492 | 1.2% |  |
| apollo-router | v2.15.1 | 361 | 375 | 358 | 1.7% |  |
| apollo-gateway | 2.14.2 | 227 | 229 | 226 | 0.4% |  |
| hive-gateway | 2.10.0 | 227 | 232 | 226 | 0.9% |  |
| feddi | 77271dc84a06 | 20 | 20 | 19 | 1.7% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 650118      ✗ 0     
     data_received..................: 19 GB   156 MB/s
     data_sent......................: 261 MB  2.1 MB/s
     http_req_blocked...............: avg=3.66µs   min=1.17µs  med=2.79µs   max=8.01ms   p(90)=4.38µs   p(95)=5.12µs  p(99.9)=41.38µs
     http_req_connecting............: avg=397ns    min=0s      med=0s       max=3.59ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.44ms  min=17ms    med=26.78ms  max=358.13ms p(90)=32.11ms  p(95)=34.16ms p(99.9)=54.29ms
       { expected_response:true }...: avg=27.44ms  min=17ms    med=26.78ms  max=358.13ms p(90)=32.11ms  p(95)=34.16ms p(99.9)=54.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 216806
     http_req_receiving.............: avg=370.05µs min=55.1µs  med=107.55µs max=304.46ms p(90)=907.76µs p(95)=1.42ms  p(99.9)=8.93ms 
     http_req_sending...............: avg=39.63µs  min=5.27µs  med=11.13µs  max=265.46ms p(90)=20.37µs  p(95)=88.87µs p(99.9)=1.91ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.03ms  min=16.88ms med=26.39ms  max=317.36ms p(90)=31.62ms  p(95)=33.63ms p(99.9)=52.4ms 
     http_reqs......................: 216806  1778.130183/s
     iteration_duration.............: avg=27.67ms  min=18.18ms med=27ms     max=366.79ms p(90)=32.34ms  p(95)=34.39ms p(99.9)=54.85ms
     iterations.....................: 216706  1777.310035/s
     success_rate...................: 100.00% ✓ 216706      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 648084      ✗ 0     
     data_received..................: 19 GB   155 MB/s
     data_sent......................: 260 MB  2.1 MB/s
     http_req_blocked...............: avg=3.49µs  min=990ns   med=2.37µs  max=8ms      p(90)=4.27µs  p(95)=5.04µs   p(99.9)=36.62µs
     http_req_connecting............: avg=538ns   min=0s      med=0s      max=4.84ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=27.53ms min=18.35ms med=27.05ms max=333.65ms p(90)=31.49ms p(95)=33.04ms  p(99.9)=50.64ms
       { expected_response:true }...: avg=27.53ms min=18.35ms med=27.05ms max=333.65ms p(90)=31.49ms p(95)=33.04ms  p(99.9)=50.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 216128
     http_req_receiving.............: avg=81.4µs  min=27.02µs med=51.74µs max=91.42ms  p(90)=99.52µs p(95)=131.22µs p(99.9)=2.83ms 
     http_req_sending...............: avg=34.69µs min=5.14µs  med=10.17µs max=177.51ms p(90)=20.11µs p(95)=32.63µs  p(99.9)=1.64ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=27.41ms min=18.25ms med=26.95ms max=333.19ms p(90)=31.38ms p(95)=32.9ms   p(99.9)=49.67ms
     http_reqs......................: 216128  1771.836531/s
     iteration_duration.............: avg=27.76ms min=18.67ms med=27.26ms max=368.39ms p(90)=31.71ms p(95)=33.26ms  p(99.9)=51.21ms
     iterations.....................: 216028  1771.016722/s
     success_rate...................: 100.00% ✓ 216028      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 636633      ✗ 0     
     data_received..................: 19 GB   153 MB/s
     data_sent......................: 255 MB  2.1 MB/s
     http_req_blocked...............: avg=3.67µs   min=1.15µs  med=2.7µs    max=4.58ms   p(90)=4.22µs  p(95)=4.91µs  p(99.9)=40.42µs
     http_req_connecting............: avg=554ns    min=0s      med=0s       max=4.54ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=28.02ms  min=17.93ms med=27.36ms  max=345.56ms p(90)=32.83ms p(95)=34.92ms p(99.9)=54.77ms
       { expected_response:true }...: avg=28.02ms  min=17.93ms med=27.36ms  max=345.56ms p(90)=32.83ms p(95)=34.92ms p(99.9)=54.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 212311
     http_req_receiving.............: avg=427.14µs min=55.23µs med=114.89µs max=163.19ms p(90)=1.07ms  p(95)=1.62ms  p(99.9)=10.61ms
     http_req_sending...............: avg=37.34µs  min=5.34µs  med=10.61µs  max=84.53ms  p(90)=19.87µs p(95)=87.5µs  p(99.9)=1.97ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.56ms  min=17.32ms med=26.91ms  max=344.88ms p(90)=32.28ms p(95)=34.32ms p(99.9)=52.77ms
     http_reqs......................: 212311  1741.180612/s
     iteration_duration.............: avg=28.26ms  min=18.17ms med=27.58ms  max=356.16ms p(90)=33.06ms p(95)=35.16ms p(99.9)=55.18ms
     iterations.....................: 212211  1740.360504/s
     success_rate...................: 100.00% ✓ 212211      ✗ 0     
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

     checks.........................: 100.00% ✓ 440250      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 176 MB  1.4 MB/s
     http_req_blocked...............: avg=3.41µs  min=1.04µs  med=2.42µs  max=3.62ms   p(90)=4.64µs   p(95)=5.52µs   p(99.9)=46.21µs
     http_req_connecting............: avg=340ns   min=0s      med=0s      max=2.73ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.61ms min=18.63ms med=40.36ms max=356.69ms p(90)=48.11ms  p(95)=50.44ms  p(99.9)=66.99ms
       { expected_response:true }...: avg=40.61ms min=18.63ms med=40.36ms max=356.69ms p(90)=48.11ms  p(95)=50.44ms  p(99.9)=66.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146850
     http_req_receiving.............: avg=87.41µs min=27.82µs med=55.35µs max=146.68ms p(90)=121.32µs p(95)=173.55µs p(99.9)=2.08ms 
     http_req_sending...............: avg=39.45µs min=4.9µs   med=10.09µs max=207.56ms p(90)=23.93µs  p(95)=89.97µs  p(99.9)=2.39ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.49ms min=18.47ms med=40.25ms max=355.12ms p(90)=47.99ms  p(95)=50.29ms  p(99.9)=65.95ms
     http_reqs......................: 146850  1203.489969/s
     iteration_duration.............: avg=40.88ms min=21.34ms med=40.6ms  max=374.27ms p(90)=48.35ms  p(95)=50.68ms  p(99.9)=67.37ms
     iterations.....................: 146750  1202.670432/s
     success_rate...................: 100.00% ✓ 146750      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 405693      ✗ 0     
     data_received..................: 12 GB   97 MB/s
     data_sent......................: 163 MB  1.3 MB/s
     http_req_blocked...............: avg=3.62µs  min=1.06µs  med=2.65µs  max=4.96ms   p(90)=4.31µs   p(95)=5.04µs   p(99.9)=38.83µs
     http_req_connecting............: avg=521ns   min=0s      med=0s      max=3.62ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.11ms min=18.84ms med=43.43ms max=342.43ms p(90)=53.82ms  p(95)=57.06ms  p(99.9)=75.5ms 
       { expected_response:true }...: avg=44.11ms min=18.84ms med=43.43ms max=342.43ms p(90)=53.82ms  p(95)=57.06ms  p(99.9)=75.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 135331
     http_req_receiving.............: avg=88.69µs min=28.52µs med=69.02µs max=131.28ms p(90)=109.84µs p(95)=128.16µs p(99.9)=1.55ms 
     http_req_sending...............: avg=30.44µs min=5.39µs  med=12.54µs max=217.12ms p(90)=20.02µs  p(95)=24.54µs  p(99.9)=1.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.99ms min=18.76ms med=43.33ms max=331.13ms p(90)=53.7ms   p(95)=56.94ms  p(99.9)=75.14ms
     http_reqs......................: 135331  1109.160145/s
     iteration_duration.............: avg=44.36ms min=23.73ms med=43.65ms max=377.42ms p(90)=54.03ms  p(95)=57.28ms  p(99.9)=75.94ms
     iterations.....................: 135231  1108.340554/s
     success_rate...................: 100.00% ✓ 135231      ✗ 0     
     vus............................: 47      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 181017     ✗ 0    
     data_received..................: 5.3 GB  43 MB/s
     data_sent......................: 73 MB   594 kB/s
     http_req_blocked...............: avg=5.57µs  min=1.43µs  med=3.39µs  max=4.26ms   p(90)=4.88µs   p(95)=5.54µs   p(99.9)=54.73µs 
     http_req_connecting............: avg=1.89µs  min=0s      med=0s      max=4.22ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=99.06ms min=21.2ms  med=96.69ms max=375.14ms p(90)=122.16ms p(95)=133.09ms p(99.9)=225.59ms
       { expected_response:true }...: avg=99.06ms min=21.2ms  med=96.69ms max=375.14ms p(90)=122.16ms p(95)=133.09ms p(99.9)=225.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60439
     http_req_receiving.............: avg=97.06µs min=33.1µs  med=81.29µs max=157.88ms p(90)=115.3µs  p(95)=127.48µs p(99.9)=934.36µs
     http_req_sending...............: avg=32.61µs min=6.04µs  med=15.86µs max=139.08ms p(90)=21.78µs  p(95)=24.33µs  p(99.9)=700.94µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.93ms min=21.1ms  med=96.57ms max=372.15ms p(90)=122.02ms p(95)=132.94ms p(99.9)=224.78ms
     http_reqs......................: 60439   494.346634/s
     iteration_duration.............: avg=99.44ms min=43.69ms med=96.95ms max=392.5ms  p(90)=122.4ms  p(95)=133.39ms p(99.9)=227.99ms
     iterations.....................: 60339   493.528707/s
     success_rate...................: 100.00% ✓ 60339      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 132567     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 53 MB   435 kB/s
     http_req_blocked...............: avg=5.25µs   min=1.16µs  med=3.05µs   max=3.65ms   p(90)=4.52µs   p(95)=5.12µs   p(99.9)=403.22µs
     http_req_connecting............: avg=1.93µs   min=0s      med=0s       max=3.63ms   p(90)=0s       p(95)=0s       p(99.9)=364.5µs 
     http_req_duration..............: avg=135.31ms min=20.96ms med=133.03ms max=383.09ms p(90)=170.22ms p(95)=181.71ms p(99.9)=231.29ms
       { expected_response:true }...: avg=135.31ms min=20.96ms med=133.03ms max=383.09ms p(90)=170.22ms p(95)=181.71ms p(99.9)=231.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44289
     http_req_receiving.............: avg=96.92µs  min=31.49µs med=83.45µs  max=161.11ms p(90)=115.19µs p(95)=126.64µs p(99.9)=850.42µs
     http_req_sending...............: avg=22.92µs  min=5.76µs  med=16.44µs  max=54.35ms  p(90)=21.66µs  p(95)=23.82µs  p(99.9)=865.25µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=135.19ms min=20.86ms med=132.91ms max=382.05ms p(90)=170.09ms p(95)=181.59ms p(99.9)=230.69ms
     http_reqs......................: 44289   361.911791/s
     iteration_duration.............: avg=135.83ms min=41.39ms med=133.32ms max=402.6ms  p(90)=170.52ms p(95)=181.99ms p(99.9)=235.98ms
     iterations.....................: 44189   361.094631/s
     success_rate...................: 100.00% ✓ 44189      ✗ 0    
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

     checks.........................: 100.00% ✓ 83358      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 34 MB   273 kB/s
     http_req_blocked...............: avg=7.15µs   min=1.6µs   med=3.57µs   max=4.55ms   p(90)=5.02µs   p(95)=5.64µs   p(99.9)=1.41ms  
     http_req_connecting............: avg=3.22µs   min=0s      med=0s       max=4.5ms    p(90)=0s       p(95)=0s       p(99.9)=1.37ms  
     http_req_duration..............: avg=215.07ms min=24.18ms med=215.43ms max=471.21ms p(90)=229.66ms p(95)=235.35ms p(99.9)=306.4ms 
       { expected_response:true }...: avg=215.07ms min=24.18ms med=215.43ms max=471.21ms p(90)=229.66ms p(95)=235.35ms p(99.9)=306.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 27886
     http_req_receiving.............: avg=108.08µs min=40.18µs med=93.71µs  max=146.47ms p(90)=125.73µs p(95)=138.5µs  p(99.9)=957.9µs 
     http_req_sending...............: avg=22.75µs  min=7.05µs  med=18.27µs  max=17.49ms  p(90)=23.18µs  p(95)=25.4µs   p(99.9)=633.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=214.94ms min=24.05ms med=215.31ms max=470.61ms p(90)=229.54ms p(95)=235.24ms p(99.9)=305.93ms
     http_reqs......................: 27886   227.188574/s
     iteration_duration.............: avg=216.06ms min=46.44ms med=215.91ms max=482.57ms p(90)=229.93ms p(95)=235.64ms p(99.9)=324.36ms
     iterations.....................: 27786   226.373869/s
     success_rate...................: 100.00% ✓ 27786      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 83058      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 33 MB   273 kB/s
     http_req_blocked...............: avg=8.01µs   min=1.57µs  med=3.71µs   max=4.8ms    p(90)=5.2µs    p(95)=5.82µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=4µs      min=0s      med=0s       max=4.76ms   p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=215.85ms min=18.55ms med=201.93ms max=856.06ms p(90)=255.79ms p(95)=291.9ms  p(99.9)=625.35ms
       { expected_response:true }...: avg=215.85ms min=18.55ms med=201.93ms max=856.06ms p(90)=255.79ms p(95)=291.9ms  p(99.9)=625.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 27786
     http_req_receiving.............: avg=105.71µs min=38.45µs med=94.79µs  max=141.22ms p(90)=125.48µs p(95)=138.2µs  p(99.9)=1.1ms   
     http_req_sending...............: avg=34.62µs  min=7.98µs  med=19.35µs  max=92.98ms  p(90)=24.13µs  p(95)=26.54µs  p(99.9)=621.46µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=215.71ms min=18.39ms med=201.81ms max=855.97ms p(90)=255.64ms p(95)=291.59ms p(99.9)=625.25ms
     http_reqs......................: 27786   227.173037/s
     iteration_duration.............: avg=216.86ms min=47.65ms med=202.45ms max=856.28ms p(90)=256.18ms p(95)=294.35ms p(99.9)=625.6ms 
     iterations.....................: 27686   226.355457/s
     success_rate...................: 100.00% ✓ 27686      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 7464      ✗ 0   
     data_received..................: 248 MB  2.0 MB/s
     data_sent......................: 3.1 MB  24 kB/s
     http_req_blocked...............: avg=47.84µs  min=1.37µs   med=3.78µs   max=4.37ms  p(90)=5.49µs   p(95)=6.5µs   p(99.9)=4.03ms 
     http_req_connecting............: avg=43.28µs  min=0s       med=0s       max=4.33ms  p(90)=0s       p(95)=0s      p(99.9)=4ms    
     http_req_duration..............: avg=2.33s    min=42.34ms  med=2.4s     max=4.06s   p(90)=3s       p(95)=3.16s   p(99.9)=3.89s  
       { expected_response:true }...: avg=2.33s    min=42.34ms  med=2.4s     max=4.06s   p(90)=3s       p(95)=3.16s   p(99.9)=3.89s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2588
     http_req_receiving.............: avg=139.51µs min=36.73µs  med=101.71µs max=37.91ms p(90)=148.53µs p(95)=168.6µs p(99.9)=9.84ms 
     http_req_sending...............: avg=74.75µs  min=6.72µs   med=19.71µs  max=38.65ms p(90)=25.38µs  p(95)=29.73µs p(99.9)=20.97ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=2.33s    min=42.19ms  med=2.4s     max=4.06s   p(90)=3s       p(95)=3.16s   p(99.9)=3.89s  
     http_reqs......................: 2588    20.378294/s
     iteration_duration.............: avg=2.42s    min=411.02ms med=2.43s    max=4.06s   p(90)=3.01s    p(95)=3.18s   p(99.9)=3.91s  
     iterations.....................: 2488    19.59088/s
     success_rate...................: 100.00% ✓ 2488      ✗ 0   
     vus............................: 2       min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 7.0.0-27-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=120 GB

