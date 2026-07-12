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
| fusion-nightly | 16.5.0-p.12 | 1,866 | 1,911 | 1,858 | 0.9% |  |
| fusion | 16.4.0 | 1,850 | 1,900 | 1,832 | 1.2% |  |
| fusion-nightly-net11 | 16.5.0-p.12 | 1,838 | 1,886 | 1,830 | 1.1% |  |
| hive-router | v0.0.78 | 1,837 | 1,899 | 1,823 | 1.3% |  |
| fusion-nightly-fed | 16.5.0-p.12 | 1,741 | 1,777 | 1,728 | 1.0% |  |
| grafbase | 0.53.5 | 1,326 | 1,357 | 1,318 | 1.0% |  |
| cosmo | 0.329.0 | 1,214 | 1,256 | 1,204 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.2 | 568 | 588 | 563 | 1.4% |  |
| apollo-router | v2.16.0 | 399 | 418 | 396 | 2.1% |  |
| apollo-gateway | 2.14.2 | 266 | 269 | 262 | 0.8% |  |
| hive-gateway | 2.10.2 | 254 | 260 | 253 | 1.1% |  |
| feddi | 5ff8b6165878 | 18 | 19 | 17 | 2.8% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 682389      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=2.79µs   min=912ns   med=1.99µs  max=8.64ms   p(90)=3.51µs   p(95)=4.22µs  p(99.9)=26.17µs
     http_req_connecting............: avg=384ns    min=0s      med=0s      max=3.41ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.16ms  min=17.65ms med=25.57ms max=303.27ms p(90)=30.6ms   p(95)=32.41ms p(99.9)=48.13ms
       { expected_response:true }...: avg=26.16ms  min=17.65ms med=25.57ms max=303.27ms p(90)=30.6ms   p(95)=32.41ms p(99.9)=48.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227563
     http_req_receiving.............: avg=330.55µs min=51.03µs med=94.96µs max=30.39ms  p(90)=849.13µs p(95)=1.36ms  p(99.9)=8.39ms 
     http_req_sending...............: avg=31.04µs  min=4.71µs  med=8.33µs  max=190.14ms p(90)=16.99µs  p(95)=26.91µs p(99.9)=1.58ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.79ms  min=17.2ms  med=25.22ms max=302.73ms p(90)=30.16ms  p(95)=31.93ms p(99.9)=46.57ms
     http_reqs......................: 227563  1866.507929/s
     iteration_duration.............: avg=26.37ms  min=17.83ms med=25.77ms max=314ms    p(90)=30.8ms   p(95)=32.61ms p(99.9)=48.62ms
     iterations.....................: 227463  1865.687713/s
     success_rate...................: 100.00% ✓ 227463      ✗ 0     
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

     checks.........................: 100.00% ✓ 676539      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=2.89µs   min=902ns   med=2.04µs  max=4.09ms   p(90)=3.78µs   p(95)=4.49µs  p(99.9)=32.43µs
     http_req_connecting............: avg=404ns    min=0s      med=0s      max=4.05ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.38ms  min=17.72ms med=25.8ms  max=276.93ms p(90)=30.77ms  p(95)=32.6ms  p(99.9)=50.47ms
       { expected_response:true }...: avg=26.38ms  min=17.72ms med=25.8ms  max=276.93ms p(90)=30.77ms  p(95)=32.6ms  p(99.9)=50.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 225613
     http_req_receiving.............: avg=338.26µs min=51.22µs med=97.29µs max=221.76ms p(90)=810.54µs p(95)=1.3ms   p(99.9)=9.13ms 
     http_req_sending...............: avg=30.47µs  min=4.66µs  med=8.67µs  max=45.86ms  p(90)=18.8µs   p(95)=29.07µs p(99.9)=1.55ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.01ms  min=17.63ms med=25.47ms max=207.06ms p(90)=30.36ms  p(95)=32.17ms p(99.9)=48.89ms
     http_reqs......................: 225613  1850.178603/s
     iteration_duration.............: avg=26.59ms  min=17.9ms  med=26.01ms max=319.95ms p(90)=30.98ms  p(95)=32.8ms  p(99.9)=50.83ms
     iterations.....................: 225513  1849.358535/s
     success_rate...................: 100.00% ✓ 225513      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 672312      ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=2.77µs   min=871ns   med=1.92µs  max=7.06ms   p(90)=3.5µs    p(95)=4.23µs  p(99.9)=29.23µs
     http_req_connecting............: avg=429ns    min=0s      med=0s      max=3.46ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.55ms  min=17.82ms med=25.97ms max=301.04ms p(90)=30.91ms  p(95)=32.73ms p(99.9)=50.08ms
       { expected_response:true }...: avg=26.55ms  min=17.82ms med=25.97ms max=301.04ms p(90)=30.91ms  p(95)=32.73ms p(99.9)=50.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 224204
     http_req_receiving.............: avg=348.95µs min=50.12µs med=96.31µs max=247.57ms p(90)=920.19µs p(95)=1.43ms  p(99.9)=9.04ms 
     http_req_sending...............: avg=30.62µs  min=4.49µs  med=8.37µs  max=149.6ms  p(90)=17.62µs  p(95)=28.39µs p(99.9)=1.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.17ms  min=17.73ms med=25.61ms max=288.05ms p(90)=30.46ms  p(95)=32.23ms p(99.9)=48.4ms 
     http_reqs......................: 224204  1838.776567/s
     iteration_duration.............: avg=26.76ms  min=17.97ms med=26.17ms max=309.58ms p(90)=31.1ms   p(95)=32.93ms p(99.9)=50.46ms
     iterations.....................: 224104  1837.956432/s
     success_rate...................: 100.00% ✓ 224104      ✗ 0     
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

     checks.........................: 100.00% ✓ 672009      ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=3.32µs  min=941ns   med=2.48µs  max=8.22ms   p(90)=4.22µs  p(95)=4.96µs   p(99.9)=33.68µs
     http_req_connecting............: avg=431ns   min=0s      med=0s      max=3.76ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.55ms min=18.07ms med=26.11ms max=302.41ms p(90)=30.35ms p(95)=31.77ms  p(99.9)=48.46ms
       { expected_response:true }...: avg=26.55ms min=18.07ms med=26.11ms max=302.41ms p(90)=30.35ms p(95)=31.77ms  p(99.9)=48.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 224103
     http_req_receiving.............: avg=75.84µs min=25.31µs med=50.53µs max=131.9ms  p(90)=95.14µs p(95)=122.43µs p(99.9)=1.98ms 
     http_req_sending...............: avg=30.93µs min=4.6µs   med=10.15µs max=181.66ms p(90)=19.26µs p(95)=27.14µs  p(99.9)=1.39ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.44ms min=17.98ms med=26.02ms max=302.11ms p(90)=30.24ms p(95)=31.65ms  p(99.9)=47.01ms
     http_reqs......................: 224103  1837.654058/s
     iteration_duration.............: avg=26.77ms min=18.46ms med=26.32ms max=310.29ms p(90)=30.56ms p(95)=31.98ms  p(99.9)=48.97ms
     iterations.....................: 224003  1836.834054/s
     success_rate...................: 100.00% ✓ 224003      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 637029      ✗ 0     
     data_received..................: 19 GB   153 MB/s
     data_sent......................: 255 MB  2.1 MB/s
     http_req_blocked...............: avg=3.01µs   min=852ns   med=2.07µs  max=4.19ms   p(90)=3.97µs   p(95)=4.69µs  p(99.9)=33.34µs
     http_req_connecting............: avg=471ns    min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=28.03ms  min=17.62ms med=27.48ms max=305.4ms  p(90)=32.8ms   p(95)=34.63ms p(99.9)=50.33ms
       { expected_response:true }...: avg=28.03ms  min=17.62ms med=27.48ms max=305.4ms  p(90)=32.8ms   p(95)=34.63ms p(99.9)=50.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 212443
     http_req_receiving.............: avg=334.58µs min=51.11µs med=98.33µs max=153.22ms p(90)=870.87µs p(95)=1.39ms  p(99.9)=8.18ms 
     http_req_sending...............: avg=30.65µs  min=4.37µs  med=8.58µs  max=158.2ms  p(90)=19.44µs  p(95)=29.06µs p(99.9)=1.48ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.66ms  min=17.53ms med=27.14ms max=277.57ms p(90)=32.35ms  p(95)=34.16ms p(99.9)=48.83ms
     http_reqs......................: 212443  1741.666139/s
     iteration_duration.............: avg=28.24ms  min=17.79ms med=27.69ms max=316.31ms p(90)=33ms     p(95)=34.84ms p(99.9)=50.77ms
     iterations.....................: 212343  1740.846311/s
     success_rate...................: 100.00% ✓ 212343      ✗ 0     
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

     checks.........................: 100.00% ✓ 485115      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 194 MB  1.6 MB/s
     http_req_blocked...............: avg=3.97µs  min=932ns   med=2.85µs  max=4.02ms   p(90)=5.19µs   p(95)=6.17µs   p(99.9)=47.02µs
     http_req_connecting............: avg=580ns   min=0s      med=0s      max=3.52ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=36.83ms min=18.23ms med=36.46ms max=296.03ms p(90)=43.29ms  p(95)=45.35ms  p(99.9)=62.81ms
       { expected_response:true }...: avg=36.83ms min=18.23ms med=36.46ms max=296.03ms p(90)=43.29ms  p(95)=45.35ms  p(99.9)=62.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 161805
     http_req_receiving.............: avg=94.08µs min=27.6µs  med=61.45µs max=164.13ms p(90)=129.29µs p(95)=177.07µs p(99.9)=2.29ms 
     http_req_sending...............: avg=38.97µs min=4.75µs  med=11.18µs max=152.11ms p(90)=25.47µs  p(95)=62.2µs   p(99.9)=2.17ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=36.69ms min=18.09ms med=36.34ms max=295.49ms p(90)=43.15ms  p(95)=45.2ms   p(99.9)=61.12ms
     http_reqs......................: 161805  1326.502687/s
     iteration_duration.............: avg=37.09ms min=20.83ms med=36.71ms max=326.08ms p(90)=43.52ms  p(95)=45.58ms  p(99.9)=63.31ms
     iterations.....................: 161705  1325.682871/s
     success_rate...................: 100.00% ✓ 161705      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 444183      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=3.39µs  min=1.01µs  med=2.43µs  max=3.94ms   p(90)=4.07µs   p(95)=4.77µs   p(99.9)=37.66µs 
     http_req_connecting............: avg=626ns   min=0s      med=0s      max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.28ms min=18.58ms med=39.66ms max=300.55ms p(90)=48.41ms  p(95)=51.19ms  p(99.9)=65.29ms 
       { expected_response:true }...: avg=40.28ms min=18.58ms med=39.66ms max=300.55ms p(90)=48.41ms  p(95)=51.19ms  p(99.9)=65.29ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 148161
     http_req_receiving.............: avg=79.45µs min=26.74µs med=61.86µs max=166.21ms p(90)=102.75µs p(95)=119.87µs p(99.9)=869.68µs
     http_req_sending...............: avg=25.25µs min=5µs     med=11.32µs max=250.94ms p(90)=19.37µs  p(95)=23.12µs  p(99.9)=909.81µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.17ms min=18.43ms med=39.56ms max=279.45ms p(90)=48.31ms  p(95)=51.09ms  p(99.9)=65ms    
     http_reqs......................: 148161  1214.451176/s
     iteration_duration.............: avg=40.51ms min=22.9ms  med=39.87ms max=327.74ms p(90)=48.61ms  p(95)=51.4ms   p(99.9)=65.76ms 
     iterations.....................: 148061  1213.631492/s
     success_rate...................: 100.00% ✓ 148061      ✗ 0     
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

     checks.........................: 100.00% ✓ 208101     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 83 MB   682 kB/s
     http_req_blocked...............: avg=4.52µs  min=1.21µs  med=3.36µs  max=3.09ms   p(90)=4.99µs   p(95)=5.71µs   p(99.9)=51.28µs 
     http_req_connecting............: avg=860ns   min=0s      med=0s      max=3.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.14ms min=20.71ms med=84.53ms max=323.05ms p(90)=102.84ms p(95)=111.69ms p(99.9)=195.4ms 
       { expected_response:true }...: avg=86.14ms min=20.71ms med=84.53ms max=323.05ms p(90)=102.84ms p(95)=111.69ms p(99.9)=195.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 69467
     http_req_receiving.............: avg=92.25µs min=32.45µs med=81.72µs max=85.16ms  p(90)=118.56µs p(95)=132.73µs p(99.9)=674.02µs
     http_req_sending...............: avg=26.94µs min=5.64µs  med=16.18µs max=127.84ms p(90)=22.96µs  p(95)=25.3µs   p(99.9)=649.88µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.02ms min=20.62ms med=84.42ms max=322.65ms p(90)=102.73ms p(95)=111.57ms p(99.9)=194.98ms
     http_reqs......................: 69467   568.149261/s
     iteration_duration.............: avg=86.5ms  min=30.21ms med=84.82ms max=342.71ms p(90)=103.11ms p(95)=112ms    p(99.9)=196.59ms
     iterations.....................: 69367   567.331392/s
     success_rate...................: 100.00% ✓ 69367      ✗ 0    
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

     checks.........................: 100.00% ✓ 146265     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   479 kB/s
     http_req_blocked...............: avg=5.6µs    min=1.17µs  med=3.2µs    max=4.39ms   p(90)=4.73µs   p(95)=5.29µs   p(99.9)=600.36µs
     http_req_connecting............: avg=2.16µs   min=0s      med=0s       max=4.35ms   p(90)=0s       p(95)=0s       p(99.9)=578.77µs
     http_req_duration..............: avg=122.63ms min=21.12ms med=120.64ms max=339.24ms p(90)=153.21ms p(95)=163.69ms p(99.9)=212.83ms
       { expected_response:true }...: avg=122.63ms min=21.12ms med=120.64ms max=339.24ms p(90)=153.21ms p(95)=163.69ms p(99.9)=212.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48855
     http_req_receiving.............: avg=86.01µs  min=29.29µs med=83µs     max=24.81ms  p(90)=113.96µs p(95)=126.27µs p(99.9)=562.69µs
     http_req_sending...............: avg=29.7µs   min=5.2µs   med=15.99µs  max=176.23ms p(90)=21.4µs   p(95)=23.28µs  p(99.9)=583.84µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.51ms min=20.99ms med=120.53ms max=319.21ms p(90)=153.1ms  p(95)=163.58ms p(99.9)=212.61ms
     http_reqs......................: 48855   399.274057/s
     iteration_duration.............: avg=123.1ms  min=39.19ms med=120.94ms max=353.97ms p(90)=153.52ms p(95)=163.97ms p(99.9)=214.5ms 
     iterations.....................: 48755   398.456794/s
     success_rate...................: 100.00% ✓ 48755      ✗ 0    
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

     checks.........................: 100.00% ✓ 97893      ✗ 0    
     data_received..................: 2.9 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=5.32µs   min=1.5µs   med=3.83µs   max=1.65ms   p(90)=5.41µs   p(95)=6.04µs   p(99.9)=535.87µs
     http_req_connecting............: avg=1.18µs   min=0s      med=0s       max=1.61ms   p(90)=0s       p(95)=0s       p(99.9)=510.6µs 
     http_req_duration..............: avg=183.17ms min=23.45ms med=184.06ms max=362.41ms p(90)=194.67ms p(95)=198.61ms p(99.9)=274.04ms
       { expected_response:true }...: avg=183.17ms min=23.45ms med=184.06ms max=362.41ms p(90)=194.67ms p(95)=198.61ms p(99.9)=274.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32731
     http_req_receiving.............: avg=100.78µs min=35.91µs med=92.44µs  max=44.65ms  p(90)=125.76µs p(95)=138.77µs p(99.9)=595.89µs
     http_req_sending...............: avg=28.69µs  min=6.49µs  med=19.07µs  max=86.69ms  p(90)=24.3µs   p(95)=26.33µs  p(99.9)=468.06µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.05ms min=23.34ms med=183.94ms max=362.05ms p(90)=194.54ms p(95)=198.48ms p(99.9)=273.91ms
     http_reqs......................: 32731   266.810922/s
     iteration_duration.............: avg=183.98ms min=57.63ms med=184.45ms max=378.1ms  p(90)=194.97ms p(95)=198.92ms p(99.9)=276.84ms
     iterations.....................: 32631   265.995759/s
     success_rate...................: 100.00% ✓ 32631      ✗ 0    
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

     checks.........................: 100.00% ✓ 92856      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   305 kB/s
     http_req_blocked...............: avg=6.73µs   min=1.12µs  med=3.7µs    max=3.46ms   p(90)=5.15µs   p(95)=5.81µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=2.7µs    min=0s      med=0s       max=3.41ms   p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=193.1ms  min=17.67ms med=179.47ms max=692.89ms p(90)=243.34ms p(95)=279.99ms p(99.9)=596.62ms
       { expected_response:true }...: avg=193.1ms  min=17.67ms med=179.47ms max=692.89ms p(90)=243.34ms p(95)=279.99ms p(99.9)=596.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31052
     http_req_receiving.............: avg=96.49µs  min=32.99µs med=89.58µs  max=37.4ms   p(90)=120.71µs p(95)=133.12µs p(99.9)=840.69µs
     http_req_sending...............: avg=25.99µs  min=5.98µs  med=18.41µs  max=54.22ms  p(90)=23.38µs  p(95)=25.36µs  p(99.9)=543.35µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.98ms min=17.53ms med=179.34ms max=692.8ms  p(90)=243.24ms p(95)=279.89ms p(99.9)=596.5ms 
     http_reqs......................: 31052   254.115897/s
     iteration_duration.............: avg=193.95ms min=50.07ms med=179.87ms max=693.11ms p(90)=243.74ms p(95)=281.13ms p(99.9)=596.97ms
     iterations.....................: 30952   253.297541/s
     success_rate...................: 100.00% ✓ 30952      ✗ 0    
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

     checks.........................: 100.00% ✓ 6597      ✗ 0   
     data_received..................: 220 MB  1.7 MB/s
     data_sent......................: 2.8 MB  22 kB/s
     http_req_blocked...............: avg=47.44µs  min=1.26µs   med=3.73µs  max=4.3ms   p(90)=5.44µs   p(95)=6.29µs   p(99.9)=3.96ms  
     http_req_connecting............: avg=42.93µs  min=0s       med=0s      max=4.25ms  p(90)=0s       p(95)=0s       p(99.9)=3.93ms  
     http_req_duration..............: avg=2.63s    min=38.57ms  med=2.71s   max=4.51s   p(90)=3.42s    p(95)=3.63s    p(99.9)=4.44s   
       { expected_response:true }...: avg=2.63s    min=38.57ms  med=2.71s   max=4.51s   p(90)=3.42s    p(95)=3.63s    p(99.9)=4.44s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2299
     http_req_receiving.............: avg=106.09µs min=33.24µs  med=97.07µs max=5.11ms  p(90)=147.01µs p(95)=166.11µs p(99.9)=539.31µs
     http_req_sending...............: avg=48.87µs  min=6.19µs   med=19.04µs max=20.47ms p(90)=24.73µs  p(95)=29.63µs  p(99.9)=6.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.63s    min=38.38ms  med=2.71s   max=4.51s   p(90)=3.42s    p(95)=3.63s    p(99.9)=4.44s   
     http_reqs......................: 2299    18.139205/s
     iteration_duration.............: avg=2.74s    min=869.99ms med=2.75s   max=4.51s   p(90)=3.43s    p(95)=3.66s    p(99.9)=4.45s   
     iterations.....................: 2199    17.350201/s
     success_rate...................: 100.00% ✓ 2199      ✗ 0   
     vus............................: 46      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

