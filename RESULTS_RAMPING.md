## Overview for: `ramping-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Subgraph technology is reported in the `Subgraphs` column for each row:
- `rust` = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- `.net` = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 11 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 10 runs are measured. Results are ranked by **median RPS** across the 10 measured runs, with best/worst/CV% reported for transparency.

This scenario is a stress test that ramps up to **500 VUs** over **120s**.


### Comparison

| Gateway | Subgraphs | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :-------- | :------ | ---------: | -------: | --------: | --: | :---- |
| hotchocolate-aot | .net | 16.0.0-p.11.46-aot | 1,524 | 1,524 | 1,524 | 0.0% | non-compatible response (85655 across 1/1 runs) |
| hotchocolate-aot | rust | 16.0.0-p.11.46-aot | 0 | 0 | 0 | 0.0% | 1 failed requests across 1/1 runs |

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

<details>
  <summary>Summary for: hotchocolate-aot (.net subgraphs) (16.0.0-p.11.46-aot)</summary>

  **K6 Output**


```
✗ response code was 200
      ↳  90% — ✓ 168739 / ✗ 17313
     ✗ no graphql errors
      ↳  53% — ✓ 100397 / ✗ 85655
     ✗ valid response structure
      ↳  99% — ✓ 185937 / ✗ 115

     checks.........................: 81.53% ✓ 455073      ✗ 103083
     data_received..................: 9.1 GB 74 MB/s
     data_sent......................: 225 MB 1.8 MB/s
     http_req_blocked...............: avg=10.21µs  min=942ns    med=2.16µs   max=123.09ms p(90)=3.84µs   p(95)=4.83µs   p(99.9)=193.68µs
     http_req_connecting............: avg=7.49µs   min=0s       med=0s       max=122.92ms p(90)=0s       p(95)=0s       p(99.9)=139.29µs
     http_req_duration..............: avg=272.77ms min=226.56µs med=170.52ms max=50.02s   p(90)=625.77ms p(95)=779.46ms p(99.9)=2.39s   
       { expected_response:true }...: avg=256.16ms min=226.56µs med=138.9ms  max=50.02s   p(90)=606.87ms p(95)=763.26ms p(99.9)=2.49s   
     http_req_failed................: 9.25%  ✓ 17313       ✗ 169739
     http_req_receiving.............: avg=3.57ms   min=8.71µs   med=78.92µs  max=1.06s    p(90)=1.84ms   p(95)=5.21ms   p(99.9)=385.21ms
     http_req_sending...............: avg=36.27µs  min=4.27µs   med=9.25µs   max=160.07ms p(90)=16.5µs   p(95)=21.21µs  p(99.9)=5.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=269.16ms min=204.9µs  med=168.02ms max=50.02s   p(90)=617.2ms  p(95)=768.85ms p(99.9)=2.39s   
     http_reqs......................: 187052 1524.372735/s
     iteration_duration.............: avg=274.49ms min=277.63µs med=172.85ms max=50.03s   p(90)=627.18ms p(95)=781.02ms p(99.9)=2.47s   
     iterations.....................: 186052 1516.223276/s
     success_rate...................: 53.96% ✓ 100397      ✗ 85655 
     vus............................: 71     min=0         max=500 
     vus_max........................: 500    min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate-aot (rust subgraphs) (16.0.0-p.11.46-aot)</summary>

  **K6 Output**


```
data_received..............: 301 B   5.016647353410464 B/s
     data_sent..................: 2.4 kB  40 B/s
     http_req_blocked...........: avg=5.38ms   min=5.38ms   med=5.38ms   max=5.38ms   p(90)=5.38ms   p(95)=5.38ms   p(99.9)=5.38ms  
     http_req_connecting........: avg=132.65µs min=132.65µs med=132.65µs max=132.65µs p(90)=132.65µs p(95)=132.65µs p(99.9)=132.65µs
     http_req_duration..........: avg=30s      min=30s      med=30s      max=30s      p(90)=30s      p(95)=30s      p(99.9)=30s     
     http_req_failed............: 100.00% ✓ 1                   ✗ 0    
     http_req_receiving.........: avg=76.3µs   min=76.3µs   med=76.3µs   max=76.3µs   p(90)=76.3µs   p(95)=76.3µs   p(99.9)=76.3µs  
     http_req_sending...........: avg=74.62µs  min=74.62µs  med=74.62µs  max=74.62µs  p(90)=74.62µs  p(95)=74.62µs  p(99.9)=74.62µs 
     http_req_tls_handshaking...: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...........: avg=30s      min=30s      med=30s      max=30s      p(90)=30s      p(95)=30s      p(99.9)=30s     
     http_reqs..................: 1       0.016667/s
     vus........................: 0       min=0                 max=0  
     vus_max....................: 500     min=500               max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

