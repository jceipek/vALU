include "mux2by1.v";

/* Shifter.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

module Shifter(out, A, B, ctl0, ctl1);
  output [31:0] out;
  input [31:0] A, B;
  input ctl0;
  input ctl1;
  
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
  
  // mux32layers2by1 to left/right flip A or not left/right flip A based on ctl1 -> Apre0

  mux2by1 muxPre0(Apre0ext, ctl0, {A[31], low});
  // mux32layers2by1 to shift Apre0 by 1 based on B[0] -> Apre1
  
  mux2by1 muxPre1a(Apre1ext[0], ctl0, {A[31], low});
  mux2by1 muxPre1b(Apre1ext[1], ctl0, {A[31], low});
  // mux32layers2by1 to shift Apre1 by 2 based on B[1] -> Apre2
  
  mux2by1 muxPre2a(Apre2ext[0], ctl0, {A[31], low});
  mux2by1 muxPre2b(Apre2ext[1], ctl0, {A[31], low});
  mux2by1 muxPre2c(Apre2ext[2], ctl0, {A[31], low});
  mux2by1 muxPre2d(Apre2ext[3], ctl0, {A[31], low});
  // mux32layers2by1 to shift Apre2 by 4 based on B[2] -> Apre3
  
  mux2by1 muxPre3a(Apre3ext[0], ctl0, {A[31], low});
  mux2by1 muxPre3b(Apre3ext[1], ctl0, {A[31], low});
  mux2by1 muxPre3c(Apre3ext[2], ctl0, {A[31], low});
  mux2by1 muxPre3d(Apre3ext[3], ctl0, {A[31], low});
  mux2by1 muxPre3e(Apre3ext[4], ctl0, {A[31], low});
  mux2by1 muxPre3f(Apre3ext[5], ctl0, {A[31], low});
  mux2by1 muxPre3g(Apre3ext[6], ctl0, {A[31], low});
  mux2by1 muxPre3h(Apre3ext[7], ctl0, {A[31], low});
  // mux32layers2by1 to shift Apre3 by 8 based on B[3] -> Apre4
  
  mux2by1 muxPre4a(Apre4ext[0], ctl0, {A[31], low});
  mux2by1 muxPre4b(Apre4ext[1], ctl0, {A[31], low});
  mux2by1 muxPre4c(Apre4ext[2], ctl0, {A[31], low});
  mux2by1 muxPre4d(Apre4ext[3], ctl0, {A[31], low});
  mux2by1 muxPre4e(Apre4ext[4], ctl0, {A[31], low});
  mux2by1 muxPre4f(Apre4ext[5], ctl0, {A[31], low});
  mux2by1 muxPre4g(Apre4ext[6], ctl0, {A[31], low});
  mux2by1 muxPre4h(Apre4ext[7], ctl0, {A[31], low});
  mux2by1 muxPre4i(Apre4ext[8], ctl0, {A[31], low});
  mux2by1 muxPre4j(Apre4ext[9], ctl0, {A[31], low});
  mux2by1 muxPre4k(Apre4ext[10], ctl0, {A[31], low});
  mux2by1 muxPre4l(Apre4ext[11], ctl0, {A[31], low});
  mux2by1 muxPre4m(Apre4ext[12], ctl0, {A[31], low});
  mux2by1 muxPre4n(Apre4ext[13], ctl0, {A[31], low});
  mux2by1 muxPre4o(Apre4ext[14], ctl0, {A[31], low});
  mux2by1 muxPre4p(Apre4ext[15], ctl0, {A[31], low});
  // mux32layers2by1 to shift Apre4 by 16 based on B[4] -> Apreout
  
  // mux32layers2by1 to left/right flip Apreout or not left/right flip Apreout based on ctl1 -> out
  
endmodule