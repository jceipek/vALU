/* testAdderSubtractor.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

`include "testConstants.v"
`include "AdderSubtractor.v"

/*
    Test every combination of adding, subtracting and less-than comparing A and B for:
        all 0s
        all 1s
        alternating 01s
        alternating 10s
*/

module testAdderSubtractor();
  wire [31:0] out;
  wire Zero, Overflow, Cout;
  reg [31:0] A, B;
  reg ctl0, ctl1;

  AdderSubtractor plusandminus(out, Zero, Overflow, Cout, A, B, ctl0, ctl1);
  initial begin

    /* PYTHON GENERATOR

    from bitstring import BitArray

    def genCtl(cmd):
        d = {
            "ADD" : (0,0),
            "SUB" : (1,0),
            "<" : (1,1)
        }
        ctl0, ctl1 = d[cmd]
        print "ctl0 = %i;" % ctl0
        print "ctl1 = %i;" % ctl1

    def makeBinStr(a):
        return a.bin

    def sub(a,b):
        res = a.int - b.int
        overflow = False
        try:
            res = BitArray('int:32='+str(res))
        except:
            overflow = True
            res = BitArray('int:32='+'0') #XXX: Currently returns 0 if overflow

        return res, overflow

    def add(a,b):
        res = a.int + b.int
        overflow = False
        try:
            res = BitArray('int:32='+str(res))
        except:
            overflow = True
            res = BitArray('int:32='+'0') #XXX: Currently returns 0 if overflow

        return res, overflow

    def genCaseFor(a,b):
        print "// %i + %i"%(a.int,b.int)
        genCtl("ADD")
        print "A = 'b%s;" % a.bin
        print "B = 'b%s;" % b.bin
        print "`CLK"
        desRes, desOverflow = add(a,b)
        if desOverflow:
            print "if (Overflow !== 'b1) begin"
            print "  `FAIL;"
            print "end\n"
        else:
            print "if (Overflow !== 'b0) begin"
            print "  `FAIL;"
            print "end\n"

            print "if (out !== 'b%s) begin" % makeBinStr(desRes)
            print "  `FAIL;"
            print "end\n"

        print "// %i - %i"%(a.int,b.int)
        genCtl("SUB")
        print "A = 'b%s;" % a.bin
        print "B = 'b%s;" % b.bin
        print "`CLK"
        desRes, desOverflow = sub(a,b)
        if desOverflow:
            print "if (Overflow !== 'b1) begin"
            print "  `FAIL;"
            print "end\n"
        else:
            print "if (Overflow !== 'b0) begin"
            print "  `FAIL;"
            print "end\n"

            print "if (out !== 'b%s) begin" % makeBinStr(desRes)
            print "  `FAIL;"
            print "end\n"

        print "// %i < %i"%(a.int,b.int)
        genCtl("<")
        print "A = 'b%s;" % a.bin
        print "B = 'b%s;" % b.bin
        print "`CLK"
        print "if (Overflow !== 'b0) begin"
        print "  `FAIL;"
        print "end\n"
        print "if (out !== 'b%s) begin" % makeBinStr(BitArray('int:32='+str(int(a.int<b.int))))
        print "  `FAIL;"
        print "end\n"

    testCases = [BitArray(bin=('0'*32)), BitArray(bin=('1'*32)), BitArray(bin=('01'*16)), BitArray(bin=('10'*16))]
    for a in testCases:
        for b in testCases:
            genCaseFor(a,b)

    */

    // 0 + 0
    ctl0 = 0;
    ctl1 = 0;
    A = 'b00000000000000000000000000000000;
    B = 'b00000000000000000000000000000000;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    // 0 - 0
    ctl0 = 1;
    ctl1 = 0;
    A = 'b00000000000000000000000000000000;
    B = 'b00000000000000000000000000000000;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    // 0 < 0
    ctl0 = 1;
    ctl1 = 1;
    A = 'b00000000000000000000000000000000;
    B = 'b00000000000000000000000000000000;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    // 0 + -1
    ctl0 = 0;
    ctl1 = 0;
    A = 'b00000000000000000000000000000000;
    B = 'b11111111111111111111111111111111;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b11111111111111111111111111111111) begin
      `FAIL;
    end

    // 0 - -1
    ctl0 = 1;
    ctl1 = 0;
    A = 'b00000000000000000000000000000000;
    B = 'b11111111111111111111111111111111;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000001) begin
      `FAIL;
    end

    // 0 < -1
    ctl0 = 1;
    ctl1 = 1;
    A = 'b00000000000000000000000000000000;
    B = 'b11111111111111111111111111111111;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    // 0 + 1431655765
    ctl0 = 0;
    ctl1 = 0;
    A = 'b00000000000000000000000000000000;
    B = 'b01010101010101010101010101010101;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b01010101010101010101010101010101) begin
      `FAIL;
    end

    // 0 - 1431655765
    ctl0 = 1;
    ctl1 = 0;
    A = 'b00000000000000000000000000000000;
    B = 'b01010101010101010101010101010101;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b10101010101010101010101010101011) begin
      `FAIL;
    end

    // 0 < 1431655765
    ctl0 = 1;
    ctl1 = 1;
    A = 'b00000000000000000000000000000000;
    B = 'b01010101010101010101010101010101;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000001) begin
      `FAIL;
    end

    // 0 + -1431655766
    ctl0 = 0;
    ctl1 = 0;
    A = 'b00000000000000000000000000000000;
    B = 'b10101010101010101010101010101010;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b10101010101010101010101010101010) begin
      `FAIL;
    end

    // 0 - -1431655766
    ctl0 = 1;
    ctl1 = 0;
    A = 'b00000000000000000000000000000000;
    B = 'b10101010101010101010101010101010;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b01010101010101010101010101010110) begin
      `FAIL;
    end

    // 0 < -1431655766
    ctl0 = 1;
    ctl1 = 1;
    A = 'b00000000000000000000000000000000;
    B = 'b10101010101010101010101010101010;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    // -1 + 0
    ctl0 = 0;
    ctl1 = 0;
    A = 'b11111111111111111111111111111111;
    B = 'b00000000000000000000000000000000;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b11111111111111111111111111111111) begin
      `FAIL;
    end

    // -1 - 0
    ctl0 = 1;
    ctl1 = 0;
    A = 'b11111111111111111111111111111111;
    B = 'b00000000000000000000000000000000;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b11111111111111111111111111111111) begin
      `FAIL;
    end

    // -1 < 0
    ctl0 = 1;
    ctl1 = 1;
    A = 'b11111111111111111111111111111111;
    B = 'b00000000000000000000000000000000;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000001) begin
      `FAIL;
    end

    // -1 + -1
    ctl0 = 0;
    ctl1 = 0;
    A = 'b11111111111111111111111111111111;
    B = 'b11111111111111111111111111111111;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b11111111111111111111111111111110) begin
      `FAIL;
    end

    // -1 - -1
    ctl0 = 1;
    ctl1 = 0;
    A = 'b11111111111111111111111111111111;
    B = 'b11111111111111111111111111111111;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    // -1 < -1
    ctl0 = 1;
    ctl1 = 1;
    A = 'b11111111111111111111111111111111;
    B = 'b11111111111111111111111111111111;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    // -1 + 1431655765
    ctl0 = 0;
    ctl1 = 0;
    A = 'b11111111111111111111111111111111;
    B = 'b01010101010101010101010101010101;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b01010101010101010101010101010100) begin
      `FAIL;
    end

    // -1 - 1431655765
    ctl0 = 1;
    ctl1 = 0;
    A = 'b11111111111111111111111111111111;
    B = 'b01010101010101010101010101010101;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b10101010101010101010101010101010) begin
      `FAIL;
    end

    // -1 < 1431655765
    ctl0 = 1;
    ctl1 = 1;
    A = 'b11111111111111111111111111111111;
    B = 'b01010101010101010101010101010101;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000001) begin
      `FAIL;
    end

    // -1 + -1431655766
    ctl0 = 0;
    ctl1 = 0;
    A = 'b11111111111111111111111111111111;
    B = 'b10101010101010101010101010101010;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b10101010101010101010101010101001) begin
      `FAIL;
    end

    // -1 - -1431655766
    ctl0 = 1;
    ctl1 = 0;
    A = 'b11111111111111111111111111111111;
    B = 'b10101010101010101010101010101010;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b01010101010101010101010101010101) begin
      `FAIL;
    end

    // -1 < -1431655766
    ctl0 = 1;
    ctl1 = 1;
    A = 'b11111111111111111111111111111111;
    B = 'b10101010101010101010101010101010;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    // 1431655765 + 0
    ctl0 = 0;
    ctl1 = 0;
    A = 'b01010101010101010101010101010101;
    B = 'b00000000000000000000000000000000;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b01010101010101010101010101010101) begin
      `FAIL;
    end

    // 1431655765 - 0
    ctl0 = 1;
    ctl1 = 0;
    A = 'b01010101010101010101010101010101;
    B = 'b00000000000000000000000000000000;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b01010101010101010101010101010101) begin
      `FAIL;
    end

    // 1431655765 < 0
    ctl0 = 1;
    ctl1 = 1;
    A = 'b01010101010101010101010101010101;
    B = 'b00000000000000000000000000000000;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    // 1431655765 + -1
    ctl0 = 0;
    ctl1 = 0;
    A = 'b01010101010101010101010101010101;
    B = 'b11111111111111111111111111111111;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b01010101010101010101010101010100) begin
      `FAIL;
    end

    // 1431655765 - -1
    ctl0 = 1;
    ctl1 = 0;
    A = 'b01010101010101010101010101010101;
    B = 'b11111111111111111111111111111111;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b01010101010101010101010101010110) begin
      `FAIL;
    end

    // 1431655765 < -1
    ctl0 = 1;
    ctl1 = 1;
    A = 'b01010101010101010101010101010101;
    B = 'b11111111111111111111111111111111;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    // 1431655765 + 1431655765
    ctl0 = 0;
    ctl1 = 0;
    A = 'b01010101010101010101010101010101;
    B = 'b01010101010101010101010101010101;
    `CLK
    if (Overflow !== 'b1) begin
      `FAIL;
    end

    // 1431655765 - 1431655765
    ctl0 = 1;
    ctl1 = 0;
    A = 'b01010101010101010101010101010101;
    B = 'b01010101010101010101010101010101;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    // 1431655765 < 1431655765
    ctl0 = 1;
    ctl1 = 1;
    A = 'b01010101010101010101010101010101;
    B = 'b01010101010101010101010101010101;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    // 1431655765 + -1431655766
    ctl0 = 0;
    ctl1 = 0;
    A = 'b01010101010101010101010101010101;
    B = 'b10101010101010101010101010101010;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b11111111111111111111111111111111) begin
      `FAIL;
    end

    // 1431655765 - -1431655766
    ctl0 = 1;
    ctl1 = 0;
    A = 'b01010101010101010101010101010101;
    B = 'b10101010101010101010101010101010;
    `CLK
    if (Overflow !== 'b1) begin
      `FAIL;
    end

    // 1431655765 < -1431655766
    ctl0 = 1;
    ctl1 = 1;
    A = 'b01010101010101010101010101010101;
    B = 'b10101010101010101010101010101010;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    // -1431655766 + 0
    ctl0 = 0;
    ctl1 = 0;
    A = 'b10101010101010101010101010101010;
    B = 'b00000000000000000000000000000000;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b10101010101010101010101010101010) begin
      `FAIL;
    end

    // -1431655766 - 0
    ctl0 = 1;
    ctl1 = 0;
    A = 'b10101010101010101010101010101010;
    B = 'b00000000000000000000000000000000;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b10101010101010101010101010101010) begin
      `FAIL;
    end

    // -1431655766 < 0
    ctl0 = 1;
    ctl1 = 1;
    A = 'b10101010101010101010101010101010;
    B = 'b00000000000000000000000000000000;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000001) begin
      `FAIL;
    end

    // -1431655766 + -1
    ctl0 = 0;
    ctl1 = 0;
    A = 'b10101010101010101010101010101010;
    B = 'b11111111111111111111111111111111;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b10101010101010101010101010101001) begin
      `FAIL;
    end

    // -1431655766 - -1
    ctl0 = 1;
    ctl1 = 0;
    A = 'b10101010101010101010101010101010;
    B = 'b11111111111111111111111111111111;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b10101010101010101010101010101011) begin
      `FAIL;
    end

    // -1431655766 < -1
    ctl0 = 1;
    ctl1 = 1;
    A = 'b10101010101010101010101010101010;
    B = 'b11111111111111111111111111111111;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000001) begin
      `FAIL;
    end

    // -1431655766 + 1431655765
    ctl0 = 0;
    ctl1 = 0;
    A = 'b10101010101010101010101010101010;
    B = 'b01010101010101010101010101010101;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b11111111111111111111111111111111) begin
      `FAIL;
    end

    // -1431655766 - 1431655765
    ctl0 = 1;
    ctl1 = 0;
    A = 'b10101010101010101010101010101010;
    B = 'b01010101010101010101010101010101;
    `CLK
    if (Overflow !== 'b1) begin
      `FAIL;
    end

    // -1431655766 < 1431655765
    ctl0 = 1;
    ctl1 = 1;
    A = 'b10101010101010101010101010101010;
    B = 'b01010101010101010101010101010101;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000001) begin
      `FAIL;
    end

    // -1431655766 + -1431655766
    ctl0 = 0;
    ctl1 = 0;
    A = 'b10101010101010101010101010101010;
    B = 'b10101010101010101010101010101010;
    `CLK
    if (Overflow !== 'b1) begin
      `FAIL;
    end

    // -1431655766 - -1431655766
    ctl0 = 1;
    ctl1 = 0;
    A = 'b10101010101010101010101010101010;
    B = 'b10101010101010101010101010101010;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

    // -1431655766 < -1431655766
    ctl0 = 1;
    ctl1 = 1;
    A = 'b10101010101010101010101010101010;
    B = 'b10101010101010101010101010101010;
    `CLK
    if (Overflow !== 'b0) begin
      `FAIL;
    end

    if (out !== 'b00000000000000000000000000000000) begin
      `FAIL;
    end

  end

endmodule