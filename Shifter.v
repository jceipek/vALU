/* Shifter.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

/* module Shifter
outputs out as a 32-bit result after shifting
input A is a 32-bit entry that gets shifted
input B is a 32-bit number, but we only care about the lowest
  5 bits and it determines the number of shifts we do
input control ctl0 is 1 if logical shift, 0 if arithmetic shift
input control ctl1 is 1 if right shift, 0 if left shift

worst-case delay = 7 * delay of MUX32LAYRES2BY1 = 7 * 50 = 350 */

`include "gateConstants.v"
`include "MUX32LAYERS2BY1.v"

module Shifter(out, A, B, ctl0, ctl1);
  output [31:0] out;
  input [31:0] A, B;
  input ctl0;
  input ctl1;

  wire [31:0] Aleftflipped;
  wire [31:0] Apreoutleftflipped;

  wire [31:0] Apre0;
  wire [31:0] Apre1;
  wire [31:0] Apre2;
  wire [31:0] Apre3;
  wire [31:0] Apre4;
  wire [31:0] Apreout;

  wire Apre0ext;
  wire [1:0] Apre1ext;
  wire [3:0] Apre2ext;
  wire [7:0] Apre3ext;
  wire [15:0] Apre4ext;

  wire low = 0;

  /* Python
   for i in range(32): print "  assign Aleftflipped[" + str(i) + "] = A[" + str(31-i) + "];"
  */

  // left-right flip A
  assign Aleftflipped[0] = A[31];
  assign Aleftflipped[1] = A[30];
  assign Aleftflipped[2] = A[29];
  assign Aleftflipped[3] = A[28];
  assign Aleftflipped[4] = A[27];
  assign Aleftflipped[5] = A[26];
  assign Aleftflipped[6] = A[25];
  assign Aleftflipped[7] = A[24];
  assign Aleftflipped[8] = A[23];
  assign Aleftflipped[9] = A[22];
  assign Aleftflipped[10] = A[21];
  assign Aleftflipped[11] = A[20];
  assign Aleftflipped[12] = A[19];
  assign Aleftflipped[13] = A[18];
  assign Aleftflipped[14] = A[17];
  assign Aleftflipped[15] = A[16];
  assign Aleftflipped[16] = A[15];
  assign Aleftflipped[17] = A[14];
  assign Aleftflipped[18] = A[13];
  assign Aleftflipped[19] = A[12];
  assign Aleftflipped[20] = A[11];
  assign Aleftflipped[21] = A[10];
  assign Aleftflipped[22] = A[9];
  assign Aleftflipped[23] = A[8];
  assign Aleftflipped[24] = A[7];
  assign Aleftflipped[25] = A[6];
  assign Aleftflipped[26] = A[5];
  assign Aleftflipped[27] = A[4];
  assign Aleftflipped[28] = A[3];
  assign Aleftflipped[29] = A[2];
  assign Aleftflipped[30] = A[1];
  assign Aleftflipped[31] = A[0];

  // MUX32LAYERS2BY1 to left/right flip A or not left/right flip A based on ctl1 -> Apre0
  MUX32LAYERS2BY1 muxInit(Apre0, ctl1, Aleftflipped, A);

  // FROM THIS POINT ON ALWAYS SHIFT RIGHT
  // extra bits not sign-extended (1: logical shift) or sign-extended (0: arithmetic shift)
  `MUX2BY1 muxPre0(Apre0ext, ctl0, {low, A[31]});
  // MUX32LAYERS2BY1 to shift Apre0 by 1 based on B[0] -> Apre1
  MUX32LAYERS2BY1 mux0(Apre1, B[0], Apre0, {Apre0ext, Apre0[31:1]});

  // extra bits not sign-extended (1: logical shift) or sign-extended (0: arithmetic shift)
  `MUX2BY1 muxPre1a(Apre1ext[0], ctl0, {low, A[31]});
  `MUX2BY1 muxPre1b(Apre1ext[1], ctl0, {low, A[31]});
  // MUX32LAYERS2BY1 to shift Apre1 by 2 based on B[1] -> Apre2
  MUX32LAYERS2BY1 mux1(Apre2, B[1], Apre1, {Apre1ext[1:0], Apre1[31:2]});

  // extra bits not sign-extended (1: logical shift) or sign-extended (0: arithmetic shift)
  `MUX2BY1 muxPre2a(Apre2ext[0], ctl0, {low, A[31]});
  `MUX2BY1 muxPre2b(Apre2ext[1], ctl0, {low, A[31]});
  `MUX2BY1 muxPre2c(Apre2ext[2], ctl0, {low, A[31]});
  `MUX2BY1 muxPre2d(Apre2ext[3], ctl0, {low, A[31]});
  // MUX32LAYERS2BY1 to shift Apre2 by 4 based on B[2] -> Apre3
  MUX32LAYERS2BY1 mux2(Apre3, B[2], Apre2, {Apre2ext[3:0], Apre2[31:4]});

  // extra bits not sign-extended (1: logical shift) or sign-extended (0: arithmetic shift)
  `MUX2BY1 muxPre3a(Apre3ext[0], ctl0, {low, A[31]});
  `MUX2BY1 muxPre3b(Apre3ext[1], ctl0, {low, A[31]});
  `MUX2BY1 muxPre3c(Apre3ext[2], ctl0, {low, A[31]});
  `MUX2BY1 muxPre3d(Apre3ext[3], ctl0, {low, A[31]});
  `MUX2BY1 muxPre3e(Apre3ext[4], ctl0, {low, A[31]});
  `MUX2BY1 muxPre3f(Apre3ext[5], ctl0, {low, A[31]});
  `MUX2BY1 muxPre3g(Apre3ext[6], ctl0, {low, A[31]});
  `MUX2BY1 muxPre3h(Apre3ext[7], ctl0, {low, A[31]});
  // MUX32LAYERS2BY1 to shift Apre3 by 8 based on B[3] -> Apre4
  MUX32LAYERS2BY1 mux3(Apre4, B[3], Apre3, {Apre3ext[7:0], Apre3[31:8]});

  // extra bits not sign-extended (1: logical shift) or sign-extended (0: arithmetic shift)
  `MUX2BY1 muxPre4a(Apre4ext[0], ctl0, {low, A[31]});
  `MUX2BY1 muxPre4b(Apre4ext[1], ctl0, {low, A[31]});
  `MUX2BY1 muxPre4c(Apre4ext[2], ctl0, {low, A[31]});
  `MUX2BY1 muxPre4d(Apre4ext[3], ctl0, {low, A[31]});
  `MUX2BY1 muxPre4e(Apre4ext[4], ctl0, {low, A[31]});
  `MUX2BY1 muxPre4f(Apre4ext[5], ctl0, {low, A[31]});
  `MUX2BY1 muxPre4g(Apre4ext[6], ctl0, {low, A[31]});
  `MUX2BY1 muxPre4h(Apre4ext[7], ctl0, {low, A[31]});
  `MUX2BY1 muxPre4i(Apre4ext[8], ctl0, {low, A[31]});
  `MUX2BY1 muxPre4j(Apre4ext[9], ctl0, {low, A[31]});
  `MUX2BY1 muxPre4k(Apre4ext[10], ctl0, {low, A[31]});
  `MUX2BY1 muxPre4l(Apre4ext[11], ctl0, {low, A[31]});
  `MUX2BY1 muxPre4m(Apre4ext[12], ctl0, {low, A[31]});
  `MUX2BY1 muxPre4n(Apre4ext[13], ctl0, {low, A[31]});
  `MUX2BY1 muxPre4o(Apre4ext[14], ctl0, {low, A[31]});
  `MUX2BY1 muxPre4p(Apre4ext[15], ctl0, {low, A[31]});
  // MUX32LAYERS2BY1 to shift Apre4 by 16 based on B[4] -> Apreout
  MUX32LAYERS2BY1 mux4(Apreout, B[4], Apre4, {Apre4ext[15:0], Apre4[31:16]});

  // left-right flip Apreout
  assign Apreoutleftflipped[0] = Apreout[31];
  assign Apreoutleftflipped[1] = Apreout[30];
  assign Apreoutleftflipped[2] = Apreout[29];
  assign Apreoutleftflipped[3] = Apreout[28];
  assign Apreoutleftflipped[4] = Apreout[27];
  assign Apreoutleftflipped[5] = Apreout[26];
  assign Apreoutleftflipped[6] = Apreout[25];
  assign Apreoutleftflipped[7] = Apreout[24];
  assign Apreoutleftflipped[8] = Apreout[23];
  assign Apreoutleftflipped[9] = Apreout[22];
  assign Apreoutleftflipped[10] = Apreout[21];
  assign Apreoutleftflipped[11] = Apreout[20];
  assign Apreoutleftflipped[12] = Apreout[19];
  assign Apreoutleftflipped[13] = Apreout[18];
  assign Apreoutleftflipped[14] = Apreout[17];
  assign Apreoutleftflipped[15] = Apreout[16];
  assign Apreoutleftflipped[16] = Apreout[15];
  assign Apreoutleftflipped[17] = Apreout[14];
  assign Apreoutleftflipped[18] = Apreout[13];
  assign Apreoutleftflipped[19] = Apreout[12];
  assign Apreoutleftflipped[20] = Apreout[11];
  assign Apreoutleftflipped[21] = Apreout[10];
  assign Apreoutleftflipped[22] = Apreout[9];
  assign Apreoutleftflipped[23] = Apreout[8];
  assign Apreoutleftflipped[24] = Apreout[7];
  assign Apreoutleftflipped[25] = Apreout[6];
  assign Apreoutleftflipped[26] = Apreout[5];
  assign Apreoutleftflipped[27] = Apreout[4];
  assign Apreoutleftflipped[28] = Apreout[3];
  assign Apreoutleftflipped[29] = Apreout[2];
  assign Apreoutleftflipped[30] = Apreout[1];
  assign Apreoutleftflipped[31] = Apreout[0];

  // MUX32LAYERS2BY1 to left/right flip Apreout or not left/right flip Apreout based on ctl1 -> out
  MUX32LAYERS2BY1 muxFinal(out, ctl1, Apreoutleftflipped, Apreout);

endmodule