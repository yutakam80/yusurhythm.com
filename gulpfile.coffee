gulp = require 'gulp'
browserSync = require 'browser-sync'
compass = require 'gulp-compass'

gulp.task 'browserSync', ->
  browserSync.init null,
    server:
      baseDir: 'html'
    host: '0.0.0.0'

gulp.task 'bsReload', ->
  browserSync.reload()

gulp.task 'compass', ->
  gulp.src 'src/sass/*.scss'
    .pipe compass
        css: 'html/assets/css/'
        sass: 'src/sass/'
        image: 'src/sprite/'
        generated_images_path: 'html/assets/img/'
    .pipe gulp.dest('html/assets/css/')
    
gulp.task 'serve', [ 'browserSync' ], ->
  gulp.watch 'html/**/*.html', [ 'bsReload' ]
  gulp.watch 'html/**/*.css', [ 'bsReload' ]
  gulp.watch 'src/**/*.scss', [ 'compass' ]
