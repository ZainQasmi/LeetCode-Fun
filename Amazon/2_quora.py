# Given an array,find the maximum j – i such that arr[j] > arr[i]
# https://www.geeksforgeeks.org/given-an-array-arr-find-the-maximum-j-i-such-that-arrj-arri/

import copy

def maxJI(arr):
	
	lMin = copy.deepcopy(arr)
	lMin[0] = arr[0]
	rMax = copy.deepcopy(arr)
	rMax[-1] = arr[-1]

	for i in range(1,len(arr)):
		lMin[i] = min(lMin[i-1],arr[i])

	for j in range(len(arr)-2,-1,-1):
		rMax[j] = max(rMax[j+1],arr[j])

	i = 0
	j = 0
	maxDiff = -1
	while(i<len(arr) and j<len(arr)):
		if lMin[i] < rMax[j]:
			maxDiff = max(maxDiff,j-i)
			j += 1
		else:
			i += 1

	return maxDiff


def main():
	print "And so it begins"
	arr = [34, 8, 10, 3, 2, 80, 30, 33, 1]
	print "maxJI :: ",maxJI(arr)


if __name__=="__main__":
	main()

