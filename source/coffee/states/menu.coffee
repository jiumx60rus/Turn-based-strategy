class Menu
  startGame: ->
    @game.state.start "play"

  create: ->
    bg = @add.tileSprite 0, 0, @camera.view.width, @camera.view.height, "menuBg"
    
    buttonStart = @.add.button @camera.view.width / 2, @camera.view.height / 2,
      "menuButtonStart", @startGame, @, 1, 0, 2
    # Центрировать
    buttonStart.anchor.setTo 0.5