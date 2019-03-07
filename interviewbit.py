# Problem Statement(Interviewee)
# Stairs
# You are climbing a stair case. It takes n steps to reach to the top.

# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

# Example :

# Input : 3
# Return : 3

# Steps : [1 1 1], [1 2], [2 1]



class Solution:
    # @param A : integer
    # @return an integer
    def climbStairs(self, A):
        
        if A == 0 or A == 1:
            return 1
            
        return self.climbStairs(A-1) + self.climbStairs(A-2)
        
        def recursive(A, counter):
            if A == 0:
                return counter+=1
            else:
                if A%2 == 0:
                    return recursive(A-2,counter)
                else:
                    return recursive(A-1,counter)
                
        
        return recursive(A,0)
        
        
        
    class Solution {
        public:
            int climbStairs(int n) {
            int ways[n+1];
            ways[0] = 1;
            ways[1] = 1;
            for (int i = 2; i <= n; i++) ways[i] = ways[i - 1] + ways[i - 2];
            return ways[n];
    }
};

class Solution:
    # @param A : integer
    # @return an integer
    def climbStairs(self, A):
        DP = [1]*(A+1)
        for i in range(2, A+1):
            DP[i] = DP[i-1] + DP[i-2]
        return DP[A]
            
            
'''
f(n) = f(n-1) + f(n-2)

F(4) = F(3) + F(2)


fib(n) = f(n-1) + f(n-2)

'''
    
        
        
        
        
    # 4:
    # 1  1  1  1
    # 2 2
    # 1 2 1
    # 2 1 1
    # 1 1 2
