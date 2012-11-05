/* testXOR_32.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

`include "testConstants.v"
`include "XOR_32.v"

/* module testXOR_32
tests the XOR_32 module by running 4
tests that, combined, cover every combination of
0 and 1 in every bit of A and B.*/

module testXOR_32();
  reg clk;
  parameter period = 500; // 2*period = length of clock
  // Make the clock LONG to test
  initial clk = 0;
  always #(period) clk = ~clk;
  reg [31:0] A, B;
  wire [31:0] O;

  // Alternate one way
  A = 'b01010101010101010101010101010101;
  B = 'b10101010101010101010101010101010;
  `CLK
  XOR_32 (O, A, B);

  // Alternate the other way
  A = 'b10101010101010101010101010101010;
  B = 'b01010101010101010101010101010101;
  `CLK
  XOR_32 (O, A, B);

  // Both the same one way
  A = 'b01010101010101010101010101010101;
  B = 'b01010101010101010101010101010101;
  `CLK
  XOR_32 (O, A, B);

  // Both the same the other way
  A = 'b10101010101010101010101010101010;
  B = 'b10101010101010101010101010101010;
  `CLK
  XOR_32 (O, A, B);

  MegaMuxOfDestiny mega01(O,S,I0,I1,I2,I3,I4);
  initial
  begin
      I0 = 2**0;
      I1 = 2**1;
      I2 = 2**2;
      I3 = 2**3;
      I4 = 2**4;
  end
  integer i;
  initial begin

    for(i = 3'b000; i <= 7; i=i+001) begin
      #(period*2); S = i;


    end
    $monitor(O);
  end

endmodule