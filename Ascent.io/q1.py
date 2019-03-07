
def execute(myStr,oper):
	myStr = list(myStr)

	for op in oper:
		op = op.split()

		if op[2] == 'L':
			for i in range(int(op[0]),int(op[1])+1):
				myStr[i] = 'z' if myStr[i] == 'a' else chr(ord(myStr[i])-1)
		elif op[2] == 'R':
			for i in range(int(op[0]),int(op[1])+1):
				myStr[i] = 'a' if myStr[i] == 'z' else chr(ord(myStr[i])+1)
		print myStr
		# else:
			# print 'invalid'

	return ''.join(myStr)





def exec2(myStr, oper):
	# print myStr
	myStr = list(myStr)
	# print myStr

	for op in oper:
		# print op
		op = op.split()
		# print op
		if op[2] == 'L':
			for i in range(int(op[0]),int(op[1])+1):
				myStr[i] = 'z' if myStr[i] == 'a' else chr(ord(myStr[i])-1)
		elif op[2] == 'R':
			for i in range(int(op[0]),int(op[1])+1):
				myStr[i] = 'a' if myStr[i] == 'z' else chr(ord(myStr[i])+1)
		print myStr


	return ''.join(myStr)


def main():
	oper = ['0 0 L','1 2 R','0 2 R']
	myStr = 'abc'
	# oper = ['0 0 L','0 0 R']
	# myStr = 'abc'
	# print execute(myStr,oper)
	print exec2(myStr,oper)





if __name__ == "__main__":
	main()