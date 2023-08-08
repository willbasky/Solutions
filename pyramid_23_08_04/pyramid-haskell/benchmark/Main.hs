module Main (main) where

import Pyramid (w, wSeq, wST,wMVector)
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
      , bench "wST 0 0" $ nf (uncurry wST) (0,0)
      , bench "wMVector 0 0" $ nf (uncurry wMVector) (0,0)
      , bench "w 3 2" $ nf (uncurry w) (3,2)
      , bench "wSeq 3 2" $ nf (uncurry wSeq) (3,2)
      , bench "wST 3 2" $ nf (uncurry wST) (3,2)
      , bench "wMVector 3 2" $ nf (uncurry wMVector) (3,2)
      , bench "w 322 156" $ nf (uncurry w) (322,156)
      , bench "wSeq 322 156" $ nf (uncurry wSeq) (322,156)
      , bench "wST 322 156" $ nf (uncurry wST) (322,156)
      , bench "wMVector 322 156" $ nf (uncurry wMVector) (322,156)
      ]
    ]

{-
Benchmark pyramid-benchmark: RUNNING...
benchmarking 4_000_000/w 0 0
time                 11.54 ns   (11.48 ns .. 11.62 ns)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 11.53 ns   (11.48 ns .. 11.66 ns)
std dev              274.3 ps   (115.3 ps .. 491.0 ps)
variance introduced by outliers: 38% (moderately inflated)

benchmarking 4_000_000/wSeq 0 0
time                 12.18 ns   (12.02 ns .. 12.36 ns)
                     0.998 R²   (0.996 R² .. 0.999 R²)
mean                 12.25 ns   (12.11 ns .. 12.60 ns)
std dev              678.8 ps   (376.7 ps .. 1.240 ns)
variance introduced by outliers: 78% (severely inflated)

benchmarking 4_000_000/wST 0 0
time                 36.66 ns   (35.29 ns .. 38.56 ns)
                     0.981 R²   (0.969 R² .. 0.989 R²)
mean                 39.04 ns   (37.04 ns .. 41.70 ns)
std dev              6.847 ns   (5.055 ns .. 9.080 ns)
variance introduced by outliers: 97% (severely inflated)

benchmarking 4_000_000/wMVector 0 0
time                 23.98 ns   (23.29 ns .. 24.68 ns)
                     0.994 R²   (0.990 R² .. 0.997 R²)
mean                 23.31 ns   (22.84 ns .. 23.95 ns)
std dev              1.843 ns   (1.382 ns .. 2.763 ns)
variance introduced by outliers: 87% (severely inflated)

benchmarking 4_000_000/w 3 2
time                 187.1 ns   (184.7 ns .. 192.2 ns)
                     0.995 R²   (0.988 R² .. 0.999 R²)
mean                 193.8 ns   (189.1 ns .. 201.7 ns)
std dev              20.91 ns   (13.15 ns .. 27.77 ns)
variance introduced by outliers: 92% (severely inflated)

benchmarking 4_000_000/wSeq 3 2
time                 596.8 ns   (589.8 ns .. 606.7 ns)
                     0.999 R²   (0.998 R² .. 1.000 R²)
mean                 592.4 ns   (588.7 ns .. 597.5 ns)
std dev              15.81 ns   (10.11 ns .. 24.08 ns)
variance introduced by outliers: 37% (moderately inflated)

benchmarking 4_000_000/wST 3 2
time                 151.7 ns   (151.0 ns .. 152.5 ns)
                     1.000 R²   (0.999 R² .. 1.000 R²)
mean                 151.3 ns   (150.6 ns .. 152.5 ns)
std dev              2.905 ns   (2.098 ns .. 4.109 ns)
variance introduced by outliers: 25% (moderately inflated)

benchmarking 4_000_000/wMVector 3 2
time                 46.55 ns   (46.27 ns .. 46.79 ns)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 46.36 ns   (46.15 ns .. 46.52 ns)
std dev              642.3 ps   (536.6 ps .. 756.6 ps)
variance introduced by outliers: 16% (moderately inflated)

benchmarking 4_000_000/w 322 156
time                 1.290 ms   (1.271 ms .. 1.312 ms)
                     0.998 R²   (0.997 R² .. 0.999 R²)
mean                 1.277 ms   (1.264 ms .. 1.291 ms)
std dev              47.44 μs   (38.00 μs .. 57.57 μs)
variance introduced by outliers: 26% (moderately inflated)

benchmarking 4_000_000/wSeq 322 156
time                 8.917 ms   (8.842 ms .. 8.971 ms)
                     0.999 R²   (0.999 R² .. 1.000 R²)
mean                 8.900 ms   (8.854 ms .. 8.952 ms)
std dev              142.6 μs   (96.66 μs .. 190.1 μs)

benchmarking 4_000_000/wST 322 156
time                 1.297 ms   (1.265 ms .. 1.352 ms)
                     0.991 R²   (0.978 R² .. 1.000 R²)
mean                 1.283 ms   (1.271 ms .. 1.312 ms)
std dev              64.42 μs   (33.26 μs .. 119.8 μs)
variance introduced by outliers: 38% (moderately inflated)

benchmarking 4_000_000/wMVector 322 156
time                 63.58 μs   (63.51 μs .. 63.68 μs)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 63.43 μs   (63.37 μs .. 63.50 μs)
std dev              237.1 ns   (196.7 ns .. 312.2 ns)

Benchmark pyramid-benchmark: FINISH
-}
