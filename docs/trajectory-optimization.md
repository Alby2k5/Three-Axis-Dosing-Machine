# Trajectory Optimisation

## Problem definition

For a list of planar points, the open-path travel distance is the sum of Euclidean distances between consecutive points. Reordering can reduce non-process travel when point order is not otherwise constrained.

## Implemented heuristic

The public MATLAB function `nearest_neighbor_order.m` starts from the first point and repeatedly selects the nearest unvisited point.

Advantages:

- deterministic and easy to inspect;
- low computational cost for small point lists;
- useful as a baseline comparison.

Limits:

- not guaranteed to find the global optimum;
- can create locally short but globally poor choices;
- ignores Z movement, dosing dwell, washing, source/destination dependencies, obstacles, cable limits and safety zones;
- assumes that point order is legally changeable.

## Evidence boundary

No source proves that route optimisation ran on the machine. The comparison uses a synthetic 2-D dataset and is labelled **simulated**. It demonstrates analytical capability, not an installed improvement.

## Better future formulation

After process constraints are known, model the route as a constrained graph or scheduling problem. Compare nearest neighbour with 2-opt and, for small datasets, an exact solver. The objective should include XY time, Z actions, dosing/washing dwell and mandatory precedence—not distance alone.
