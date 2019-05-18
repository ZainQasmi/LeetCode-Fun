
def findDuplicates(nums):
    """
    :type nums: List[int]
    :rtype: List[int]
    """
    
    mySet = set()
    for i in range(len(nums)):
        index = abs(nums[i])-1
        if nums[index] < 0:
            mySet.add(abs(nums[i]))
        else:
            nums[index] = -nums[index]
            
    return mySet
        


myArr = [4,3,2,7,8,2,3,1]
print findDuplicates(myArr)