var c = document.querySelector('#backdrop');
var ctx = c.getContext('2d');

var HEIGHT = c.getAttribute('height');
var WIDTH = c.getAttribute('width');

ctx.fillStyle = 'white';
ctx.fillRect(0,0,WIDTH,HEIGHT);
