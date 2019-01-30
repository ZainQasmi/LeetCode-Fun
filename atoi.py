
# Python program for implementation of atoi 
  
# A simple atoi() function 
def myAtoi(string): 
    res = 0
    # initialize sign as positive 
    sign = 1
    i = 0
  
    # if number is negative then update sign 
    if string[0] == '-': 
        sign = -1
        i+=1
  
    # Iterate through all characters of input string and update result 
    for j in xrange(i,len(string)): 
        print ord(string[j]), ord('0')
        res = res*10 + (ord(string[j]) - ord('0')) 
  
    return sign*res 
  
# Driver program 
string = "9"
print myAtoi(string) 
  
# This code is contributed by BHAVYA JAIN 
