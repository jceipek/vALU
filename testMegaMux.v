/* testMegaMux.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

`include "testConstants.v"
//`define FAIL $display("FAIL! time %d", $time)
//`define CLK #500
/* Sets each input I to be a unique value and tests to see if
each value of S selects the appropriate I */

module testMegaMux();
  reg [31:0] I0, I1, I2, I3, I4, I5, I6, I7;
  reg [2:0] S;
  wire [31:0] O;

  MegaMuxOfDestiny mega01(O, S, I0, I1, I2, I3, I4, I5, I6, I7);

  initial begin
    /* # PYTHON GENERATOR
      for s in range(8):
        print "I%s = 2**%s;" % ((s,)*2)
    */

    // Set each I to be a unique value between 'b00000001 and 'b10000000
    I0 = 2**0;
    I1 = 2**1;
    I2 = 2**2;
    I3 = 2**3;
    I4 = 2**4;
    I5 = 2**5;
    I6 = 2**6;
    I7 = 2**7;

    /* # PYTHON GENERATOR
    for s in range(8):
      print "S = '%s;" % bin(s)[1:]
      print "`CLK;"
      print "if (O !== I%i) begin" % s
      print "  `FAIL;"
      print "end"
      print
    */
    S = 'b0;
    `CLK;
    if (O !== I0) begin
      `FAIL;
    end

    S = 'b1;
    `CLK;
    if (O !== I1) begin
      `FAIL;
    end

    S = 'b10;
    `CLK;
    if (O !== I2) begin
      `FAIL;
    end

    S = 'b11;
    `CLK;
    if (O !== I3) begin
      `FAIL;
    end

    S = 'b100;
    `CLK;
    if (O !== I4) begin
      `FAIL;
    end

    S = 'b101;
    `CLK;
    if (O !== I5) begin
      `FAIL;
    end

    S = 'b110;
    `CLK;
    if (O !== I6) begin
      `FAIL;
    end

    S = 'b111;
    `CLK;
    if (O !== I7) begin
      `FAIL;
    end
  end

endmodule