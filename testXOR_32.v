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
  reg [31:0] A, B;
  wire [31:0] O;

  XOR_32 tester(O, A, B);
  initial begin
    // Alternate one way
    A = 'b01010101010101010101010101010101;
    B = 'b10101010101010101010101010101010;
    `CLK
    if (O !== 'b11111111111111111111111111111111) begin
        `FAIL;
    end

    // Alternate the other way
    A = 'b10101010101010101010101010101010;
    B = 'b01010101010101010101010101010101;
    `CLK
    if (O !== 'b11111111111111111111111111111111) begin
        `FAIL;
    end

    // Both the same one way
    A = 'b01010101010101010101010101010101;
    B = 'b01010101010101010101010101010101;
    `CLK
    if (O !== 'b00000000000000000000000000000000) begin
        `FAIL;
    end

    // Both the same the other way
    A = 'b10101010101010101010101010101010;
    B = 'b10101010101010101010101010101010;
    `CLK
    if (O !== 'b00000000000000000000000000000000) begin
        `FAIL;
    end
  end

endmodule