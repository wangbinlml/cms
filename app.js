var createError = require('http-errors');
var log4js = require('log4js');
var express = require('express');
var ejs = require('ejs')
var path = require('path');
var cookieParser = require('cookie-parser');

var indexRouter = require('./router/index');
var usersRouter = require('./router/users');


var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'themes/default'));
app.set('view engine', 'ejs');

app.use(log4js.connectLogger(log4js.getLogger("express")));
app.use(express.json());
app.use(express.urlencoded({extended: false}));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'themes/default')));

app.use('/', indexRouter);
app.use('/users', usersRouter);

global.ejs = ejs;


// catch 404 and forward to error handler
app.use(function (req, res, next) {
    next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render('error');
});
module.exports = app;
