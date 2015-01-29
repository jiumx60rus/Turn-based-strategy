class Preload

  preload: () ->
    # asset = @load.spritesheet "preloader", "img/preloader.png", 120, 128, 29
    

  create: () -> 
    # Запуск прелоадера
    preloader = @game.add.sprite @camera.view.width / 2, @camera.view.height / 2, "preloader"
    preloader.anchor.setTo 0.5, 0.5
    preloader.animations.add "load"
    preloader.animations.play "load", 24, true

    # Дальше загрузка файлов для меню :)

  update: () ->
    # if !!@ready
    #   @game.state.start 'menu'
