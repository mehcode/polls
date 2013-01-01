#! Grunt configuration for this project.
#!

module.exports = (grunt) ->

  # Grunt
  # -----
  expand = grunt.file.expandMapping

  # Configuration
  # =============
  grunt.initConfig

    # Clean
    # -----
    clean:
      dist: ['dist', 'temp']
      temp: ['temp']

    # Copy
    # ----
    copy:
      options:
        flatten: false

      temp:
        options: basePath: 'src'
        files:
          'temp/': [
            'src/**'
            '!**/*.coffee'
            '!**/*.scss'
            '!**/*.sass'
            '!**/*.haml'
          ]

      amd:
        options: basePath: 'temp/scripts.amd'
        files:
          'temp/scripts/': [
            'temp/scripts.amd/**/*'
            '!temp/scripts.amd/main.js'
            '!temp/scripts.amd/vendor/**/*'
          ]

    # CoffeeScript
    # ------------
    coffee:
      compile:
        files: 'temp/scripts/*.js': 'src/scripts/**/*.coffee'
        options:
          basePath: 'src/scripts'

    # Compass
    # -------
    compass:
      options:
        sassDir: 'src/styles'
        cssDir: 'temp/styles'
        javascriptsDir: 'temp/scripts'
        force: true
        relativeAssets: true

      compile:
        options:
          outputStyle: 'expanded'
          environment: 'development'

      dist:
        options:
          outputStyle: 'compressed'
          environment: 'production'

    # Haml
    # ----
    haml:
      compile:
        files: expand ['src/templates/**/*.haml'], 'temp/templates/'
          rename: (base, path) ->
            console.log path
            path.replace(/^src\/templates\//, base).replace /\.haml$/, '.js'

        options:
          language: 'coffee'
          target: 'js'

      index:
        files: 'temp/index.html': 'src/index.haml'
        options:
          language: 'coffee'
          context:
            lazyload: true

      dist:
        files: 'temp/index.html': 'src/index.haml'
        options:
          language: 'coffee'
          context:
            lazyload: false

    # Watch
    # -----
    watch:
      coffee:
        files: 'src/scripts/**/*.coffee'
        tasks: [
          'coffee:compile'
          'urequire'
          'copy:amd'
        ]

      haml:
        files: ['src/templates/**/*.haml', 'src/index.haml']
        tasks: [
          'haml:compile'
          'haml:index'
        ]

      compass:
        files: 'src/styles/**/*.scss'
        tasks: 'compass:compile'

    # Module translation
    # ------------------
    urequire:
      AMD:
        bundlePath: 'temp/scripts/'
        outputPath: 'temp/scripts.amd/'

    # Development HTTP server
    # -----------------------
    connect:
      base: 'temp'
      hostname: 'localhost'
      port: 3501

    # Development app server
    # ----------------------
    # proxy:
    #   null

  # Dependencies
  # ============
  for listing in ['dependencies', 'devDependencies']
    for name, version of require('./package.json')[listing]
      if name.substring(0, 6) is 'grunt-'
        grunt.loadNpmTasks name

  # Tasks
  # =====

  # Default
  # -------
  grunt.registerTask 'default', [
    'clean:temp'
    'copy:temp'
    'coffee:compile'
    'urequire'
    'copy:amd'
    'haml:compile'
    'haml:index'
    # 'compass:compile'
    'connect'
    # 'proxy'
    'watch'
  ]
