/* mux5by1.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

`include "gateConstants.v"

module mux5by1(out, s, Ins);
  output out;
  input [3:0] s;
  input [4:0] Ins;
  assign #`MUX5BY1_DELAY out = Ins[s];
endmodule