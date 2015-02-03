class HexMap
  constructor: (@game, @radius) ->
    @height = Math.sqrt(3) * @radius;
    @width = 2 * @radius;
    @side = (3 / 2) * @radius;
    @map = []

    # Текстура куда рисуется сетка
    @hexMapTexture = @game.add.renderTexture @game.camera.view.width, 
      @game.camera.view.height, "HexMap"
    
    @graphics = @game.add.graphics 0, 0

  createGrid: (_x, _y)->
    for x in [0..._x]
      @map[x] = []
      for y in [0..._y]
        @map[x][y] = new Hex this, x, y

  drawGrid: ->
    # Чистим "графику"
    do @graphics.clear
    # И отрисовываем в неё
    for xx, x in @map
      for yy, y in @map[x]
        do @map[x][y].drawHex
    # Рендрим в текстуру в нулевых координатах
    @hexMapTexture.render @graphics, 0, 0

