
/* test32layers2by1.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

module test32layers2by1();
  reg clk;
  parameter period = 500; // 2*period = length of clock
  // Make the clock LONG to test
  initial clk = 0;
  always #(period) clk = ~clk;
  reg [31:0] I0,I1;
  reg [3:0] S;
  wire [31:0] O;
  MegaMuxOfDestiny mega01(O,S,I0,I1);
  initial
  begin
      I0 = 2**0;
      I1 = 2**1;
  end
  integer i;
  initial begin

    for(i = 1'b000; i <= 1; i=i+1) begin
      #(period*2); S = i; 
      
      
    end
    $monitor(O);
  end
  
endmodule
