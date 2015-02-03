class Hex
  constructor: (@grid, @graphics, @x, @y) ->
    # Положение центра шестиугольника в пикселях(Относительно HexMap)
    @xPixel = @x * @grid.side
    @yPixel = @y * @grid.height
    # Каждый второй сдвигаем ниже
    @yPixel += (@grid.height * 0.5) if x % 2 != 0
    # Стандартный цвет линии и заливки
    @fill =
      color: 0xFFFFFF
      alpha: .6
    @line =
      width: 2
      color: 0x000000
      alpha: .6
  
  draw: ->
    # Цвет заливки и прозрачность
    @graphics.beginFill @fill.color, @fill.alpha
    # Толщина, цвет обводки, прозрачность
    @graphics.lineStyle @line.width, @line.color, @line.alpha

    @graphics.moveTo @xPixel + @grid.width - @grid.side, @yPixel
    @graphics.lineTo @xPixel + @grid.side, @yPixel
    @graphics.lineTo @xPixel + @grid.width, @yPixel + (@grid.height / 2)
    @graphics.lineTo @xPixel + @grid.side, @yPixel + @grid.height
    @graphics.lineTo @xPixel + @grid.width - @grid.side, @yPixel + @grid.height
    @graphics.lineTo @xPixel, @yPixel + (@grid.height / 2)

    do @graphics.endFill