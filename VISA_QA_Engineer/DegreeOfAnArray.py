#!/bin/python

import math
import os
import random
import re
import sys



#
# Complete the 'degreeOfArray' function below.
#
# The function is expected to return an INTEGER.
# The function accepts INTEGER_ARRAY arr as parameter.
#

def degreeOfArray(arr):
    # Write your code here
    # print arr

    left_dict = {}
    right_dict = {}
    counter = {}

    for i, num in enumerate(arr):
        if num not in left_dict:
            left_dict[num] = i
        right_dict[num] = i
        # using get is safer because key is not present on first instance
        counter[num] = counter.get(num,0) + 1

    degree = max(counter.values())    
    temp = len(arr)
    
    for val in counter:
        if counter[val] == degree:
            temp = min(temp, right_dict[val] - left_dict[val] + 1)
    
    # print temp
    return temp

    
if __name__ == '__main__':