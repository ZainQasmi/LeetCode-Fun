# Python program to check if two strings are anagrams of 
# each other 
NO_OF_CHARS = 256
  
# Function to check whether two strings are anagram of 
# each other 
def areAnagram(str1, str2): 

	# Create two count arrays and initialize all values as 0 
	count = [0] * NO_OF_CHARS 

	# For each character in input strings, increment count 
	# in the corresponding count array 
	for i in str1: 
		count[ord(i)]+= 1

	for i in str2: 
		count[ord(i)]-= 1

	# If both strings are of different length. Removing this 
	# condition will make the program fail for strings like 
	# "aaca" and "aca" 
	if len(str1) != len(str2): 
		return 0

	# Compare count arrays 
	for i in xrange(NO_OF_CHARS): 
		if count[i] != 0: 
			return 0

	return 1

# Driver program to test the above functions 
str1 = "geeksforgeeks"
str2 = "forgeeksgeeks"
if areAnagram(str1, str2): 
    print "The two strings are anagram of each other"
else: 
    print "The two strings are not anagram of each other"
  
# This code is contributed by Bhavya Jain