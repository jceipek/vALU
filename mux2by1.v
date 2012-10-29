module mux2by1(out, s, ins);
  output out;
  input s;
  input [1:0] ins;
  assign out = ins[s];
endmodule