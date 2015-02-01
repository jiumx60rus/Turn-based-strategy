class HexMap
  constructor: (gameTHis) ->
    @texture = gameTHis.game.add.renderTexture(gameTHis.camera.view.width, gameTHis.camera.view.height, 'mousetrail');

    @mushroom = gameTHis.game.make.sprite(0, 0, 'menuBg');
    @mushroom.anchor.set(0.5);

    gameTHis.game.add.sprite(0, 0, @texture);

  update: (THIS) ->
    @texture.render(@mushroom, THIS.game.input.activePointer.position, false)