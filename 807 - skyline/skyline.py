class Solution(object):
    def maxIncreaseKeepingSkyline(self, grid):
        """
        :type grid: List[List[int]]
        :rtype: int
        """
        old_sum = sum(sum(grid, []))
        
        t_grid = zip(*grid)
        
        UD_max = []
        for oneList in t_grid:
            UD_max.append(max(oneList))
        # print UD_max
        
        LR_max = []
        for oneList in grid:
            LR_max.append(max(oneList))
        # print LR_max
        
        print
        
        for i in range(len(grid)):
            for j in range(len(grid)):
                grid[i][j] = min(UD_max[j],LR_max[i])

        new_sum = sum(sum(grid, []))
        
        return new_sum-old_sum