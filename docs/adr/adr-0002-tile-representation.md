# ADR 0002: Tile Representation

## Status
Deffered

## Context
American Mahjong uses 43 unique tiles and 156 tiles total. 
Model training requires a large number of simulated games.
The representation should be easy to parse while optimizing for low memory and fast transfer.

## Decision
The tiles will be represented by an interface.
For quick development, an Enum will implement the interface.
Once the engine is developed, the Enum representation can be substituted for a byte array.

## Rejected Alternatives
Strictly using enums was rejected because of the high memory cost.
Strictly using byte arrays was rejected for simplicity of initial development

## Benefits
The interface allows for different representations to be easily substitituted when needed.
Enums allow for quick development of readable code
Byte arrays have low memory overhead, are trivial to serialize, and are cache friendly

## Consequences
Byte arrays will require custom parsing and are less readable