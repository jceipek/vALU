/* MegaMuxOfDestiny.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

`define AND and #20
`define OR or #20
`define NOT not #20

module MegaMuxOfDestiny(out, ctl, In0, In1, In2, In3, In4);
  output [31:0] out;
  input [2:0] ctl;
  input [31:0] In0, In1, In2, In3, In4;
  wire [31:0] O0, O1, O2, O3, O4;
  
  mux5by1 myMux0(O[0],S,I0[0],I1[0],I2[0],I3[0],I4[0]);
  mux5by1 myMux1(O[1],S,I0[1],I1[1],I2[1],I3[1],I4[1]);
  mux5by1 myMux2(O[2],S,I0[2],I1[2],I2[2],I3[2],I4[2]);
  mux5by1 myMux3(O[3],S,I0[3],I1[3],I2[3],I3[3],I4[3]);
  mux5by1 myMux4(O[4],S,I0[4],I1[4],I2[4],I3[4],I4[4]);
  mux5by1 myMux5(O[5],S,I0[5],I1[5],I2[5],I3[5],I4[5]);
  mux5by1 myMux6(O[6],S,I0[6],I1[6],I2[6],I3[6],I4[6]);
  mux5by1 myMux7(O[7],S,I0[7],I1[7],I2[7],I3[7],I4[7]);
  mux5by1 myMux8(O[8],S,I0[8],I1[8],I2[8],I3[8],I4[8]);
  mux5by1 myMux9(O[9],S,I0[9],I1[9],I2[9],I3[9],I4[9]);
  mux5by1 myMux10(O[10],S,I0[10],I1[10],I2[10],I3[10],I4[10]);
  mux5by1 myMux11(O[11],S,I0[11],I1[11],I2[11],I3[11],I4[11]);
  mux5by1 myMux12(O[12],S,I0[12],I1[12],I2[12],I3[12],I4[12]);
  mux5by1 myMux13(O[13],S,I0[13],I1[13],I2[13],I3[13],I4[13]);
  mux5by1 myMux14(O[14],S,I0[14],I1[14],I2[14],I3[14],I4[14]);
  mux5by1 myMux15(O[15],S,I0[15],I1[15],I2[15],I3[15],I4[15]);
  mux5by1 myMux16(O[16],S,I0[16],I1[16],I2[16],I3[16],I4[16]);
  mux5by1 myMux17(O[17],S,I0[17],I1[17],I2[17],I3[17],I4[17]);
  mux5by1 myMux18(O[18],S,I0[18],I1[18],I2[18],I3[18],I4[18]);
  mux5by1 myMux19(O[19],S,I0[19],I1[19],I2[19],I3[19],I4[19]);
  mux5by1 myMux20(O[20],S,I0[20],I1[20],I2[20],I3[20],I4[20]);
  mux5by1 myMux21(O[21],S,I0[21],I1[21],I2[21],I3[21],I4[21]);
  mux5by1 myMux22(O[22],S,I0[22],I1[22],I2[22],I3[22],I4[22]);
  mux5by1 myMux23(O[23],S,I0[23],I1[23],I2[23],I3[23],I4[23]);
  mux5by1 myMux24(O[24],S,I0[24],I1[24],I2[24],I3[24],I4[24]);
  mux5by1 myMux25(O[25],S,I0[25],I1[25],I2[25],I3[25],I4[25]);
  mux5by1 myMux26(O[26],S,I0[26],I1[26],I2[26],I3[26],I4[26]);
  mux5by1 myMux27(O[27],S,I0[27],I1[27],I2[27],I3[27],I4[27]);
  mux5by1 myMux28(O[28],S,I0[28],I1[28],I2[28],I3[28],I4[28]);
  mux5by1 myMux29(O[29],S,I0[29],I1[29],I2[29],I3[29],I4[29]);
  mux5by1 myMux30(O[30],S,I0[30],I1[30],I2[30],I3[30],I4[30]);
  mux5by1 myMux31(O[31],S,I0[31],I1[31],I2[31],I3[31],I4[31]);
  
  // Python code to make above lines:     
  //  for i in range (0,32):
  //    print ("  mux5by1 myMux"+str(i)+"(O["+str(i)+"],S,I0["+str(i)+"],I1["+str(i)+"],I2["+str(i)+"],I3["+str(i)+"],I4["+str(i)+"]);")

endmodule

module mux5by1(out, s, Ins);
  output out;
  input [3:0] s;
  input [4:0] Ins;
  assign out = ins[s];
endmodule