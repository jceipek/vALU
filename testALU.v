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

// did not have time to fully do this, but the modules are good and we have a Python script that is mostly complete
  
endmodule
  