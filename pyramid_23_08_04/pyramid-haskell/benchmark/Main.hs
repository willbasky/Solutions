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
time                 10.11 ns   (10.07 ns .. 10.16 ns)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 10.10 ns   (10.07 ns .. 10.13 ns)
std dev              96.80 ps   (75.13 ps .. 130.5 ps)

benchmarking 4_000_000/wSeq 0 0
time                 11.11 ns   (10.84 ns .. 11.36 ns)
                     0.998 R²   (0.997 R² .. 1.000 R²)
mean                 10.87 ns   (10.81 ns .. 11.00 ns)
std dev              292.9 ps   (163.7 ps .. 442.1 ps)
variance introduced by outliers: 45% (moderately inflated)

benchmarking 4_000_000/wST 0 0
time                 26.22 ns   (25.75 ns .. 26.75 ns)
                     0.998 R²   (0.998 R² .. 0.999 R²)
mean                 26.22 ns   (25.98 ns .. 26.44 ns)
std dev              767.6 ps   (669.6 ps .. 908.9 ps)
variance introduced by outliers: 47% (moderately inflated)

benchmarking 4_000_000/wMVector 0 0
time                 20.12 ns   (19.66 ns .. 20.59 ns)
                     0.995 R²   (0.993 R² .. 0.997 R²)
mean                 19.65 ns   (19.28 ns .. 20.12 ns)
std dev              1.429 ns   (1.208 ns .. 1.709 ns)
variance introduced by outliers: 86% (severely inflated)

benchmarking 4_000_000/w 3 2
time                 146.1 ns   (144.0 ns .. 149.7 ns)
                     0.995 R²   (0.993 R² .. 0.997 R²)
mean                 155.1 ns   (151.0 ns .. 159.4 ns)
std dev              14.12 ns   (12.18 ns .. 17.18 ns)
variance introduced by outliers: 89% (severely inflated)

benchmarking 4_000_000/wSeq 3 2
time                 475.6 ns   (469.8 ns .. 480.1 ns)
                     0.999 R²   (0.998 R² .. 0.999 R²)
mean                 470.5 ns   (465.7 ns .. 477.0 ns)
std dev              19.28 ns   (13.57 ns .. 28.99 ns)
variance introduced by outliers: 58% (severely inflated)

benchmarking 4_000_000/wST 3 2
time                 127.2 ns   (117.2 ns .. 136.4 ns)
                     0.979 R²   (0.966 R² .. 0.999 R²)
mean                 123.8 ns   (120.8 ns .. 129.9 ns)
std dev              14.37 ns   (8.390 ns .. 21.21 ns)
variance introduced by outliers: 93% (severely inflated)

benchmarking 4_000_000/wMVector 3 2
time                 43.23 ns   (41.01 ns .. 45.24 ns)
                     0.986 R²   (0.983 R² .. 0.992 R²)
mean                 39.94 ns   (38.76 ns .. 41.36 ns)
std dev              4.339 ns   (3.148 ns .. 5.798 ns)
variance introduced by outliers: 93% (severely inflated)

benchmarking 4_000_000/w 322 156
time                 986.2 μs   (942.8 μs .. 1.044 ms)
                     0.983 R²   (0.974 R² .. 0.992 R²)
mean                 1.137 ms   (1.072 ms .. 1.255 ms)
std dev              292.3 μs   (191.5 μs .. 408.2 μs)
variance introduced by outliers: 95% (severely inflated)

benchmarking 4_000_000/wSeq 322 156
time                 6.822 ms   (6.763 ms .. 6.884 ms)
                     0.999 R²   (0.999 R² .. 1.000 R²)
mean                 6.892 ms   (6.845 ms .. 6.959 ms)
std dev              155.6 μs   (95.55 μs .. 230.1 μs)

benchmarking 4_000_000/wST 322 156
time                 945.3 μs   (938.3 μs .. 955.5 μs)
                     0.999 R²   (0.998 R² .. 0.999 R²)
mean                 961.6 μs   (954.0 μs .. 972.7 μs)
std dev              31.02 μs   (23.66 μs .. 42.79 μs)
variance introduced by outliers: 22% (moderately inflated)

benchmarking 4_000_000/wMVector 322 156
time                 62.97 μs   (62.95 μs .. 63.00 μs)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 62.96 μs   (62.94 μs .. 62.99 μs)
std dev              86.49 ns   (55.94 ns .. 134.3 ns)

Benchmark pyramid-benchmark: FINISH
-}
