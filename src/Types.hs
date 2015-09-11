module Types where

import Data.Map (Map)

type Permanence = Float

data Synapse = Synapse Permanence

data Region = Region [Col]

-- Cell

data Cell = Cell CellState [Cell]

data CellState = CellActive | CellInactive | CellPredicted


-- Column

data ColState = ColActive | ColInactive

data Col = Col { state :: ColState
               , inhibitionRadius :: Float
               , boostingFactor :: Float
               , cells :: [Cell]
               , potentialPool :: Map InputIndex Permanence
               }


-- Input

type InputIndex = Int

type Input = Map InputIndex Bool

type InputStream = [Input]
