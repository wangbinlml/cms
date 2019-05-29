var createError = require('http-errors');
var log4js = require('log4js');
var express = require('express');
var ejs = require('ejs');
var path = require('path');
var cookieParser = require('cookie-parser');

var mysql = require('./classes/db/MySQL');
var stringUtils = require('./classes/utils/StringUtils');
const logger = require("./classes/utils/logger").getLogger("system");

global.ejs = ejs;
global.mysql = mysql;
global.logger = logger;
global.stringUtils = stringUtils;

var app = express();

(async (app) => {

// view engine setup
    app.set('views', path.join(__dirname, 'themes/default'));
    app.set('view engine', 'ejs');

    app.use(log4js.connectLogger(log4js.getLogger("express")));
    app.use(express.json());
    app.use(express.urlencoded({extended: false}));
    app.use(cookieParser());
    app.use(express.static(path.join(__dirname, 'themes/default')));

    var router = require('./classes/Router').getInstances(app);
    await router.initHook({}, true);
    router.setAllRouter();

    global.rt = router;

    // catch 404 and forward to error handler
    app.use(function (req, res, next) {
        next(createError(404));
        res.status(err.status);
        res.render('templates/404');
    });

    // error handler
    app.use(function (err, req, res, next) {
        // set locals, only providing error in development
        res.locals.message = err.message;
        res.locals.error = req.app.get('env') === 'development' ? err : {};

        // render the error page
        res.status(err.status || 500);
        res.render('templates/error', {error: 500, msg: err.message});
    });
})(app);
process.on('unhandledRejection', (err) => {
    console.log(err);
    process.exit(1);
});

module.exports = app;
