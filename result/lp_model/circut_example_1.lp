\ Model circut_example
\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  x[0] + x[1] + x[2] + x[3] + x[4] + x[5]
Subject To
 fix_x: x[1] = 1
 geo_c2: x[0] - x[1] + x[2] >= 0
 geo_c2: x[0] - x[1] + x[3] >= 0
 geo_c2: x[0] + x[3] - x[5] >= 0
 geo_c2: x[0] + x[4] - x[5] >= 0
 geo_c2: x[1] - x[2] + x[3] >= 0
 geo_c2: - x[0] + x[1] + x[4] >= 0
 geo_c2: x[1] - x[2] + x[4] >= 0
 geo_c2: - x[0] + x[1] + x[5] >= 0
 geo_c2: x[2] - x[3] + x[4] >= 0
 geo_c2: - x[1] + x[2] + x[5] >= 0
 geo_c2: x[2] - x[3] + x[5] >= 0
 geo_c2: x[3] - x[4] + x[5] >= 0
Bounds
Binaries
 x[0] x[1] x[2] x[3] x[4] x[5]
End
