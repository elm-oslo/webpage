const canvas = document.querySelector('#backdrop');
const defs = canvas.querySelector('defs');
const createSVGElement = document.createElementNS.bind(document,  'http://www.w3.org/2000/svg');
const setAttributes = (el, map) => Object.keys(map).forEach(k => el.setAttribute(k, map[k]));
const setXlink = (use, id) => use.setAttributeNS('http://www.w3.org/1999/xlink', 'xlink:href', `#${id}`);

const cos = Math.cos;
const sin = Math.sin;

//internal SVG coordinate system
const HEIGHT = 500;
const WIDTH = 1000;

const gradientColors = [
  ['#9012ef', '#ce6bdb'],
  ['#f0ad00', '#ce6bdb'],
  ['#60b4cc', '#8581b0'],
  ['#7fd13b', '#8581b0'],
  ['#5a6378', '#ce6bdb']
];

function createGradient([c1, c2], i) {
  const el = createSVGElement('radialGradient');
  const s1 = createSVGElement('stop');
  const s2 = createSVGElement('stop');

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

const gradients = gradientColors
  .map(createGradient)
  .forEach(el => defs.appendChild(el));

function rand2(a, b) {
  return a + Math.random() * (b - a);
}

function randomSquare() {
  const minWidth = 50;
  const x = rand2(-WIDTH, -minWidth*4);;
  const y = rand2(minWidth, HEIGHT - minWidth*4);
  const w = rand2(minWidth, minWidth * 4);
  const stroke = 'none';
  const fill = `url(#gradient${Math.floor(rand2(0, 5))})`;
  const className = 'shape';

  const el = createSVGElement('rect');
  setAttributes(el, {
    x, y, stroke, fill,
    width: w, height: w,
    class: className
  });
  return el;
}

function randomTriangle() {
  const minWidth = 25;
  const x = rand2(-WIDTH, -minWidth*4);
  const y = rand2(minWidth, HEIGHT - minWidth*4);
  const w = rand2(minWidth, minWidth * 4);
  const stroke = 'none';
  const fill = `url(#gradient${Math.floor(rand2(0, 5))})`;
  const className = 'shape';

  const el = createSVGElement('polygon');
  setAttributes(el, {
    stroke, fill,
    points: `${x},${y} ${x + w},${y + w} ${x},${y + 2*w}`,
    class: className
  });

  return el;
}

const shapes = [
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

  const vx = rand2(0.5, 5);
  const vr = rand2(0.36, 1.8);
  const initialR = rand2(0, 180);
  const initialX = -200;

  let state = {
    x: initialX,
    r: initialR
  }

  return function update() {
    state.x = state.x + vx;
    if(state.x > WIDTH*2) {
      state.x = 0;
    }

    state.r = state.r + vr;
    if(state.r > 360) {
      state.r = state.r - 360;
    }
    el.setAttribute('style', `transform: translateX(${state.x}px) rotate(${state.r}deg);`);
  }
}

const initialized = shapes.map(initialize);

let t0 = 0;
let rafId = 0;
function main(t) {
  const delta = t - t0;

  rafID = requestAnimationFrame(main);
  if(t0 && delta < (60/30) * 16 + 1) { return; }

  initialized.forEach(i => i());

  t0 = t;
}

rafID = requestAnimationFrame(main);
