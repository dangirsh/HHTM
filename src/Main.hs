module Main (main) where

import Types

{-- When a column becomes active, it looks at all the cells in the column. If one
    or more cells in the column are already in the predictive state, only those cells
    become active. If no cells in the column are in the predictive state, then all
    the cells become active. You can think of it this way, if an input pattern is
    expected then the system confirms that expectation by activating only the cells
    in the predictive state. If the input pattern is unexpected then the system
    activates all cells in the column as if to say “the input occurred unexpectedly
    so all possible interpretations are valid”. --}
-- stepCol :: Col -> Col
-- stepCol (Col cells ColActive pp)
--   | any cellActive cells = Col (map stepCell cells) ColInactive pp
--   | otherwise = Col (map activateCell cells) ColInactive pp  -- burst
--   where
--     activateCell (Cell _ cons) = Cell CellActive cons
--     cellActive (Cell CellActive _) = True
--     cellActive _ = False
-- stepCol col = col

-- stepCell :: Cell -> Cell
-- stepCell (Cell CellPredicted cons) = (Cell CellActive cons)
-- stepCell cell = cell

main :: IO ()
main = putStrLn "I am conscious"
