class Play
  create: ->
    # Фон
    bg = @add.tileSprite 0, 0, @camera.view.width, @camera.view.height, "gameBg"

    @map  = new HexMap this, @game.camera.width / 35
    # Создать сетку на весь экран
    @x = Math.floor @game.camera.width / @map.side
    @y = Math.floor @game.camera.height / @map.height
    @map.createGrid @x, @y
    # Отрисовать карту
    do @map.drawGrid

  update: ->
    color = [0x808000, 0x008080, 0xFF00FF, 0xFFFAF0, 0xF0E68C, 0x8B4513]
    # Test
    hex = @map.map[~~(do Math.random * @x)][~~(do Math.random * @y)]
    hex.fillColor = color[Math.round(do Math.random * color.length)]

    do @map.drawGrid