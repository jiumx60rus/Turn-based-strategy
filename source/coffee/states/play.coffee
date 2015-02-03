class Play
  create: ->
    # Фон
    bg = @add.tileSprite 0, 0, @camera.view.width, @camera.view.height, "gameBg"

    @hexGrid  = new HexGrid this, @game.camera.width / 20
    # Создать сетку на весь экран
    @x = Math.floor @game.camera.width / @hexGrid.side
    @y = Math.floor @game.camera.height / @hexGrid.height
    @hexGrid.createGrid @x, @y
    # Отрисовать карту
    do @hexGrid.drawGrid

  update: ->
    # Test
    setHex = @hexGrid.setHexOnPoint @game.input.activePointer.position.x,
      @game.input.activePointer.position.y

    if 0 <= setHex.x < @hexGrid.grid.length and 0 <= setHex.y < @hexGrid.grid[setHex.y].length
      hex = @hexGrid.grid[setHex.x][setHex.y]
      hex.fillColor = 0xFF6347

      do @hexGrid.drawGrid
