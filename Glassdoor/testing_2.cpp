#include <iostream>
#include <stdio.h>
using namespace std;

class emptyClass {
    int a = 10;
};
main(int count, char *args[]) {
   extern int i;
    //int i = 10;
   cout<<i<<endl;
   cout<<args[0]<<endl;
   cout<<sizeof(long)<<endl;
   int *a = NULL;

   cout << sizeof(emptyClass) << endl;
    string name = "ZAIN";
    int id = 10;
    printf ("%s \n", "A string");

}
int i = 20;
