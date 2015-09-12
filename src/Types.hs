module Types where

import Data.Map (Map)

type Permanence = Float

type SynapseWeight = Float

data Synapse = Synapse Permanence

data Region = Region [Col]

-- Cell

data Cell = Cell CellState Bool --[Cell]

data CellState = CellActive | CellInactive | CellPredicted


-- Column

type PotentialPool = [Permanence] -- Map InputBitIndex Permanence

data ColState = ColActive | ColInactive

data Col = Col { state :: ColState
               , inhibitionRadius :: Float
               , boostingFactor :: Float
               , cells :: [Cell]
               , potentialPool :: PotentialPool
               }


-- Input

type InputBitIndex = Int

data InputBitState = InputBitActive | InputBitInactive

type Input = [Bool] --Map InputBitIndex InputBitState

type InputStream = [Input]
