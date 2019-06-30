let cleanRoom = function() {
  return new Promise(function(resolve, reject) {
    resolve('Cleaned Room');
  });
};

let removeGarbage = function(msg) {
  return new Promise(function(resolve, reject) {
    resolve(msg + ' remove Garbage');
  });
};

let winIceCream = function(msg) {
  return new Promise(function (resolve, reject) {
    resolve(msg + ' won icecream');
  });
 };

 cleanRoom().then(function(result) {
   return removeGarbage(result);
 }).then(function(result){
   return winIceCream(result);
 }).then(function(result){
   console.log('finished ' + result);
 })

//  let promiseToCleanTheRoom = new Promise(function(resolve,reject) {
//   //cleaning the room
//   let isClean = false;
//   if(isClean){
//       resolve('Cleaned');
//   } else {
//       reject('Not Cleaned');
//   }
// });


// promiseToCleanTheRoom.then(function(fromResolve) {
//   console.log('the room is ' + fromResolve); 
// }).catch(function(fromReject){
//   console.log('the room is ' + fromReject);
// })


// ============================================================================================================

$.ajax({
  url: "a.json",
  success: function(r) {
    $.ajax({
      url: "b.json" + r.a,
      success: function(result) {
        $("#div1").html(result);
      }
    });
  }
});

// Just nicer to look at
var p1 = new Promise(function(resolve, reject) {
  resolve($.ajax("a.json"));
});

p1.then(function(r){
  return new Promise()
}).then(function(result){
  $("#div1").html(result);
})