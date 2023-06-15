\ Model cube
\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  x[0] + x[1] + x[2] + x[3] + x[4] + x[5] + x[6] + x[7]
Subject To
 fix_x: x[0] = 1
 miset: - x[0] + x[1] + x[2] >= 0
Bounds
Binaries
 x[0] x[1] x[2] x[3] x[4] x[5] x[6] x[7]
End
