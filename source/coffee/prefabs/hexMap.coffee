class HexMap
  constructor: (@game, @radius) ->
    @height = Math.sqrt(3) * @radius;
    @width = 2 * @radius;
    @side = (3 / 2) * @radius;

    @HexMapTexture = @game.add.renderTexture @game.camera.view.width, 
      @game.camera.view.height, "HexMap"
    
    @graphics = @game.add.graphics 0, 0

  drawHex: (x, y, fillColor)->
    @graphics.beginFill("#bed0db", .5);
    @graphics.lineStyle(2, "#000000", 10);

    @graphics.moveTo(x + @width - @side, y);
    @graphics.lineTo(x + @side, y);
    @graphics.lineTo(x + @width, y + (@height / 2));
    @graphics.lineTo(x + @side, y + @height);
    @graphics.lineTo(x + @width - @side, y + @height);
    @graphics.lineTo(x, y + (@height / 2));
    @graphics.endFill();

  drawnGrid: (rows, cols)->
    
    currentHexX = null
    currentHexY = null

    for col in [0...cols]
      for row in [0...rows]
        currentHexX = col * @side
        currentHexY = row * @height
        currentHexY += (@height * 0.5) if col % 2 != 0

        @drawHex currentHexX, currentHexY
    
    @HexMapTexture.render(@graphics, @game.input.activePointer.position, false)

