# Python 3 for finding minimum
# operation required

# function for finding array sum


def arraySum(arr, n):

    sm = 0
    i = 0

    while(i < n):
        sm = sm + arr[i]
        i = i + 1
    return sm

# function for finding smallest
# element


def smallest(arr, n):

    small = 1000000000

    for i in range(0, n):

        if (arr[i] < small):
            small = arr[i]
    return small


# function for finding min
# operation
def minOp(arr, n):

    # count = 0
    # arr.sort()
    # for i in range(1,len(arr)):
    #     count += arr[i]-arr[0]
    # return count

    count = 0
    arrMin = min(arr)
    for i in range(1,len(arr)):
        count += arr[i] - arrMin
    return count

    # return sum(arr) - (n * min(arr))


# Driver function
arr = [2,3,6,6,5]
# arr = [5, 6, 2, 4, 3]
n = len(arr)
print("Minimum Operation = ", minOp(arr, n))

# This code is contributed by Nikita Tiwari.
# https://www.geeksforgeeks.org/minimum-number-increment-operations-make-array-elements-equal/
