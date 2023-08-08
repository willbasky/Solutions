{-# LANGUAGE LambdaCase #-}
module Pyramid
    ( w
    , wSeq
    , wST
    , wVector
    , wMVector
    ) where


import Data.List ( unfoldr )
import Data.List.Extra ( (!?) )
import Data.Sequence (Seq(..), (|>), (<|))
import qualified Data.Sequence as Seq
import Data.STRef
import Control.Monad
import qualified Data.Vector.Unboxed.Mutable as MV
import Control.Monad.ST
import qualified Data.Vector.Unboxed as V
import Data.Vector.Unboxed (Vector)

makeLine :: [Double] -> [Double]
makeLine [] = []
makeLine [x] = [1 + x/2]
makeLine (a:b:ys) = 1 + (a + b)/2 : makeLine (b:ys)

-- [] version is faster than Sequence one.
genPyramid :: Int -> [[Double]]
genPyramid top = unfoldr genLine ([1], top)
 where
  genLine (xs, t) =
    let newLine = makeLine $ 0 : xs
      in case t of
        0 -> Nothing
        _ -> Just (newLine, (newLine, t - 1))

-- Benchmark 1.271 ms
w :: Int -> Int -> Maybe Double
w top left =
  let pyramid = genPyramid top
  in if null pyramid
    then Just 0
    else (\x -> x - 1) <$> last pyramid !? left


genPyramidSeq :: Int -> [Seq Double]
genPyramidSeq top = unfoldr genLine (Seq.singleton 1, top)
 where
  genLine :: (Seq Double, Int) -> Maybe (Seq Double, (Seq Double, Int))
  genLine (xs, t) =
    let newLine = makeLineSeq $ 0 <| (xs |> 0)
        makeLineSeq = \case
          Empty -> Seq.empty
          _ :<| Empty -> Seq.empty
          a :<| (b :<| ys) -> 1 + (a + b)/2 <| makeLineSeq (b <| ys)
      in case t of
        0 -> Nothing
        _ -> Just (newLine, (newLine, t - 1))

wSeq :: Int -> Int -> Maybe Double
wSeq top left =
  let pyramid = genPyramidSeq top
  in if null pyramid
    then Just 0
    else (\x -> x - 1) <$> last pyramid Seq.!? left

genPyramidST :: Int -> [Double]
genPyramidST top = runST $ do
    ref <- newSTRef [1]
    replicateM_ top $ modifySTRef' ref $ \rowAbove ->
        makeLine $ 0 : rowAbove
    readSTRef ref

wST :: Int -> Int -> Maybe Double
wST top left =
  let pyramid = genPyramidST top
  in if null pyramid
    then Just 0
    else (\x -> x - 1) <$> pyramid !? left


-- MVector, ST
makeLineV :: Vector Double -> Vector Double
makeLineV vec = V.imap nextRow vec
  where
    nextRow i x
      | i == V.length vec - 1 = 1 + x / 2
      | otherwise = 1 + (x + vec V.! (i + 1)) / 2

genPyramidV :: Int -> Vector Double
genPyramidV top = runST $ do
    ref <- newSTRef (V.singleton 1.0)
    replicateM_ top $ modifySTRef' ref $ \vec ->
        makeLineV (V.cons 0 vec)
    readSTRef ref

wVector :: Int -> Int -> Maybe Double
wVector top left =
  let pyramid = genPyramidV top
  in if V.null pyramid
    then Just 0
    else (\x -> x - 1) <$> (pyramid V.!? left)

-- длина вектора (количество элементов в ряде пирамиды) top+1
-- Benchmark speed 64.18 μs
makeTargetRow :: Int -> Vector Double
makeTargetRow 0 = V.singleton 1.0
makeTargetRow 1 = V.replicate 2 1.5
makeTargetRow top = runST $ do
  mv <- MV.new (top + 1)
  MV.unsafeWrite mv 0 1.5
  MV.unsafeWrite mv 1 1.5
  buf <- MV.new 1
  MV.unsafeWrite buf 0 0.0
  forM_ [2..top] $ \tx -> do
      forM_ [0..tx] $ \ix -> do
        element <- MV.unsafeRead mv ix
        prevElement <- MV.unsafeRead buf 0
        let newElement = 1 + (element + prevElement) / 2
        MV.unsafeWrite buf 0 element
        MV.unsafeWrite mv ix newElement

  V.unsafeFreeze mv

wMVector :: Int -> Int -> Maybe Double
wMVector top left = (\x -> x - 1) <$> makeTargetRow top V.!? left
