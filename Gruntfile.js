module.exports = function(grunt) {
    grunt.initConfig({
        jade: {
            compile: {
                options: {
                    data: {
                        debug: false
                    }
                },
                files: {
                    'dest/index.html': 'source/jade/index.jade'
                }
            }
        },
        /*----------------------------------------------------------*/
        stylus: {
            compile: {
                files: {
                    'ready/css/stylus.css': 'source/stylus/*.styl'
                }
            }
        },
        /*----------------------------------------------------------*/
        coffee: {
            compile: {
                options: {
                    join: true
                },
                files: {
                    'ready/js/coffee.js': 'source/coffee/*.coffee'
                }
            }
        },
        /*----------------------------------------------------------*/
        concat: {
            js: {
                src: 'ready/js/**/*.js',
                dest: 'dest/main.js',
            },
            css: {
                src: 'ready/css/**/*.css',
                dest: 'dest/style.css',
            },
        },
        /*----------------------------------------------------------*/
        watch: {
            livereload: {
                options: {
                    livereload: true
                },
                files: ['dest/**/*']
            },
            js: {
                files: ['ready/js/**/*.js'],
                tasks: ['concat:js']
            },
            css: {
                files: ['ready/css/**/*.css'],
                tasks: ['concat:css']
            },
            jade: {
                files: ['source/jade/**/*.jade'],
                tasks: ['jade', 'notify:jade']
            },
            stylus: {
                files: ['source/stylus/*.styl'],
                tasks: ['stylus', 'notify:stylus']
            },
            coffee: {
                files: ['source/coffee/*.coffee'],
                tasks: ['coffee', 'notify:coffee']
            }
        },
        /*----------------------------------------------------------*/
        connect: {
            server: {
                options: {
                    port: 3000,
                    base: 'dest',
                }
            }
        },
        /*----------------------------------------------------------*/
        'ftp-deploy': {
            build: {
                auth: {
                    host: 'ftp.grishy.ru',
                    port: 21,
                    authKey: 'key1'
                },
                src: 'dest',
                dest: '/public_html/Game',
            }
        },
        /*----------------------------------------------------------*/
        uglify: {
            js: {
                files: {
                    'dest/main.js': 'dest/main.js'
                }
            }
        },
        /*----------------------------------------------------------*/
        cssmin: {
            css: {
                files: {
                    'dest/style.css': 'dest/style.css'
                }
            }
        },
        /*----------------------------------------------------------*/
        notify: {
            options: {
                enabled: true,
                title: "Game",
                success: true,
                duration: 1
            },
            jade: {
                options: {
                    message: 'Compiling jade'
                }
            },
            stylus: {
                options: {
                    message: 'Compiling stylus'
                }
            },
            coffee: {
                options: {
                    message: 'Compiling coffee'
                }
            },
            start: {
                options: {
                    message: 'Start server'
                }
            }
        }
        /*----------------------------------------------------------*/
    });

    grunt.loadNpmTasks('grunt-contrib-jade');
    grunt.loadNpmTasks('grunt-contrib-stylus');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-connect');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-ftp-deploy');
    grunt.loadNpmTasks('grunt-notify');

    grunt.registerTask('default', [
        'jade',
        'stylus',
        'coffee',
        'concat:js',
        'concat:css',
        'connect',
        'notify:start',
        'watch'
    ]);

    grunt.registerTask('ftp', [
        'uglify',
        'cssmin',
        'ftp-deploy'
    ]);
};
