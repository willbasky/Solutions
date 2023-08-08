# Solutions

The solutions of challenges that companies ever assigned to me

## Comparing of the haskell and cargo implementation

```shell
❯ hyperfine "cargo r" "stack run"
Benchmark 1: cargo r
  Time (mean ± σ):      57.6 ms ±  14.3 ms    [User: 46.5 ms, System: 11.0 ms]
  Range (min … max):    41.0 ms …  75.7 ms    64 runs

Benchmark 2: stack run
  Time (mean ± σ):     597.4 ms ±  30.5 ms    [User: 521.1 ms, System: 95.1 ms]
  Range (min … max):   549.8 ms … 636.1 ms    10 runs

Summary
  cargo r ran
   10.36 ± 2.63 times faster than stack run
```
