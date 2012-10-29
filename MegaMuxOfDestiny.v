/* MegaMuxOfDestiny.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

module MegaMuxOfDestiny(out, s, ins);
  output [31:0] out;
  input [2:0] s;
  input [31:0] ins;
  assign out = ins[s];
endmodule