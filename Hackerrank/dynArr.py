#!/bin/python3

import math
import os
import random
import re
import sys

# Complete the dynamicArray function below.
def dynamicArray(n, queries):
    # print queries
    # print n
    
    lastAns = 0
    seqList = []
    
    for i in range(n):
        seqList.append([])
    fans = ''
    # seq = 0
    for query in queries:
        if (query[0] == 1):
            seq = (query[1]^lastAns)%n
            seqList[seq].append(query[2])    
        elif (query[0] == 2):
            seq = (query[1]^lastAns)%n
            size = query[2]%len(seqList[seq])
            lastAns = seqList[seq][size]
            print lastAns
            # fans = fans + str(lastAns)
    # print (fans)
    # return fans


# n = 2
# queries = [[1, 0, 5], [1, 1, 7], [1, 0, 3], [2, 1, 0], [2, 1, 1]]

f = open('testcase', 'r')
x = f.readlines()
f.close()
counter = 0
queries = []
for line in x:
    for lol in line:
        print lol
    # print line.split(' ') 
    break


# result = dynamicArray(n, queries)