module Util where

import Data.List (sort)

count :: (a -> Bool) -> [a] -> Integer
count pred xs = fromIntegral $ length $ filter pred xs

topPercent :: Ord a => Double -> [a] -> [a]
topPercent percentage xs = take (round $ percentage * (fromIntegral (length xs))) $ (reverse . sort) xs
