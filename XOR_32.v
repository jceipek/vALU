/* XOR_32.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

/* Python generator

for i in range(31,-1,-1):
	s = "  xor(out["
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
  
  xor(out[31], A[31], B[31]);
  xor(out[30], A[30], B[30]);
  xor(out[29], A[29], B[29]);
  xor(out[28], A[28], B[28]);
  xor(out[27], A[27], B[27]);
  xor(out[26], A[26], B[26]);
  xor(out[25], A[25], B[25]);
  xor(out[24], A[24], B[24]);
  xor(out[23], A[23], B[23]);
  xor(out[22], A[22], B[22]);
  xor(out[21], A[21], B[21]);
  xor(out[20], A[20], B[20]);
  xor(out[19], A[19], B[19]);
  xor(out[18], A[18], B[18]);
  xor(out[17], A[17], B[17]);
  xor(out[16], A[16], B[16]);
  xor(out[15], A[15], B[15]);
  xor(out[14], A[14], B[14]);
  xor(out[13], A[13], B[13]);
  xor(out[12], A[12], B[12]);
  xor(out[11], A[11], B[11]);
  xor(out[10], A[10], B[10]);
  xor(out[9], A[9], B[9]);
  xor(out[8], A[8], B[8]);
  xor(out[7], A[7], B[7]);
  xor(out[6], A[6], B[6]);
  xor(out[5], A[5], B[5]);
  xor(out[4], A[4], B[4]);
  xor(out[3], A[3], B[3]);
  xor(out[2], A[2], B[2]);
  xor(out[1], A[1], B[1]);
  xor(out[0], A[0], B[0]);
  
endmodule