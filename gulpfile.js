var gulp = require('gulp');
var gutil = require('gulp-util');
var clean = require('gulp-clean');
var concat = require('gulp-concat');
var sass = require('gulp-sass');
var coffee = require('gulp-coffee');
var symlink = require('gulp-symlink');

var sources = {
  html: ['src/*.html', 'src/**/*.html'],
  sass: ['src/**/*.scss'],
  coffee: ['src/app.coffee', 'src/**/*.coffee']
};

var copies = [
  'bower_components/**',
  'assets/**'
];

gulp.task('default', ['clean-build', 'copy', 'html', 'sass', 'coffee', 'watch']);

gulp.task('clean-build', function() {
  return gulp.src('build/*', {read: false})
    .pipe(clean());
});

gulp.task('html', function() {
  return gulp.src(sources.html)
    .pipe(gulp.dest('build/'))
});

gulp.task('sass', function() {
  return gulp.src(sources.sass)
    .pipe(concat('application.scss'))
    .pipe(sass())
    .pipe(gulp.dest('build/css/'));
});

gulp.task('coffee', function() {
  return gulp.src(sources.coffee)
    .pipe(concat('application.coffee'))
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(gulp.dest('build/js/'));
});

gulp.task('watch', ['watch-html', 'watch-sass', 'watch-coffee']);

gulp.task('watch-html', function() {
  var watcher = gulp.watch(sources.html, ['html']);
});

gulp.task('watch-sass', function() {
  var watcher = gulp.watch(sources.sass, ['sass']);
});

gulp.task('watch-coffee', function() {
  var watcher = gulp.watch(sources.coffee, ['coffee']);
});

gulp.task('copy', function() {
  return gulp.src(copies, { "base" : "." })
    .pipe(gulp.dest('build/'));
});