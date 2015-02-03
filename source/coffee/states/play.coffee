class Play
  create: ->
    # Фон
    bg = @add.tileSprite 0, 0, @camera.view.width, @camera.view.height, "gameBg"

    @map  = new HexMap this, @game.camera.width / 35
    # Создать сетку на весь экран
    x = Math.floor @game.camera.width / @map.side
    y = Math.floor @game.camera.height / @map.height
    @map.createGrid x, y
    # Отрисовать карту
    do @map.drawGrid

  update: ->