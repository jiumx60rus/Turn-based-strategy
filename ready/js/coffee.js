(function() {
  var animate, count, renderer, stage, texture, tilingSprite;

  console.log("Test!");

  stage = new PIXI.Stage(0x97C56E);

  renderer = new PIXI.autoDetectRenderer(window.innerWidth, window.innerHeight);

  renderer.view.style.position = "absolute";

  renderer.view.style.top = "0px";

  renderer.view.style.left = "0px";

  document.body.appendChild(renderer.view);

  texture = PIXI.Texture.fromImage("img/bg.jpg");

  tilingSprite = new PIXI.TilingSprite(texture, window.innerWidth, window.innerHeight);

  stage.addChild(tilingSprite);

  count = 0;

  animate = function() {
    count += 0.005;
    tilingSprite.tileScale.x = 1 + Math.sin(count * 0.2);
    tilingSprite.tileScale.y = 1 + Math.cos(count * 0.2);
    tilingSprite.tilePosition.x += 1;
    tilingSprite.tilePosition.y += 1;
    renderer.render(stage);
    return requestAnimFrame(animate);
  };

  requestAnimFrame(animate);

}).call(this);
