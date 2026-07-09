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
| hive-router | v0.0.78 | 1,865 | 1,917 | 1,851 | 1.2% |  |
| fusion-nightly | 16.5.0-p.8 | 1,851 | 1,895 | 1,841 | 1.0% |  |
| fusion | 16.4.0 | 1,840 | 1,893 | 1,830 | 1.1% |  |
| fusion-nightly-net11 | 16.5.0-p.8 | 1,827 | 1,863 | 1,822 | 0.8% |  |
| fusion-nightly-fed | 16.5.0-p.8 | 1,760 | 1,794 | 1,755 | 0.7% |  |
| grafbase | 0.53.5 | 1,305 | 1,328 | 1,302 | 0.7% |  |
| cosmo | 0.329.0 | 1,145 | 1,191 | 1,139 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.2 | 572 | 593 | 571 | 1.3% |  |
| apollo-router | v2.16.0 | 434 | 453 | 432 | 1.9% |  |
| hive-gateway | 2.10.2 | 264 | 272 | 263 | 1.0% |  |
| apollo-gateway | 2.14.2 | 260 | 263 | 260 | 0.4% |  |
| feddi | 77271dc84a06 | 21 | 21 | 19 | 4.1% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 682113      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=3.37µs  min=912ns   med=2.62µs  max=3.87ms   p(90)=4.35µs  p(95)=5.08µs   p(99.9)=35.06µs
     http_req_connecting............: avg=390ns   min=0s      med=0s      max=3.83ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.16ms min=17.92ms med=25.69ms max=295.81ms p(90)=29.91ms p(95)=31.38ms  p(99.9)=48.08ms
       { expected_response:true }...: avg=26.16ms min=17.92ms med=25.69ms max=295.81ms p(90)=29.91ms p(95)=31.38ms  p(99.9)=48.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227471
     http_req_receiving.............: avg=75.91µs min=24.75µs med=50.44µs max=104.63ms p(90)=93.87µs p(95)=121.01µs p(99.9)=2.32ms 
     http_req_sending...............: avg=34.71µs min=4.67µs  med=10.27µs max=175.24ms p(90)=18.93µs p(95)=27.14µs  p(99.9)=1.49ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.05ms min=17.86ms med=25.6ms  max=291.91ms p(90)=29.8ms  p(95)=31.25ms  p(99.9)=46.89ms
     http_reqs......................: 227471  1865.202016/s
     iteration_duration.............: avg=26.38ms min=18.13ms med=25.9ms  max=307.28ms p(90)=30.11ms p(95)=31.59ms  p(99.9)=48.53ms
     iterations.....................: 227371  1864.382043/s
     success_rate...................: 100.00% ✓ 227371      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 677061      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=2.93µs   min=902ns   med=1.97µs  max=9.52ms   p(90)=3.63µs   p(95)=4.36µs  p(99.9)=30.18µs
     http_req_connecting............: avg=453ns    min=0s      med=0s      max=3.6ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.36ms  min=17.5ms  med=25.82ms max=301.91ms p(90)=30.78ms  p(95)=32.59ms p(99.9)=49.43ms
       { expected_response:true }...: avg=26.36ms  min=17.5ms  med=25.82ms max=301.91ms p(90)=30.78ms  p(95)=32.59ms p(99.9)=49.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 225787
     http_req_receiving.............: avg=324.86µs min=50.53µs med=95µs    max=189.72ms p(90)=845.19µs p(95)=1.35ms  p(99.9)=7.61ms 
     http_req_sending...............: avg=31.24µs  min=4.59µs  med=8.46µs  max=174.36ms p(90)=18.42µs  p(95)=29.45µs p(99.9)=1.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26ms     min=17.39ms med=25.48ms max=293.29ms p(90)=30.35ms  p(95)=32.11ms p(99.9)=48.06ms
     http_reqs......................: 225787  1851.871323/s
     iteration_duration.............: avg=26.57ms  min=17.76ms med=26.02ms max=311.68ms p(90)=30.98ms  p(95)=32.79ms p(99.9)=49.89ms
     iterations.....................: 225687  1851.051138/s
     success_rate...................: 100.00% ✓ 225687      ✗ 0     
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

     checks.........................: 100.00% ✓ 672828      ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 270 MB  2.2 MB/s
     http_req_blocked...............: avg=2.79µs   min=871ns   med=1.98µs  max=8.1ms    p(90)=3.47µs   p(95)=4.14µs  p(99.9)=32.89µs
     http_req_connecting............: avg=406ns    min=0s      med=0s      max=3.8ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.53ms  min=17.69ms med=25.93ms max=304.13ms p(90)=31.07ms  p(95)=32.99ms p(99.9)=49.93ms
       { expected_response:true }...: avg=26.53ms  min=17.69ms med=25.93ms max=304.13ms p(90)=31.07ms  p(95)=32.99ms p(99.9)=49.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 224376
     http_req_receiving.............: avg=347.77µs min=51.83µs med=102.3µs max=180.26ms p(90)=880.64µs p(95)=1.35ms  p(99.9)=9.12ms 
     http_req_sending...............: avg=30.49µs  min=4.41µs  med=8.56µs  max=172.4ms  p(90)=16.9µs   p(95)=27.86µs p(99.9)=1.48ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.15ms  min=17.58ms med=25.57ms max=303.83ms p(90)=30.62ms  p(95)=32.51ms p(99.9)=48.39ms
     http_reqs......................: 224376  1840.121574/s
     iteration_duration.............: avg=26.74ms  min=17.84ms med=26.13ms max=313.43ms p(90)=31.28ms  p(95)=33.19ms p(99.9)=50.26ms
     iterations.....................: 224276  1839.301468/s
     success_rate...................: 100.00% ✓ 224276      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 668064      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 268 MB  2.2 MB/s
     http_req_blocked...............: avg=2.82µs   min=891ns   med=2.01µs  max=3.97ms   p(90)=3.74µs   p(95)=4.48µs  p(99.9)=30.28µs
     http_req_connecting............: avg=401ns    min=0s      med=0s      max=3.93ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.71ms  min=17.57ms med=26.19ms max=303.17ms p(90)=31.05ms  p(95)=32.83ms p(99.9)=49.84ms
       { expected_response:true }...: avg=26.71ms  min=17.57ms med=26.19ms max=303.17ms p(90)=31.05ms  p(95)=32.83ms p(99.9)=49.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 222788
     http_req_receiving.............: avg=330.85µs min=49.65µs med=93.62µs max=101ms    p(90)=891.41µs p(95)=1.43ms  p(99.9)=7.94ms 
     http_req_sending...............: avg=32.16µs  min=4.55µs  med=8.48µs  max=193.04ms p(90)=18.13µs  p(95)=27.73µs p(99.9)=1.58ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.35ms  min=17.39ms med=25.84ms max=295.17ms p(90)=30.62ms  p(95)=32.36ms p(99.9)=47.51ms
     http_reqs......................: 222788  1827.350573/s
     iteration_duration.............: avg=26.93ms  min=18.2ms  med=26.39ms max=310.92ms p(90)=31.25ms  p(95)=33.03ms p(99.9)=50.4ms 
     iterations.....................: 222688  1826.530353/s
     success_rate...................: 100.00% ✓ 222688      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 643713      ✗ 0     
     data_received..................: 19 GB   154 MB/s
     data_sent......................: 258 MB  2.1 MB/s
     http_req_blocked...............: avg=2.91µs   min=911ns   med=2.02µs  max=4.14ms   p(90)=3.8µs    p(95)=4.58µs  p(99.9)=35.29µs
     http_req_connecting............: avg=427ns    min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.73ms  min=18.17ms med=27.19ms max=298.42ms p(90)=32.39ms  p(95)=34.24ms p(99.9)=50.06ms
       { expected_response:true }...: avg=27.73ms  min=18.17ms med=27.19ms max=298.42ms p(90)=32.39ms  p(95)=34.24ms p(99.9)=50.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 214671
     http_req_receiving.............: avg=327.64µs min=50.18µs med=96.69µs max=121.61ms p(90)=843.37µs p(95)=1.34ms  p(99.9)=8.16ms 
     http_req_sending...............: avg=30.89µs  min=4.36µs  med=8.46µs  max=133.71ms p(90)=18.84µs  p(95)=28.25µs p(99.9)=1.49ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.37ms  min=18.05ms med=26.86ms max=276.32ms p(90)=31.97ms  p(95)=33.8ms  p(99.9)=47.58ms
     http_reqs......................: 214671  1760.044859/s
     iteration_duration.............: avg=27.95ms  min=18.73ms med=27.39ms max=309.8ms  p(90)=32.59ms  p(95)=34.45ms p(99.9)=50.41ms
     iterations.....................: 214571  1759.224979/s
     success_rate...................: 100.00% ✓ 214571      ✗ 0     
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

     checks.........................: 100.00% ✓ 477333      ✗ 0     
     data_received..................: 14 GB   114 MB/s
     data_sent......................: 191 MB  1.6 MB/s
     http_req_blocked...............: avg=4.15µs  min=962ns   med=3.06µs  max=3.72ms   p(90)=5.37µs  p(95)=6.37µs   p(99.9)=46.57µs
     http_req_connecting............: avg=577ns   min=0s      med=0s      max=3.68ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.44ms min=18.53ms med=37.15ms max=299.87ms p(90)=44.12ms p(95)=46.17ms  p(99.9)=61.57ms
       { expected_response:true }...: avg=37.44ms min=18.53ms med=37.15ms max=299.87ms p(90)=44.12ms p(95)=46.17ms  p(99.9)=61.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159211
     http_req_receiving.............: avg=90.39µs min=27.47µs med=60.93µs max=95.84ms  p(90)=126.3µs p(95)=173.12µs p(99.9)=1.96ms 
     http_req_sending...............: avg=38.36µs min=4.86µs  med=11.32µs max=166.63ms p(90)=24.83µs p(95)=45.89µs  p(99.9)=1.85ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.31ms min=18.43ms med=37.03ms max=299.51ms p(90)=43.99ms p(95)=46.04ms  p(99.9)=60.03ms
     http_reqs......................: 159211  1305.218296/s
     iteration_duration.............: avg=37.7ms  min=21.57ms med=37.39ms max=310.85ms p(90)=44.34ms p(95)=46.39ms  p(99.9)=62.03ms
     iterations.....................: 159111  1304.398492/s
     success_rate...................: 100.00% ✓ 159111      ✗ 0     
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

     checks.........................: 100.00% ✓ 418863      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.89µs  min=1.16µs  med=2.89µs  max=4.08ms   p(90)=4.49µs   p(95)=5.22µs   p(99.9)=38.94µs 
     http_req_connecting............: avg=673ns   min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.72ms min=18.32ms med=42.06ms max=298.3ms  p(90)=51.76ms  p(95)=54.85ms  p(99.9)=70.63ms 
       { expected_response:true }...: avg=42.72ms min=18.32ms med=42.06ms max=298.3ms  p(90)=51.76ms  p(95)=54.85ms  p(99.9)=70.63ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 139721
     http_req_receiving.............: avg=88.39µs min=28.68µs med=72.4µs  max=172.78ms p(90)=113.91µs p(95)=132.32µs p(99.9)=857.53µs
     http_req_sending...............: avg=25.65µs min=5.19µs  med=12.4µs  max=179.52ms p(90)=19.22µs  p(95)=23.16µs  p(99.9)=911.08µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=42.6ms  min=18.21ms med=41.95ms max=297.69ms p(90)=51.64ms  p(95)=54.74ms  p(99.9)=70.28ms 
     http_reqs......................: 139721  1145.201745/s
     iteration_duration.............: avg=42.96ms min=22.54ms med=42.28ms max=324.62ms p(90)=51.98ms  p(95)=55.07ms  p(99.9)=70.91ms 
     iterations.....................: 139621  1144.382111/s
     success_rate...................: 100.00% ✓ 139621      ✗ 0     
     vus............................: 36      min=0         max=50  
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

     checks.........................: 100.00% ✓ 209715     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   688 kB/s
     http_req_blocked...............: avg=4.69µs  min=1.07µs  med=3.01µs  max=14.35ms  p(90)=4.57µs   p(95)=5.22µs   p(99.9)=49.72µs 
     http_req_connecting............: avg=1.23µs  min=0s      med=0s      max=3.37ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.5ms  min=20.43ms med=84.54ms max=317.83ms p(90)=105.44ms p(95)=113.95ms p(99.9)=192.99ms
       { expected_response:true }...: avg=85.5ms  min=20.43ms med=84.54ms max=317.83ms p(90)=105.44ms p(95)=113.95ms p(99.9)=192.99ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70005
     http_req_receiving.............: avg=87.42µs min=29.57µs med=74.61µs max=124.85ms p(90)=111.94µs p(95)=126.45µs p(99.9)=657.21µs
     http_req_sending...............: avg=21.58µs min=5.26µs  med=15.24µs max=37.67ms  p(90)=21.98µs  p(95)=24.31µs  p(99.9)=617µs   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.39ms min=20.29ms med=84.43ms max=317.09ms p(90)=105.32ms p(95)=113.82ms p(99.9)=192.3ms 
     http_reqs......................: 70005   572.627516/s
     iteration_duration.............: avg=85.84ms min=41.04ms med=84.8ms  max=327.73ms p(90)=105.7ms  p(95)=114.2ms  p(99.9)=193.8ms 
     iterations.....................: 69905   571.809535/s
     success_rate...................: 100.00% ✓ 69905      ✗ 0    
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

     checks.........................: 100.00% ✓ 159000     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 64 MB   521 kB/s
     http_req_blocked...............: avg=5.27µs   min=1.39µs  med=3.73µs   max=2.82ms   p(90)=5.35µs   p(95)=6.01µs   p(99.9)=76.91µs 
     http_req_connecting............: avg=1.23µs   min=0s      med=0s       max=2.79ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.76ms min=20.81ms med=110.89ms max=340.32ms p(90)=140.18ms p(95)=149.4ms  p(99.9)=193.77ms
       { expected_response:true }...: avg=112.76ms min=20.81ms med=110.89ms max=340.32ms p(90)=140.18ms p(95)=149.4ms  p(99.9)=193.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53100
     http_req_receiving.............: avg=91.95µs  min=31.24µs med=84.95µs  max=169.49ms p(90)=116.74µs p(95)=129.23µs p(99.9)=595.75µs
     http_req_sending...............: avg=26.95µs  min=6.18µs  med=17.99µs  max=99.1ms   p(90)=23.77µs  p(95)=25.97µs  p(99.9)=734.59µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.64ms min=20.68ms med=110.76ms max=339.26ms p(90)=140.06ms p(95)=149.26ms p(99.9)=192.26ms
     http_reqs......................: 53100   434.092142/s
     iteration_duration.............: avg=113.23ms min=37.69ms med=111.19ms max=351.52ms p(90)=140.47ms p(95)=149.75ms p(99.9)=196.1ms 
     iterations.....................: 53000   433.274643/s
     success_rate...................: 100.00% ✓ 53000      ✗ 0    
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

     checks.........................: 100.00% ✓ 96474      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   317 kB/s
     http_req_blocked...............: avg=6.07µs   min=1.55µs  med=3.95µs   max=3.35ms   p(90)=5.53µs   p(95)=6.18µs   p(99.9)=581.9µs 
     http_req_connecting............: avg=1.83µs   min=0s      med=0s       max=3.32ms   p(90)=0s       p(95)=0s       p(99.9)=556.66µs
     http_req_duration..............: avg=185.86ms min=18.35ms med=172.46ms max=810.74ms p(90)=228.34ms p(95)=261.84ms p(99.9)=633.42ms
       { expected_response:true }...: avg=185.86ms min=18.35ms med=172.46ms max=810.74ms p(90)=228.34ms p(95)=261.84ms p(99.9)=633.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32258
     http_req_receiving.............: avg=109.91µs min=36.96µs med=92.69µs  max=214.37ms p(90)=125.2µs  p(95)=139.35µs p(99.9)=850.28µs
     http_req_sending...............: avg=30.23µs  min=6.71µs  med=19.54µs  max=82.38ms  p(90)=24.78µs  p(95)=26.93µs  p(99.9)=642.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.72ms min=18.19ms med=172.33ms max=810.6ms  p(90)=228.22ms p(95)=261.55ms p(99.9)=633.32ms
     http_reqs......................: 32258   264.025559/s
     iteration_duration.............: avg=186.68ms min=56.63ms med=172.85ms max=811.03ms p(90)=228.75ms p(95)=262.7ms  p(99.9)=633.87ms
     iterations.....................: 32158   263.207078/s
     success_rate...................: 100.00% ✓ 32158      ✗ 0    
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

     checks.........................: 100.00% ✓ 95598      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=4.88µs   min=1.03µs  med=3.11µs   max=3.17ms   p(90)=4.46µs   p(95)=5.02µs   p(99.9)=455.99µs
     http_req_connecting............: avg=1.54µs   min=0s      med=0s       max=3.11ms   p(90)=0s       p(95)=0s       p(99.9)=430.13µs
     http_req_duration..............: avg=187.59ms min=23.45ms med=185.23ms max=366.16ms p(90)=227.15ms p(95)=233.38ms p(99.9)=299.38ms
       { expected_response:true }...: avg=187.59ms min=23.45ms med=185.23ms max=366.16ms p(90)=227.15ms p(95)=233.38ms p(99.9)=299.38ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31966
     http_req_receiving.............: avg=88.01µs  min=30.57µs med=83.87µs  max=19.63ms  p(90)=115.23µs p(95)=126.99µs p(99.9)=456.99µs
     http_req_sending...............: avg=33.3µs   min=5.22µs  med=16.72µs  max=129.15ms p(90)=21.61µs  p(95)=23.51µs  p(99.9)=470.3µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.46ms min=23.3ms  med=184.98ms max=365.96ms p(90)=227.04ms p(95)=233.28ms p(99.9)=299.29ms
     http_reqs......................: 31966   260.57903/s
     iteration_duration.............: avg=188.4ms  min=57.31ms med=187.02ms max=386.2ms  p(90)=227.43ms p(95)=233.66ms p(99.9)=304.45ms
     iterations.....................: 31866   259.763854/s
     success_rate...................: 100.00% ✓ 31866      ✗ 0    
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

     checks.........................: 100.00% ✓ 7788      ✗ 0   
     data_received..................: 258 MB  2.0 MB/s
     data_sent......................: 3.2 MB  26 kB/s
     http_req_blocked...............: avg=93.41µs  min=1.15µs  med=3.36µs  max=8.45ms  p(90)=5.05µs   p(95)=5.83µs   p(99.9)=7.22ms  
     http_req_connecting............: avg=87.8µs   min=0s      med=0s      max=8.39ms  p(90)=0s       p(95)=0s       p(99.9)=6.97ms  
     http_req_duration..............: avg=2.24s    min=36.79ms med=2.25s   max=4.54s   p(90)=2.95s    p(95)=3.21s    p(99.9)=4.28s   
       { expected_response:true }...: avg=2.24s    min=36.79ms med=2.25s   max=4.54s   p(90)=2.95s    p(95)=3.21s    p(99.9)=4.28s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2696
     http_req_receiving.............: avg=105.33µs min=29.49µs med=99.34µs max=6.13ms  p(90)=139.72µs p(95)=160.68µs p(99.9)=354.57µs
     http_req_sending...............: avg=102.48µs min=6.26µs  med=19.55µs max=43.04ms p(90)=24.99µs  p(95)=29µs     p(99.9)=14.4ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.24s    min=36.68ms med=2.25s   max=4.54s   p(90)=2.95s    p(95)=3.21s    p(99.9)=4.28s   
     http_reqs......................: 2696    21.366277/s
     iteration_duration.............: avg=2.32s    min=770.3ms med=2.27s   max=4.54s   p(90)=2.96s    p(95)=3.23s    p(99.9)=4.29s   
     iterations.....................: 2596    20.573759/s
     success_rate...................: 100.00% ✓ 2596      ✗ 0   
     vus............................: 27      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

