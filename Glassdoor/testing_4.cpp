#include <iostream>

using namespace std;

void F(int *A, int *B,int N) {
    int total=1;
    for (int i=0; i<N;i++) {
        B[i] = total;
        total *= A[i];
    }
    /*
    for (int i=0; i<N;i++) {
        if (A[i] != 0) {
            B[i] = total/A[i];
        }
    }
    */
    for (int i=0; i<N;i++) {
        cout << B[i] << endl;
    }
    total = 1;
    for (int i = N - 1; i >= 0; --i) {
        B[i] *= total;
        total *= A[i];
    }
    for (int i=0; i<N;i++) {
        cout << B[i] << endl;
    }
}


int main() {

    int N = 4;
    int myArr[N] = {2,1,5,9};
    int *A = myArr;
    int myArr2[N];
    int *B = myArr2;
    F(A,B,N);

}
