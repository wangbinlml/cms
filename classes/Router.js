const fs = require('fs');
const mysql = require('./db/MySQL');
const stringUtils = require('./utils/StringUtils');
var express = require('express');
var Module = require('../classes/Module');
var mdl = require('../classes/Module').instances();

function Router(app) {
    this.app = app;
}
Router.prototype = {
    setAllRouter: function(app) {
        var _self = this;
        app.all("/*", async function (req, res, next) {
            _self.homePage(req, res, next);
        });
    },
    setRouter: async function(req, res, next) {

    },
    homePage: async function (req, res, next) {
        res.header("Access-Control-Allow-Origin", "*");
        res.header("Access-Control-Allow-Headers", "X-Requested-With");
        res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
        var params = req.method == 'POST'? req.body: req.query;
        var data = {
            title: '首页-CMS',
            'HOOK_HEADER': await mdl.hookExec('Header', params),
            'HOOK_LEFT_COLUMN': await mdl.hookExec('LeftColumn', params),
            'HOOK_TOP': await mdl.hookExec('Top', params),
            'HOOK_HOME': await mdl.hookExec('Home', params),
            'HOOK_RIGHT_COLUMN': await mdl.hookExec('RightColumn', params),
            'HOOK_FOOTER': await mdl.hookExec('Footer', params),
        };
        res.render('templates/index', data);

    }
};

function instances(app) {

    return new Router(app);
}

module.exports.getInstances = instances;