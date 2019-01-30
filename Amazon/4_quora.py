import sys
import collections
import operator 

def find_most_common_words(textfile, top):    

    textfile = open(textfile)
    text = textfile.read().lower()
    textfile.close()

    # words = collections.Counter(text.split()) # how often each word appears
    # return dict(words.most_common(top))

    words = {}
    for word in text.split():
    	if word in words:
    		words[word] +=1
    	else:
    		words[word] = 1 
    return dict(sorted(words.items(), key=operator.itemgetter(1), reverse=True)[:top])

filename = sys.argv[1]
top_five_words = find_most_common_words(filename, 5)
print top_five_words	