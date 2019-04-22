#include <iostream>
#include <algorithm>
#include <string>
#include <vector>

using namespace std;

class TinyURL {

	private:
		vector<string> URL_BANK;

	public:
		string encode(string longURL) {
			int n = URL_BANK.size()+1;			
			URL_BANK.push_back(longURL);

			// 62-Bit Map
			char map[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

			// Convert unique id "n" to a base 62 number
			string shorturl;
			while (n) {
				// use above map to store actual character in short url
				shorturl.push_back(map[n % 62]);
				n = n / 62;
			}
			// Reverse shortURL to complete base conversion
			reverse(shorturl.begin(), shorturl.end());

			return "http://tinyurl.com/" + shorturl;
		}

		string decode(string shortURL) {
			int foundIndex = shortURL.find_last_of("/");
			string parsedURL = shortURL.substr(foundIndex+1);

			long id = 0; // initialize result

			// Convert base 62 number back to unique id
			for (int i = 0; i < parsedURL.length(); i++) {
				if ('a' <= parsedURL[i] && parsedURL[i] <= 'z')
					id = id * 62 + parsedURL[i] - 'a';
				if ('A' <= parsedURL[i] && parsedURL[i] <= 'Z')
					id = id * 62 + parsedURL[i] - 'A' + 26;
				if ('0' <= parsedURL[i] && parsedURL[i] <= '9')
					id = id * 62 + parsedURL[i] - '0' + 52;
			}
			return URL_BANK[id-1]; // unique id maps to longURL in vector
		}
};

int main() {
	
	string longURLs[] = {
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
		"https://blow.example.com/"
	};

	TinyURL tinyUrl;

	for (string longURL : longURLs) {
		string shorturl = tinyUrl.encode(longURL);
		cout << "Encoded :: " << shorturl << endl;
		cout << "Decoded :: " << tinyUrl.decode(shorturl) << endl;
	}
}
