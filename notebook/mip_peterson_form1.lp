\ Model mip_peterson_form1
\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
  x[0] + x[1] + x[2] + x[3] + x[4] + x[5] + x[6] + x[7] + x[8] + x[9]
Subject To
 R0: x[0] = 0
 geodesic: x[0] - x[1] + x[2] <= 1
 geodesic: x[0] + x[3] - x[4] <= 1
 geodesic: x[0] - x[1] + x[6] <= 1
 geodesic: x[0] - x[5] + x[7] <= 1
 geodesic: x[0] - x[5] + x[8] <= 1
 geodesic: x[0] - x[4] + x[9] <= 1
 geodesic: x[1] - x[2] + x[3] <= 1
 geodesic: - x[0] + x[1] + x[4] <= 1
 geodesic: - x[0] + x[1] + x[5] <= 1
 geodesic: x[1] - x[2] + x[7] <= 1
 geodesic: x[1] - x[6] + x[8] <= 1
 geodesic: x[1] - x[6] + x[9] <= 1
 geodesic: x[2] - x[3] + x[4] <= 1
 geodesic: x[2] + x[5] - x[7] <= 1
 geodesic: - x[1] + x[2] + x[6] <= 1
 geodesic: x[2] - x[3] + x[8] <= 1
 geodesic: x[2] - x[7] + x[9] <= 1
 geodesic: x[3] + x[5] - x[8] <= 1
 geodesic: x[3] + x[6] - x[8] <= 1
 geodesic: - x[2] + x[3] + x[7] <= 1
 geodesic: x[3] - x[4] + x[9] <= 1
 geodesic: - x[0] + x[4] + x[5] <= 1
 geodesic: x[4] + x[6] - x[9] <= 1
 geodesic: x[4] + x[7] - x[9] <= 1
 geodesic: - x[3] + x[4] + x[8] <= 1
 geodesic: x[5] + x[6] - x[8] <= 1
 geodesic: x[5] - x[7] + x[9] <= 1
 geodesic: x[6] + x[7] - x[9] <= 1
 geodesic: - x[5] + x[7] + x[8] <= 1
 geodesic: - x[6] + x[8] + x[9] <= 1
 set_indep0: x[1] + x[4] + x[5] <= 1
 set_indep1: x[0] - 2 x[1] + x[2] + x[6] <= 1
 set_indep1: x[1] - 2 x[2] + x[3] + x[7] <= 1
 set_indep1: x[2] - 2 x[3] + x[4] + x[8] <= 1
 set_indep1: x[0] + x[3] - 2 x[4] + x[9] <= 1
 set_indep1: x[0] - 2 x[5] + x[7] + x[8] <= 1
 set_indep1: x[1] - 2 x[6] + x[8] + x[9] <= 1
 set_indep1: x[2] + x[5] - 2 x[7] + x[9] <= 1
 set_indep1: x[3] + x[5] + x[6] - 2 x[8] <= 1
 set_indep1: x[4] + x[6] + x[7] - 2 x[9] <= 1
Bounds
Binaries
 x[0] x[1] x[2] x[3] x[4] x[5] x[6] x[7] x[8] x[9]
End
