\ Model dodecahedral
\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  x[0] + x[1] + x[2] + x[3] + x[4] + x[5] + x[6] + x[7] + x[8] + x[9]
   + x[10] + x[11] + x[12] + x[13] + x[14] + x[15] + x[16] + x[17] + x[18]
   + x[19]
Subject To
 fix_x: x[19] = 1
 miset: - 2 x[0] + x[1] + x[10] + x[19] >= 0
 miset: x[0] - 2 x[1] + x[2] + x[8] >= 0
 miset: x[1] - 2 x[2] + x[3] + x[6] >= 0
 miset: x[2] - 2 x[3] + x[4] + x[19] >= 0
 miset: x[3] - 2 x[4] + x[5] + x[17] >= 0
 miset: x[4] - 2 x[5] + x[6] + x[15] >= 0
 miset: x[2] + x[5] - 2 x[6] + x[7] >= 0
 miset: x[6] - 2 x[7] + x[8] + x[14] >= 0
 miset: x[1] + x[7] - 2 x[8] + x[9] >= 0
 miset: x[8] - 2 x[9] + x[10] + x[13] >= 0
 miset: x[0] + x[9] - 2 x[10] + x[11] >= 0
 miset: x[10] - 2 x[11] + x[12] + x[18] >= 0
 miset: x[11] - 2 x[12] + x[13] + x[16] >= 0
 miset: x[9] + x[12] - 2 x[13] + x[14] >= 0
 miset: x[7] + x[13] - 2 x[14] + x[15] >= 0
 miset: x[5] + x[14] - 2 x[15] + x[16] >= 0
 miset: x[12] + x[15] - 2 x[16] + x[17] >= 0
 miset: x[4] + x[16] - 2 x[17] + x[18] >= 0
 miset: x[11] + x[17] - 2 x[18] + x[19] >= 0
 miset: x[0] + x[3] + x[18] - 2 x[19] >= 0
Bounds
Binaries
 x[0] x[1] x[2] x[3] x[4] x[5] x[6] x[7] x[8] x[9] x[10] x[11] x[12] x[13]
 x[14] x[15] x[16] x[17] x[18] x[19]
End
