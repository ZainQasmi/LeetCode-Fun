def divWithoutDivideOP(a,b):
	ans = a
	count = 1
	while(b is not ans):
		ans = ans-b
		count += 1
	return count


print divWithoutDivideOP(16384,8)
