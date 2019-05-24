// 1) Event Delegation
// JS event listeners fire only only on a single DOM element but on all its descendants

// 2) Event Bubbling
// Inverse of this. Also known as propagation, events on an element will "bubble up" 
// and also fire on all parents

// 3) IIFE - immediately invoked function expression
// Used to control variable scope. Variables not available outside the function
// This is how jQuery works

(function foo(){
	// i pity this code
})();

// 4) Difference between both

function foo(){
	// function definition or statement
}

var foo = function(){
	// expression
	// resolves to a value even if just "undefined"
}

// 5) Why is it a good idea to leave global scope of a website as-is and never touch it?
// Reduce collision
// Maintain independence
// Easier to write your own code

// 6) HOISTING
// All variables (var) are declared at the top of any given function scope 
// (includes function declarations)

function hoist(track){
	var action;
	if (track === 'Down With Disease'){
		// var action = 'dance';
		action = 'dance';
	}
	else {
		var action = 'skip';
	}
	// var action;
	return action;

}

// var is function scoped

// ES6 - ENTER const and let
// Not hoisted
// Scoped within the block they are in
// Gives you more control

// 7) Difference between a variable that is null, undefined and undeclared

const bar = foo + 1; // undeclared - foo is not defined.

// undefined - you've declared it. But it does not have a value assigned
let foo;
let bar = {};
let baz = ['johnny', 'phil', 'ed'];
const qux = function(){
	// dont return anything
};

console.log(foo, bar.name, baz[4], qux()); // ALL are undefined

const quxx; // Missing initializer in const declaration;

const quux = null;
console.log(quux); //print null...like a placeholder assignment 
// for something that may have other value...
// a "nothing" value

// 7) (a) How to check for these states?

// Use a Linter

// global scope
foo = 5;
console.log(foo);
// prints 5! IMPLIED GLOBAL...another reason to hate JS

// Check for undefined

let foo
console.log(typeof foo); // "undefined" as a string...wtf?
console.log(typeof bar); // undeclared, but also returns "undefined"

// preferred 
console.log (foo === undefined); //true Boolean

const baz = 'undefined';
console.log(baz === undefined); // FALSE...YASSSSS 



// 8) Difference between '==' and '==='
// == forces a conversion to the same type, whereas === does not, i.e., == does more work than ===.


// 9) Event Loop





































