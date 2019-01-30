a={
'C':100,
'CM':900,
'MMIX':2009,
'DC':600,
'DCCVII':707,
'XVI':16,
'XC':90,
'IV':4,
'V':5,
'XLVIII':48,
'CMXCIX':999,
'IX':9,
'M':1000,
'X':10,
'CXV':115,
'MDCLXVI':1666,
'XL':40,
'CDXCV':495,
'DXXX':530,
'MDCCC':1800,
'D':500,
'LX':60,
'DCXVII':617,
'L':50,
'DL':550,
'I':1,
'MCDV':1405,
'XCIX':99,
'MCMLXXIII':1973,
'XXXVIII':38	
}

def romanToInt(s):
    """
    :type s: str
    :rtype: int
    """
    count = 0
    toSkip = False
    for i in range(len(s)-1,-1,-1):
    	if toSkip:
    		toSkip = False
    		continue

        if s[i] == 'I':
            count +=1
        elif s[i] == 'V':
            count +=5
            if s[i-1] == 'I' and i-1 >= 0:
            	count -= 1
            	toSkip = True
        elif s[i] == 'X':
            count +=10
            if s[i-1] == 'I' and i-1 >= 0:
            	count -= 1
            	toSkip = True
        elif s[i] == 'L':
            count +=50
            if s[i-1] == 'X' and i-1 >= 0:
            	count -= 10
            	toSkip = True
        elif s[i] == 'C':
            count +=100
            if s[i-1] == 'X' and i-1 >= 0:
            	count -= 10
            	toSkip = True
            	
        elif s[i] == 'D':
            count +=500
            if s[i-1] == 'C' and i-1 >= 0:
            	count -= 100
            	toSkip = True
        elif s[i] == 'M':
            count +=1000
            if s[i-1] == 'C' and i-1 >= 0:
            	count -= 100
            	toSkip = True

    	print s,s[i],count
    # for symbol in s:
    
    return count

def romanToInt2(s):
    roman = {'M': 1000,'D': 500 ,'C': 100,'L': 50,'X': 10,'V': 5,'I': 1}
    z = 0
    for i in range(0, len(s) - 1):
        if roman[s[i]] < roman[s[i+1]]:
            z -= roman[s[i]]
        else:
            z += roman[s[i]]
    	print s[i], roman[s[i]], z
    return z + roman[s[-1]]

# print a['CMXCIX']
print romanToInt('CMXCIX')
print romanToInt2('CMXCIX')
# print romanToInt(raw_input("Enter: "))