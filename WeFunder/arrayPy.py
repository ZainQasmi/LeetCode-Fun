


class Node:

	def __init__(self, data=None):
		self.data = data
		self.next = None
		# self.prev = None
		
	def __int__(self):
		return self.data

	def __str__(self):
		return str(self.data)


class LinkedList(object):
	size = 0

	def __init__(self):
		self.head = None


	def insert_at_head(self, elem):
		self.size +=1
		if self.head == None:
			self.head = Node(elem)
		else:
			newNode = Node(elem)
			newNode.next = self.head
			self.head = newNode

	def search(self, elem):
		curr = self.head
		while(curr != None):
			if curr.data == elem:
				return curr
			curr = curr.next
		return False


	def delete(self, data):
	    current = self.head
	    previous = None
	    found = False
	    while current and found is False:
	        if current.data == data:
	            found = True
	        else:
	            previous = current
	            current = current.next
	    if current is None:
	        raise ValueError("Data not in list")
	    if previous is None:
	        self.head = current.next
	    else:
	        previous.next = current.next

	def remove(self, elem):
		self.size -= 1

		curr = self.head
		prev = None
		
		while curr != None:
			if curr.data == elem:
				if (prev and self.head.next) == None:
					self.head = None
				elif prev is None:
					self.head = self.head.next
				else:
					prev.next = curr.next
				return True
			else:
				prev = curr
				curr = curr.next

		return False

	

	def print_all(self):
		temp = self.head

		while(temp != None):
			print temp,
			temp = temp.next





def main():
	myLL = LinkedList()
	myLL.insert_at_head(1)
	myLL.insert_at_head(2)
	myLL.insert_at_head(3)
	myLL.insert_at_head(4)
	myLL.insert_at_head(5)
	
	# myLL.print_all()
	# myLL.delete(5)
	# myLL.remove(1)
	myLL.remove(1)
	# myLL.remove(2)
	# myLL.remove(3)
	# myLL.remove(4)
	# myLL.remove(5)
	myLL.print_all()

	# print myLL.search(1)
	# print myLL.search(2)
	# print myLL.search(3)
	# print myLL.search(4)
	# print myLL.search(5)



if __name__ == "__main__":
	main()
