
module MegaMuxOfDestiny(out, s, ins);
  output out;
  input [2:0] s;
  input [32:0] ins;
  assign out = ins[s];
endmodule