
/* testShifter.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

`include "gateConstants.v"
`include "testConstants.v"
`include "Shifter.v"



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

    /* Python Gen Code
    #import antigravity

    def raShift(a,b):
        a = list(a)
        msb = a[0]
        for i in range(b):
            # Shift 1 right arith
            for j in range(31,-1,-1):
                if j+1 <= 31:
                    a[j+1] = a[j]
                a[j] = msb
        return a

    def llShift(a,b):
        a = list(a)
        for i in range(b):
            # Shift 1 left
            for j in range(32):
                if j-1 >= 0:
                    a[j-1] = a[j]
                a[j] = "0"
        return a

    def rlShift(a,b):
        a = list(a)
        for i in range(b):
            # Shift 1 right logical
            for j in range(31,-1,-1):
                if j+1 <= 31:
                    a[j+1] = a[j]
                a[j] = "0"
        return a


    for i in range(3):
        theShift = None
        theOp = None
        if (i == 0):
            ctl0 = 1
            ctl1 = 0
            theShift = llShift
            theOp = "// Left Logical Shift"
        if (i == 1):
            ctl0 = 0
            ctl1 = 1
            theShift = raShift
            theOp = "// Right Arithmetic Shift"
        if (i == 2):
            ctl0 = 1
            ctl1 = 1
            theShift = rlShift
            theOp = "// Right Logical Shift"

        for polarity in range(2):
            for j in [31, 7, 0]:
                a = [str(polarity)]*32
                a[j] = str(int(not polarity))
                for shift in [31, 7, 1, 0]:
                    print("A = 'b%s;" % "".join(a))
                    b = bin(shift)[2:]
                    print("B = 'b%s;" % b)
                    print(theOp+" by "+str(shift))
                    print("ctl0 = %i;" % ctl0)
                    print("ctl1 = %i;" % ctl1)
                    print("`CLK;")
                    print("if (out !== 'b%s) begin" % "".join(theShift(a,shift)))
                    print("  `FAIL;")
                    print("end\n")

    */

    A = 'b00000000000000000000000000000001;
    B = 'b11111;
    // Left Logical Shift by 31
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b10000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b00000000000000000000000000000001;
    B = 'b111;
    // Left Logical Shift by 7
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b00000000000000000000000010000000) begin
      `FAIL;
    end

    A = 'b00000000000000000000000000000001;
    B = 'b1;
    // Left Logical Shift by 1
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b00000000000000000000000000000010) begin
      `FAIL;
    end

    A = 'b00000000000000000000000000000001;
    B = 'b0;
    // Left Logical Shift by 0
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b00000000000000000000000000000001) begin
      `FAIL;
    end

    A = 'b00000001000000000000000000000000;
    B = 'b11111;
    // Left Logical Shift by 31
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b00000001000000000000000000000000;
    B = 'b111;
    // Left Logical Shift by 7
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b10000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b00000001000000000000000000000000;
    B = 'b1;
    // Left Logical Shift by 1
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b00000010000000000000000000000000) begin
      `FAIL;
    end

    A = 'b00000001000000000000000000000000;
    B = 'b0;
    // Left Logical Shift by 0
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b00000001000000000000000000000000) begin
      `FAIL;
    end

    A = 'b10000000000000000000000000000000;
    B = 'b11111;
    // Left Logical Shift by 31
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b10000000000000000000000000000000;
    B = 'b111;
    // Left Logical Shift by 7
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b10000000000000000000000000000000;
    B = 'b1;
    // Left Logical Shift by 1
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b10000000000000000000000000000000;
    B = 'b0;
    // Left Logical Shift by 0
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b10000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b11111111111111111111111111111110;
    B = 'b11111;
    // Left Logical Shift by 31
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b11111111111111111111111111111110;
    B = 'b111;
    // Left Logical Shift by 7
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b11111111111111111111111100000000) begin
      `FAIL;
    end

    A = 'b11111111111111111111111111111110;
    B = 'b1;
    // Left Logical Shift by 1
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b11111111111111111111111111111100) begin
      `FAIL;
    end

    A = 'b11111111111111111111111111111110;
    B = 'b0;
    // Left Logical Shift by 0
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b11111111111111111111111111111110) begin
      `FAIL;
    end

    A = 'b11111110111111111111111111111111;
    B = 'b11111;
    // Left Logical Shift by 31
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b10000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b11111110111111111111111111111111;
    B = 'b111;
    // Left Logical Shift by 7
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b01111111111111111111111110000000) begin
      `FAIL;
    end

    A = 'b11111110111111111111111111111111;
    B = 'b1;
    // Left Logical Shift by 1
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b11111101111111111111111111111110) begin
      `FAIL;
    end

    A = 'b11111110111111111111111111111111;
    B = 'b0;
    // Left Logical Shift by 0
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b11111110111111111111111111111111) begin
      `FAIL;
    end

    A = 'b01111111111111111111111111111111;
    B = 'b11111;
    // Left Logical Shift by 31
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b10000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b01111111111111111111111111111111;
    B = 'b111;
    // Left Logical Shift by 7
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b11111111111111111111111110000000) begin
      `FAIL;
    end

    A = 'b01111111111111111111111111111111;
    B = 'b1;
    // Left Logical Shift by 1
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b11111111111111111111111111111110) begin
      `FAIL;
    end

    A = 'b01111111111111111111111111111111;
    B = 'b0;
    // Left Logical Shift by 0
    ctl0 = 1;
    ctl1 = 0;
    `CLK;
    if (out !== 'b01111111111111111111111111111111) begin
      `FAIL;
    end

    A = 'b00000000000000000000000000000001;
    B = 'b11111;
    // Right Arithmetic Shift by 31
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b00000000000000000000000000000001;
    B = 'b111;
    // Right Arithmetic Shift by 7
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b00000000000000000000000000000001;
    B = 'b1;
    // Right Arithmetic Shift by 1
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b00000000000000000000000000000001;
    B = 'b0;
    // Right Arithmetic Shift by 0
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000000000000000000000000001) begin
      `FAIL;
    end

    A = 'b00000001000000000000000000000000;
    B = 'b11111;
    // Right Arithmetic Shift by 31
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b00000001000000000000000000000000;
    B = 'b111;
    // Right Arithmetic Shift by 7
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000000000100000000000000000) begin
      `FAIL;
    end

    A = 'b00000001000000000000000000000000;
    B = 'b1;
    // Right Arithmetic Shift by 1
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000100000000000000000000000) begin
      `FAIL;
    end

    A = 'b00000001000000000000000000000000;
    B = 'b0;
    // Right Arithmetic Shift by 0
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000001000000000000000000000000) begin
      `FAIL;
    end

    A = 'b10000000000000000000000000000000;
    B = 'b11111;
    // Right Arithmetic Shift by 31
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b11111111111111111111111111111111) begin
      `FAIL;
    end

    A = 'b10000000000000000000000000000000;
    B = 'b111;
    // Right Arithmetic Shift by 7
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b11111111000000000000000000000000) begin
      `FAIL;
    end

    A = 'b10000000000000000000000000000000;
    B = 'b1;
    // Right Arithmetic Shift by 1
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b11000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b10000000000000000000000000000000;
    B = 'b0;
    // Right Arithmetic Shift by 0
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b10000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b11111111111111111111111111111110;
    B = 'b11111;
    // Right Arithmetic Shift by 31
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b11111111111111111111111111111111) begin
      `FAIL;
    end

    A = 'b11111111111111111111111111111110;
    B = 'b111;
    // Right Arithmetic Shift by 7
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b11111111111111111111111111111111) begin
      `FAIL;
    end

    A = 'b11111111111111111111111111111110;
    B = 'b1;
    // Right Arithmetic Shift by 1
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b11111111111111111111111111111111) begin
      `FAIL;
    end

    A = 'b11111111111111111111111111111110;
    B = 'b0;
    // Right Arithmetic Shift by 0
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b11111111111111111111111111111110) begin
      `FAIL;
    end

    A = 'b11111110111111111111111111111111;
    B = 'b11111;
    // Right Arithmetic Shift by 31
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b11111111111111111111111111111111) begin
      `FAIL;
    end

    A = 'b11111110111111111111111111111111;
    B = 'b111;
    // Right Arithmetic Shift by 7
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b11111111111111011111111111111111) begin
      `FAIL;
    end

    A = 'b11111110111111111111111111111111;
    B = 'b1;
    // Right Arithmetic Shift by 1
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b11111111011111111111111111111111) begin
      `FAIL;
    end

    A = 'b11111110111111111111111111111111;
    B = 'b0;
    // Right Arithmetic Shift by 0
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b11111110111111111111111111111111) begin
      `FAIL;
    end

    A = 'b01111111111111111111111111111111;
    B = 'b11111;
    // Right Arithmetic Shift by 31
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b01111111111111111111111111111111;
    B = 'b111;
    // Right Arithmetic Shift by 7
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000111111111111111111111111) begin
      `FAIL;
    end

    A = 'b01111111111111111111111111111111;
    B = 'b1;
    // Right Arithmetic Shift by 1
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00111111111111111111111111111111) begin
      `FAIL;
    end

    A = 'b01111111111111111111111111111111;
    B = 'b0;
    // Right Arithmetic Shift by 0
    ctl0 = 0;
    ctl1 = 1;
    `CLK;
    if (out !== 'b01111111111111111111111111111111) begin
      `FAIL;
    end

    A = 'b00000000000000000000000000000001;
    B = 'b11111;
    // Right Logical Shift by 31
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b00000000000000000000000000000001;
    B = 'b111;
    // Right Logical Shift by 7
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b00000000000000000000000000000001;
    B = 'b1;
    // Right Logical Shift by 1
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b00000000000000000000000000000001;
    B = 'b0;
    // Right Logical Shift by 0
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000000000000000000000000001) begin
      `FAIL;
    end

    A = 'b00000001000000000000000000000000;
    B = 'b11111;
    // Right Logical Shift by 31
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b00000001000000000000000000000000;
    B = 'b111;
    // Right Logical Shift by 7
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000000000100000000000000000) begin
      `FAIL;
    end

    A = 'b00000001000000000000000000000000;
    B = 'b1;
    // Right Logical Shift by 1
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000100000000000000000000000) begin
      `FAIL;
    end

    A = 'b00000001000000000000000000000000;
    B = 'b0;
    // Right Logical Shift by 0
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000001000000000000000000000000) begin
      `FAIL;
    end

    A = 'b10000000000000000000000000000000;
    B = 'b11111;
    // Right Logical Shift by 31
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000000000000000000000000001) begin
      `FAIL;
    end

    A = 'b10000000000000000000000000000000;
    B = 'b111;
    // Right Logical Shift by 7
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000001000000000000000000000000) begin
      `FAIL;
    end

    A = 'b10000000000000000000000000000000;
    B = 'b1;
    // Right Logical Shift by 1
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b01000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b10000000000000000000000000000000;
    B = 'b0;
    // Right Logical Shift by 0
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b10000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b11111111111111111111111111111110;
    B = 'b11111;
    // Right Logical Shift by 31
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000000000000000000000000001) begin
      `FAIL;
    end

    A = 'b11111111111111111111111111111110;
    B = 'b111;
    // Right Logical Shift by 7
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000001111111111111111111111111) begin
      `FAIL;
    end

    A = 'b11111111111111111111111111111110;
    B = 'b1;
    // Right Logical Shift by 1
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b01111111111111111111111111111111) begin
      `FAIL;
    end

    A = 'b11111111111111111111111111111110;
    B = 'b0;
    // Right Logical Shift by 0
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b11111111111111111111111111111110) begin
      `FAIL;
    end

    A = 'b11111110111111111111111111111111;
    B = 'b11111;
    // Right Logical Shift by 31
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000000000000000000000000001) begin
      `FAIL;
    end

    A = 'b11111110111111111111111111111111;
    B = 'b111;
    // Right Logical Shift by 7
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000001111111011111111111111111) begin
      `FAIL;
    end

    A = 'b11111110111111111111111111111111;
    B = 'b1;
    // Right Logical Shift by 1
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b01111111011111111111111111111111) begin
      `FAIL;
    end

    A = 'b11111110111111111111111111111111;
    B = 'b0;
    // Right Logical Shift by 0
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b11111110111111111111111111111111) begin
      `FAIL;
    end

    A = 'b01111111111111111111111111111111;
    B = 'b11111;
    // Right Logical Shift by 31
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    A = 'b01111111111111111111111111111111;
    B = 'b111;
    // Right Logical Shift by 7
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00000000111111111111111111111111) begin
      `FAIL;
    end

    A = 'b01111111111111111111111111111111;
    B = 'b1;
    // Right Logical Shift by 1
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b00111111111111111111111111111111) begin
      `FAIL;
    end

    A = 'b01111111111111111111111111111111;
    B = 'b0;
    // Right Logical Shift by 0
    ctl0 = 1;
    ctl1 = 1;
    `CLK;
    if (out !== 'b01111111111111111111111111111111) begin
      `FAIL;
    end


  end

endmodule
