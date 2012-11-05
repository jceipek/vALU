/* testMegaMux.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

module testMegaMux();
  reg clk;
  parameter period = 500; // 2*period = length of clock
  // Make the clock LONG to test
  initial clk = 0;
  always #(period) clk = ~clk;
  reg [31:0] I0,I1,I2,I3,I4;
  reg [3:0] S;
  wire [31:0] O;
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