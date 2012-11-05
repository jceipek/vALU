/* mux32layers2by1.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

`include "gateConstants.v"
`include "mux2by1.v"

module mux32layers2by1(out, ctl, I1, I0);
  output [31:0] out;
  input ctl;
  input [31:0] I0, I1;

  mux2by1 lilMux0(out[0],ctl,{I0[0],I1[0]});
  mux2by1 lilMux1(out[1],ctl,{I0[1],I1[1]});
  mux2by1 lilMux2(out[2],ctl,{I0[2],I1[2]});
  mux2by1 lilMux3(out[3],ctl,{I0[3],I1[3]});
  mux2by1 lilMux4(out[4],ctl,{I0[4],I1[4]});
  mux2by1 lilMux5(out[5],ctl,{I0[5],I1[5]});
  mux2by1 lilMux6(out[6],ctl,{I0[6],I1[6]});
  mux2by1 lilMux7(out[7],ctl,{I0[7],I1[7]});
  mux2by1 lilMux8(out[8],ctl,{I0[8],I1[8]});
  mux2by1 lilMux9(out[9],ctl,{I0[9],I1[9]});
  mux2by1 lilMux10(out[10],ctl,{I0[10],I1[10]});
  mux2by1 lilMux11(out[11],ctl,{I0[11],I1[11]});
  mux2by1 lilMux12(out[12],ctl,{I0[12],I1[12]});
  mux2by1 lilMux13(out[13],ctl,{I0[13],I1[13]});
  mux2by1 lilMux14(out[14],ctl,{I0[14],I1[14]});
  mux2by1 lilMux15(out[15],ctl,{I0[15],I1[15]});
  mux2by1 lilMux16(out[16],ctl,{I0[16],I1[16]});
  mux2by1 lilMux17(out[17],ctl,{I0[17],I1[17]});
  mux2by1 lilMux18(out[18],ctl,{I0[18],I1[18]});
  mux2by1 lilMux19(out[19],ctl,{I0[19],I1[19]});
  mux2by1 lilMux20(out[20],ctl,{I0[20],I1[20]});
  mux2by1 lilMux21(out[21],ctl,{I0[21],I1[21]});
  mux2by1 lilMux22(out[22],ctl,{I0[22],I1[22]});
  mux2by1 lilMux23(out[23],ctl,{I0[23],I1[23]});
  mux2by1 lilMux24(out[24],ctl,{I0[24],I1[24]});
  mux2by1 lilMux25(out[25],ctl,{I0[25],I1[25]});
  mux2by1 lilMux26(out[26],ctl,{I0[26],I1[26]});
  mux2by1 lilMux27(out[27],ctl,{I0[27],I1[27]});
  mux2by1 lilMux28(out[28],ctl,{I0[28],I1[28]});
  mux2by1 lilMux29(out[29],ctl,{I0[29],I1[29]});
  mux2by1 lilMux30(out[30],ctl,{I0[30],I1[30]});
  mux2by1 lilMux31(out[31],ctl,{I0[31],I1[31]});

  // Python code to make above lines:
  //  for i in range (0,32):
  //    print ("  mux2by1 lilMux"+str(i)+"(out["+str(i)+"],ctl,{I0["+str(i)+"],I1["+str(i)+"]});")

endmodule