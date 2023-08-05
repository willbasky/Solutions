module Main (main) where

import Nitka (w, wSeq)
import Criterion
import Criterion.Main (defaultMain)

main :: IO ()
main = p2benchmark

p2benchmark :: IO ()
p2benchmark = do
  defaultMain
    [ bgroup "4_000_000"
      [
        bench "w 0 0" $ nf (uncurry w) (0,0)
      , bench "wSeq 0 0" $ nf (uncurry wSeq) (0,0)
      , bench "w 3 2" $ nf (uncurry w) (3,2)
      , bench "wSeq 3 2" $ nf (uncurry wSeq) (3,2)
      , bench "w 322 156" $ nf (uncurry w) (322,156)
      , bench "wSeq 322 156" $ nf (uncurry wSeq) (322,156)
      ]
    ]

{-
Benchmark pyramid-benchmark: RUNNING...
benchmarking 4_000_000/w 0 0
time                 18.79 ns   (18.72 ns .. 18.87 ns)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 18.75 ns   (18.69 ns .. 18.81 ns)
std dev              229.0 ps   (177.3 ps .. 316.0 ps)
variance introduced by outliers: 14% (moderately inflated)

benchmarking 4_000_000/wSeq 0 0
time                 12.29 ns   (12.24 ns .. 12.38 ns)
                     0.997 R²   (0.995 R² .. 0.998 R²)
mean                 13.13 ns   (12.80 ns .. 13.51 ns)
std dev              1.345 ns   (1.069 ns .. 1.575 ns)
variance introduced by outliers: 92% (severely inflated)

benchmarking 4_000_000/w 3 2
time                 183.7 ns   (181.4 ns .. 186.6 ns)
                     0.999 R²   (0.998 R² .. 0.999 R²)
mean                 186.0 ns   (184.5 ns .. 189.8 ns)
std dev              9.052 ns   (5.500 ns .. 14.77 ns)
variance introduced by outliers: 69% (severely inflated)

benchmarking 4_000_000/wSeq 3 2
time                 597.6 ns   (593.9 ns .. 600.8 ns)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 601.5 ns   (598.1 ns .. 604.2 ns)
std dev              11.02 ns   (9.127 ns .. 13.87 ns)
variance introduced by outliers: 21% (moderately inflated)

benchmarking 4_000_000/w 322 156
time                 1.239 ms   (1.228 ms .. 1.250 ms)
                     1.000 R²   (0.999 R² .. 1.000 R²)
mean                 1.222 ms   (1.216 ms .. 1.229 ms)
std dev              20.89 μs   (16.78 μs .. 26.50 μs)

benchmarking 4_000_000/wSeq 322 156
time                 8.582 ms   (8.473 ms .. 8.664 ms)
                     0.999 R²   (0.997 R² .. 0.999 R²)
mean                 8.618 ms   (8.519 ms .. 8.727 ms)
std dev              293.7 μs   (212.8 μs .. 442.8 μs)
variance introduced by outliers: 12% (moderately inflated)

Benchmark pyramid-benchmark: FINISH
Completed 2 action(s).
-}
