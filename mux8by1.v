/* mux8by1.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

//`include "gateConstants.v"

module mux8by1(out, s, Ins);
  output out;
  input [3:0] s;
  input [4:0] Ins;
  assign #(150) out = Ins[s];
endmodule