class Preload

  loadComplete: ->
    @game.state.start "menu"

  create: ->
    # Запуск прелоадера
    preloader = @game.add.sprite @camera.view.width / 2, @camera.view.height / 2, "preloader"
    preloader.anchor.setTo 0.5
    preloader.animations.add "load"
    preloader.animations.play "load", 24, true

    # Дальше загрузка файлов для меню :)
    @load.onLoadComplete.add @loadComplete, this

    @load.image "menuBg", "img/menu/bg.jpg"
    @load.spritesheet "menuButtonStart", "img/menu/buttonStart.png", 401, 143

    @load.image "gameBg", "img/grass.jpg"
    # Начало загрузки
    do @load.start
