module Nitka
    ( w
    , wSeq
    ) where


import Data.List ( unfoldr )
import Data.List.Extra ( (!?) )
import Data.Sequence (Seq(..), (|>), (<|))
import qualified Data.Sequence as Seq

-- [] version is faster than Sequence one.
genPyramid :: Int -> [[Double]]
genPyramid top = unfoldr genLine ([1], top)
 where
  genLine (xs, t) =
    let newLine = makeLine $ 0 : xs
        makeLine [] = []
        makeLine [x] = [1 + x/2]
        makeLine (a:b:ys) = 1 + (a + b)/2 : makeLine (b:ys)
      in case t of
        0 -> Nothing
        _ -> Just (newLine, (newLine, t - 1))

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
    let newLine = makeLine $ 0 <| (xs |> 0)
        makeLine = \case
          Empty -> Seq.empty
          _ :<| Empty -> Seq.empty
          a :<| (b :<| ys) -> 1 + (a + b)/2 <| makeLine (b <| ys)
      in case t of
        0 -> Nothing
        _ -> Just (newLine, (newLine, t - 1))

wSeq :: Int -> Int -> Maybe Double
wSeq top left =
  let pyramid = genPyramidSeq top
  in if null pyramid
    then Just 0
    else (\x -> x - 1) <$> last pyramid Seq.!? left
