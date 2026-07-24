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
| fusion-nightly-net11 | 16.6.0-p.3 | 1,885 | 1,929 | 1,880 | 0.9% |  |
| fusion-nightly | 16.6.0-p.3 | 1,880 | 1,932 | 1,876 | 1.0% |  |
| fusion | 16.5.1 | 1,876 | 1,920 | 1,865 | 1.0% |  |
| hive-router | v0.0.83 | 1,862 | 1,918 | 1,852 | 1.2% |  |
| fusion-nightly-fed | 16.6.0-p.3 | 1,778 | 1,805 | 1,772 | 0.7% |  |
| grafbase | 0.53.5 | 1,289 | 1,335 | 1,281 | 1.5% |  |
| cosmo | 0.331.1 | 1,236 | 1,281 | 1,232 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.4 | 546 | 566 | 543 | 1.4% |  |
| apollo-router | v2.16.0 | 434 | 454 | 432 | 1.9% |  |
| hive-gateway | 2.10.4 | 266 | 273 | 265 | 1.0% |  |
| apollo-gateway | 2.14.2 | 261 | 266 | 260 | 0.8% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 19 | 3.3% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 689079      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.7µs   min=821ns   med=1.88µs  max=3.9ms    p(90)=3.57µs   p(95)=4.32µs  p(99.9)=28.09µs
     http_req_connecting............: avg=392ns   min=0s      med=0s      max=3.87ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.9ms  min=17.39ms med=25.34ms max=298.85ms p(90)=30.14ms  p(95)=31.92ms p(99.9)=48.54ms
       { expected_response:true }...: avg=25.9ms  min=17.39ms med=25.34ms max=298.85ms p(90)=30.14ms  p(95)=31.92ms p(99.9)=48.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229793
     http_req_receiving.............: avg=314.5µs min=49.21µs med=90.9µs  max=257.78ms p(90)=827.63µs p(95)=1.36ms  p(99.9)=7.59ms 
     http_req_sending...............: avg=29.02µs min=4.31µs  med=8.06µs  max=136.29ms p(90)=18.02µs  p(95)=28.22µs p(99.9)=1.55ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.55ms min=17.26ms med=25ms    max=282.1ms  p(90)=29.72ms  p(95)=31.45ms p(99.9)=46.91ms
     http_reqs......................: 229793  1885.039109/s
     iteration_duration.............: avg=26.11ms min=17.52ms med=25.54ms max=309.34ms p(90)=30.34ms  p(95)=32.13ms p(99.9)=48.92ms
     iterations.....................: 229693  1884.218789/s
     success_rate...................: 100.00% ✓ 229693      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687594      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.71µs   min=802ns   med=1.93µs  max=4.04ms   p(90)=3.44µs   p(95)=4.16µs  p(99.9)=28µs   
     http_req_connecting............: avg=393ns    min=0s      med=0s      max=3.96ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.96ms  min=16.97ms med=25.38ms max=280.6ms  p(90)=30.35ms  p(95)=32.16ms p(99.9)=48.78ms
       { expected_response:true }...: avg=25.96ms  min=16.97ms med=25.38ms max=280.6ms  p(90)=30.35ms  p(95)=32.16ms p(99.9)=48.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229298
     http_req_receiving.............: avg=314.92µs min=51.03µs med=96.24µs max=106.03ms p(90)=791.77µs p(95)=1.26ms  p(99.9)=8.03ms 
     http_req_sending...............: avg=29.1µs   min=4.5µs   med=8.21µs  max=137.5ms  p(90)=16.96µs  p(95)=27.41µs p(99.9)=1.51ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.61ms  min=16.85ms med=25.05ms max=279.97ms p(90)=29.96ms  p(95)=31.7ms  p(99.9)=47.08ms
     http_reqs......................: 229298  1880.571105/s
     iteration_duration.............: avg=26.17ms  min=17.16ms med=25.57ms max=311.89ms p(90)=30.55ms  p(95)=32.36ms p(99.9)=49.35ms
     iterations.....................: 229198  1879.750962/s
     success_rate...................: 100.00% ✓ 229198      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 686118      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.85µs   min=902ns   med=1.98µs  max=3.9ms    p(90)=3.66µs   p(95)=4.39µs  p(99.9)=27.59µs
     http_req_connecting............: avg=420ns    min=0s      med=0s      max=3.83ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.01ms  min=17.29ms med=25.42ms max=301.31ms p(90)=30.38ms  p(95)=32.21ms p(99.9)=49.97ms
       { expected_response:true }...: avg=26.01ms  min=17.29ms med=25.42ms max=301.31ms p(90)=30.38ms  p(95)=32.21ms p(99.9)=49.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228806
     http_req_receiving.............: avg=302.28µs min=49.36µs med=90.53µs max=156.93ms p(90)=766.64µs p(95)=1.28ms  p(99.9)=7.65ms 
     http_req_sending...............: avg=33.72µs  min=4.58µs  med=8.39µs  max=174.43ms p(90)=18.72µs  p(95)=29.75µs p(99.9)=1.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.67ms  min=17.18ms med=25.1ms  max=300.83ms p(90)=29.98ms  p(95)=31.77ms p(99.9)=48.48ms
     http_reqs......................: 228806  1876.609872/s
     iteration_duration.............: avg=26.22ms  min=17.51ms med=25.62ms max=310.24ms p(90)=30.58ms  p(95)=32.41ms p(99.9)=50.4ms 
     iterations.....................: 228706  1875.789697/s
     success_rate...................: 100.00% ✓ 228706      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 681048      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=2.96µs  min=871ns   med=2.07µs  max=3.75ms   p(90)=3.82µs  p(95)=4.59µs   p(99.9)=32.36µs
     http_req_connecting............: avg=459ns   min=0s      med=0s      max=3.71ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.21ms min=18.12ms med=25.76ms max=291.49ms p(90)=29.91ms p(95)=31.32ms  p(99.9)=46.19ms
       { expected_response:true }...: avg=26.21ms min=18.12ms med=25.76ms max=291.49ms p(90)=29.91ms p(95)=31.32ms  p(99.9)=46.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227116
     http_req_receiving.............: avg=72.17µs min=24.43µs med=49.4µs  max=148.95ms p(90)=92.94µs p(95)=118.63µs p(99.9)=1.62ms 
     http_req_sending...............: avg=29.61µs min=4.49µs  med=8.98µs  max=168.24ms p(90)=18.07µs p(95)=24.93µs  p(99.9)=1.33ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.11ms min=17.97ms med=25.67ms max=285.94ms p(90)=29.81ms p(95)=31.2ms   p(99.9)=45.12ms
     http_reqs......................: 227116  1862.479244/s
     iteration_duration.............: avg=26.42ms min=18.66ms med=25.96ms max=323.35ms p(90)=30.1ms  p(95)=31.52ms  p(99.9)=46.64ms
     iterations.....................: 227016  1861.659187/s
     success_rate...................: 100.00% ✓ 227016      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 650589      ✗ 0     
     data_received..................: 19 GB   156 MB/s
     data_sent......................: 261 MB  2.1 MB/s
     http_req_blocked...............: avg=2.93µs   min=841ns   med=2µs     max=4.61ms   p(90)=3.84µs   p(95)=4.55µs  p(99.9)=35.97µs
     http_req_connecting............: avg=410ns    min=0s      med=0s      max=3.3ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.43ms  min=17.92ms med=26.89ms max=290.35ms p(90)=32.11ms  p(95)=33.88ms p(99.9)=50.61ms
       { expected_response:true }...: avg=27.43ms  min=17.92ms med=26.89ms max=290.35ms p(90)=32.11ms  p(95)=33.88ms p(99.9)=50.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 216963
     http_req_receiving.............: avg=306.96µs min=49.8µs  med=93.76µs max=172.37ms p(90)=787.05µs p(95)=1.31ms  p(99.9)=7.14ms 
     http_req_sending...............: avg=30.88µs  min=4.51µs  med=8.58µs  max=142.07ms p(90)=19.35µs  p(95)=28.33µs p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.09ms  min=17.83ms med=26.57ms max=290.04ms p(90)=31.69ms  p(95)=33.46ms p(99.9)=48.47ms
     http_reqs......................: 216963  1778.923401/s
     iteration_duration.............: avg=27.65ms  min=18.07ms med=27.1ms  max=306.88ms p(90)=32.31ms  p(95)=34.08ms p(99.9)=50.95ms
     iterations.....................: 216863  1778.103481/s
     success_rate...................: 100.00% ✓ 216863      ✗ 0     
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

     checks.........................: 100.00% ✓ 471609      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 189 MB  1.5 MB/s
     http_req_blocked...............: avg=3.02µs  min=842ns   med=2.21µs  max=2.04ms   p(90)=4.56µs   p(95)=5.55µs   p(99.9)=40.74µs
     http_req_connecting............: avg=242ns   min=0s      med=0s      max=2ms      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.91ms min=18.36ms med=37.62ms max=305.07ms p(90)=44.61ms  p(95)=46.69ms  p(99.9)=61.36ms
       { expected_response:true }...: avg=37.91ms min=18.36ms med=37.62ms max=305.07ms p(90)=44.61ms  p(95)=46.69ms  p(99.9)=61.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157303
     http_req_receiving.............: avg=83.89µs min=27.44µs med=54.57µs max=88.47ms  p(90)=122.41µs p(95)=165.33µs p(99.9)=1.79ms 
     http_req_sending...............: avg=31.56µs min=4.62µs  med=9.27µs  max=177.81ms p(90)=23.37µs  p(95)=40.73µs  p(99.9)=1.6ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.79ms min=18.19ms med=37.52ms max=304.88ms p(90)=44.49ms  p(95)=46.56ms  p(99.9)=60.1ms 
     http_reqs......................: 157303  1289.567701/s
     iteration_duration.............: avg=38.16ms min=21.37ms med=37.85ms max=319.74ms p(90)=44.82ms  p(95)=46.9ms   p(99.9)=61.92ms
     iterations.....................: 157203  1288.747903/s
     success_rate...................: 100.00% ✓ 157203      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 452040      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 181 MB  1.5 MB/s
     http_req_blocked...............: avg=3.95µs  min=1.16µs  med=2.95µs  max=4.17ms   p(90)=4.66µs   p(95)=5.42µs   p(99.9)=39.01µs
     http_req_connecting............: avg=655ns   min=0s      med=0s      max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.57ms min=18.99ms med=38.97ms max=314.02ms p(90)=47.46ms  p(95)=50.15ms  p(99.9)=64.61ms
       { expected_response:true }...: avg=39.57ms min=18.99ms med=38.97ms max=314.02ms p(90)=47.46ms  p(95)=50.15ms  p(99.9)=64.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150780
     http_req_receiving.............: avg=84.62µs min=26.73µs med=68.75µs max=150.09ms p(90)=110.51µs p(95)=129.54µs p(99.9)=1.11ms 
     http_req_sending...............: avg=27.78µs min=5.12µs  med=12.58µs max=92.93ms  p(90)=20.17µs  p(95)=24.56µs  p(99.9)=1.13ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.46ms min=18.88ms med=38.86ms max=313.47ms p(90)=47.34ms  p(95)=50.04ms  p(99.9)=64.03ms
     http_reqs......................: 150780  1236.045236/s
     iteration_duration.............: avg=39.81ms min=23.4ms  med=39.19ms max=321.2ms  p(90)=47.67ms  p(95)=50.37ms  p(99.9)=65.06ms
     iterations.....................: 150680  1235.225469/s
     success_rate...................: 100.00% ✓ 150680      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 199959     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 80 MB   656 kB/s
     http_req_blocked...............: avg=5.19µs  min=1.21µs  med=3.25µs  max=4.1ms    p(90)=4.79µs   p(95)=5.42µs   p(99.9)=41.76µs 
     http_req_connecting............: avg=1.68µs  min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=89.66ms min=20.31ms med=88.24ms max=325.14ms p(90)=113.89ms p(95)=122.87ms p(99.9)=214.12ms
       { expected_response:true }...: avg=89.66ms min=20.31ms med=88.24ms max=325.14ms p(90)=113.89ms p(95)=122.87ms p(99.9)=214.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 66753
     http_req_receiving.............: avg=91.55µs min=31.32µs med=78.52µs max=93.52ms  p(90)=114.65µs p(95)=129.15µs p(99.9)=698.18µs
     http_req_sending...............: avg=24.01µs min=5.58µs  med=15.25µs max=98.83ms  p(90)=21.85µs  p(95)=24.15µs  p(99.9)=619.15µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.55ms min=20.21ms med=88.13ms max=324.65ms p(90)=113.8ms  p(95)=122.76ms p(99.9)=213.56ms
     http_reqs......................: 66753   546.096157/s
     iteration_duration.............: avg=90.03ms min=25.46ms med=88.51ms max=346.17ms p(90)=114.15ms p(95)=123.21ms p(99.9)=216.2ms 
     iterations.....................: 66653   545.278072/s
     success_rate...................: 100.00% ✓ 66653      ✗ 0    
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

     checks.........................: 100.00% ✓ 159285     ✗ 0    
     data_received..................: 4.7 GB  38 MB/s
     data_sent......................: 64 MB   522 kB/s
     http_req_blocked...............: avg=5.45µs   min=1.47µs  med=3.8µs    max=3.31ms   p(90)=5.4µs    p(95)=6.05µs   p(99.9)=173.49µs
     http_req_connecting............: avg=1.28µs   min=0s      med=0s       max=3.25ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.57ms min=20.92ms med=110.76ms max=336.59ms p(90)=140.16ms p(95)=149.35ms p(99.9)=189.38ms
       { expected_response:true }...: avg=112.57ms min=20.92ms med=110.76ms max=336.59ms p(90)=140.16ms p(95)=149.35ms p(99.9)=189.38ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53195
     http_req_receiving.............: avg=95.53µs  min=32.04µs med=88.41µs  max=82.08ms  p(90)=121.05µs p(95)=134.54µs p(99.9)=653.28µs
     http_req_sending...............: avg=26.36µs  min=6.29µs  med=18.44µs  max=139.21ms p(90)=23.95µs  p(95)=26.09µs  p(99.9)=595.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.44ms min=20.83ms med=110.64ms max=325.04ms p(90)=140.06ms p(95)=149.22ms p(99.9)=188.76ms
     http_reqs......................: 53195   434.863488/s
     iteration_duration.............: avg=113.03ms min=34.61ms med=111.07ms max=360.13ms p(90)=140.49ms p(95)=149.65ms p(99.9)=193.03ms
     iterations.....................: 53095   434.045998/s
     success_rate...................: 100.00% ✓ 53095      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 97143      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=7.48µs   min=1.64µs  med=3.92µs   max=4.18ms   p(90)=5.6µs    p(95)=6.27µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=3.22µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=184.57ms min=17.68ms med=172.93ms max=606.21ms p(90)=217.48ms p(95)=248.45ms p(99.9)=558.84ms
       { expected_response:true }...: avg=184.57ms min=17.68ms med=172.93ms max=606.21ms p(90)=217.48ms p(95)=248.45ms p(99.9)=558.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32481
     http_req_receiving.............: avg=108.21µs min=38.42µs med=94.68µs  max=150.09ms p(90)=127.18µs p(95)=141.78µs p(99.9)=845.84µs
     http_req_sending...............: avg=34.57µs  min=7.18µs  med=19.96µs  max=109.63ms p(90)=25.32µs  p(95)=27.45µs  p(99.9)=543.83µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.42ms min=17.58ms med=172.79ms max=606.06ms p(90)=217.26ms p(95)=248.31ms p(99.9)=558.72ms
     http_reqs......................: 32481   266.160448/s
     iteration_duration.............: avg=185.4ms  min=31.12ms med=173.33ms max=606.47ms p(90)=217.89ms p(95)=249.91ms p(99.9)=559.14ms
     iterations.....................: 32381   265.341014/s
     success_rate...................: 100.00% ✓ 32381      ✗ 0    
     vus............................: 27      min=0        max=50 
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

     checks.........................: 100.00% ✓ 95856      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   314 kB/s
     http_req_blocked...............: avg=6.55µs   min=1.11µs  med=3.26µs   max=4.12ms   p(90)=4.7µs    p(95)=5.27µs   p(99.9)=1.55ms  
     http_req_connecting............: avg=3.01µs   min=0s      med=0s       max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=1.47ms  
     http_req_duration..............: avg=187.12ms min=23.47ms med=183.04ms max=389.64ms p(90)=216.75ms p(95)=222.41ms p(99.9)=298.9ms 
       { expected_response:true }...: avg=187.12ms min=23.47ms med=183.04ms max=389.64ms p(90)=216.75ms p(95)=222.41ms p(99.9)=298.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32052
     http_req_receiving.............: avg=94.13µs  min=31.78µs med=88.93µs  max=78.81ms  p(90)=119.42µs p(95)=130.99µs p(99.9)=474.87µs
     http_req_sending...............: avg=27.57µs  min=5.41µs  med=17.93µs  max=106.79ms p(90)=22.66µs  p(95)=24.52µs  p(99.9)=723.67µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.99ms min=23.33ms med=182.92ms max=384.15ms p(90)=216.64ms p(95)=222.3ms  p(99.9)=298.49ms
     http_reqs......................: 32052   261.204218/s
     iteration_duration.............: avg=187.92ms min=58.51ms med=183.58ms max=410.36ms p(90)=217.05ms p(95)=222.76ms p(99.9)=302.22ms
     iterations.....................: 31952   260.389279/s
     success_rate...................: 100.00% ✓ 31952      ✗ 0    
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

     checks.........................: 100.00% ✓ 7596      ✗ 0   
     data_received..................: 252 MB  2.0 MB/s
     data_sent......................: 3.2 MB  25 kB/s
     http_req_blocked...............: avg=42.43µs  min=1.62µs   med=3.82µs  max=9.08ms  p(90)=5.39µs   p(95)=6.16µs   p(99.9)=4.23ms  
     http_req_connecting............: avg=30.49µs  min=0s       med=0s      max=4.07ms  p(90)=0s       p(95)=0s       p(99.9)=4.03ms  
     http_req_duration..............: avg=2.3s     min=39.05ms  med=2.38s   max=11.82s  p(90)=3.02s    p(95)=3.31s    p(99.9)=9.49s   
       { expected_response:true }...: avg=2.3s     min=39.05ms  med=2.38s   max=11.82s  p(90)=3.02s    p(95)=3.31s    p(99.9)=9.49s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2632
     http_req_receiving.............: avg=103.85µs min=34.33µs  med=95.7µs  max=10.39ms p(90)=138.37µs p(95)=154.42µs p(99.9)=590.94µs
     http_req_sending...............: avg=42.58µs  min=6.63µs   med=19.12µs max=12.35ms p(90)=24.69µs  p(95)=28.73µs  p(99.9)=3.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.3s     min=38.95ms  med=2.38s   max=11.82s  p(90)=3.02s    p(95)=3.31s    p(99.9)=9.49s   
     http_reqs......................: 2632    20.676711/s
     iteration_duration.............: avg=2.39s    min=467.75ms med=2.4s    max=11.83s  p(90)=3.05s    p(95)=3.33s    p(99.9)=9.51s   
     iterations.....................: 2532    19.891121/s
     success_rate...................: 100.00% ✓ 2532      ✗ 0   
     vus............................: 20      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

