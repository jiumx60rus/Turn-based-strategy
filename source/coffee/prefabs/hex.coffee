class Hex
  constructor: (@grid, @x, @y) ->
    # Положение центра шестиугольника в пикселях(Относительно HexMap)
    @xPixel = @x * @grid.side
    @yPixel = @y * @grid.height
    # Каждый второй сдвигаем ниже
    @yPixel += (@grid.height * 0.5) if x % 2 != 0
    # Стандартный цвет линии и заливки
    @fillColor = 0xFFFFFF
    @lineColor = 0x000000
  
  drawHex: ->
    # Цвет заливки и прозрачность
    @grid.graphics.beginFill @fillColor, .6
    # Толщина, цвет обводки, прозрачность
    @grid.graphics.lineStyle 2, @lineColor, .6

    @grid.graphics.moveTo @xPixel + @grid.width - @grid.side, @yPixel
    @grid.graphics.lineTo @xPixel + @grid.side, @yPixel
    @grid.graphics.lineTo @xPixel + @grid.width, @yPixel + (@grid.height / 2)
    @grid.graphics.lineTo @xPixel + @grid.side, @yPixel + @grid.height
    @grid.graphics.lineTo @xPixel + @grid.width - @grid.side, @yPixel + @grid.height
    @grid.graphics.lineTo @xPixel, @yPixel + (@grid.height / 2)

    do @grid.graphics.endFill