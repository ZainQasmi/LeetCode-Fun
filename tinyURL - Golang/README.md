# tinyURL

### Getting started

* Uses fixed length SHA-1 hash. 
```
go run tinyURL_hash.go
```

```
Encoded :: http://tinyurl.com/bf8b4530
Decoded :: https://picsum.photos/
Encoded :: http://tinyurl.com/c4ea21bb
Decoded :: https://www.example.com/
Encoded :: http://tinyurl.com/9842926a
Decoded :: http://blow.example.com/?bit=back
Encoded :: http://tinyurl.com/a42c6cf1
Decoded :: https://www.example.com/
Encoded :: http://tinyurl.com/8dc00598
Decoded :: https://books.example.com/army/bird
Encoded :: http://tinyurl.com/2d0134ed
Decoded :: http://aftermath.example.com/angle
Encoded :: http://tinyurl.com/5d1be7e9
Decoded :: http://www.example.net/boundary/bone.php
Encoded :: http://tinyurl.com/8d883f15
Decoded :: https://example.com/#account
Encoded :: http://tinyurl.com/ac9231da
Decoded :: https://www.example.org/
Encoded :: http://tinyurl.com/adc83b19
Decoded :: https://www.example.com/#bait
Encoded :: http://tinyurl.com/067d5096
Decoded :: https://blow.example.com/
```

* Uses base-62 number conversion
```
go run tinyURL_62bit.go
```

```
Encoded :: http://tinyurl.com/b
Decoded :: https://picsum.photos/
Encoded :: http://tinyurl.com/c
Decoded :: https://www.example.com/
Encoded :: http://tinyurl.com/d
Decoded :: http://blow.example.com/?bit=back
Encoded :: http://tinyurl.com/e
Decoded :: https://www.example.com/
Encoded :: http://tinyurl.com/f
Decoded :: https://books.example.com/army/bird
Encoded :: http://tinyurl.com/g
Decoded :: http://aftermath.example.com/angle
Encoded :: http://tinyurl.com/h
Decoded :: http://www.example.net/boundary/bone.php
Encoded :: http://tinyurl.com/i
Decoded :: https://example.com/#account
Encoded :: http://tinyurl.com/j
Decoded :: https://www.example.org/
Encoded :: http://tinyurl.com/k
Decoded :: https://www.example.com/#bait
Encoded :: http://tinyurl.com/l
Decoded :: https://blow.example.com/
```


