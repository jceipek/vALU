/* mux2by1.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

`include "gateConstants.v"

module mux2by1(out, s, ins);
  output out;
  input s;
  input [1:0] ins;
  assign #50 out = ins[s];
endmodule