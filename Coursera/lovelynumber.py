# 1.count the lovely number from 1 to a given n. lovelynumber  is a number with unique characters. eg. 123 is a lovely number while 122 isn't.

def isLovely(n):
	n = str(n)
	if len(n) > len(set(n)):
		return False
	else:
		# print n
		return True

def isUnique(n):
	n = str(n)
	temp = n[0]
	for i in range(1,len(n)):
		if n[i] == temp:
			return False
		temp = n[i]
	return True

def counter(n):
	uniqueSet = []
	lovelySet = []
	count = 0
	for i in range(0,n):
		# if isLovely(i):
		# 	lovelySet.append(i)
		# 	count +=1
		if isUnique(i):
			uniqueSet.append(i)
		else:
			print i
	# return set(uniqueSet) - set(lovelySet)

def uniques(number):
    seen = set()
    quotient = number
    while quotient > 0:
        quotient, remainder = divmod(quotient, 10)
        print quotient,remainder
        if remainder in seen:
            return False
        else:
            seen.add(remainder)
    else:
        return True

def uniques2(numbers):
    for number in numbers:
        seen = set()
        quotient = number
        while quotient > 0:
            quotient, remainder = divmod(quotient, 10)
            # print quotient,remainder
            if remainder in seen:
                break
            else:
                seen.add(remainder)
        else:
            yield number

def countNumbersWithUniqueDigits(n):
    """
    :type n: int
    :rtype: int
    """
    choices = [9, 9, 8, 7, 6, 5, 4, 3, 2, 1]
    ans, product = 1, 1
    
    for i in range(min(n,10)):
    	# print i
        product = product * choices[i]
        ans = ans + product
        
    return ans

def countNumbersWithUniqueDigits2(n):
    if n==0:
        return 1
    res = 0
    for j in range(1, n+1):
    	# print j
        if j==1:
        	res += 10
        else:
            p = 9
            for i in range(j-1):
                print i
                p = p * (9 - i)
        	res += p
    return res

myC = 0
for i in uniques2(xrange(20000000,30000000 )):
    myC +=1
    # print i,'T'
print myC

def countNumbersWithUniqueDigits3(n):
    if n==0:
        return 1
    res = 0
    for i in range(1, n+1):
        res += NumForDig(i)
    return res
    
def NumForDig(n):
    if n==1:
        return 10
    else:
        p = 9
        for i in range(n-1):
            p *= (9 - i)
        return p

print countNumbersWithUniqueDigits(5)
# print countNumbersWithUniqueDigits2(1)
# print countNumbersWithUniqueDigits2(2)
# print countNumbersWithUniqueDigits2(3)
# print countNumbersWithUniqueDigits3(3)
# 
# counter(300)
# counter(127)
# counter(222)
# counter(112)
# counter(211)
# counter(345)
# counter(1)
# counter(12)
# counter(5)
