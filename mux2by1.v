/* mux2by1.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

module mux2by1(out, s, ins);
  output out;
  input s;
  input [1:0] ins;
  // Expands to 2 ANDS, 1 OR, and 2 NOTS (for a total of 8 inputs)
  `MUX2BY1
  assign out = ins[s];
endmodule