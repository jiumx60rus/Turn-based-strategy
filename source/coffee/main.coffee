window.onload = ->
  game = new Phaser.Game window.innerWidth, window.innerHeight, Phaser.AUTO, "Game"

  game.state.add "boot", new Boot
  game.state.add "preload", new Preload
  game.state.add "menu", new Menu
  game.state.add "play", new Play
  # game.state.add "gameover", new GameOver

  game.state.start "boot"