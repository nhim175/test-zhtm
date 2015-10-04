var gulp = require('gulp');
var gutil = require('gulp-util');
var clean = require('gulp-clean');
var concat = require('gulp-concat');
var sass = require('gulp-sass');
var coffee = require('gulp-coffee');
var symlink = require('gulp-symlink');
var install = require('gulp-install');
var webserver = require('gulp-webserver');
var _ = require('lodash');

var sources = {
  html: ['src/*.html', 'src/**/*.html'],
  sass: ['src/**/*.scss'],
  coffee: ['src/app.coffee', 'src/**/*.coffee']
};

var copies = [
  'bower_components/**',
  'assets/**'
];

var symlinks = [
  { from: 'bower_components', to: 'build/bower_components' },
  { from: 'assets', to: 'build/assets' }
];

gulp.task('default', ['clean-build', 'copy', 'html', 'sass', 'coffee', 'watch', 'webserver']);

gulp.task('clean-build', function() {
  return gulp.src('build/*', {read: false})
    .pipe(clean());
});

gulp.task('install', function() {
  return gulp.src(['./bower.json']).pipe(install());
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

gulp.task('webserver', ['install'], function() {
  gulp.src('./build').pipe(webserver({
    host: '127.0.0.1',
    port: '3000'
  }));
});

gulp.task('copy', ['install'], function() {
  return _.each(symlinks, function(link) {
    gulp.src(link.from).pipe(symlink(link.to));
  });
});