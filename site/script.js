// Polyfills, tools, etc

HTMLElement.prototype.addClass = function(add) {
  this.className = this.className + " " + add;
}

HTMLElement.prototype.removeClass = function(remove) {
    var newClassName = "";
    var i;
    var classes = this.className.split(" ");
    for(i = 0; i < classes.length; i++) {
        if(classes[i] !== remove) {
            newClassName += classes[i] + " ";
        }
    }
    this.className = newClassName;
}


// Animation

var canvas = document.querySelector('#backdrop');
var defs = canvas.querySelector('defs');
var createSVGElement = document.createElementNS.bind(document,  'http://www.w3.org/2000/svg');
var setAttributes = (el, map) => Object.keys(map).forEach(k => el.setAttribute(k, map[k]));
var setXlink = (use, id) => use.setAttributeNS('http://www.w3.org/1999/xlink', 'xlink:href', `#${id}`);

var cos = Math.cos;
var sin = Math.sin;

//internal SVG coordinate system
var HEIGHT = 500;
var WIDTH = 1000;

var gradientColors = [
  ['#9012ef', '#ce6bdb'],
  ['#f0ad00', '#ce6bdb'],
  ['#60b4cc', '#8581b0'],
  ['#7fd13b', '#8581b0'],
  ['#5a6378', '#ce6bdb']
];

function createGradient([c1, c2], i) {
  var el = createSVGElement('radialGradient');
  var s1 = createSVGElement('stop');
  var s2 = createSVGElement('stop');

  setAttributes(el, {
    id: `gradient${i}`,
    cx: '50%',
    cy: '50%',
    r: '75%',
    fx: '0%',
    fy: '0%'
  });

  setAttributes(s1, {
    'stop-color': c1,
    offset: '0%'
  });

  setAttributes(s2, {
    'stop-color': c2,
    offset: '100%'
  });

  el.appendChild(s1);
  el.appendChild(s2);

  return el;
}

var gradients = gradientColors
  .map(createGradient)
  .forEach(el => defs.appendChild(el));

function rand2(a, b) {
  return a + Math.random() * (b - a);
}

function randomSquare() {
  var minWidth = 50;
  var x = rand2(-WIDTH, -minWidth*4);;
  var y = rand2(minWidth, HEIGHT - minWidth*4);
  var w = rand2(minWidth, minWidth * 4);
  var stroke = 'none';
  var fill = `url(#gradient${Math.floor(rand2(0, 5))})`;
  var className = 'shape';

  var el = createSVGElement('rect');
  setAttributes(el, {
    x, y, stroke, fill,
    width: w, height: w,
    class: className
  });
  return el;
}

function randomTriangle() {
  var minWidth = 25;
  var x = rand2(-WIDTH, -minWidth*4);
  var y = rand2(minWidth, HEIGHT - minWidth*4);
  var w = rand2(minWidth, minWidth * 4);
  var stroke = 'none';
  var fill = `url(#gradient${Math.floor(rand2(0, 5))})`;
  var className = 'shape';

  var el = createSVGElement('polygon');
  setAttributes(el, {
    stroke, fill,
    points: `${x},${y} ${x + w},${y + w} ${x},${y + 2*w}`,
    class: className
  });

  return el;
}

var shapes = [
  randomSquare(),
  randomSquare(),
  randomSquare(),
  randomSquare(),
  randomSquare(),
  randomTriangle(),
  randomTriangle(),
  randomTriangle(),
  randomTriangle(),
  randomTriangle()
];

function initialize(el) {
  canvas.appendChild(el);

  var vx = rand2(0.5, 2.5);
  var vr = rand2(0.09, 0.9);
  var initialR = rand2(0, 180);
  var initialX = -200;

  var x = initialX;
  var r = initialR;

  return function update() {
    x = x + vx;
    if(x > WIDTH*2) {
      x = 0;
    }

    r = (r + vr) % 360;

    el.setAttribute('style', `transform: translateX(${x}px) rotate(${r}deg);`);
  }
}

var initialized = shapes.map(initialize);

var t0 = 0;
function main(t) {
  var delta = t - t0;

  requestAnimationFrame(main);
  if(t0 && delta < 32) { return; }

  initialized.forEach(i => i());

  t0 = t;
}

requestAnimationFrame(main);

// Navigation

var $ = document.querySelector.bind(document);

window.onhashchange = function(e) {
  var newPage = window.location.hash.substr(1);
  if (!newPage) return;

  openContent(newPage);
};

function openContent(page) {
  $('.overlay').addClass('open');
  $('.content__page').removeClass('open');
  $('.' + page).addClass('open');
  window.location.hash = page;
}

function closeContent() {
  $('.content__page.open').removeClass('open');
  $('.overlay').removeClass('open');
  window.location.hash = '';
}