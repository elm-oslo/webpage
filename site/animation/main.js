window.initAnimation = initAnimation;
function initAnimation() {
  var delta = 0;

  var canvas = document.getElementById('sketch');

  // Renderer setup
  var renderer = new THREE.WebGLRenderer({
    canvas: canvas,
    antialias: true
  });
  renderer.setSize(canvas.clientWidth, canvas.clientHeight, false);
  renderer.setPixelRatio(window.devicePixelRatio);
  renderer.setClearColor(0x0a0338);

  // Stats
  // var stats = new Stats();
  // stats.showPanel(0);
  // document.body.appendChild(stats.dom);

  // Camera
  var camera = new THREE.PerspectiveCamera(
    35,
    window.innerWidth / window.innerHeight,
    0.1,
    3000
  );

  // Scene
  var scene = new THREE.Scene();

  // Lights
  var ambientLight = new THREE.AmbientLight(0xffffff, 0.5);
  scene.add(ambientLight);
  var spotLight = new THREE.PointLight(0xffffff, 0.5);
  scene.add(spotLight);

  // Box 1
  var box_1_speed = 0.7;
  var box_1_colorArray = [
    0x190e60,
    0x190e60,
    0x190e60,
    0x190e60,
    0x190e60,
    0x190e60,
    0xffffff,
    0x252ede,
    0x252ede,
    0xffca6a
  ];
  var box_1_material = [];
  var box_1_amount = 60;
  var box_1_rotationXSpeed = [];
  var box_1_rotationYSpeed = [];
  var box_1_zPos = [];
  var box_1_width = [];
  var box_1_magicClippingNumbers = [-1200, 2400];
  var box_1_group = new THREE.Group();
  var box_1_randomizeYPos = [];
  var box_1_randomizeXSpeed = [];

  for (var i = 0; i < box_1_amount; i++) {
    box_1_rotationXSpeed[i] = THREE.Math.randFloat(0.002, 0.008);
    box_1_rotationYSpeed[i] = THREE.Math.randFloat(0.002, 0.008);
    box_1_zPos[i] = THREE.Math.randFloat(-800, -1600);
    box_1_width[i] = THREE.Math.randFloat(20, 60);
    box_1_randomizeYPos[i] = getRandomInt(20, 150);
    box_1_randomizeXSpeed[i] = getRandomInt(1.01, 1.03);

    var randomColorInteger = getRandomInt(0, box_1_colorArray.length);
    box_1_material[i] = new THREE.MeshBasicMaterial({
      color: box_1_colorArray[randomColorInteger]
    });

    var boxGeomery_1 = new RoundedBoxGeometry(
      box_1_width[i],
      box_1_width[i],
      box_1_width[i],
      3,
      5
    );
    var mesh_1 = new THREE.Mesh(boxGeomery_1, box_1_material[i]);
    box_1_group.add(mesh_1);
    box_1_group.position.x = box_1_magicClippingNumbers[0];

    box_1_group.children[i].rotation.x = THREE.Math.randFloat(20, 60);
    box_1_group.children[i].rotation.y = THREE.Math.randFloat(20, 60);
  }
  scene.add(box_1_group);

  // Render that shit
  requestAnimationFrame(render);
  function render() {
    // stats.begin();

    for (var i = 0; i < box_1_group.children.length; i++) {
      var box_1_xSpeed =
        (i * 40 + delta * box_1_randomizeXSpeed[i]) %
        box_1_magicClippingNumbers[1];
      var box_1_ySpeed =
        Math.sin((i / 2) * 0.2 + delta * 0.001) * box_1_randomizeYPos[i];
      var box_1_zSpeed = box_1_zPos[i];

      box_1_group.children[i].rotation.x += box_1_rotationXSpeed[i];
      box_1_group.children[i].rotation.y += box_1_rotationYSpeed[i];
      box_1_group.children[i].position.set(
        box_1_xSpeed,
        box_1_ySpeed,
        box_1_zSpeed
      );
    }

    renderer.render(scene, camera);
    delta = delta + box_1_speed;
    // stats.end();
    requestAnimationFrame(render);
  }

  // Update on resize
  function onWindowResize() {
    camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();
    renderer.setSize(window.innerWidth, window.innerHeight);
  }
  window.addEventListener('resize', onWindowResize, false);
}
