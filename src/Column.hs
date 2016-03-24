module Column where

import Types (Col)

instance Ord Col where
  col1 > col2 = col1
