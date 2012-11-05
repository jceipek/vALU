include "TestConstants.v"

/* AdderSubtractor.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

/* module AdderSubtractor
outputs out as a 32-bit result that is either the addition of A and B,
  the subtraction of B from A, or the SLT of B from A
input A is a 32-bit number
input B is a 32-bit number
input control ctl0 is 1 if SUB/SLT 0 if ADD
input control ctl1 is 1 if SLT 0 if ADD/SUB */

module AdderSubtractor(out, Zero, Overflow, Cout, A, B, ctl0, ctl1);
  output [31:0] out;
  output Zero, Overflow, Cout;
  input [31:0] A, B;
  input ctl0, ctl1;
  
  wire [31:0] notB;
  wire [31:0] Bmuxed;
  wire [31:0] ABadded;
  wire [31:0] ABaddedMSB;
  
  // flip B and mux between B or notB depending on ctl0: (0) ADD or (1) SUB/SLT
  not32 not32_0(notB, B);
  mux32layers2by1 muxBnotB(Bmuxed, ctl0, B, notB);
  
  // add A with Bmuxed and a carry of ctl0
  add32 add32_0(ABadded, Cout, A, Bmuxed, ctl0);
  
  // mux between ABadded or the MSB of ABadded depending on ctl1: (0) ADD/SUB or (1) SLT
  assign ABaddedMSB[0] = ABadded[31];
  mux32layers2by1 muxABaddedMSB(out, ctl1, ABadded, ABaddedMSB);
    
endmodule

/* Python generator

for i in range(31,-1,-1):
	s = "  `NOT not_"
	s += str(i)
	s += " (out["
	s += str(i)
	s += "], in["
	s += str(i)
	s += "]);"
	print s

*/

module not32(out, in);
  output [31:0] out;
  input [31:0] in;
  
  `NOT not_31 (out[31], in[31]);
  `NOT not_30 (out[30], in[30]);
  `NOT not_29 (out[29], in[29]);
  `NOT not_28 (out[28], in[28]);
  `NOT not_27 (out[27], in[27]);
  `NOT not_26 (out[26], in[26]);
  `NOT not_25 (out[25], in[25]);
  `NOT not_24 (out[24], in[24]);
  `NOT not_23 (out[23], in[23]);
  `NOT not_22 (out[22], in[22]);
  `NOT not_21 (out[21], in[21]);
  `NOT not_20 (out[20], in[20]);
  `NOT not_19 (out[19], in[19]);
  `NOT not_18 (out[18], in[18]);
  `NOT not_17 (out[17], in[17]);
  `NOT not_16 (out[16], in[16]);
  `NOT not_15 (out[15], in[15]);
  `NOT not_14 (out[14], in[14]);
  `NOT not_13 (out[13], in[13]);
  `NOT not_12 (out[12], in[12]);
  `NOT not_11 (out[11], in[11]);
  `NOT not_10 (out[10], in[10]);
  `NOT not_9 (out[9], in[9]);
  `NOT not_8 (out[8], in[8]);
  `NOT not_7 (out[7], in[7]);
  `NOT not_6 (out[6], in[6]);
  `NOT not_5 (out[5], in[5]);
  `NOT not_4 (out[4], in[4]);
  `NOT not_3 (out[3], in[3]);
  `NOT not_2 (out[2], in[2]);
  `NOT not_1 (out[1], in[1]);
  `NOT not_0 (out[0], in[0]);
  
endmodule

module add32(out, Cout, A, B, Cin);
  output [31:0] out;
  output Cout;
  input [31:0] A, B;
  input Cin;
  
  wire [30:0] Ctemp;
  
  // 32-bit full adder
  add1 add1_0(out[0], Ctemp[0], A[0], B[0], Cin);
  add1 add1_1(out[1], Ctemp[1], A[1], B[1], Ctemp[0]);
  add1 add1_2(out[2], Ctemp[2], A[2], B[2], Ctemp[1]);
  add1 add1_3(out[3], Ctemp[3], A[3], B[3], Ctemp[2]);
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
  
  `XOR xor_0 (out, Cin, A, B);
  `AND and_0 (andOut0, A, B);
  `OR or_0 (orOut, A, B);
  `AND and_1 (andOut1, orOut, Cin);
  `OR or_1 (Cout, andOut1, andOut0);
  
endmodule