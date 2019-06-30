# ANSWER: [('thou', 5485), ('thy', 4032), ('shall', 3591), ('thee', 3178), ('lord', 3059)]

import requests 
from collections import Counter
from itertools import chain
import string

data = requests.get(url = 'https://ocw.mit.edu/ans7870/6/6.006/s08/lecturenotes/files/t8.shakespeare.txt') 
data = data.content
data = data.splitlines()
stopwords = requests.get(url = "https://gist.githubusercontent.com/sebleier/554280/raw/7e0e4a1ce04c2bb7bd41089c9821dbcf6d0c786c/NLTK's%2520list%2520of%2520english%2520stopwords")  
stopwords = stopwords.content
stopwords = stopwords.splitlines()

punct = "!\"#$%&'()*+,-./:;<=>?@[\]^_`{|}~"

def remove_stopwords_punctuation(word_list):
        processed_word_list = []
        for word in word_list:
            word = word.lower()
            # word = word.strip(string.punctuation)
            # word = word.strip(punct)
            if word not in stopwords:
                processed_word_list.append(word)
        return processed_word_list

total_words_LoL = []

count = 0
for line in data:
    count +=1
    if count <= 244:
        continue
    else:
        total_words_LoL.append((remove_stopwords_punctuation(line.split())))

print (Counter(list(chain(*total_words_LoL))).most_common(5))

