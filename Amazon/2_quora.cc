#include <iostream>

using namespace std;


int maxIndexDiff(int arr[],int n){
	int maxDiff;
	int i,j;

	int rmax[n];
	int lmin[n];

	lmin[0] = arr[0];

	for (i=1; i<n; ++i){
		lmin[i] = min(arr[i],lmin[i-1]);
	}

	cout << "Print Min Arr" << endl; 
	for (i=0;i<n;++i){
		cout << lmin[i] << " ";
	}
	cout << endl;

	rmax[n-1] = arr[n-1];

	for (j=n-2;j>=0;--j){
		rmax[j] = max(arr[j],rmax[j+1]);
	}

	cout << "Print Max Arr" << endl; 
	for (j=0;j<n;++j){
		cout << rmax[j] << " ";
	}
	cout << endl;


	i=0;	j=0;	maxDiff=-1;

	while(j<n && i<n){
		cout << "lmin " << i << ":" << lmin[i] << " rmax " << j << ":" << rmax[j] <<  "  MD::" << maxDiff << endl; 
		if (lmin[i] < rmax[j]){
			maxDiff = max(maxDiff,j-i);
			j++;
		}
		else if (lmin[i] >= rmax[j]){
		// else{
			i++;
		}

	}
	return maxDiff;



	// return 0;

}


int main(){

	// int arr[] = {9, 2, 3, 4, 5, 6, 7, 8, 18, 0}; int n = 10; 
	// int arr[] = {6, 5, 4, 3, 2, 1}; int n = 6;
	int arr[] = {34, 8, 10, 3, 2, 80, 30, 33, 1}; int n = 9;
	// int arr[] = {1, 2, 3, 4, 5, 6}; int n = 6;
    // cout << 10 << endl; 
    int maxDiff = maxIndexDiff(arr, n); 
    cout << "maxDiff: " << maxDiff <<endl;
    // Console.Write(maxDiff); 


}