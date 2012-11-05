`include "testConstants.v"

/* XOR_32.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

/* Python generator

for i in range(31,-1,-1):
	s = "  `XOR xor_"
	s += str(i)
	s += " (out["
	s += str(i)
	s += "], A["
	s += str(i)
	s += "], B["
	s += str(i)
	s += "]);"
	print s

*/

module XOR_32(out, A, B);
  output [31:0] out;
  input [31:0] A, B;

  `XOR xor_31 (out[31], A[31], B[31]);
  `XOR xor_30 (out[30], A[30], B[30]);
  `XOR xor_29 (out[29], A[29], B[29]);
  `XOR xor_28 (out[28], A[28], B[28]);
  `XOR xor_27 (out[27], A[27], B[27]);
  `XOR xor_26 (out[26], A[26], B[26]);
  `XOR xor_25 (out[25], A[25], B[25]);
  `XOR xor_24 (out[24], A[24], B[24]);
  `XOR xor_23 (out[23], A[23], B[23]);
  `XOR xor_22 (out[22], A[22], B[22]);
  `XOR xor_21 (out[21], A[21], B[21]);
  `XOR xor_20 (out[20], A[20], B[20]);
  `XOR xor_19 (out[19], A[19], B[19]);
  `XOR xor_18 (out[18], A[18], B[18]);
  `XOR xor_17 (out[17], A[17], B[17]);
  `XOR xor_16 (out[16], A[16], B[16]);
  `XOR xor_15 (out[15], A[15], B[15]);
  `XOR xor_14 (out[14], A[14], B[14]);
  `XOR xor_13 (out[13], A[13], B[13]);
  `XOR xor_12 (out[12], A[12], B[12]);
  `XOR xor_11 (out[11], A[11], B[11]);
  `XOR xor_10 (out[10], A[10], B[10]);
  `XOR xor_9 (out[9], A[9], B[9]);
  `XOR xor_8 (out[8], A[8], B[8]);
  `XOR xor_7 (out[7], A[7], B[7]);
  `XOR xor_6 (out[6], A[6], B[6]);
  `XOR xor_5 (out[5], A[5], B[5]);
  `XOR xor_4 (out[4], A[4], B[4]);
  `XOR xor_3 (out[3], A[3], B[3]);
  `XOR xor_2 (out[2], A[2], B[2]);
  `XOR xor_1 (out[1], A[1], B[1]);
  `XOR xor_0 (out[0], A[0], B[0]);

endmodule