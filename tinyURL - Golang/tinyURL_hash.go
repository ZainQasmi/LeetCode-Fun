package main

import (
	"fmt"
	"strings"
	"crypto/sha1"
	"encoding/hex"
)

// Global dictionary. Holds key-value pairs of hashval against URL
var URL_MAP = make(map[string]string)

// Helper function to return string hash of given unique integer ID
func getHash(id int) string{
	byteCode := []byte(string(id))
	hashVal := sha1.Sum(byteCode)
	return hex.EncodeToString(hashVal[:])[:8]
}

func encode(longURL string) string {
	var n int = len(URL_MAP)+1
	shorturl := getHash(n)
	URL_MAP[shorturl] = longURL
	return "http://tinyurl.com/" + shorturl
}

func decode(shortURL string) string {
	foundIndex := strings.LastIndex(shortURL, "/")
	parsedURL := shortURL[foundIndex+1:]
	return URL_MAP[parsedURL]
}

func main() {
        longURLs := []string{
		"https://picsum.photos/",
		"https://www.example.com/",
		"http://blow.example.com/?bit=back",
		"https://www.example.com/",
		"https://books.example.com/army/bird",
		"http://aftermath.example.com/angle",
		"http://www.example.net/boundary/bone.php",
		"https://example.com/#account",
		"https://www.example.org/",
		"https://www.example.com/#bait",
		"https://blow.example.com/"}

		// fmt.Println(longURLs)

		var shortURL string
		for i:=0; i<len(longURLs); i++ {
			shortURL = encode(longURLs[i])
			fmt.Println("Encoded ::",shortURL)
			fmt.Println("Decoded ::",decode(shortURL)) 
		}
}