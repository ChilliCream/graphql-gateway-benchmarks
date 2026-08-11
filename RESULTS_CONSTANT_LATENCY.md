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
| fusion | 16.6.0 | 1,888 | 1,934 | 1,877 | 0.9% |  |
| hive-router | v0.0.84 | 1,833 | 1,905 | 1,820 | 1.5% |  |
| grafbase | 0.53.5 | 1,269 | 1,309 | 1,267 | 1.2% |  |
| cosmo | 0.334.0 | 1,222 | 1,262 | 1,217 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 563 | 582 | 561 | 1.2% |  |
| apollo-router | v2.16.1 | 435 | 450 | 432 | 1.5% |  |
| apollo-gateway | 2.14.3 | 264 | 268 | 263 | 0.6% |  |
| hive-gateway | 2.10.8 | 253 | 260 | 252 | 1.3% |  |
| feddi | 5ff8b6165878 | 20 | 20 | 19 | 2.5% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 690516      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=2.88µs   min=871ns   med=2.05µs  max=4.11ms   p(90)=3.8µs    p(95)=4.54µs  p(99.9)=30.63µs
     http_req_connecting............: avg=395ns    min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.84ms  min=17.26ms med=25.24ms max=299.65ms p(90)=30.17ms  p(95)=32ms    p(99.9)=49.94ms
       { expected_response:true }...: avg=25.84ms  min=17.26ms med=25.24ms max=299.65ms p(90)=30.17ms  p(95)=32ms    p(99.9)=49.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230272
     http_req_receiving.............: avg=299.37µs min=50.05µs med=93.12µs max=75.77ms  p(90)=734.26µs p(95)=1.24ms  p(99.9)=8.25ms 
     http_req_sending...............: avg=33.23µs  min=4.57µs  med=8.55µs  max=158.72ms p(90)=18.61µs  p(95)=32.15µs p(99.9)=1.59ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.5ms   min=17.15ms med=24.93ms max=277.18ms p(90)=29.77ms  p(95)=31.54ms p(99.9)=48.36ms
     http_reqs......................: 230272  1888.535706/s
     iteration_duration.............: avg=26.05ms  min=17.48ms med=25.44ms max=316ms    p(90)=30.38ms  p(95)=32.21ms p(99.9)=50.45ms
     iterations.....................: 230172  1887.715573/s
     success_rate...................: 100.00% ✓ 230172      ✗ 0     
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

     checks.........................: 100.00% ✓ 670620      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=2.75µs  min=871ns   med=1.99µs  max=3.97ms   p(90)=3.5µs   p(95)=4.2µs    p(99.9)=29.78µs
     http_req_connecting............: avg=401ns   min=0s      med=0s      max=3.93ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.62ms min=18.35ms med=26.21ms max=289.16ms p(90)=30.35ms p(95)=31.76ms  p(99.9)=46.51ms
       { expected_response:true }...: avg=26.62ms min=18.35ms med=26.21ms max=289.16ms p(90)=30.35ms p(95)=31.76ms  p(99.9)=46.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223640
     http_req_receiving.............: avg=71.39µs min=24.45µs med=49.06µs max=107.54ms p(90)=90.04µs p(95)=114.21µs p(99.9)=1.63ms 
     http_req_sending...............: avg=27.43µs min=4.59µs  med=8.99µs  max=103.8ms  p(90)=17.22µs p(95)=23.65µs  p(99.9)=1.27ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.52ms min=18.24ms med=26.12ms max=288.99ms p(90)=30.25ms p(95)=31.64ms  p(99.9)=45.12ms
     http_reqs......................: 223640  1833.767817/s
     iteration_duration.............: avg=26.83ms min=18.52ms med=26.4ms  max=306.64ms p(90)=30.55ms p(95)=31.95ms  p(99.9)=46.88ms
     iterations.....................: 223540  1832.947853/s
     success_rate...................: 100.00% ✓ 223540      ✗ 0     
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

     checks.........................: 100.00% ✓ 464400      ✗ 0     
     data_received..................: 14 GB   111 MB/s
     data_sent......................: 186 MB  1.5 MB/s
     http_req_blocked...............: avg=3.91µs  min=1.07µs  med=3.02µs  max=6.51ms   p(90)=5.33µs   p(95)=6.32µs   p(99.9)=48.85µs
     http_req_connecting............: avg=284ns   min=0s      med=0s      max=2.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.47ms min=18.39ms med=38.21ms max=319.22ms p(90)=45.29ms  p(95)=47.42ms  p(99.9)=62.76ms
       { expected_response:true }...: avg=38.47ms min=18.39ms med=38.21ms max=319.22ms p(90)=45.29ms  p(95)=47.42ms  p(99.9)=62.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154900
     http_req_receiving.............: avg=91.92µs min=27.86µs med=61.9µs  max=142.65ms p(90)=129.93µs p(95)=180.25µs p(99.9)=1.99ms 
     http_req_sending...............: avg=37.08µs min=4.92µs  med=11.57µs max=232.82ms p(90)=25.57µs  p(95)=76.64µs  p(99.9)=1.94ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.34ms min=18.29ms med=38.09ms max=318.98ms p(90)=45.15ms  p(95)=47.26ms  p(99.9)=62.19ms
     http_reqs......................: 154900  1269.703924/s
     iteration_duration.............: avg=38.74ms min=21.91ms med=38.46ms max=331.78ms p(90)=45.51ms  p(95)=47.64ms  p(99.9)=63.37ms
     iterations.....................: 154800  1268.884231/s
     success_rate...................: 100.00% ✓ 154800      ✗ 0     
     vus............................: 34      min=0         max=50  
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

     checks.........................: 100.00% ✓ 447222      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.23µs  min=972ns   med=2.28µs  max=3.6ms    p(90)=3.87µs   p(95)=4.55µs   p(99.9)=33.62µs 
     http_req_connecting............: avg=610ns   min=0s      med=0s      max=3.56ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.02ms min=18.17ms med=39.38ms max=315.19ms p(90)=48.09ms  p(95)=50.9ms   p(99.9)=65.65ms 
       { expected_response:true }...: avg=40.02ms min=18.17ms med=39.38ms max=315.19ms p(90)=48.09ms  p(95)=50.9ms   p(99.9)=65.65ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 149174
     http_req_receiving.............: avg=72.96µs min=25.1µs  med=59.88µs max=50.19ms  p(90)=100.08µs p(95)=117.38µs p(99.9)=833.89µs
     http_req_sending...............: avg=24.18µs min=4.93µs  med=10.69µs max=123.7ms  p(90)=18.26µs  p(95)=22.14µs  p(99.9)=929.54µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.92ms min=18.08ms med=39.29ms max=298.13ms p(90)=47.99ms  p(95)=50.8ms   p(99.9)=65.25ms 
     http_reqs......................: 149174  1222.929774/s
     iteration_duration.............: avg=40.24ms min=23.03ms med=39.59ms max=325.18ms p(90)=48.29ms  p(95)=51.1ms   p(99.9)=65.92ms 
     iterations.....................: 149074  1222.109973/s
     success_rate...................: 100.00% ✓ 149074      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 206211     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 83 MB   676 kB/s
     http_req_blocked...............: avg=4.95µs  min=1.3µs   med=3.32µs  max=3.37ms   p(90)=4.93µs   p(95)=5.62µs   p(99.9)=46.05µs 
     http_req_connecting............: avg=1.33µs  min=0s      med=0s      max=3.33ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.94ms min=20.74ms med=85.38ms max=315.71ms p(90)=105.48ms p(95)=114.42ms p(99.9)=202.59ms
       { expected_response:true }...: avg=86.94ms min=20.74ms med=85.38ms max=315.71ms p(90)=105.48ms p(95)=114.42ms p(99.9)=202.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68837
     http_req_receiving.............: avg=92.18µs min=29.36µs med=78.91µs max=206.07ms p(90)=115.53µs p(95)=129.57µs p(99.9)=650.94µs
     http_req_sending...............: avg=22.93µs min=5.5µs   med=15.72µs max=50.89ms  p(90)=22.48µs  p(95)=24.83µs  p(99.9)=666.49µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.82ms min=20.6ms  med=85.27ms max=315.12ms p(90)=105.36ms p(95)=114.28ms p(99.9)=201.8ms 
     http_reqs......................: 68837   563.181607/s
     iteration_duration.............: avg=87.29ms min=40.15ms med=85.65ms max=348.03ms p(90)=105.74ms p(95)=114.69ms p(99.9)=203.68ms
     iterations.....................: 68737   562.363469/s
     success_rate...................: 100.00% ✓ 68737      ✗ 0    
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

     checks.........................: 100.00% ✓ 159405     ✗ 0    
     data_received..................: 4.7 GB  38 MB/s
     data_sent......................: 64 MB   522 kB/s
     http_req_blocked...............: avg=6.24µs   min=1.42µs  med=3.85µs   max=4.05ms   p(90)=5.5µs    p(95)=6.13µs   p(99.9)=57.07µs 
     http_req_connecting............: avg=2.12µs   min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.48ms min=21.79ms med=110.6ms  max=345.55ms p(90)=139.96ms p(95)=149.56ms p(99.9)=189.07ms
       { expected_response:true }...: avg=112.48ms min=21.79ms med=110.6ms  max=345.55ms p(90)=139.96ms p(95)=149.56ms p(99.9)=189.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53235
     http_req_receiving.............: avg=92.05µs  min=31.57µs med=85.35µs  max=154.31ms p(90)=116.9µs  p(95)=129.38µs p(99.9)=558.68µs
     http_req_sending...............: avg=30.46µs  min=5.89µs  med=17.95µs  max=122.01ms p(90)=23.84µs  p(95)=26.02µs  p(99.9)=581.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.36ms min=21.65ms med=110.49ms max=345.29ms p(90)=139.84ms p(95)=149.42ms p(99.9)=188.7ms 
     http_reqs......................: 53235   435.089529/s
     iteration_duration.............: avg=112.94ms min=40.74ms med=110.91ms max=355.84ms p(90)=140.26ms p(95)=149.87ms p(99.9)=190.61ms
     iterations.....................: 53135   434.272229/s
     success_rate...................: 100.00% ✓ 53135      ✗ 0    
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

     checks.........................: 100.00% ✓ 96930      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   317 kB/s
     http_req_blocked...............: avg=6.23µs   min=1.18µs  med=3.16µs   max=3.98ms   p(90)=4.64µs   p(95)=5.22µs   p(99.9)=1.21ms  
     http_req_connecting............: avg=2.8µs    min=0s      med=0s       max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=1.15ms  
     http_req_duration..............: avg=185.02ms min=23.32ms med=194.75ms max=373.41ms p(90)=212.36ms p(95)=216.4ms  p(99.9)=289.39ms
       { expected_response:true }...: avg=185.02ms min=23.32ms med=194.75ms max=373.41ms p(90)=212.36ms p(95)=216.4ms  p(99.9)=289.39ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32410
     http_req_receiving.............: avg=93.76µs  min=33.05µs med=90.17µs  max=14.44ms  p(90)=120.99µs p(95)=133.56µs p(99.9)=523.08µs
     http_req_sending...............: avg=27.64µs  min=5.71µs  med=17.14µs  max=75.79ms  p(90)=21.92µs  p(95)=23.88µs  p(99.9)=571.92µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.89ms min=23.22ms med=194.59ms max=372.74ms p(90)=212.25ms p(95)=216.29ms p(99.9)=289.28ms
     http_reqs......................: 32410   264.253227/s
     iteration_duration.............: avg=185.81ms min=42.81ms med=195.88ms max=383.34ms p(90)=212.66ms p(95)=216.71ms p(99.9)=290.88ms
     iterations.....................: 32310   263.437882/s
     success_rate...................: 100.00% ✓ 32310      ✗ 0    
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

     checks.........................: 100.00% ✓ 92562      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   304 kB/s
     http_req_blocked...............: avg=7.13µs   min=1.26µs  med=3.58µs   max=4.39ms   p(90)=5.03µs   p(95)=5.65µs   p(99.9)=1.39ms  
     http_req_connecting............: avg=3.22µs   min=0s      med=0s       max=4.35ms   p(90)=0s       p(95)=0s       p(99.9)=1.37ms  
     http_req_duration..............: avg=193.72ms min=18.39ms med=180.83ms max=630.24ms p(90)=231.49ms p(95)=262.41ms p(99.9)=580.07ms
       { expected_response:true }...: avg=193.72ms min=18.39ms med=180.83ms max=630.24ms p(90)=231.49ms p(95)=262.41ms p(99.9)=580.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30954
     http_req_receiving.............: avg=100.61µs min=36.97µs med=90.77µs  max=78.19ms  p(90)=122.55µs p(95)=135.34µs p(99.9)=533.3µs 
     http_req_sending...............: avg=30.07µs  min=6.35µs  med=18.53µs  max=79.66ms  p(90)=23.45µs  p(95)=25.38µs  p(99.9)=524.95µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.59ms min=18.29ms med=180.71ms max=630.15ms p(90)=231.37ms p(95)=262.05ms p(99.9)=579.98ms
     http_reqs......................: 30954   253.555906/s
     iteration_duration.............: avg=194.58ms min=50.99ms med=181.26ms max=630.5ms  p(90)=231.84ms p(95)=263.31ms p(99.9)=580.29ms
     iterations.....................: 30854   252.736769/s
     success_rate...................: 100.00% ✓ 30854      ✗ 0    
     vus............................: 35      min=0        max=50 
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

     checks.........................: 100.00% ✓ 7434      ✗ 0   
     data_received..................: 247 MB  2.0 MB/s
     data_sent......................: 3.1 MB  25 kB/s
     http_req_blocked...............: avg=52.54µs  min=1.6µs    med=3.95µs   max=5.78ms  p(90)=5.75µs   p(95)=6.5µs    p(99.9)=5.34ms
     http_req_connecting............: avg=46.2µs   min=0s       med=0s       max=5.65ms  p(90)=0s       p(95)=0s       p(99.9)=5.27ms
     http_req_duration..............: avg=2.34s    min=37.65ms  med=2.39s    max=11.99s  p(90)=3.21s    p(95)=3.46s    p(99.9)=10.95s
       { expected_response:true }...: avg=2.34s    min=37.65ms  med=2.39s    max=11.99s  p(90)=3.21s    p(95)=3.46s    p(99.9)=10.95s
     http_req_failed................: 0.00%   ✓ 0         ✗ 2578
     http_req_receiving.............: avg=134.72µs min=36.25µs  med=102.58µs max=35.01ms p(90)=144.17µs p(95)=160.23µs p(99.9)=7.59ms
     http_req_sending...............: avg=51.82µs  min=6.43µs   med=20.04µs  max=22.53ms p(90)=25.96µs  p(95)=31.07µs  p(99.9)=2.15ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.34s    min=37.49ms  med=2.39s    max=11.99s  p(90)=3.21s    p(95)=3.46s    p(99.9)=10.95s
     http_reqs......................: 2578    20.409812/s
     iteration_duration.............: avg=2.43s    min=170.45ms med=2.43s    max=12s     p(90)=3.22s    p(95)=3.48s    p(99.9)=11.02s
     iterations.....................: 2478    19.61812/s
     success_rate...................: 100.00% ✓ 2478      ✗ 0   
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

