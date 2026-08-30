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
| fusion-nightly-net11 | 16.7.0-p.1 | 1,897 | 1,942 | 1,887 | 1.0% |  |
| fusion-nightly | 16.7.0-p.1 | 1,894 | 1,936 | 1,886 | 0.9% |  |
| fusion | 16.6.2 | 1,874 | 1,925 | 1,868 | 1.1% |  |
| hive-router | v0.0.84 | 1,858 | 1,923 | 1,842 | 1.4% |  |
| fusion-nightly-fed | 16.7.0-p.1 | 1,798 | 1,861 | 1,790 | 1.4% |  |
| grafbase | 0.53.5 | 1,310 | 1,331 | 1,303 | 0.8% |  |
| cosmo | 0.334.0 | 1,215 | 1,259 | 1,209 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 568 | 585 | 567 | 1.1% |  |
| apollo-router | v2.16.1 | 394 | 413 | 391 | 2.0% |  |
| apollo-gateway | 2.14.3 | 264 | 267 | 262 | 0.6% |  |
| hive-gateway | 2.10.8 | 259 | 267 | 258 | 1.2% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 20 | 2.5% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 693618      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=2.8µs    min=872ns   med=1.97µs  max=7.24ms   p(90)=3.6µs    p(95)=4.29µs  p(99.9)=30.77µs
     http_req_connecting............: avg=377ns    min=0s      med=0s      max=3.44ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.73ms  min=17.46ms med=25.16ms max=283.33ms p(90)=29.95ms  p(95)=31.74ms p(99.9)=48.84ms
       { expected_response:true }...: avg=25.73ms  min=17.46ms med=25.16ms max=283.33ms p(90)=29.95ms  p(95)=31.74ms p(99.9)=48.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 231306
     http_req_receiving.............: avg=254.22µs min=48.52µs med=86.72µs max=135.61ms p(90)=585.83µs p(95)=1.09ms  p(99.9)=7.43ms 
     http_req_sending...............: avg=34.36µs  min=4.44µs  med=8.43µs  max=169.67ms p(90)=18.44µs  p(95)=32.7µs  p(99.9)=1.87ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.44ms  min=17.21ms med=24.89ms max=274.07ms p(90)=29.61ms  p(95)=31.37ms p(99.9)=47.38ms
     http_reqs......................: 231306  1897.351491/s
     iteration_duration.............: avg=25.94ms  min=17.68ms med=25.36ms max=317.51ms p(90)=30.15ms  p(95)=31.95ms p(99.9)=49.34ms
     iterations.....................: 231206  1896.531213/s
     success_rate...................: 100.00% ✓ 231206      ✗ 0     
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

     checks.........................: 100.00% ✓ 692769      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=2.83µs   min=862ns   med=1.99µs  max=3.78ms   p(90)=3.7µs    p(95)=4.43µs  p(99.9)=30.37µs
     http_req_connecting............: avg=410ns    min=0s      med=0s      max=3.74ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.76ms  min=17.41ms med=25.19ms max=314.72ms p(90)=30.05ms  p(95)=31.83ms p(99.9)=49.31ms
       { expected_response:true }...: avg=25.76ms  min=17.41ms med=25.19ms max=314.72ms p(90)=30.05ms  p(95)=31.83ms p(99.9)=49.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 231023
     http_req_receiving.............: avg=328.01µs min=50.04µs med=93.87µs max=271.11ms p(90)=764.07µs p(95)=1.25ms  p(99.9)=8.37ms 
     http_req_sending...............: avg=29.67µs  min=4.5µs   med=8.35µs  max=33.89ms  p(90)=17.61µs  p(95)=29.96µs p(99.9)=1.49ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.4ms   min=17.22ms med=24.87ms max=150.94ms p(90)=29.65ms  p(95)=31.37ms p(99.9)=46.05ms
     http_reqs......................: 231023  1894.778025/s
     iteration_duration.............: avg=25.97ms  min=17.58ms med=25.39ms max=337.7ms  p(90)=30.26ms  p(95)=32.03ms p(99.9)=49.91ms
     iterations.....................: 230923  1893.957857/s
     success_rate...................: 100.00% ✓ 230923      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 685353      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.02µs   min=862ns   med=2.15µs  max=9.52ms   p(90)=3.8µs    p(95)=4.51µs  p(99.9)=32.7µs 
     http_req_connecting............: avg=421ns    min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.04ms  min=17.29ms med=25.45ms max=303.81ms p(90)=30.51ms  p(95)=32.32ms p(99.9)=48.83ms
       { expected_response:true }...: avg=26.04ms  min=17.29ms med=25.45ms max=303.81ms p(90)=30.51ms  p(95)=32.32ms p(99.9)=48.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228551
     http_req_receiving.............: avg=344.66µs min=49.54µs med=96.42µs max=255.74ms p(90)=845.93µs p(95)=1.35ms  p(99.9)=8.54ms 
     http_req_sending...............: avg=30.87µs  min=4.47µs  med=8.63µs  max=149.91ms p(90)=17.99µs  p(95)=29.78µs p(99.9)=1.6ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.67ms  min=17.2ms  med=25.11ms max=225.97ms p(90)=30.08ms  p(95)=31.86ms p(99.9)=47.51ms
     http_reqs......................: 228551  1874.598518/s
     iteration_duration.............: avg=26.25ms  min=17.45ms med=25.66ms max=315.29ms p(90)=30.71ms  p(95)=32.53ms p(99.9)=49.18ms
     iterations.....................: 228451  1873.778308/s
     success_rate...................: 100.00% ✓ 228451      ✗ 0     
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

     checks.........................: 100.00% ✓ 679398      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=2.94µs  min=902ns   med=2.09µs  max=3.75ms   p(90)=3.86µs  p(95)=4.58µs   p(99.9)=29.39µs
     http_req_connecting............: avg=426ns   min=0s      med=0s      max=3.71ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.27ms min=17.52ms med=25.84ms max=298.15ms p(90)=29.97ms p(95)=31.37ms  p(99.9)=47.09ms
       { expected_response:true }...: avg=26.27ms min=17.52ms med=25.84ms max=298.15ms p(90)=29.97ms p(95)=31.37ms  p(99.9)=47.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226566
     http_req_receiving.............: avg=71.88µs min=24.79µs med=49.32µs max=111.25ms p(90)=92.82µs p(95)=117.39µs p(99.9)=1.68ms 
     http_req_sending...............: avg=29.28µs min=4.46µs  med=9.05µs  max=162.53ms p(90)=18.34µs p(95)=24.94µs  p(99.9)=1.31ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.17ms min=17.42ms med=25.75ms max=297.48ms p(90)=29.87ms p(95)=31.26ms  p(99.9)=45.7ms 
     http_reqs......................: 226566  1858.147384/s
     iteration_duration.............: avg=26.48ms min=18.77ms med=26.04ms max=308.04ms p(90)=30.17ms p(95)=31.57ms  p(99.9)=47.57ms
     iterations.....................: 226466  1857.327249/s
     success_rate...................: 100.00% ✓ 226466      ✗ 0     
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

     checks.........................: 100.00% ✓ 657993      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 264 MB  2.2 MB/s
     http_req_blocked...............: avg=3.51µs   min=932ns   med=2.64µs   max=9.3ms    p(90)=4.4µs    p(95)=5.17µs  p(99.9)=39.76µs
     http_req_connecting............: avg=401ns    min=0s      med=0s       max=3.31ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.12ms  min=17.83ms med=26.52ms  max=311.17ms p(90)=31.74ms  p(95)=33.63ms p(99.9)=50.98ms
       { expected_response:true }...: avg=27.12ms  min=17.83ms med=26.52ms  max=311.17ms p(90)=31.74ms  p(95)=33.63ms p(99.9)=50.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 219431
     http_req_receiving.............: avg=324.32µs min=51.6µs  med=101.13µs max=119.14ms p(90)=817.72µs p(95)=1.34ms  p(99.9)=8.28ms 
     http_req_sending...............: avg=33.26µs  min=4.51µs  med=10.04µs  max=127.92ms p(90)=19.86µs  p(95)=41.27µs p(99.9)=1.64ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.76ms  min=17.73ms med=26.18ms  max=310.62ms p(90)=31.31ms  p(95)=33.17ms p(99.9)=49.78ms
     http_reqs......................: 219431  1798.761143/s
     iteration_duration.............: avg=27.34ms  min=18.07ms med=26.73ms  max=318.56ms p(90)=31.96ms  p(95)=33.84ms p(99.9)=51.53ms
     iterations.....................: 219331  1797.941404/s
     success_rate...................: 100.00% ✓ 219331      ✗ 0     
     vus............................: 5       min=0         max=50  
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

     checks.........................: 100.00% ✓ 479370      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=3.34µs  min=881ns   med=2.19µs  max=3.45ms   p(90)=4.57µs  p(95)=5.52µs   p(99.9)=40.36µs
     http_req_connecting............: avg=557ns   min=0s      med=0s      max=3.42ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.29ms min=17.03ms med=37.01ms max=311.1ms  p(90)=43.82ms p(95)=45.85ms  p(99.9)=60.72ms
       { expected_response:true }...: avg=37.29ms min=17.03ms med=37.01ms max=311.1ms  p(90)=43.82ms p(95)=45.85ms  p(99.9)=60.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159890
     http_req_receiving.............: avg=86.19µs min=26.46µs med=55.25µs max=108.88ms p(90)=124.7µs p(95)=168.87µs p(99.9)=1.93ms 
     http_req_sending...............: avg=35.46µs min=4.35µs  med=9.14µs  max=259.92ms p(90)=24.14µs p(95)=43.94µs  p(99.9)=1.93ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.17ms min=16.96ms med=36.9ms  max=310.49ms p(90)=43.7ms  p(95)=45.72ms  p(99.9)=59.98ms
     http_reqs......................: 159890  1310.833963/s
     iteration_duration.............: avg=37.54ms min=20.75ms med=37.24ms max=324.08ms p(90)=44.04ms p(95)=46.06ms  p(99.9)=61.41ms
     iterations.....................: 159790  1310.014128/s
     success_rate...................: 100.00% ✓ 159790      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 444528      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=3.24µs  min=992ns   med=2.3µs   max=4ms      p(90)=3.93µs  p(95)=4.64µs   p(99.9)=32.85µs 
     http_req_connecting............: avg=600ns   min=0s      med=0s      max=3.96ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.25ms min=18.49ms med=39.62ms max=311.99ms p(90)=48.36ms p(95)=51.13ms  p(99.9)=66.15ms 
       { expected_response:true }...: avg=40.25ms min=18.49ms med=39.62ms max=311.99ms p(90)=48.36ms p(95)=51.13ms  p(99.9)=66.15ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 148276
     http_req_receiving.............: avg=79.49µs min=26.12µs med=63.7µs  max=253.31ms p(90)=105µs   p(95)=123.27µs p(99.9)=821.65µs
     http_req_sending...............: avg=27.09µs min=4.9µs   med=11.06µs max=226.6ms  p(90)=18.72µs p(95)=22.55µs  p(99.9)=984.57µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.14ms min=18.3ms  med=39.52ms max=294.3ms  p(90)=48.25ms p(95)=51.02ms  p(99.9)=65.88ms 
     http_reqs......................: 148276  1215.449841/s
     iteration_duration.............: avg=40.48ms min=22.57ms med=39.82ms max=323.49ms p(90)=48.56ms p(95)=51.33ms  p(99.9)=66.58ms 
     iterations.....................: 148176  1214.63012/s
     success_rate...................: 100.00% ✓ 148176      ✗ 0     
     vus............................: 21      min=0         max=50  
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

     checks.........................: 100.00% ✓ 208203     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   683 kB/s
     http_req_blocked...............: avg=4.91µs  min=1.03µs  med=3.35µs  max=3.22ms   p(90)=4.98µs   p(95)=5.68µs   p(99.9)=47.11µs 
     http_req_connecting............: avg=1.3µs   min=0s      med=0s      max=3.18ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.1ms  min=20.47ms med=84.25ms max=329.05ms p(90)=106.38ms p(95)=115.63ms p(99.9)=203.61ms
       { expected_response:true }...: avg=86.1ms  min=20.47ms med=84.25ms max=329.05ms p(90)=106.38ms p(95)=115.63ms p(99.9)=203.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69501
     http_req_receiving.............: avg=85.39µs min=29.31µs med=78.91µs max=12.09ms  p(90)=115.28µs p(95)=129.36µs p(99.9)=622.27µs
     http_req_sending...............: avg=25.29µs min=5.2µs   med=15.93µs max=80.2ms   p(90)=22.47µs  p(95)=24.91µs  p(99.9)=671.03µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.99ms min=20.37ms med=84.14ms max=328.2ms  p(90)=106.25ms p(95)=115.5ms  p(99.9)=203.02ms
     http_reqs......................: 69501   568.619043/s
     iteration_duration.............: avg=86.46ms min=27.98ms med=84.52ms max=349.06ms p(90)=106.64ms p(95)=115.92ms p(99.9)=204.77ms
     iterations.....................: 69401   567.800897/s
     success_rate...................: 100.00% ✓ 69401      ✗ 0    
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

     checks.........................: 100.00% ✓ 144630     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   474 kB/s
     http_req_blocked...............: avg=5.46µs   min=1.13µs  med=3.06µs   max=3.75ms   p(90)=4.53µs   p(95)=5.1µs    p(99.9)=584.62µs
     http_req_connecting............: avg=2.17µs   min=0s      med=0s       max=3.71ms   p(90)=0s       p(95)=0s       p(99.9)=561µs   
     http_req_duration..............: avg=124ms    min=21.06ms med=122.03ms max=348.44ms p(90)=155.12ms p(95)=165.39ms p(99.9)=208.7ms 
       { expected_response:true }...: avg=124ms    min=21.06ms med=122.03ms max=348.44ms p(90)=155.12ms p(95)=165.39ms p(99.9)=208.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 48310
     http_req_receiving.............: avg=86.78µs  min=29.53µs med=83.17µs  max=57.63ms  p(90)=114.3µs  p(95)=126.14µs p(99.9)=532.36µs
     http_req_sending...............: avg=28.56µs  min=5.3µs   med=16.58µs  max=98.15ms  p(90)=22µs     p(95)=23.86µs  p(99.9)=476.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.88ms min=20.97ms med=121.92ms max=347.89ms p(90)=154.97ms p(95)=165.28ms p(99.9)=208.6ms 
     http_reqs......................: 48310   394.849862/s
     iteration_duration.............: avg=124.49ms min=55.65ms med=122.33ms max=358.74ms p(90)=155.4ms  p(95)=165.67ms p(99.9)=210.69ms
     iterations.....................: 48210   394.032536/s
     success_rate...................: 100.00% ✓ 48210      ✗ 0    
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

     checks.........................: 100.00% ✓ 96972      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   317 kB/s
     http_req_blocked...............: avg=6.6µs    min=1.49µs  med=3.67µs   max=3.44ms   p(90)=5.19µs   p(95)=5.83µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=2.62µs   min=0s      med=0s       max=3.39ms   p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=184.89ms min=23.49ms med=177.47ms max=368.03ms p(90)=219.71ms p(95)=224.59ms p(99.9)=289.23ms
       { expected_response:true }...: avg=184.89ms min=23.49ms med=177.47ms max=368.03ms p(90)=219.71ms p(95)=224.59ms p(99.9)=289.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32424
     http_req_receiving.............: avg=100.03µs min=35.86µs med=92.36µs  max=109.08ms p(90)=125.18µs p(95)=138.59µs p(99.9)=553.59µs
     http_req_sending...............: avg=30.08µs  min=6.67µs  med=19.29µs  max=108.99ms p(90)=24.62µs  p(95)=26.7µs   p(99.9)=701.26µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.76ms min=23.29ms med=177.34ms max=366.84ms p(90)=219.59ms p(95)=224.47ms p(99.9)=289.11ms
     http_reqs......................: 32424   264.303408/s
     iteration_duration.............: avg=185.71ms min=63.44ms med=177.79ms max=383.81ms p(90)=220.03ms p(95)=224.91ms p(99.9)=293.61ms
     iterations.....................: 32324   263.488261/s
     success_rate...................: 100.00% ✓ 32324      ✗ 0    
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

     checks.........................: 100.00% ✓ 94824      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=6.83µs   min=1.18µs  med=3.65µs   max=4.23ms   p(90)=5.15µs   p(95)=5.81µs   p(99.9)=1.31ms  
     http_req_connecting............: avg=2.88µs   min=0s      med=0s       max=4.19ms   p(90)=0s       p(95)=0s       p(99.9)=1.27ms  
     http_req_duration..............: avg=189.09ms min=18.11ms med=175.79ms max=657.07ms p(90)=232.41ms p(95)=265.64ms p(99.9)=567.38ms
       { expected_response:true }...: avg=189.09ms min=18.11ms med=175.79ms max=657.07ms p(90)=232.41ms p(95)=265.64ms p(99.9)=567.38ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31708
     http_req_receiving.............: avg=102.9µs  min=36.47µs med=94.2µs   max=120.05ms p(90)=126.2µs  p(95)=139.35µs p(99.9)=723.83µs
     http_req_sending...............: avg=29.84µs  min=6.19µs  med=18.96µs  max=76.1ms   p(90)=24.09µs  p(95)=26.13µs  p(99.9)=596.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.96ms min=17.92ms med=175.66ms max=656.98ms p(90)=232.29ms p(95)=265.47ms p(99.9)=567.26ms
     http_reqs......................: 31708   259.485308/s
     iteration_duration.............: avg=189.93ms min=49.8ms  med=176.21ms max=657.28ms p(90)=232.85ms p(95)=267.13ms p(99.9)=567.65ms
     iterations.....................: 31608   258.666949/s
     success_rate...................: 100.00% ✓ 31608      ✗ 0    
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

     checks.........................: 100.00% ✓ 7302      ✗ 0   
     data_received..................: 243 MB  1.9 MB/s
     data_sent......................: 3.0 MB  24 kB/s
     http_req_blocked...............: avg=41.59µs  min=1.67µs   med=3.94µs  max=3.71ms   p(90)=5.62µs   p(95)=6.56µs   p(99.9)=3.45ms  
     http_req_connecting............: avg=36.91µs  min=0s       med=0s      max=3.67ms   p(90)=0s       p(95)=0s       p(99.9)=3.42ms  
     http_req_duration..............: avg=2.38s    min=33.85ms  med=2.47s   max=5.78s    p(90)=3.11s    p(95)=3.35s    p(99.9)=4.26s   
       { expected_response:true }...: avg=2.38s    min=33.85ms  med=2.47s   max=5.78s    p(90)=3.11s    p(95)=3.35s    p(99.9)=4.26s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2534
     http_req_receiving.............: avg=131.83µs min=34.38µs  med=97.83µs max=69.18ms  p(90)=142.85µs p(95)=158.67µs p(99.9)=977.69µs
     http_req_sending...............: avg=152.14µs min=6.76µs   med=19.73µs max=122.79ms p(90)=25µs     p(95)=28.88µs  p(99.9)=45.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.38s    min=33.74ms  med=2.47s   max=5.78s    p(90)=3.11s    p(95)=3.35s    p(99.9)=4.26s   
     http_reqs......................: 2534    20.047787/s
     iteration_duration.............: avg=2.48s    min=262.21ms med=2.5s    max=5.78s    p(90)=3.12s    p(95)=3.36s    p(99.9)=4.27s   
     iterations.....................: 2434    19.256635/s
     success_rate...................: 100.00% ✓ 2434      ✗ 0   
     vus............................: 29      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

