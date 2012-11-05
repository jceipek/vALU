/* ALU.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

`include "ALU.v"
`include "testConstants.v"

module testALU();

ALU myALU(out, Zero, Overflow, Cout, S, A, B);
  wire [31:0] out;
  wire Zero, Overflow, Cout;
  
  reg [2:0] S;
  reg [31:0] A, B;
  
  initial begin
    
    A = 00000000000000000000000000000000;
    B = 00000000000000000000000000000000;
    S = 000;
    if (out !== 00000000000000000000000000000000) begin
      `FAIL;
    end
    
    
    
    
    
  end
  
  
endmodule
  