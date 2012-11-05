/* testMegaMux.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

`include "testConstants.v"

module testMegaMux();
  reg clk;
  reg [31:0] I0,I1,I2,I3,I4;
  reg [3:0] S;
  wire [31:0] O;

  MegaMuxOfDestiny mega01(O,S,I0,I1,I2,I3,I4);
  initial begin
      I0 = 2**0;
      I1 = 2**1;
      I2 = 2**2;
      I3 = 2**3;
      I4 = 2**4;
  end

  initial begin

    S = 000;
    if (O !== I0) begin
      `FAIL;
    end
    `CLK;
  end
  
endmodule