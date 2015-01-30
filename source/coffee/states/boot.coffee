class Boot
  preload: () ->
    # Загрузка прелоадера
    @load.spritesheet "preloader", "img/preloader.png", 120, 128, 29

  create: () ->
    # Очистка консоли
    # do console.clear if console?
    @game.state.start "preload"