import string
import random

class Codec:

    alphabet = string.ascii_letters + '0123456789'

    def __init__(self):
        self.url2code = {}
        self.code2url = {}

    def encode(self, longUrl):
        while longUrl not in self.url2code:
            # x = random.choice(Codec.alphabet) for _ in range(6)
            # code = ''.join(x)
            code = ''.join(random.choice(Codec.alphabet) for _ in range(6))
            if code not in self.code2url:
                self.code2url[code] = longUrl
                self.url2code[longUrl] = code
        return 'http://tinyurl.com/' + self.url2code[longUrl]

    def decode(self, shortUrl):
        return self.code2url[shortUrl[-6:]]

# class Codec:

#     def __init__(self):
#         self.urls = []

#     def encode(self, longUrl):
#         self.urls.append(longUrl)
#         return 'http://tinyurl.com/' + str(len(self.urls)-1)

#     def decode(self, shortUrl):
#     	print shortUrl.split('/')[-1]
#     	a = shortUrl.split('/')[-1]
#     	b = int(a)
#         return self.urls[b]



codec = Codec()
test = codec.encode('https://leetcode.com/problems/design-tinyurl')
print test
print codec.decode(test)



