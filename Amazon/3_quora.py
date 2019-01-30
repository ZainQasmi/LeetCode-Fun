


def removeAlternateDuplicates(myStr):
	myStr = list(myStr)

	letters = [0] * 256
	ind = 0
	for i in range(len(myStr)):
		lowerCase = myStr[i] # char
		if(ord(myStr[i]) >= 65 and ord(myStr[i]) <= 90 ):
			# lowerCase += ord('a') - ord('A')
			lowerCase.lower()
		if (letters[ord(lowerCase)] == 0):
			letters[ord(lowerCase)] += 1
			myStr[ind] = myStr[i]
			ind += 1
		else:
			letters[ord(lowerCase)] -= 1


	while(ind < len(myStr)):
		myStr[ind] = ""
		ind += 1

	return ''.join(myStr)

def main():
	myStr = "aAaBbBcCcdefgFGZzzzO"
	print removeAlternateDuplicates(myStr)


if __name__ == "__main__":
	main()