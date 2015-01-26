(function() {
  console.log("Test.coffee");

}).call(this);

(function() {
  var animate, bunny, renderer, stage, texture;

  stage = new PIXI.Stage(0x66FF99);

  renderer = new PIXI.WebGLRenderer(400, 300);

  document.body.appendChild(renderer.view);

  texture = PIXI.Texture.fromImage("bunny.png");

  bunny = new PIXI.Sprite(texture);

  bunny.anchor.x = 0.5;

  bunny.anchor.y = 0.5;

  bunny.position.x = 200;

  bunny.position.y = 150;

  stage.addChild(bunny);

  animate = function() {
    requestAnimFrame(animate);
    bunny.rotation += 0.1;
    return renderer.render(stage);
  };

  requestAnimFrame(animate);

}).call(this);
