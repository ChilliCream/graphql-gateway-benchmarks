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
| hive-router | v0.0.43 | 1,581 | 1,605 | 1,568 | 0.8% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,440 | 1,447 | 1,433 | 0.3% |  |
| cosmo | 0.298.0 | 1,131 | 1,144 | 1,126 | 0.6% | non-compatible response (2 across 2/9 runs) |
| grafbase | 0.53.2 | 1,128 | 1,154 | 1,122 | 1.0% |  |
| hive-gateway-router-runtime | 2.5.14 | 567 | 581 | 563 | 1.1% |  |
| apollo-router | v2.12.1 | 362 | 374 | 357 | 1.5% |  |
| hive-gateway | 2.5.14 | 256 | 261 | 254 | 1.1% |  |
| apollo-gateway | 2.13.3 | 228 | 231 | 227 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 578610      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.5µs   min=1.01µs  med=2.43µs  max=4.26ms   p(90)=4.29µs   p(95)=5.25µs   p(99.9)=35.78µs
     http_req_connecting............: avg=565ns   min=0s      med=0s      max=4.21ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.86ms min=13.94ms med=30.56ms max=329.66ms p(90)=36.72ms  p(95)=38.75ms  p(99.9)=59.81ms
       { expected_response:true }...: avg=30.86ms min=13.94ms med=30.56ms max=329.66ms p(90)=36.72ms  p(95)=38.75ms  p(99.9)=59.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192970
     http_req_receiving.............: avg=86.84µs min=27.69µs med=53.29µs max=99.6ms   p(90)=106.09µs p(95)=157.05µs p(99.9)=2.7ms  
     http_req_sending...............: avg=36.41µs min=4.91µs  med=9.73µs  max=136.12ms p(90)=20.28µs  p(95)=77.73µs  p(99.9)=1.96ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.73ms min=13.85ms med=30.45ms max=312.21ms p(90)=36.6ms   p(95)=38.59ms  p(99.9)=58.72ms
     http_reqs......................: 192970  1581.589059/s
     iteration_duration.............: avg=31.1ms  min=14.12ms med=30.78ms max=341.19ms p(90)=36.94ms  p(95)=38.96ms  p(99.9)=60.26ms
     iterations.....................: 192870  1580.769456/s
     success_rate...................: 100.00% ✓ 192870      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 527289      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 211 MB  1.7 MB/s
     http_req_blocked...............: avg=4.44µs   min=962ns   med=2.21µs   max=9.9ms    p(90)=3.94µs  p(95)=4.82µs   p(99.9)=30.64µs
     http_req_connecting............: avg=1.68µs   min=0s      med=0s       max=9.84ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.88ms  min=13.75ms med=32.77ms  max=837.62ms p(90)=41.45ms p(95)=44.62ms  p(99.9)=84.65ms
       { expected_response:true }...: avg=33.88ms  min=13.75ms med=32.77ms  max=837.62ms p(90)=41.45ms p(95)=44.62ms  p(99.9)=84.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175863
     http_req_receiving.............: avg=822.21µs min=51.3µs  med=117.11µs max=184.94ms p(90)=2.32ms  p(95)=3.48ms   p(99.9)=21ms   
     http_req_sending...............: avg=37.39µs  min=5.16µs  med=9.08µs   max=187.4ms  p(90)=19.69µs p(95)=103.28µs p(99.9)=2.17ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.02ms  min=13.65ms med=31.95ms  max=837.52ms p(90)=40.33ms p(95)=43.4ms   p(99.9)=82.22ms
     http_reqs......................: 175863  1440.860514/s
     iteration_duration.............: avg=34.13ms  min=13.98ms med=32.99ms  max=837.85ms p(90)=41.67ms p(95)=44.85ms  p(99.9)=85.27ms
     iterations.....................: 175763  1440.041206/s
     success_rate...................: 100.00% ✓ 175763      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 414069      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.72µs  min=1.09µs  med=2.63µs  max=4ms      p(90)=4.26µs   p(95)=5.02µs   p(99.9)=38.07µs
     http_req_connecting............: avg=734ns   min=0s      med=0s      max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.22ms min=19.48ms med=42.63ms max=333.5ms  p(90)=52.53ms  p(95)=55.66ms  p(99.9)=72.85ms
       { expected_response:true }...: avg=43.22ms min=19.48ms med=42.63ms max=333.5ms  p(90)=52.53ms  p(95)=55.66ms  p(99.9)=72.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138123
     http_req_receiving.............: avg=85.23µs min=29.16µs med=63.94µs max=33.04ms  p(90)=107.79µs p(95)=133.25µs p(99.9)=1.56ms 
     http_req_sending...............: avg=27.54µs min=5.4µs   med=11µs    max=226.13ms p(90)=18.52µs  p(95)=23.27µs  p(99.9)=1.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.11ms min=19.34ms med=42.52ms max=332.89ms p(90)=52.42ms  p(95)=55.54ms  p(99.9)=72.16ms
     http_reqs......................: 138123  1131.776999/s
     iteration_duration.............: avg=43.46ms min=20.41ms med=42.84ms max=341.97ms p(90)=52.74ms  p(95)=55.87ms  p(99.9)=73.52ms
     iterations.....................: 138023  1130.957601/s
     success_rate...................: 100.00% ✓ 138023      ✗ 0     
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

     checks.........................: 100.00% ✓ 412809      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.58µs   min=972ns   med=2.27µs  max=3.98ms   p(90)=4.69µs   p(95)=5.86µs   p(99.9)=43.83µs
     http_req_connecting............: avg=678ns    min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.32ms  min=15.96ms med=42.88ms max=332.7ms  p(90)=52.73ms  p(95)=55.96ms  p(99.9)=78.87ms
       { expected_response:true }...: avg=43.32ms  min=15.96ms med=42.88ms max=332.7ms  p(90)=52.73ms  p(95)=55.96ms  p(99.9)=78.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137703
     http_req_receiving.............: avg=112.94µs min=28.41µs med=58.67µs max=116.12ms p(90)=129.91µs p(95)=208.48µs p(99.9)=4.26ms 
     http_req_sending...............: avg=35.95µs  min=4.94µs  med=9.94µs  max=83.37ms  p(90)=23.73µs  p(95)=112.33µs p(99.9)=2.23ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.17ms  min=15.88ms med=42.76ms max=216.31ms p(90)=52.58ms  p(95)=55.8ms   p(99.9)=77.91ms
     http_reqs......................: 137703  1128.509646/s
     iteration_duration.............: avg=43.6ms   min=16.18ms med=43.12ms max=359.02ms p(90)=52.96ms  p(95)=56.2ms   p(99.9)=79.57ms
     iterations.....................: 137603  1127.690122/s
     success_rate...................: 100.00% ✓ 137603      ✗ 0     
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

     checks.........................: 100.00% ✓ 208218     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   682 kB/s
     http_req_blocked...............: avg=4.93µs  min=1.19µs  med=3.19µs  max=4.15ms   p(90)=4.84µs   p(95)=5.52µs   p(99.9)=56.81µs 
     http_req_connecting............: avg=1.47µs  min=0s      med=0s      max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.11ms min=18.63ms med=83.97ms max=359.54ms p(90)=101ms    p(95)=108.68ms p(99.9)=209.23ms
       { expected_response:true }...: avg=86.11ms min=18.63ms med=83.97ms max=359.54ms p(90)=101ms    p(95)=108.68ms p(99.9)=209.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69506
     http_req_receiving.............: avg=87.34µs min=32.53µs med=77.61µs max=59.48ms  p(90)=113.69µs p(95)=127.23µs p(99.9)=982.23µs
     http_req_sending...............: avg=26.06µs min=5.78µs  med=13.66µs max=105.37ms p(90)=20.45µs  p(95)=22.88µs  p(99.9)=762.23µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86ms    min=18.47ms med=83.86ms max=358.8ms  p(90)=100.88ms p(95)=108.56ms p(99.9)=209.07ms
     http_reqs......................: 69506   567.75756/s
     iteration_duration.............: avg=86.45ms min=29.42ms med=84.22ms max=369.93ms p(90)=101.23ms p(95)=108.97ms p(99.9)=211.12ms
     iterations.....................: 69406   566.940713/s
     success_rate...................: 100.00% ✓ 69406      ✗ 0    
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

     checks.........................: 100.00% ✓ 132846     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 53 MB   435 kB/s
     http_req_blocked...............: avg=5.88µs   min=1.18µs  med=3.39µs   max=4.12ms   p(90)=4.92µs   p(95)=5.55µs   p(99.9)=512.03µs
     http_req_connecting............: avg=2.28µs   min=0s      med=0s       max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=385.6µs 
     http_req_duration..............: avg=135.01ms min=22.37ms med=132.96ms max=375.15ms p(90)=169.49ms p(95)=181.01ms p(99.9)=234.6ms 
       { expected_response:true }...: avg=135.01ms min=22.37ms med=132.96ms max=375.15ms p(90)=169.49ms p(95)=181.01ms p(99.9)=234.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 44382
     http_req_receiving.............: avg=180.82µs min=31.88µs med=86µs     max=171.31ms p(90)=119.63µs p(95)=132.94µs p(99.9)=1.5ms   
     http_req_sending...............: avg=34.73µs  min=5.49µs  med=15.85µs  max=227.41ms p(90)=21.76µs  p(95)=23.77µs  p(99.9)=568.61µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=134.79ms min=22.26ms med=132.82ms max=267.1ms  p(90)=169.32ms p(95)=180.77ms p(99.9)=227.28ms
     http_reqs......................: 44382   362.284437/s
     iteration_duration.............: avg=135.54ms min=26.41ms med=133.27ms max=385.33ms p(90)=169.75ms p(95)=181.31ms p(99.9)=239.01ms
     iterations.....................: 44282   361.46815/s
     success_rate...................: 100.00% ✓ 44282      ✗ 0    
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

     checks.........................: 100.00% ✓ 93747      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 38 MB   308 kB/s
     http_req_blocked...............: avg=7.22µs   min=1.22µs  med=3.83µs   max=4.26ms   p(90)=5.35µs   p(95)=5.97µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=3.15µs   min=0s      med=0s       max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=191.24ms min=18.86ms med=177.9ms  max=655.55ms p(90)=261.59ms p(95)=374.54ms p(99.9)=563.46ms
       { expected_response:true }...: avg=191.24ms min=18.86ms med=177.9ms  max=655.55ms p(90)=261.59ms p(95)=374.54ms p(99.9)=563.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31349
     http_req_receiving.............: avg=159.8µs  min=33.54µs med=95.87µs  max=229.4ms  p(90)=129.09µs p(95)=142.7µs  p(99.9)=4.31ms  
     http_req_sending...............: avg=29.34µs  min=6.24µs  med=17.8µs   max=81.19ms  p(90)=23.21µs  p(95)=25.12µs  p(99.9)=662.25µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.05ms min=18.69ms med=177.74ms max=655.41ms p(90)=261.42ms p(95)=374.3ms  p(99.9)=563.34ms
     http_reqs......................: 31349   256.535112/s
     iteration_duration.............: avg=192.1ms  min=40.88ms med=178.37ms max=655.84ms p(90)=262.04ms p(95)=376.21ms p(99.9)=563.66ms
     iterations.....................: 31249   255.716792/s
     success_rate...................: 100.00% ✓ 31249      ✗ 0    
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

     checks.........................: 100.00% ✓ 83934      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   274 kB/s
     http_req_blocked...............: avg=7.7µs    min=1.17µs  med=3.57µs   max=4.18ms   p(90)=4.99µs   p(95)=5.61µs   p(99.9)=2.21ms  
     http_req_connecting............: avg=3.81µs   min=0s      med=0s       max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=2.03ms  
     http_req_duration..............: avg=213.62ms min=19.97ms med=212.42ms max=444.87ms p(90)=227.93ms p(95)=239.13ms p(99.9)=312.89ms
       { expected_response:true }...: avg=213.62ms min=19.97ms med=212.42ms max=444.87ms p(90)=227.93ms p(95)=239.13ms p(99.9)=312.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28078
     http_req_receiving.............: avg=207µs    min=34.69µs med=93.69µs  max=154.12ms p(90)=126.54µs p(95)=139.9µs  p(99.9)=19.13ms 
     http_req_sending...............: avg=34.04µs  min=5.88µs  med=17.56µs  max=147.73ms p(90)=22.81µs  p(95)=24.74µs  p(99.9)=700.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=213.38ms min=19.81ms med=212.3ms  max=327.34ms p(90)=227.79ms p(95)=238.82ms p(99.9)=306.5ms 
     http_reqs......................: 28078   228.565249/s
     iteration_duration.............: avg=214.59ms min=43.71ms med=212.72ms max=454.09ms p(90)=228.22ms p(95)=239.71ms p(99.9)=319.2ms 
     iterations.....................: 27978   227.751212/s
     success_rate...................: 100.00% ✓ 27978      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

