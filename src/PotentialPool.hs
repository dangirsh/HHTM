module PotentialPool where

import Types
import Constants (permanenceThreshold)
import Util (count)


-- Each dendrite segment has a set of potential synapses representing a subset of
-- the input bits. Each potential synapse has a permanence value. Based on their
-- permanence values, some of the potential synapses will be valid.
numActiveSynapses :: PotentialPool -> Integer
numActiveSynapses = count (> permanenceThreshold)
