## Overview for: `ramping-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

**Methodology:** Each gateway executes 11 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 10 runs are measured. Results are ranked by **median RPS** across the 10 measured runs, with best/worst/CV% reported for transparency.

This scenario is a stress test that ramps up to **500 VUs** over **120s**.


### Comparison

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% |
| :------ | :------ | ---------: | -------: | --------: | --: |
| grafbase | 0.53.2 | 1,927 | 1,940 | 1,920 | 0.3% |
| apollo-router | v2.12.0 | 519 | 522 | 513 | 0.6% |
| cosmo | 0.291.0 | 511 | 518 | 508 | 0.7% |


<details>
  <summary>Summary for: grafbase (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 355470      ✗ 0     
     data_received..................: 11 GB   169 MB/s
     data_sent......................: 144 MB  2.3 MB/s
     http_req_blocked...............: avg=231.1µs  min=891ns   med=2.72µs   max=221.74ms p(90)=4.83µs   p(95)=6.2µs    p(99.9)=95.03ms 
     http_req_connecting............: avg=227.14µs min=0s      med=0s       max=221.64ms p(90)=0s       p(95)=0s       p(99.9)=94.91ms 
     http_req_duration..............: avg=116.79ms min=1.64ms  med=101ms    max=488.75ms p(90)=253.25ms p(95)=308.19ms p(99.9)=439.38ms
       { expected_response:true }...: avg=116.79ms min=1.64ms  med=101ms    max=488.75ms p(90)=253.25ms p(95)=308.19ms p(99.9)=439.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 119490
     http_req_receiving.............: avg=360.74µs min=24.39µs med=52.04µs  max=121.83ms p(90)=136.75µs p(95)=400.34µs p(99.9)=54.35ms 
     http_req_sending...............: avg=269.16µs min=4.14µs  med=10.33µs  max=141.54ms p(90)=22.82µs  p(95)=132.74µs p(99.9)=50.14ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.16ms min=1.59ms  med=100.46ms max=488.64ms p(90)=251.77ms p(95)=306.9ms  p(99.9)=437.08ms
     http_reqs......................: 119490  1927.568395/s
     iteration_duration.............: avg=118.26ms min=1.85ms  med=102.33ms max=680.88ms p(90)=255.22ms p(95)=310.07ms p(99.9)=443.6ms 
     iterations.....................: 118490  1911.436766/s
     success_rate...................: 100.00% ✓ 118490      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✗ no graphql errors
      ↳  99% — ✓ 32719 / ✗ 21
     ✓ valid response structure

     checks.........................: 99.97% ✓ 98199      ✗ 21   
     data_received..................: 3.0 GB 46 MB/s
     data_sent......................: 41 MB  626 kB/s
     http_req_blocked...............: avg=11.45µs  min=892ns   med=2.6µs    max=18.35ms p(90)=5.03µs   p(95)=7.32µs   p(99.9)=819.67µs
     http_req_connecting............: avg=7.63µs   min=0s      med=0s       max=18.31ms p(90)=0s       p(95)=0s       p(99.9)=751.18µs
     http_req_duration..............: avg=388.7ms  min=4.27ms  med=324.68ms max=28.37s  p(90)=496.26ms p(95)=555.96ms p(99.9)=25.79s  
       { expected_response:true }...: avg=388.7ms  min=4.27ms  med=324.68ms max=28.37s  p(90)=496.26ms p(95)=555.96ms p(99.9)=25.79s  
     http_req_failed................: 0.00%  ✓ 0          ✗ 33740
     http_req_receiving.............: avg=70.37µs  min=27.03µs med=57.72µs  max=9.08ms  p(90)=102.58µs p(95)=117.96µs p(99.9)=596.36µs
     http_req_sending...............: avg=31.39µs  min=4.96µs  med=10.74µs  max=11.32ms p(90)=21.55µs  p(95)=27.35µs  p(99.9)=5.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=388.59ms min=4.22ms  med=324.56ms max=28.37s  p(90)=496.19ms p(95)=555.9ms  p(99.9)=25.79s  
     http_reqs......................: 33740  519.745063/s
     iteration_duration.............: avg=400.71ms min=4.53ms  med=331.46ms max=28.37s  p(90)=498.88ms p(95)=559.66ms p(99.9)=25.81s  
     iterations.....................: 32740  504.340645/s
     success_rate...................: 99.93% ✓ 32719      ✗ 21   
     vus............................: 58     min=0        max=499
     vus_max........................: 500    min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✗ no graphql errors
      ↳  99% — ✓ 32206 / ✗ 39
     ✓ valid response structure

     checks.........................: 99.95% ✓ 96696      ✗ 39   
     data_received..................: 2.9 GB 45 MB/s
     data_sent......................: 40 MB  617 kB/s
     http_req_blocked...............: avg=11.74µs  min=932ns   med=2.58µs   max=25.26ms p(90)=4.91µs   p(95)=7.33µs   p(99.9)=847.88µs
     http_req_connecting............: avg=8.05µs   min=0s      med=0s       max=25.15ms p(90)=0s       p(95)=0s       p(99.9)=799.66µs
     http_req_duration..............: avg=398.36ms min=4.29ms  med=334ms    max=29.4s   p(90)=583.28ms p(95)=664.4ms  p(99.9)=20.93s  
       { expected_response:true }...: avg=398.36ms min=4.29ms  med=334ms    max=29.4s   p(90)=583.28ms p(95)=664.4ms  p(99.9)=20.93s  
     http_req_failed................: 0.00%  ✓ 0          ✗ 33245
     http_req_receiving.............: avg=68.12µs  min=27.11µs med=55.04µs  max=7.35ms  p(90)=99.64µs  p(95)=114.85µs p(99.9)=629.56µs
     http_req_sending...............: avg=30.24µs  min=4.86µs  med=10.32µs  max=24.84ms p(90)=20.72µs  p(95)=26.29µs  p(99.9)=4.8ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=398.26ms min=4.21ms  med=333.89ms max=29.4s   p(90)=583.18ms p(95)=664.33ms p(99.9)=20.93s  
     http_reqs......................: 33245  511.919704/s
     iteration_duration.............: avg=410.85ms min=4.55ms  med=342.82ms max=29.4s   p(90)=587.17ms p(95)=669.92ms p(99.9)=22.51s  
     iterations.....................: 32245  496.521307/s
     success_rate...................: 99.87% ✓ 32206      ✗ 39   
     vus............................: 58     min=0        max=498
     vus_max........................: 500    min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

