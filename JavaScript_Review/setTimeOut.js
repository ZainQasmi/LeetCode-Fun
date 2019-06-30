setTimeout(function() {
    console.log('a');
}, 0);

console.log('b');
console.log('c');


// output: b, c, a
// a becomes asynchronous with setimeout...it has to wait for everything on stack to finish first