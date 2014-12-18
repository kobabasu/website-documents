module.exports = (grunt) ->

  cwd = process.cwd()
  process.chdir('../../../')
  grunt.loadNpmTasks 'grunt-este-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-requirejs'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-yuidoc'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-csso'
  grunt.loadNpmTasks 'grunt-styleguide'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'
  process.chdir(cwd)

  grunt.initConfig
    pkg: grunt.file.readJSON '../../../package.json'

    coffee:
      src:
        expand: true
        cwd: 'coffee/'
        src: ['*.coffee', '**/*.coffee']
        dest: 'public/js'
        ext: '.js'
      mocha:
        expand: true
        cwd: 'test/'
        src: ['*.coffee', '**/*.coffee']
        dest: 'public/test'
        ext: '.js'

    requirejs:
      public:
        almond:   true
        baseUrl:  'public/js'
        include:  ['main']
        out:      'public/js/main.min.js'
        mainConfigFile: ['public/js/main.js']
        optimize: 'uglify2'
        # optimize: 'closure'
        # optimize: 'none'
        # generateSourceMaps: true,
        # preserveLicenseComments: false,
        # useSourceUrl: true

    jshint:
      options:
        node: true

    coffeelint:
      app: [
        'coffee/**/*.coffee'
      ]
      options:
        'indentation':
          'level': 'ignore'

    yuidoc:
      public:
        compile:
          name: '<%= pkg.name %>'
        options:
          # extension: '.coffee'
          # syntaxtype: 'coffee'
          paths: 'public/js'
          outdir: 'public/doc/js'

    compass:
      dev:
        options:
          config: 'config.rb'
          environment: 'development'
          force: true
      production:
        options:
          config: 'config.rb'
          environment: 'production'
          force: true

    styleguide:
      public:
        options:
          framework:
            name: 'styledocco'
          name: '<%= pkg.name %>'
        files: {
          'public/doc/css': 'public/assets/css/style.css'
        }

    clean:
      public:
        'public/doc/css'

    imagemin:
      files: {
        expand: true,
        cwd: 'public/assets/img/src',
        src: '**/*.{png,jpg,gif}',
        dest: 'public/assets/img'
      }
      
    csso:
      files: {
        'public/assets/css/style.css': 'public/assets/css/style.css'
      }

    esteWatch:
      options:
        dirs: [
          'coffee/**/'
          'test/**/'
          'sass/**/'
          'public/doc/manual/source/**'
        ]
        livereload:
          enabled: false
      'coffee': (filepath) ->
        files = [
          expand: true
          src: filepath
          ext: '.js'
        ]
        grunt.config ['coffee','src','files'], files
        # grunt.config ['coffee','jasmine','files'], files
        grunt.config ['coffee','mocha','files'], files
        # ['coffee:src', 'coffee:jasmine', 'coffee:mocha']
        ['coffee:src', 'coffee:mocha']
      'sass': (filepath) ->
        files = [
          expand: true
          src: filepath
          ext: '.css'
        ]
        grunt.config ['compass','dev','files'], files
        ['compass:dev']

  grunt.registerTask 'default', [
    'compass:dev'
    'coffee'
    'styleguide'
  ]

  grunt.registerTask 'production', [
    'compass:production'
    'imagemin'
    'csso'
  ]

  grunt.registerTask 'watch', [
    'esteWatch'
  ]

  # console.log grunt.file.watchfiles
  return
