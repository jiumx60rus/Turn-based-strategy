class Play
  create: ->
    # @texture = @game.add.renderTexture(@camera.view.width, @camera.view.height, 'mousetrail');

    # @mushroom = @game.make.sprite(0, 0, 'menuBg');
    # @mushroom.anchor.set(0.5);

    # @game.add.sprite(0, 0, @texture);

    @map  = new HexMap this

  update: ->
     @map.update @
    # @texture.render(@mushroom, @game.input.activePointer.position, false)