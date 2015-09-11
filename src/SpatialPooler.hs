module SpatialPooler () where

-- learning the connections to each column from a subset of the inputs,
-- determining the level of input to each column
-- using inhibition to select a sparse set of active columns

import Types

spatiallyPool :: Region -> Input -> Region
