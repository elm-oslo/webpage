// Polyfills, tools, etc

HTMLElement.prototype.addClass = function(add) {
  if (/open/.test(this.className)) return;

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
  ['#f0ad00', '#ce6bdb'],
  ['#60b4cc', '#8581b0'],
  ['#7fd13b', '#8581b0'],
  ['#5a6378', '#ce6bdb']
];

var sizes = [
  1,
  2, 2,
  3, 3, 3,
  4, 4, 4, 4,
  5, 5, 5, 5,
  6, 6, 6,
  7, 7,
  8
]

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

function spread(n, min, max) {
  var step = (max-min)/n;
  var ret = [];
  for (var i = 1; i < n+1; i++) {
    ret.push(min + i*step);
  }
  return ret;
}

function randomSquare(x) {
  var minWidth = 40;
  var y = rand2(minWidth, HEIGHT - minWidth * 8);
  var w = minWidth * sizes[Math.floor(rand2(0,20))];
  var stroke = 'none';
  var fill = `url(#gradient${Math.floor(rand2(0, 8))})`;
  var className = 'shape';

  var el = createSVGElement('rect');
  setAttributes(el, {
    x, y, stroke, fill,
    rx: 3, ry: 3,
    width: w, height: w,
    class: className
  });
  return {el, x};
}

function randomTriangle(x) {
  var minWidth = 30;
  var y = rand2(minWidth, HEIGHT - minWidth * 16);
  var w = minWidth * sizes[Math.floor(rand2(0,20))];
  var stroke = 'none';
  var fill = `url(#gradient${Math.floor(rand2(0, 8))})`;
  var className = 'shape';

  var el = createSVGElement('path');
  setAttributes(el, {
    stroke, fill,
    d: `M${x},${y} L${x + w},${y + w} L${x},${y + 2*w} Z`,
    class: className
  });

  return {el, x};
}

var xs = spread(8, -WIDTH, WIDTH);
var shapes = [
  randomSquare(xs[0]),
  randomTriangle(xs[1]),
  randomSquare(xs[2]),
  randomTriangle(xs[3]),
  randomSquare(xs[4]),
  randomTriangle(xs[5]),
  randomSquare(xs[6]),
  randomTriangle(xs[7])
];

function initialize({el, x: initialX}) {
  canvas.appendChild(el);

  var endVX = rand2(0.5, 2);
  var vx = endVX;
  var endVR = rand2(0.09, 0.45);
  var vr = endVR;
  var initialR = rand2(45, 360-45);

  var x = 0;
  var r = initialR;

  return function update() {
    x = x + vx;
    if(initialX + x > WIDTH*1.5) {
      x = initialR > 0 ? -1.75*WIDTH : 0;
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
  if(t0 && delta < 16) { return; }

  initialized.forEach(i => i());

  t0 = t;
}

requestAnimationFrame(main);




document.addEventListener("DOMContentLoaded", function(e) {
  setTimeout(function() {
    document.querySelectorAll('.animate').forEach(function(node) {
      if (node.addClass) node.addClass('animate-start');
      else node.className += 'animate-start';
      
    })
  }, 300);
});


// Navigation

var $ = document.querySelector.bind(document);

function trackPage() {
  ga('send', 'pageview', {
   'page': window.location.pathname + window.location.search  + window.location.hash
  });
}

function render(e) {
  var newPage = window.location.hash.substr(1);
  if (!newPage) return closeContent();

  trackPage();
  openContent(newPage);
};

(function(window) {
    var newPage = window.location.hash.substr(1);
    if (!newPage) return;
    trackPage();

    openContent(newPage);
})(window);

var menuItems = document.querySelectorAll('.content__menu-item');
Array.prototype.forEach.call(menuItems, function(n) {
  n.addEventListener('click', function(e) {
    var page = n.href.substr(n.href.lastIndexOf('#') + 1);
    $('.' + page).addClass('no-transform');
  });
});

function openContent(page) {
  window.scrollTo(0, 0);
  var current = $('.content__page.open')
  if (current) current.removeClass('open');
  $('.' + page).addClass('open');
  $('.overlay').addClass('open');
  $('main').addClass('content-open');
  window.location.hash = page;
}

function closeContent() {
  var current = $('.content__page.open')
  if (current) {
    current.removeClass('open');
    current.removeClass('no-transform');
  }
  $('.overlay').removeClass('open');
  $('main').removeClass('content-open');
  window.location.hash = '';
}

function showSpeaker(speakerNo) {
  setTimeout(function () {
    document.querySelectorAll('.speaker')[speakerNo].scrollIntoView();
  }, 5);
}

window.onhashchange = render;
render();

