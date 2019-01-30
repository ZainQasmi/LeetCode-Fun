# [[4, 10, 15, 24, 26], [0, 9, 12, 20], [5, 18, 22, 30]]

x = [4, 10, 15, 24, 26]
y = [0, 9, 12, 20]
z = [5, 18, 22, 30]

# x = [4,10,15,24]
# y = [0,9,12,20]
# z = [5,18,22,30]

cX = 0
cY = 0
cZ = 0

myMin = min(x[cX],y[cY],z[cZ])
myMax = max(x[cX],y[cY],z[cZ])
myRange = myMax-myMin

minRange = myRange
minRmin = myMin
minRmax = myMax

print myMin, myMax, myRange

while( (cX != len(x)) and (cY != len(y)) and (cZ != len(z)) ):
	myMin = min(x[cX],y[cY],z[cZ])
	myMax = max(x[cX],y[cY],z[cZ])
	myRange = myMax-myMin

	if myMin == x[cX]:
		cX +=1
	elif myMin == y[cY]:
		cY +=1
	elif myMin == z[cZ]:
		cZ +=1

	# print cX, cY,cZ

	if myRange < minRange:
		minRange = myRange
		minRmin = myMin
		minRmax = myMax

	print minRange, myMin, myMax
