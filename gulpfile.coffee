gulp   = require 'gulp'
coffee = require 'gulp-coffee'
zip = require 'gulp-zip'
install = require 'gulp-install'
path = require 'path'

coffeeSrc = 'src/**/*.coffee'
libSrc = 'lib/**/*.js'
configSrc = 'config/**/*.json'
dest = 'build'

gulp.task 'compile-coffee', ->
  gulp.src coffeeSrc
    .pipe coffee()
    .pipe gulp.dest(dest)

gulp.task 'copy-libs', ->
  gulp.src libSrc
    .pipe gulp.dest(dest)

gulp.task 'copy-configs', ->
  gulp.src configSrc
    .pipe gulp.dest(path.join(dest, 'config'))

gulp.task 'package-install', ->
  gulp.src './package.json'
    .pipe gulp.dest(dest)
    .pipe install production: true

gulp.task 'build', ['compile-coffee', 'copy-libs', 'copy-configs']

gulp.task 'bundle', ['build', 'package-install'], ->
  gulp.src path.join(dest, '/**/*')
    .pipe zip("#{dest}.zip")
    .pipe gulp.dest('.')

gulp.task 'watch', -> gulp.watch [coffeeSrc, libSrc], ['build']

gulp.task 'default', ['build'], -> gulp.start 'watch'
