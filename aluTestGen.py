from bitstring import BitArray

def add(a,b):
	out = None
	zero = None
	overflow = None
	carryout = None

	try:
		out = BitArray('int:32='+str(a.int+b.int))

		if out == BitArray(bin=('0'*32)):
			zero = BitArray(bin='1')
		else:
			zero = BitArray(bin='0')
		overflow = BitArray(bin=('0'*32))
	except:
		overflow = BitArray(bin=(('0'*31)+'1'))

	return out, zero, overflow, carryout

def sub(a,b):
	out = None
	zero = None
	overflow = None
	carryout = None

	try:
		out = BitArray('int:32='+str(a.int-b.int))

		if out == BitArray(bin=('0'*32)):
			zero = BitArray(bin='1')
		else:
			zero = BitArray(bin='0')
		overflow = BitArray(bin=('0'*32))
	except:
		overflow = BitArray(bin=(('0'*31)+'1'))

	return out, zero, overflow, carryout

def xor(a,b):
	out = None
	zero = None
	overflow = None
	carryout = None

	out = BitArray(bin=''.join([str(int(a.bin[i] != b.bin[i])) for i in range(32)]))

	return out, zero, overflow, carryout

def slt(a,b):
	out = None
	zero = None
	overflow = None
	carryout = None
	return out, zero, overflow, carryout

def sllv(a,b):
	out = None
	zero = None
	overflow = None
	carryout = None
	return out, zero, overflow, carryout

def srav(a,b):
	out = None
	zero = None
	overflow = None
	carryout = None
	return out, zero, overflow, carryout

def srlv(a,b):
	out = None
	zero = None
	overflow = None
	carryout = None

	if b.uint < 32:
		# Only do stuff if b is in bounds of what a shift can be
		out = a.__rshift__(b.uint)
	return out, zero, overflow, carryout

def mult(a,b):
	# Not implemented in ALU
	out = None
	zero = None
	overflow = None
	carryout = None
	return out, zero, overflow, carryout

sENUM = {
	0: (add  , " + "),
	1: (sub  , " - "),
	2: (xor  , " XOR "),
	3: (slt  , " SLT "),
	4: (mult  , " MUL "),
	5: (sllv , " SLLV "),
	6: (srav , " SRAV "),
	7: (srlv , " SRLV ")
}

def genCaseFor(a, b):
	for s in range(8):
		if not sENUM[s][1] == " MUL ":
			op, comment = sENUM[s]
			print("// %i%s%i" % (a.int, comment, b.int))
			print("S = 'b%s;" % BitArray('uint:3=%s'%s).bin)
			print("A = 'b%s;" % a.bin)
			print("B = 'b%s;" % b.bin)
			print("`CLK;")
			out, zero, overflow, carryout = op(a,b)
			if not out == None:
				print ("if (out !== 'b%s) begin" % out.bin)
				print ("  `FAIL;")
				print ("end\n")
			if not zero == None:
				print ("if (out !== 'b%s) begin" % zero.bin)
				print ("  `FAIL;")
				print ("end\n")
			if not overflow == None:
				print ("if (out !== 'b%s) begin" % overflow.bin)
				print ("  `FAIL;")
				print ("end\n")
			if not carryout == None:
				print ("if (out !== 'b%s) begin" % carryout.bin)
				print ("  `FAIL;")
				print ("end\n")

testCases = [BitArray(bin=('0'*32)), BitArray(bin=('1'*32)), BitArray(bin=('01'*16)), BitArray(bin=('10'*16)),  BitArray(bin=(('0'*31)+'1'))]
for a in testCases:
	for b in testCases:
		genCaseFor(a,b)
