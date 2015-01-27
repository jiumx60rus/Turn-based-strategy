(function() {
  var create, game, preload, render, sprite, update;

  sprite = 0;

  preload = function() {
    return game.load.image('phaser', 'img/test.png');
  };

  create = function() {
    game.physics.startSystem(Phaser.Physics.ARCADE);
    sprite = game.add.sprite(game.world.centerX, game.world.centerY, 'phaser');
    sprite.anchor.set(0.5);
    return game.physics.arcade.enable(sprite);
  };

  update = function() {
    if (game.physics.arcade.distanceToPointer(sprite, game.input.activePointer) > 8) {
      game.physics.arcade.moveToPointer(sprite, 300);
    } else {
      sprite.body.velocity.set(0);
    }
    return sprite.angle += 1;
  };

  render = function() {
    return game.debug.inputInfo(32, 32);
  };

  game = new Phaser.Game(window.innerWidth, window.innerHeight, Phaser.AUTO, 'phaser-example', {
    preload: preload,
    create: create,
    update: update,
    render: render
  });

}).call(this);
