/* eslint-disable indent */
let express = require('express');
let app = express();

app.get('/', function(req, res) {
	res.send('Hello World!');
});
app.listen(3000, function() {
	console.log('Example app listening on port 3000!');
});

// JS - The Good Parts

/* # 1
block {
}
*/

/*
#2
No space between a function and (
One space between all other names and (

function () {
	...
} (); // Syntax Error

*/

/*
#3 Dont rely on automatic semicolon insertion
Always put semicolons

Always use triple equals ===
*/

/*
for (var i ...) {...}

var i is NOT scoped to the loop...instantiate it above

ALWAYS USE LETS...it respects block scope.
*/

/*
use UPPER_CASE for global variables

use +=1 instead of ++
*/


