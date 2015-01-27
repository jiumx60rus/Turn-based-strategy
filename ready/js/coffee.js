(function() {
  var LogoSprite, MainState,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.onload = function() {
    this.game = new Phaser.Game(window.innerWidth, window.innerHeight, Phaser.AUTO);
    console.log("Tes");
    return this.game.state.add('main', new MainState, true);
  };

  MainState = (function(_super) {
    __extends(MainState, _super);

    function MainState() {
      MainState.__super__.constructor.apply(this, arguments);
    }

    MainState.prototype.preload = function() {
      return this.game.load.image('logo', 'img/test.png');
    };

    MainState.prototype.create = function() {
      this.logo = new LogoSprite(this.game, this.game.world.centerX, this.game.world.centerY, 'logo');
      this.game.world.add(this.logo);
      if (this.game.scaleToFit) {
        this.game.stage.scaleMode = Phaser.StageScaleMode.SHOW_ALL;
        this.game.stage.scale.setShowAll();
        return this.game.stage.scale.refresh();
      }
    };

    return MainState;

  })(Phaser.State);

  LogoSprite = (function(_super) {
    __extends(LogoSprite, _super);

    function LogoSprite() {
      LogoSprite.__super__.constructor.apply(this, arguments);
      this.anchor = {
        x: 0.5,
        y: 0.5
      };
    }

    return LogoSprite;

  })(Phaser.Sprite);

}).call(this);
