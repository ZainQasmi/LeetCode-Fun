package main

import (
	"fmt"
	"strings"
)

// Global slice. Holds all the URLs
var URL_BANK[] string

func encode(longURL string) string {
	var n int = len(URL_BANK)+1
	URL_BANK = append(URL_BANK, longURL)

	// 62-bit map
	charMap := "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	
	// Convert unique id "n" to a base 62 number
	var shorturl string
	for n>0 {
        shorturl += string(charMap[n % 62])
        n = n / 62
	}
	// Reverse shorturl to complete base conversion
	shorturl = Reverse(shorturl)

	return "http://tinyurl.com/" + shorturl
}

func decode(shortURL string) string {
	foundIndex := strings.LastIndex(shortURL, "/")
	parsedURL := shortURL[foundIndex+1:]
	
	id := 0; // init output
	for i := 0; i < len(parsedURL); i++ {
		if ('a' <= parsedURL[i] && parsedURL[i] <= 'z') {
			id = id * 62 + int(parsedURL[i]) - int('a');
		}	
		if ('A' <= parsedURL[i] && parsedURL[i] <= 'Z') {
			id = id * 62 + int(parsedURL[i]) - int('A') + 26;
		}	
		if ('0' <= parsedURL[i] && parsedURL[i] <= '9') {
			id = id * 62 + int(parsedURL[i]) - int('0') + 52;
		}		
	}
	return URL_BANK[id-1]; // unique id maps to longURL in vector
}

// Helper function to reverse string
func Reverse(s string) string { 
    n := len(s)
    runes := make([]rune, n)
    for _, rune := range s {
        n--
        runes[n] = rune
    }
    return string(runes[n:])
}

func main() {
	longURLs := []string {
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
	"https://blow.example.com/" }

	var shortURL string
	for i:=0; i<len(longURLs); i++ {
		shortURL = encode(longURLs[i])
		fmt.Println("Encoded ::",shortURL)
		fmt.Println("Decoded ::",decode(shortURL)) 
	}
}