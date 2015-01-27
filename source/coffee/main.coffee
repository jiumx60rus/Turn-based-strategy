window.onload = ()->
	@game = new Phaser.Game(window.innerWidth, window.innerHeight, Phaser.AUTO)
	console.log "Tes"
	@game.state.add 'main', new MainState, true
