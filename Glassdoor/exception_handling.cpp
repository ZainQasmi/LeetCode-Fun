#include <iostream>
using namespace std;
class A {
public:
    A() {}
    ~A() {
        //throw 42;
        cout << "lol" << endl;
    }
};

int main(int argc, const char * argv[]) {
    try {
        A a;
        //throw 32;
    } catch(int a) {
        std::cout << a;
    }
    A b;
    cout << "lol2" << endl;
}
