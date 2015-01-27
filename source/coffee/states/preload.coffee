class Preload
	onLoadComplete: () ->
		@ready = on

	preload: () ->
		@asset = @add.sprite @width/2, @height/2, 'preloader'
		@asset.anchor.setTo 0.5, 0.5

		@load.onLoadComplete.addOnce @onLoadComplete, @
		@load.setPreloadSprite @asset
		@load.image 'yeoman', 'img/yeoman-logo.png'
		

	create: () ->
		@asset.cropEnabled = off

	update: () ->
		if !!@ready
			@game.state.start 'menu'
