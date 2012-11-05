/* ALU.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

`include "ALU.v"
`include "testConstants.v"

module testALU();
  wire [31:0] out;
  wire Zero, Overflow, Cout;
  
  reg [2:0] S;
  reg [31:0] A, B;
ALU myALU(out, Zero, Overflow, Cout, S, A, B);

  
  initial begin
    
    A = 32'b00000000000000000000000000000000;
    B = 32'b00000000000000000000000000000001;
    S = 000;
    if (out !== 0000000000000000000000000000001) begin
      `FAIL;
    end
    
    
    
    
    
  end
  
  
endmodule
  