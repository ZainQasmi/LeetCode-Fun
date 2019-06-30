// lexical scoping

// The returning function would hold its environment...all the variables it needs


let obj = function() {
    let i = 0;

    return {
        setI(k) {
            i=k;
        }, 
        getI() { 
            return i;
        }
    }
} 


let x = obj()
x.setI(2);
console.log(x.getI()); // returns 2

x.setI(4);
console.log(x.getI()); // returns 4

// can inspect element in chrome and check closure property