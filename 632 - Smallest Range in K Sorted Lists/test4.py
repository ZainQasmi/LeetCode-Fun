import heapq

nums = [[4, 10, 15, 24, 26], [0, 9, 12, 20], [5, 18, 22, 30]]
# nums = [[3,10,15,24], [0,1,2,20], [1,18,21,30]]
# nums = [[4, 7, 9, 12, 15], [0, 8, 10, 14, 20], [6, 12, 16, 30, 50]]
# nums = [[1,2,3],[1,2,3],[1,2,3]]

li = [(row[0], i, 0) for i, row in enumerate(nums)]
heapq.heapify(li)

ans = -1e9, 1e9
currMax = max(row[0] for row in nums)

while li:
    Min, i, j = heapq.heappop(li)
    if currMax - Min < ans[1] - ans[0]:
        ans = Min, currMax
    if (j + 1) == len(nums[i]):
        print ans
        break;

    v = nums[i][j+1]
    print currMax
    currMax = max (currMax, v)
    heapq.heappush(li, (v, i, j+1))