\ Model lp_neighbors_form1
\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
  x[0] + x[1] + x[2] + x[3] + x[4] + x[5]
Subject To
 fix_x: x[2] = 0
 geodesic: x[0] + x[1] - x[2] <= 1
 geodesic: x[0] - x[2] + x[3] <= 1
 geodesic: x[0] - x[2] + x[4] <= 1
 geodesic: x[0] - x[2] + x[5] <= 1
 geodesic: x[0] + x[1] - x[2] <= 1
 geodesic: x[1] - x[2] + x[3] <= 1
 geodesic: x[1] - x[2] + x[4] <= 1
 geodesic: x[1] - x[2] + x[5] <= 1
 geodesic: x[2] - x[3] + x[4] <= 1
 geodesic: x[2] - x[3] + x[5] <= 1
 geodesic: x[0] - x[2] + x[3] <= 1
 geodesic: x[1] - x[2] + x[3] <= 1
 geodesic: x[3] - x[4] + x[5] <= 1
 geodesic: x[0] - x[3] + x[4] <= 1
 geodesic: x[1] - x[3] + x[4] <= 1
 geodesic: x[2] - x[3] + x[4] <= 1
 geodesic: x[0] - x[4] + x[5] <= 1
 geodesic: x[1] - x[4] + x[5] <= 1
 geodesic: x[2] - x[4] + x[5] <= 1
 geodesic: x[3] - x[4] + x[5] <= 1
Bounds
 x[0] <= 1
 x[1] <= 1
 x[2] <= 1
 x[3] <= 1
 x[4] <= 1
 x[5] <= 1
End
