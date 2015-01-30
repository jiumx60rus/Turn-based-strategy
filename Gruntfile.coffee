module.exports = (grunt) ->
  js = [
    "source/coffee/states/*.coffee"
    # "source/coffee/sprites/*.coffee"
    "source/coffee/main.coffee"
  ]

  # configuration
  grunt.initConfig
    # jade
    jade:
      compile:
        options:
          data:
            debug: no
        files:
          "dest/index.html": "source/jade/index.jade"

    # stylus
    stylus:
      compile:
        files:
          "ready/css/stylus.css": "source/stylus/**/*.styl"

    # coffee
    coffee:
      compile:
        files:
          "ready/js/coffee.js": "ready/js/coffee.coffee"


    # concat
    concat:
      js:
        src: "ready/js/**/*.js"
        dest: "dest/main.js"
      css:
        src: "ready/css/**/*.css"
        dest: "dest/style.css"
      coffee:
        src: [
          "source/coffee/states/*.coffee"
          # "source/coffee/sprites/*.coffee"
          "source/coffee/main.coffee"
        ]
        dest: "ready/js/coffee.coffee"

    # connect
    connect:
      server:
        options:
          port: 3000
          base: "dest"

    # watch
    watch:
      livereload:
        options:
          livereload: on
        files: ["dest/**/*"]
      js:
        files: ["ready/js/**/*.js"]
        tasks: ["concat:js"]
      css:
        files: ["ready/css/**/*.css"]
        tasks: ["concat:css"]
      jade:
        files: ["source/jade/**/*.jade"]
        tasks: ["jade", "notify:jade"]
      stylus:
        files: ["source/stylus/**/*.styl"]
        tasks: ["stylus", "notify:stylus"]
      coffee:
        files: ["source/coffee/**/*.coffee"]
        tasks: ["concat:coffee", "coffee", "notify:coffee"]

    # notify
    notify:
      options:
        enabled: true
        title: "Game"
        success: true
        duration: 1
      jade:
        options:
          message: "Compiling jade"
      stylus:
        options:
          message: "Compiling stylus"
      coffee:
        options:
          message: "Compiling coffee"
      start:
        options:
          message: "Start server"

    # uglify
    uglify:
      js:
        files:
          "dest/main.js": "dest/main.js"

    # cssmin
    cssmin:
      css:
        files:
          "dest/style.css": "dest/style.css"

    # ftp-deploy
    "ftp-deploy":
      build:
        auth:
          host: "ftp.grishy.ru"
          port: 21
          authKey: "key1"
        src: "dest"
        dest: "/public_html/Game"



  # load plugins
  grunt.loadNpmTasks "grunt-contrib-jade"
  grunt.loadNpmTasks "grunt-contrib-stylus"
  grunt.loadNpmTasks "grunt-contrib-coffee"

  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-watch"
  
  grunt.loadNpmTasks "grunt-notify"

  grunt.loadNpmTasks "grunt-ftp-deploy"
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-contrib-uglify"

  # tasks
  grunt.registerTask "default", [
    "jade"
    "stylus"
    "concat:coffee"
    "coffee"
    "concat:js"
    "concat:css"
    "connect"
    "watch"
    "notify:start"
  ]
  grunt.registerTask "ftp", [
    "uglify"
    "cssmin"
    "ftp-deploy"
  ]