module Types () where

type Permanence = Float

type SynapseWeight = Bool

type Input = [Bool]

type InputStream = [Input]

data Cell = Cell CellState [Cell]

data CellState = Active | Inactive | Predicted

type ColumnState = Bool

type PotentialPool = [Int]

data Column = Column [Cell] ColumnState PotentialPool
