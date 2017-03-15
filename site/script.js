var c = document.querySelector('#backdrop');
var ctx = c.getContext('2d');

var HEIGHT = window.innerHeight / 2;
var WIDTH = window.innerWidth;
c.setAttribute('height', HEIGHT);
c.setAttribute('width', WIDTH);

/*
  [1 0 -x]
  [0 1 -y]
  [0 0 1]
x
  [cos sin 0]
  [-sin cos 0]
  [0 0 1]
=
  //
  // [cos sin -x]
  // [-sin cos -y]
  // [0 0 1]
  //
x
  [1 0 x]
  [0 1 y]
  [0 0 1]
=
  //
  // [cos sin (xcos ysin -x)]
  // [-sin cos (-xsin ycos -y)]
  // [0 0 1]
  //
x
  [1 0 tx]
  [0 1 0]
  [0 0 1]
=
  //
  // [cos sin (txcos (xcos ysin -x))]
  // [-sin cos (-txsin (-xsin ycos -y))]
  // [0 0 1]
  //
x
  [x]
  [y]
  [1]
=
  //
  // [xcos ysin (txcos (xcos ysin -x))]
  // [-xsin ycos (-txsin (-xsin ycos -y))]
  // [1]
  //

*/


function transform(tx, r, [x, y]) {
  return [
    2*x*Math.cos(r) + 2*y*Math.sin(r) + tx*Math.cos(r) - x,
    -2*x*Math.sin(r) + 2*y*Math.cos(r) - tx*Math.sin(r) - y
  ];
}

function shape({vertices, initialR, vx, vr, style: {stroke, fill}}) {
  let state = {
    x: -200,
    r: initialR
  }

  function draw() {
    ctx.fillStyle = fill;
    ctx.strokeStyle = stroke;
    ctx.beginPath();
    vertices
      .map(transform.bind(null, state.x, state.r))
      .forEach(function([x, y], i) {
        if(i === 0) { ctx.moveTo(x, y); }
        else { ctx.lineTo(x, y); }
      });
    ctx.closePath();
    ctx.stroke();
    ctx.fill();
  }

  return function update() {
    draw();

    state = {
      x: state.x + vx,
      r: state.r + vr
    }

    if(state.x > WIDTH + 400) {
      state.x = -200;
    }

    if(state.r > 2*Math.PI) {
      state.r = state.r - 2*Math.PI;
    }

  }
}

function rand2(a, b) {
  return b + Math.random() * (a - b);
}

function randomSquare() {
  const minWidth = 50;
  const x0 = 0;
  const y0 = rand2(minWidth, HEIGHT - minWidth);
  const w = rand2(minWidth, minWidth * 4);

  return [
    [x0, y0],
    [x0 + w, y0],
    [x0 + w, y0 + w],
    [x0, y0 + w]
  ]
}

function randomTriangle() {
  const minWidth = 25;
  const x0 = 0;
  const y0 = rand2(minWidth, HEIGHT - minWidth);
  const w = rand2(minWidth, minWidth * 4);

  return [
    [x0, y0],
    [x0 + w, y0 + w],
    [x0, y0 + 2*w]
  ]
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

const initialized = shapes
  .map(function(vertices) {
    return shape({
      vertices,
      initialR: rand2(0, Math.PI),
      vx: rand2(1, 5),
      vr: rand2(0, Math.PI * 0.01),
      style: {stroke: '#9012ef', fill: '#ce6bdb'}
    });
  });

let t0 = 0;
let rafId = 0;
function main(t) {
  const delta = t - t0;

  rafID = requestAnimationFrame(main);
  if(t0 && delta < (60/30) * 16 + 1) { return; }
  ctx.fillStyle = 'white';
  ctx.fillRect(0,0,WIDTH,HEIGHT);
  initialized.forEach(i => i());
  t0 = t;
}

rafID = requestAnimationFrame(main);
