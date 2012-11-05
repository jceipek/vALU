/* MegaMuxOfDestiny.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

`include "gateConstants.v"
`include "mux5by1.v"

module MegaMuxOfDestiny(out, ctl, I7, I6, I5, I4, I3, I2, I1, I0);
  output [31:0] out;
  input [2:0] ctl;
  input [31:0] I0, I1, I2, I3, I4, I5, I6, I7;

', '.join(["I%i"%j for j in range(8)])

  /* # PYTHON GENERATOR
  for i in range(32):
    print "`MUX8BY1 myMux%s(out[%s], ctl, {%s});" % (i,i,', '.join(["I%s[%s]"%(j,i) for j in range(8)]))
  */

  `MUX8BY1 myMux0 (out[0] , ctl, {I0[0] , I1[0] , I2[0] , I3[0] , I4[0] , I5[0] , I6[0] , I7[0] });
  `MUX8BY1 myMux1 (out[1] , ctl, {I0[1] , I1[1] , I2[1] , I3[1] , I4[1] , I5[1] , I6[1] , I7[1] });
  `MUX8BY1 myMux2 (out[2] , ctl, {I0[2] , I1[2] , I2[2] , I3[2] , I4[2] , I5[2] , I6[2] , I7[2] });
  `MUX8BY1 myMux3 (out[3] , ctl, {I0[3] , I1[3] , I2[3] , I3[3] , I4[3] , I5[3] , I6[3] , I7[3] });
  `MUX8BY1 myMux4 (out[4] , ctl, {I0[4] , I1[4] , I2[4] , I3[4] , I4[4] , I5[4] , I6[4] , I7[4] });
  `MUX8BY1 myMux5 (out[5] , ctl, {I0[5] , I1[5] , I2[5] , I3[5] , I4[5] , I5[5] , I6[5] , I7[5] });
  `MUX8BY1 myMux6 (out[6] , ctl, {I0[6] , I1[6] , I2[6] , I3[6] , I4[6] , I5[6] , I6[6] , I7[6] });
  `MUX8BY1 myMux7 (out[7] , ctl, {I0[7] , I1[7] , I2[7] , I3[7] , I4[7] , I5[7] , I6[7] , I7[7] });
  `MUX8BY1 myMux8 (out[8] , ctl, {I0[8] , I1[8] , I2[8] , I3[8] , I4[8] , I5[8] , I6[8] , I7[8] });
  `MUX8BY1 myMux9 (out[9] , ctl, {I0[9] , I1[9] , I2[9] , I3[9] , I4[9] , I5[9] , I6[9] , I7[9] });
  `MUX8BY1 myMux10(out[10], ctl, {I0[10], I1[10], I2[10], I3[10], I4[10], I5[10], I6[10], I7[10]});
  `MUX8BY1 myMux11(out[11], ctl, {I0[11], I1[11], I2[11], I3[11], I4[11], I5[11], I6[11], I7[11]});
  `MUX8BY1 myMux12(out[12], ctl, {I0[12], I1[12], I2[12], I3[12], I4[12], I5[12], I6[12], I7[12]});
  `MUX8BY1 myMux13(out[13], ctl, {I0[13], I1[13], I2[13], I3[13], I4[13], I5[13], I6[13], I7[13]});
  `MUX8BY1 myMux14(out[14], ctl, {I0[14], I1[14], I2[14], I3[14], I4[14], I5[14], I6[14], I7[14]});
  `MUX8BY1 myMux15(out[15], ctl, {I0[15], I1[15], I2[15], I3[15], I4[15], I5[15], I6[15], I7[15]});
  `MUX8BY1 myMux16(out[16], ctl, {I0[16], I1[16], I2[16], I3[16], I4[16], I5[16], I6[16], I7[16]});
  `MUX8BY1 myMux17(out[17], ctl, {I0[17], I1[17], I2[17], I3[17], I4[17], I5[17], I6[17], I7[17]});
  `MUX8BY1 myMux18(out[18], ctl, {I0[18], I1[18], I2[18], I3[18], I4[18], I5[18], I6[18], I7[18]});
  `MUX8BY1 myMux19(out[19], ctl, {I0[19], I1[19], I2[19], I3[19], I4[19], I5[19], I6[19], I7[19]});
  `MUX8BY1 myMux20(out[20], ctl, {I0[20], I1[20], I2[20], I3[20], I4[20], I5[20], I6[20], I7[20]});
  `MUX8BY1 myMux21(out[21], ctl, {I0[21], I1[21], I2[21], I3[21], I4[21], I5[21], I6[21], I7[21]});
  `MUX8BY1 myMux22(out[22], ctl, {I0[22], I1[22], I2[22], I3[22], I4[22], I5[22], I6[22], I7[22]});
  `MUX8BY1 myMux23(out[23], ctl, {I0[23], I1[23], I2[23], I3[23], I4[23], I5[23], I6[23], I7[23]});
  `MUX8BY1 myMux24(out[24], ctl, {I0[24], I1[24], I2[24], I3[24], I4[24], I5[24], I6[24], I7[24]});
  `MUX8BY1 myMux25(out[25], ctl, {I0[25], I1[25], I2[25], I3[25], I4[25], I5[25], I6[25], I7[25]});
  `MUX8BY1 myMux26(out[26], ctl, {I0[26], I1[26], I2[26], I3[26], I4[26], I5[26], I6[26], I7[26]});
  `MUX8BY1 myMux27(out[27], ctl, {I0[27], I1[27], I2[27], I3[27], I4[27], I5[27], I6[27], I7[27]});
  `MUX8BY1 myMux28(out[28], ctl, {I0[28], I1[28], I2[28], I3[28], I4[28], I5[28], I6[28], I7[28]});
  `MUX8BY1 myMux29(out[29], ctl, {I0[29], I1[29], I2[29], I3[29], I4[29], I5[29], I6[29], I7[29]});
  `MUX8BY1 myMux30(out[30], ctl, {I0[30], I1[30], I2[30], I3[30], I4[30], I5[30], I6[30], I7[30]});
  `MUX8BY1 myMux31(out[31], ctl, {I0[31], I1[31], I2[31], I3[31], I4[31], I5[31], I6[31], I7[31]});

endmodule