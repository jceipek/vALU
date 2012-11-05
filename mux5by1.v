/* mux5by1.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

module mux5by1(out, s, Ins);
  output out;
  input [3:0] s;
  input [4:0] Ins;
  assign out = Ins[s];
endmodule