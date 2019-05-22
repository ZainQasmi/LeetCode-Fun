// Return sum of all vectors in O(1)
// All vectors have size < 1000
// All vectors have consecutive integers e.g. [4,5,6,7]

int returnTotalSum(vector<int> v1, vector<int> v2, vector<int> v3, vector<int> v4) {

	int sumV1 = (v1.size() * (v1[0] + v1[v1.size()-1]))/2;
	int sumV2 = (v2.size() * (v2[0] + v2[v2.size()-1]))/2;
	int sumV3 = (v3.size() * (v3[0] + v3[v3.size()-1]))/2;
	int sumV4 = (v4.size() * (v4[0] + v4[v4.size()-1]))/2;
	
	return sumV1+sumV2+sumV3+sumV4;
}