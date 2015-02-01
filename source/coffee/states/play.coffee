class Play
  create: ->
    # Фон
    bg = @add.tileSprite 0, 0, @camera.view.width, @camera.view.height, "gameBg"

    @map  = new HexMap this, 50
    # Отобразить сетку на весь экран
    @map.drawnGrid Math.ceil(@game.camera.width / @map.width), 
      Math.ceil(@game.camera.height / @map.height )
    console.log Math.ceil(@game.camera.width / @map.width)

  update: ->