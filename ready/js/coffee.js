(function() {
  var Particle, ParticleSystem, Vec2, World, test, _Object,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Vec2 = (function() {
    function Vec2(x, y) {
      this.x = x != null ? x : 0;
      this.y = y != null ? y : 0;
    }

    Vec2.prototype.add = function(vec) {
      this.x += vec.x;
      this.y += vec.y;
      return this;
    };

    Vec2.prototype.copy = function() {
      return new Vec2(this.x, this.y);
    };

    Vec2.getRandom = function(min, max) {
      return new Vec2(Math.random() * (max - min) + min, Math.random() * (max - min) + min);
    };

    return Vec2;

  })();

  World = (function() {
    function World(canvas) {
      this.canvas = canvas;
      this.ctx = this.canvas.getContext('2d');
      this.canvasWidth = this.canvas.width = 400;
      this.canvasHeight = this.canvas.height = 500;
      this.objects = [];
      this.controllable = {};
      this.mouse = new Vec2(this.canvasWidth / 2, this.canvasHeight / 2);
      this.params = {
        gravity: new Vec2(0, -.2)
      };
      this.canvas.addEventListener("mousemove", ((function(_this) {
        return function(e) {
          var _ref;
          return _ref = [e.offsetX, e.offsetY], _this.mouse.x = _ref[0], _this.mouse.y = _ref[1], _ref;
        };
      })(this)), false);
      this.canvas.addEventListener("mousewheel", ((function(_this) {
        return function(e) {
          e.preventDefault();
          if (_this.controllable instanceof ParticleSystem) {
            if (e.shiftKey) {
              return _this.controllable.scatter = Math.max(0, _this.controllable.scatter - e.wheelDelta / 100);
            } else if (e.altKey) {
              return _this.controllable.particleSize = Math.max(0, _this.controllable.particleSize - e.wheelDelta / 100);
            } else {
              return _this.controllable.particleLife = Math.max(1, _this.controllable.particleLife - e.wheelDelta / 10);
            }
          }
        };
      })(this)), false);
    }

    World.prototype.addObject = function(constructor, config, controllable) {
      var obj;
      config.world = this;
      obj = new constructor(config);
      if (controllable) {
        obj.setControllable();
      }
      return this.objects.push(obj);
    };

    World.prototype.removeObject = function(index) {
      return this.objects.splice(index, 1);
    };

    World.prototype.start = function() {
      return this.tick();
    };

    World.prototype.tick = function() {
      this.update();
      this.draw();
      return webkitRequestAnimationFrame(this.tick.bind(this));
    };

    World.prototype.update = function() {
      var ind, object, _i, _len, _ref, _results;
      _ref = this.objects;
      _results = [];
      for (ind = _i = 0, _len = _ref.length; _i < _len; ind = ++_i) {
        object = _ref[ind];
        if (object) {
          _results.push(object.update(ind));
        }
      }
      return _results;
    };

    World.prototype.draw = function() {
      var object, _i, _len, _ref, _results;
      this.ctx.clearRect(0, 0, this.canvasWidth, this.canvasHeight);
      this.ctx.globalAlpha = 1;
      _ref = this.objects;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        object = _ref[_i];
        _results.push(object.draw());
      }
      return _results;
    };

    return World;

  })();

  _Object = (function() {
    function _Object(config) {
      var _ref, _ref1;
      this.loc = (_ref = config.loc) != null ? _ref : new Vec2;
      this.speed = (_ref1 = config.speed) != null ? _ref1 : new Vec2;
      this.world = config.world;
    }

    _Object.prototype.update = function() {
      if (!(this instanceof ParticleSystem)) {
        this.speed.add(this.world.params.gravity);
      }
      return this.loc.add(this.speed);
    };

    _Object.prototype.notVisible = function(threshold) {
      return this.loc.y > this.world.canvasHeight + threshold || this.loc.y < -threshold || this.loc.x > this.world.canvasWidth + threshold || this.loc.x < -threshold;
    };

    _Object.prototype.setControllable = function() {
      this.world.controllable = this;
      return this.loc = this.world.mouse;
    };

    return _Object;

  })();

  ParticleSystem = (function(_super) {
    __extends(ParticleSystem, _super);

    function ParticleSystem(config) {
      var _ref, _ref1, _ref2, _ref3, _ref4;
      ParticleSystem.__super__.constructor.call(this, config);
      this.particles = [];
      this.maxParticles = (_ref = config.maxParticles) != null ? _ref : 300;
      this.particleLife = (_ref1 = config.particleLife) != null ? _ref1 : 60;
      this.particleSize = (_ref2 = config.particleSize) != null ? _ref2 : 24;
      this.creationRate = (_ref3 = config.creationRate) != null ? _ref3 : 3;
      this.scatter = (_ref4 = config.scatter) != null ? _ref4 : 1.3;
    }

    ParticleSystem.prototype.addParticle = function(config) {
      config.system = this;
      config.world = this.world;
      return this.particles.push(new Particle(config));
    };

    ParticleSystem.prototype.removeParticle = function(index) {
      return this.particles.splice(index, 1);
    };

    ParticleSystem.prototype.update = function() {
      var i, ind, particle, _i, _j, _len, _ref, _ref1, _results;
      if (!(this.particles.length > this.maxParticles)) {
        for (i = _i = 0, _ref = this.creationRate; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
          this.addParticle({
            loc: this.loc.copy(),
            speed: Vec2.getRandom(-this.scatter, this.scatter)
          });
        }
      }
      _ref1 = this.particles;
      _results = [];
      for (ind = _j = 0, _len = _ref1.length; _j < _len; ind = ++_j) {
        particle = _ref1[ind];
        if (particle) {
          _results.push(particle.update(ind));
        }
      }
      return _results;
    };

    ParticleSystem.prototype.draw = function() {
      var particle, _i, _len, _ref, _results;
      _ref = this.particles;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        particle = _ref[_i];
        _results.push(particle.draw());
      }
      return _results;
    };

    return ParticleSystem;

  })(_Object);

  Particle = (function(_super) {
    __extends(Particle, _super);

    function Particle(config) {
      Particle.__super__.constructor.call(this, config);
      this.system = config.system;
      this.initialLife = this.system.particleLife;
      this.life = this.initialLife;
      this.size = this.system.particleSize;
    }

    Particle.prototype.update = function(ind) {
      Particle.__super__.update.apply(this, arguments);
      this.size = Math.max(0, this.system.particleSize * (this.life-- / this.initialLife));
      if (this.notVisible(100 || this.life < 0)) {
        return this.system.removeParticle(ind);
      }
    };

    Particle.prototype.draw = function() {
      var grad;
      this.world.ctx.globalCompositeOperation = "lighter";
      this.world.ctx.globalAlpha = this.life / this.initialLife;
      grad = this.world.ctx.createRadialGradient(this.loc.x, this.loc.y, 0, this.loc.x, this.loc.y, this.size);
      grad.addColorStop(0, "rgba(255,255,255,.5)");
      grad.addColorStop(.3, "rgba(255,255,255,.3)");
      grad.addColorStop(1, "transparent");
      this.world.ctx.fillStyle = grad;
      this.world.ctx.beginPath();
      this.world.ctx.arc(this.loc.x, this.loc.y, this.size, 0, 2 * Math.PI);
      return this.world.ctx.fill();
    };

    return Particle;

  })(_Object);

  test = new World(document.getElementById('canvas'));

  window.test = test;

  test.addObject(ParticleSystem, {
    loc: new Vec2(200, 400),
    particleSize: 30,
    particleLife: 55,
    scatter: .4
  }, true);

  test.start();

}).call(this);
