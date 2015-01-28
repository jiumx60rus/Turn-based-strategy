class Menu
  create: () ->
    style =
      font: "16px Arial"
      fill: "#ffffff"
      align: "center"

    @instructionsText = @game.add.text @game.world.centerX, 400, 
      'Click anywhere to play "Click The Yeoman Logo"', style
    @instructionsText.anchor.setTo 0.5, 0.5