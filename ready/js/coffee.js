(function() {
  var animate, bunny, renderer, stage, texture;

  stage = new PIXI.Stage(0x66FF99);

  renderer = new PIXI.WebGLRenderer(400, 300);

  console.log(renderer);

  document.body.appendChild(renderer.view);

  requestAnimFrame(animate.bind(this));

  texture = PIXI.Texture.fromImage("bunny.png");

  bunny = new PIXI.Sprite(texture);

  bunny.anchor.x = 0.5;

  bunny.anchor.y = 0.5;

  bunny.position.x = 200;

  bunny.position.y = 150;

  stage.addChild(bunny);

  animate = function() {
    requestAnimFrame(animate.bind(this));
    bunny.rotation += 0.1;
    return renderer.render(stage);
  };

}).call(this);
