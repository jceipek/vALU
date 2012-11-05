/* AdderSubtractor.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

module AdderSubtractor(out, A, B, ctl0, ctl1);
  output [31:0] out;
  input [31:0] A, B;
  input ctl0, ctl1;
  
  wire [31:0] notB;
  wire [31:0] Bmuxed;
  wire [31:0] ABadded;
  wire [31:0] ABaddedMSB;
  
  // flip B and mux between B or notB depending on ctl0: (0) ADD or (1) SUB/SLT
  not(notB, B);
  mux32layers2by1 muxBnotB(Bmuxed, ctl0, B, notB);
  
  // add A with Bmuxed and a carry of ctl0
  add32 _add32(ABadded, A, Bmuxed, ctl0);
  
  // mux between ABadded or the MSB of ABadded depending on ctl1: (0) ADD/SUB or (1) SLT
  assign ABaddedMSB = 0;
  ABaddedMSB[0] = ABadded[31];
  mux32layers2by1 muxABaddedMSB(out, ctl1, ABadded, ABaddedMSB);
    
endmodule

module add32(out, Cout, A, B, Cin);
  output [31:0] out;
  output Cout;
  input [31:0] A, B;
  input Cin;
  
  wire [30:0] Ctemp;
  
  // 32-bit full adder
  add1 add0(out[0], Ctemp[0], A[0], B[0], Cin);
  add1 add1(out[1], Ctemp[1], A[1], B[1], Ctemp[0]);
  add1 add2(out[2], Ctemp[2], A[2], B[2], Ctemp[1]);
  add1 add3(out[3], Ctemp[3], A[3], B[3], Ctemp[2]);
  /*
  .
  .
  .
  */

endmodule
  
module add1(out, Cout, A, B, Cin);
  output out, Cout;
  input A, B, Cin;
  
  wire andOut0, andOut1, orOut;
  
  `XOR xorGate(out, Cin, A, B);
  `AND andGate0(andOut0, A, B);
  `OR orGate0(orOut, A, B);
  `AND andGate1(andOut1, orOut, Cin);
  `OR orGate1(Cout, andOut1, andOut0);
  
endmodule