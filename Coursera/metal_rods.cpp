/*
Mr. Octopus has recently shut down his factory and want to sell off his metal rods to a local businessman.
In order to maximize profit, he should sell the metal of same size and shape. If he sells  metal rods of length , he receives N x L x metal_price. The remaining smaller metal rods will be thrown away. To cut the metal rods, he needs to pay cost_per_cut for every cut.

What is the maximum amount of money Mr. Octopus can make?

Input Format 
First line of input contains cost_per_cut 
Second line of input contains metal_price 
Third line contains L, the number of rods Mr. Octopus has, followed by L integers in each line representing length of each rod.

Output Format 
Print the result corresponding to the testcase.

Constraints 
1 <= metal_price, cost_per_cut <= 1000 
1 <= L <= 50 
Each element of lenghts will lie in range [1, 10000].

Sample Input#00

1
10
3
26
103
59
Sample Output#00

1770
Explanation Here cuts are pretty cheap. So we can make large number of cuts to reduce the amount of wood wasted. Most optimal lengths of rods will be . So we will cut  pieces of length  from  rod, and throw peice of length  from it. Similarly we will cut  pieces of length  from  rod and throw away a piece of length . From  rod, we will cut  pieces of length  and throw a piece of length . So in total we have pieces of length  and we have made  cuts also. So total profit is 
30 x 6 x 10 - 30 x 1 = 1770

Sample Input#01

100
10
3
26
103
59
Sample Output#01

1230
Explanation Here we will throw smallest rod entirely and cut the pieces of length 51 from both left. So profit is 

3 x 51 x 10 - 3 x 100 = 1230
    
*/



#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

int mostFrequent(int* arr, int n) 
{ 
    // Sort the array 
    sort(arr, arr + n); 
    // find the max frequency using linear traversal 
    int max_count = 1, res = arr[0], curr_count = 1; 
    for (int i = 1; i < n; i++) { 
        if (arr[i] == arr[i - 1]) 
            curr_count++; 
        else { 
            if (curr_count > max_count) { 
                max_count = curr_count; 
                res = arr[i - 1]; 
            } 
            curr_count = 1; 
        } 
    } 
    // If last element is most frequent 
    if (curr_count > max_count) 
    { 
        max_count = curr_count; 
        res = arr[n - 1]; 
    }  
    return res; 
}


int getProfit(int* rods, int cutCost, int metalPrice, int L, int n) {
    
    
    int profit2 = 0;
    
    int mF = mostFrequent(rods,n);
    for (int i=0; i<n; i++){
        if (rods[i] == mF){
            profit2 += mF;
        }
    }
    
    int profit = 0;
    int profit3 = 0;
    // cout << L << endl;
    for(int i=0; i<n; i++) {
        if (rods[i]%L==0){
            profit += (rods[i]*metalPrice)-((rods[i]/L - 1)*cutCost);
            profit3 += (rods[i]*metalPrice)-((rods[i]/L - 1)*cutCost);
        } else {
            if (rods[i] > cutCost) {
                profit3 += ((rods[i] - rods[i]%L)*metalPrice)-((rods[i]/L)*cutCost);                
            } 
            profit += ((rods[i] - rods[i]%L)*metalPrice)-((rods[i]/L)*cutCost);

        }
    }
    int localMax = max(profit,profit3);
    return max(localMax,profit2*metalPrice);
}

int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */   
    int n;
    int cutCost;
    int metalPrice;
    cin>>cutCost>>metalPrice>>n;
    int rods[n];
    for(int i=0; i<n; i++)
        cin>>rods[i];
    int maxProfit = 0;
    for (int L = 1; L <= 1000; ++L)
    {
        int profit= getProfit(rods, cutCost, metalPrice, L,n);
        if (profit > maxProfit)
            maxProfit = profit;
    }
    cout<<maxProfit;  
    return 0;
}