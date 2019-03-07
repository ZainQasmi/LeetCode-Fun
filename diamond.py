# import python modules
import sys
import os
import string

# --*-- 0
# -***- 1
# ***** i=2 | k = 0 | size-k = 5
# -***- i=3 | k = 1 | size-k = 4
# --*-- i=4 | k = 2 | size-k = 3

def printDiamond1(line):
	# Declare number of lines to be read this value should be odd
	# line = 15    
	print "print %s" % (line)

	# Calculate centre of the diamond, also calculate the offset  
	centre = line/2
	offset = line - 2*centre
	if offset == 0:
		print "...Error the number of lines should be odd"
		sys.exit()
	if offset == 1:
	    centre = centre + 1

	# Print statements
	print "centre %s" %(centre)
	print "--Here in the diamond for lines = %s--" % (line)

	# Generate the diamond pattern

	# Calculate spaces and stars for each line  
	for line_d in range (1,line+1,1):
		spaces = centre - line_d
		if spaces < 0:
			spaces = spaces * -1
		stars = 2*(centre - spaces) - 1    
		diamond = ""
		for l in range (0, spaces, 1):
			diamond = diamond + " "    
		for q in range (0, stars, 1):
			diamond = diamond + "*"
		print diamond


def printDiamond2(number):
	while True:
	    # number = raw_input("Enter an odd number or hit ENTER to quit program: ")
	    if not number:
	        print "Quitting program..."
	        break
	    number = int(number)
	    if not number % 2:
	        print "That's an even number, try again."
	    else:   
	        for i in range(1, number + 1, 2):
	            print ("*" * i).center(number)
	        for i in range(number - 2, 0, -2):
	            print ("*" * i).center(number)
	    break;


def printDiamond3(n):
	n = 9
	print("Pattern 1")
	for a1 in range(1, (n+1)//2 + 1): #from row 1 to 5
	    for a2 in range((n+1)//2 - a1):
	        print "-",
	        # print(" ", end = "")
	    for a3 in range((a1*2)-1):
	        print "*",
	        # print("*", end = "")
	    print
	    # print()

	for a1 in range((n+1)//2 + 1, n + 1): #from row 6 to 9
	    for a2 in range(a1 - (n+1)//2):
	        print "-",
	        # print(" ", end = "")
	    for a3 in range((n+1 - a1)*2 - 1):
	        print "*",
	        # print("*", end = "")
	    print
	    # print()

def printDiamond4(userInput):
    for i in range(1,userInput):
        for s in range (userInput - i):    # s is equivalent to to spaces
            print "-",
            # print(" ", end="")
        for j in range((i * 2) - 1):
            print "*",
            # print("*", end="")
        for s in range (userInput - i):    # s is equivalent to to spaces
            print "-",
        print
        # print()
    for i in range(userInput, 0, -1):
        for s in range (userInput - i):
            print "-",
            # print(" ", end="")
        for j in range((i * 2) - 1):
            print "*",
            # print("*", end="")
        for s in range (userInput - i):
            print "-",
        print
        # print()

def myPrintDiamond(size):
	# MY STUPID CODE
	normalize = size/2 + 1
	# print normalize
	for i in range(1,normalize):
		print normalize-i, " ", i, " ",
		for j in range(normalize-i):
			print "-",
		for k in range( i*2 -1):
			print "*",
		for j in range(normalize-i):
			print "-",
		print
	print

	for i in range(normalize, 0, -1):
		print normalize-i, " ", i, " ",
		for j in range(normalize-i):
			print "-",
		for k in range( i*2 - 1):
			print "*",
		for j in range(normalize-i):
			print "-",
		print

	# for i in range(size):
	# 	if i < size/2:
	# 		for j in range(size):
	# 			if j >= (size/2)-i and j <=(size/2)+i:
	# 				print '*',
	# 			else:
	# 				print '-',
	# 		print
	# 	else:
	# 		for j in range(size):
	# 			k = i-(size/2)
	# 			if j < size-k and j>=k:
	# 			# if j < size+size/2-i and j>=i-size/2:
	# 				print '*',
	# 			else:
	# 				print '-',
	# 		print

def main():
	# printDiamond1(int(sys.argv[1]))
	# printDiamond2(int(sys.argv[1]))
	# printDiamond3(int(sys.argv[1]))
	# printDiamond4(int(sys.argv[1]))
	myPrintDiamond(int(sys.argv[1]))

if __name__ == "__main__":
	main()