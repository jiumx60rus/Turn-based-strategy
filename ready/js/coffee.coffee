window.onload = ()->
	@game = new Phaser.Game(window.innerWidth, window.innerHeight, Phaser.AUTO)
	console.log "Tes"
	@game.state.add 'main', new MainState, true

class MainState extends Phaser.State
	constructor: -> super

	preload: ->
		@game.load.image('logo', 'img/test.png')

	create: ->
		@logo = new LogoSprite(@game, @game.world.centerX, @game.world.centerY, 'logo')
		@game.world.add(@logo)

		if @game.scaleToFit
			@game.stage.scaleMode = Phaser.StageScaleMode.SHOW_ALL
			@game.stage.scale.setShowAll()
			@game.stage.scale.refresh()

class LogoSprite extends Phaser.Sprite
  constructor: ->
    super

    @anchor =
      x: 0.5
      y: 0.5