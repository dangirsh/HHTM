module Types where

import Data.Map (Map)

-- Permanence
-- Synapses are forming and unforming constantly during learning. As mentioned
-- before, we assign a scalar value to each synapse (0.0 to 1.0) to indicate how
-- permanent the connection is. When a connection is reinforced, its permanence is
-- increased. Under other conditions, the permanence is decreased. When the
-- permanence is above a threshold (e.g. 0.2), the synapse is considered to be
-- established. If the permanence is below the threshold, the synapse will have no
-- effect.
type Permanence = Double

-- Binary Weights:
-- HTM synapses have only a 0 or 1 effect; their “weight” is binary, a property unlike
-- many neural network models which use scalar variable values in the range of 0 to 1
type SynapseWeight = Bool

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
