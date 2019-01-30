import heapq

# LoL = [[4, 10, 15, 24, 26], [0, 9, 12, 20], [5, 18, 22, 30]]
# LoL = [[3,10,15,24], [0,1,2,20], [1,18,21,30]]
LoL = [[4, 7, 9, 12, 15], [0, 8, 10, 14, 20], [6, 12, 16, 30, 50]]
# LoL = [[1,2,3],[1,2,3],[1,2,3]]

li = []
it = 0
for oneList in LoL:
	li.append((oneList[0],it))
	it +=1


heapq.heapify(li)
# print li
currMax = max(li)[0]
# print currMax
Min = heapq.heappop(li)
LoL[Min[1]].pop(0)
# print Min
Range = currMax - Min[0]
ans = [Min[0],currMax]
# print Range

while(LoL[Min[1]]):
	# if not LoL[Min[1]]:
		# break
	heapq.heappush(li,( LoL[Min[1]][0],Min[1] ) )
	LoL[Min[1]].pop(0)

	currMax = max(li)[0]
	Min = heapq.heappop(li)
	tempRange = currMax - Min[0]
	if (tempRange < Range):
		Range = tempRange
		ans = [Min[0],currMax]
		# print ans

	# print LoL, tempRange, ans


print ans
# print mat
# print LoL
# print li









# myMin = min(x[cX],y[cY],z[cZ])
# myMax = max(x[cX],y[cY],z[cZ])
# myRange = myMax-myMin

# minRange = myRange
# minRmin = myMin
# minRmax = myMax

# print myMin, myMax, myRange

# while( (cX != len(x)) and (cY != len(y)) and (cZ != len(z)) ):
# 	myMin = min(x[cX],y[cY],z[cZ])
# 	myMax = max(x[cX],y[cY],z[cZ])
# 	myRange = myMax-myMin

# 	if myMin == x[cX]:
# 		cX +=1
# 	elif myMin == y[cY]:
# 		cY +=1
# 	elif myMin == z[cZ]:
# 		cZ +=1

# 	# print cX, cY,cZ

# 	if myRange < minRange:
# 		minRange = myRange
# 		minRmin = myMin
# 		minRmax = myMax

# 	print minRange, myMin, myMax
