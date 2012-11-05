
/* ALU.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

`include "testConstants.v"
`include "XOR_32.v"
`include "AdderSubtractor.v"
`include "XOR_32.v"
`include "Shifter.v"
`include "MegaMuxOfDestiny.v"


module ALU(out, Zero, Overflow, Cout, S, A, B);
  output [31:0] out;
  output Zero, Overflow, Cout;
  
  input [2:0] S;
  input [31:0] A, B;
  
  Shifter shiftBlock(shiftOut, A, B, S[0], S[1]);
  
  XOR_32 xorGate(XorOut, A, B);
  
  AdderSubtractor addBlock(SumDiffSLT, Zero, Overflow, Cout, A, B, S[0], S[1]);
  
  MegaMuxOfDestiny finalMux(out, S, SumDiffSLT, SumDiffSLT, XorOut, SumDiffSLT, shiftOut, shiftOut, shiftOut);
    
endmodule