/* ALU.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

`include "AdderSubtractor.v"
`include "XOR_32.v"
`include "Shifter.v"
`include "MegaMuxOfDestiny.v"

module ALU(out, Zero, Overflow, Cout, A, B, Ctl);
  output [31:0] out;
  output Zero, Overflow, Cout;
  input [31:0] A, B;
  input [2:0] Ctl;
  
  wire [31:0] out_AS;
  wire [31:0] out_XOR;
  wire [31:0] out_Shift;
  
  // ADD SUB SLT
  AdderSubtractor AdderSubtractor_0(out_AS, Zero, Overflow, Cout, A, B, Ctl[0], Ctl[1]);
  // XOR
  XOR_32 XOR_32_0(out_XOR, A, B);
  // SLLV SRAV SRLV
  Shifter Shifter_0(out_Shift, A, B, Ctl[0], Ctl[1]);
  
  // ADD SUB XOR SLT MUL SLLV SRAV SRLV
  MegaMuxOfDestiny megamux(out, Ctl, out_AS, out_AS, out_XOR, out_AS, out, out_Shift, out_Shift, out_Shift);
  
endmodule