
/* testShifter.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

`include "testConstants.v"


/* module testShifter.v
tests the Shifter module by running 4
tests that, combined, cover every combination of
0 and 1 in every bit of A and B.*/

module testShifter();
  reg [31:0] A, B;
  reg ctl0, ctl1;
  wire [31:0] out;

  Shifter myShifter(out, A, B, ctl0, ctl1);
  initial begin
    // Alternate one way
    A = 'b00000000000000000000000000000001;
    B = 'b00000000000000000000000000000001;
    ctl0 = 0; // Arithmetic
    ctl1 = 0; // Left
    `CLK
    if (out !== 'b00000000000000000000000000000010) begin
        `FAIL;
    end




  end

endmodule
