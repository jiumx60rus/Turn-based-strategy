class HexGrid
  constructor: (@game, @radius) ->
    @height = Math.sqrt(3) * @radius;
    @width = 2 * @radius;
    @side = (3 / 2) * @radius;
    
    @grid = [] # Статические клетки

    # Для рисования шестиугольников
    @graphics = @game.add.graphics 0, 0
    # Для выделяемых элементов
    @graphicsActiv = @game.add.graphics 0, 0

  createGrid: (_x, _y)->
    for x in [0..._x]
      @grid[x] = []
      for y in [0..._y]
        @grid[x][y] = new Hex this, @graphics, x, y

  drawGrid: ->
    # Чистим "графику"
    do @graphics.clear
    # И отрисовываем в неё
    for xx, x in @grid
      for yy, y in @grid[x]
        do @grid[x][y].draw

  selectHexOnPoint: (x, y) -> 
    # x и y относительно hexgridTexture
    ci = Math.floor x / @side
    cx = x - @side * ci
    # Магия :) 
    ty = y - (ci % 2) * @height / 2
    cj = Math.floor ty / @height
    cy = ty - @height * cj

    if cx > Math.abs @radius / 2 - @radius * cy / @height
      x: ci
      y: cj
    else
      x = ci - 1
      y = cj + (ci % 2)

      if cy < @height / 2
        y--

      x: x
      y: y
    
  # Рисовать выбранный шестигранник
  drawActiveHex: (x, y)->
    do @graphicsActiv.clear
    hex = new Hex this, @graphicsActiv, x, y
    hex.fill.color = 0x000000
    do hex.draw