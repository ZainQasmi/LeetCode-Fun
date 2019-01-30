
# matrix=[[3,0,8,4],[2,4,5,7],[9,2,6,3],[0,3,1,0]]
# t_matrix = zip(*matrix) 

# print t_matrix[0][1]
# for row in t_matrix: 
    # print row 

MYURL = 'https://leetcode.com/problems/design-tinyurl'

n = 123456789

myMap = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
myMap2 = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~'


  
shortURL = ''

# // Convert given integer id to a base 62 number
while (n):
    shortURL = shortURL + (myMap[n%62]);
    n = n/62;

shortURL = shortURL[::-1]
print shortURL



myID = 0

for i in range(len(shortURL)):
	if (ord('0') <= ord(shortURL[i]) and ord(shortURL[i]) <= ord('9')):
		myID = myID*62 + ord(shortURL[i]) - ord('0');
	if (ord('A') <= ord(shortURL[i]) and ord(shortURL[i]) <= ord('Z')):
		myID = myID*62 + ord(shortURL[i]) - ord('A') + 10;
	if (ord('a') <= ord(shortURL[i]) and ord(shortURL[i]) <= ord('z')):
		myID = myID*62 + ord(shortURL[i]) - ord('a') + 36;

print myID
