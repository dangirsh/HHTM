module Types where

import Data.Map (Map)

type Permanence = Double

type SynapseWeight = Double

data Synapse = Synapse Permanence

data Region =
  Region {cols :: [Col]} deriving (Show, Eq, Ord)

-- Cell

data Cell = Cell CellState Bool deriving (Show, Eq, Ord) --[Cell]

data CellState = CellActive | CellInactive | CellPredicted deriving (Show, Eq, Ord)


-- Column

type PotentialPool = [Permanence] -- Map InputBitIndex Permanence

data ColState = ColActive | ColInactive deriving (Show, Eq, Ord)

data Col = Col { state :: ColState
               -- , inhibitionRadius :: Double
               -- , boostingFactor :: Double
               , cells :: [Cell]
               , potentialPool :: PotentialPool
               } deriving (Show, Eq, Ord)


-- Input

type InputBitIndex = Int

data InputBitState = InputBitActive | InputBitInactive

type Input = [Bool] --Map InputBitIndex InputBitState

type InputStream = [Input]
