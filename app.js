const createError = require('http-errors');
const log4js = require('log4js');
const express = require('express');
const ejs = require('ejs');
const path = require('path');
const cookieParser = require('cookie-parser');
const moment = require('moment');
const expressSession = require('express-session');
const passport = require('./classes/passport');

const mysql = require('./classes/db/MySQL');
const stringUtils = require('./classes/utils/StringUtils');
const logger = require("./classes/utils/logger").getLogger("system");

//ejs.cache = false;
ejs.compileDebug = false;
ejs.debug = true;

global.ejs = ejs;
global.mysql = mysql;
global.logger = logger;
global.stringUtils = stringUtils;

const app = express();

(async (app) => {

    app.locals.moment = moment;
    // view engine setup
    app.set('views', path.join(__dirname, 'themes/default'));
    app.set('view engine', 'ejs');
    app.set('view cache', true);
    app.use(log4js.connectLogger(log4js.getLogger("express")));
    app.use(express.json());// for parsing application/json
    app.use(express.urlencoded({extended: false}));
    app.use(cookieParser());
    app.use(express.static(path.join(__dirname, 'themes/default')));
    app.use(express.static(path.join(__dirname, 'public')));
    app.use(express.static(path.join(__dirname, 'uploads')));

    // 使服务器支持session
    app.use(expressSession({
        secret: 'chenxun.org',
        resave: false,
        saveUninitialized: false
    }));
    // 初始化调用 passport
    app.use(passport.initialize());
    app.use(passport.session());

    const router = require('./classes/Router').getInstances(app);
    await router.initHook({}, true);
    router.setAllRouter();

    global.rt = router;

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
        res.render('error', {error: 500, msg: err.message});
    });
})(app);
process.on('unhandledRejection', (err) => {
    console.log(err);
    //process.exit(1);
});

module.exports = app;
