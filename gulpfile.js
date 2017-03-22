var gulp       = require('gulp');
var watch      = require('gulp-watch');
var shell      = require('gulp-shell');
var livereload = require('gulp-livereload');

var options    = ({
	port: 8081,
	host: '127.0.0.1',
	start: true,
	reloadPage: 'resume.html'
});

gulp.task('make', function() {
    return gulp.src('./resume.md', {read: false})
            .pipe(shell([
            	'make html',
              'python main.py'
            ]))
            .pipe(livereload(options))
});

gulp.task('watch', function() {
  livereload.listen();
  gulp.watch(['./resume.md', './style_chmduquesne.css'], ['make']);
});

gulp.task('default', ['make', 'watch']);