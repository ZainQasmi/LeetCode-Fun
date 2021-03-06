# class Person:

# 	capacity = 10
# 	size = 0
	
# 	items = [None] * capacity

# 	def __init__(self):
		# pass
		# self.name = name
		# self.age = age

# p1 = Person("John", 36)
# print(p1.name)
# print(p1.age)


# Python code to demonstrate working of  
# heapify(), heappush() and heappop() 
  
# importing "heapq" to implement heap queue 
import heapq 
  
# initializing list 
li = [5, 7, 9, 1, 3] 
  
# using heapify to convert list into heap 
heapq.heapify(li) 
  
# printing created heap 
print ("The created heap is : ") 
print (list(li)) 
  
# using heappush() to push elements into heap 
# pushes 4 
heapq.heappush(li,4) 
  
# printing modified heap 
print ("The modified heap after push is : ") 
print (list(li)) 
  
# using heappop() to pop smallest element 
print ("The popped and smallest element is : ") 
print (heapq.heappop(li)) 

print ("The popped and smallest element is : ") 
print (heapq.heappop(li)) 

print ("The popped and smallest element is : ") 
print (heapq.heappop(li)) 

print ("The popped and smallest element is : ") 
print (heapq.heappop(li)) 