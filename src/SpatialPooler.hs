module SpatialPooler (
  spatiallyPool
  ) where

-- learning the connections to each column from a subset of the inputs,
-- determining the level of input to each column
-- using inhibition to select a sparse set of active columns

import Types
import PotentialPool (numActiveSynapses)
import Util (topPercent)
import Constants (colActiveCutoffPercent)

import qualified Data.Map as M

-- updatePotentialPool :: Col -> Col
-- updatePotentialPool col@(Col {potentialPool=_pp}) = col {potentialPool = updatePermanence input _pp}


-- Start with an input consisting of a fixed number of bits. These bits might
-- represent sensory data or they might come from another region lower in the
-- hierarchy. Assign a fixed number of columns to the region receiving this input.
-- Each column has an associated dendrite segment.
spatiallyPool :: Region -> Input -> Region
spatiallyPool region@(Region {cols=cols}) input = Region {cols=newCols}
  where
    activations = map (fromIntegral . numActiveSynapses . potentialPool) cols
    colActiveNext col = elem col $ map snd $ topPercent colActiveCutoffPercent $ zip activations cols
    colUpdateState col = col {state = if colActiveNext col then ColActive else ColInactive}
    newCols = map colUpdateState cols -- TODO: update weights

-- For any given input, determine how many valid synapses on each column are
-- connected to active input bits.


-- The number of active synapses is multiplied b y a “boosting” factor which is
-- dynamically determined by how often a column is active relative to its
-- neighbors.

-- The columns with the highest activations after boosting disable all but a fixed
-- percentage of the columns within an inhibition radius. The inhibition radius is
-- itself dynamically determin ed by the spread ( or “fan - out” ) of input bits.
-- There is now a sparse set of active columns.

-- For each of the active columns, we adjust the permanence values of all the
-- potential synapses. The permanence values of synapses aligned with active input
-- bit s are increased. The permanence values of synapses aligned with inactive
-- input bits are decreased. The changes made to permanence values may change some
-- synapses from being valid to not valid , and vice - versa.
