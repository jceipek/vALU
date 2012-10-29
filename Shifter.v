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
  
  // 32layers of 2by1 mux to left/right flip A or not left/right flip A based on ctl1 -> Apre0
  
  // 32layers of 2by1 mux to shift Apre0 by 1 based on B[0] -> Apre1
  // 2by1 mux on Apre1[31] to decide whether we sign extend or not based on ctl0 -> Apre1[31]
  
  // 32layers of 2by1 mux to shift Apre1 by 2 based on B[1] -> Apre2
  // 2by1 mux on Apre2[31] to decide whether we sign extend or not based on ctl0 -> Apre2[31:30]
  
  // 32layers of 2by1 mux to shift Apre2 by 4 based on B[2] -> Apre3
  // 2by1 mux on Apre3[31] to decide whether we sign extend or not based on ctl0 -> Apre3[31:28]
  
  // 32layers of 2by1 mux to shift Apre3 by 8 based on B[3] -> Apre4
  // 2by1 mux on Apre4[31] to decide whether we sign extend or not based on ctl0 -> Apre4[31:24]
  
  // 32layers of 2by1 mux to shift Apre4 by 16 based on B[4] -> Apreout
  // 2by1 mux on Apreout[31] to decide whether we sign extend or not based on ctl0 -> Apreout[31:16]
  
  // 32layers of 2by1 mux to left/right flip Apreout or not left/right flip Apreout based on ctl1 -> out
  
endmodule