class Boot
	preload: () ->
		@load.image 'preloader', 'img/preloader.gif'

	create: () ->

		@game.input.maxPointers = 1
		@game.state.start 'preload'