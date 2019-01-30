def longestPrefixSuffix(myStr):
	n = len(myStr)

	for i in range(n//2,0,-1):
		prefix = myStr[0:i]
		suffix = myStr[n-i:]

		if (prefix == suffix):
			return i

	return 0

s = "blablabla"
s = "aabcdaabc"
print(longestPrefixSuffix(s)) 


# Given 3 strings, one for a prefix, one full word, and one suffix, determine whether the prefix or suffix is longer based on the full word given.

# A list of tasks, there are dependencies on them. For a given list and some dependencies, to determine if all those tasks can be finished or not.

# Minimum unique array sum write a program that returns string yes if it is possible for the bot to start at a point(x1,y1) and reach point(x2,y2)