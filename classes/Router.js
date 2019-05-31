const fs = require('fs');
const mysql = require('./db/MySQL');
const stringUtils = require('./utils/StringUtils');
const express = require('express');
const router = express.Router();
const content = require('../routes/content');
const channels = require('../routes/channels');
const admin = require('../routes/admin');
const Module = require('../classes/Module');
const mdl = require('../classes/Module').instances();

function Router(app) {
    this.app = app;
    this.hook_header = null;
    this.hook_left_column = null;
    this.hook_right_column = null;
    this.hook_top = null;
    this.hook_home = null;
    this.hook_footer = null;
}

Router.prototype = {
    initHook: async function (params, init_router) {
        this.hook_header = await mdl.hookExec('Header', params, init_router);
        this.hook_left_column = await mdl.hookExec('LeftColumn', params, init_router);
        this.hook_right_column = await mdl.hookExec('RightColumn', params, init_router);
        this.hook_top = await mdl.hookExec('Top', params, init_router);
        this.hook_home = await mdl.hookExec('Home', params, init_router);
        this.hook_footer = await mdl.hookExec('Footer', params, init_router);
    },
    getHook: async function () {
        let data = {
            HOOK_HEADER: await this.hook_header,
            HOOK_LEFT_COLUMN: await this.hook_left_column,
            HOOK_RIGHT_COLUMN: await this.hook_right_column,
            HOOK_TOP: await this.hook_top,
            HOOK_HOME: await this.hook_home,
            HOOK_FOOTER: await this.hook_footer,
        };
        return data;
    },
    setAllRouter: function () {
        let _self = this;
        router.get("/", async function (req, res, next) {
            _self.homePage(req, res, next);
        });
        this.app.use("/", router);
        this.app.use('/admin', admin);
        let routers = mdl.routers;
        for (let path in routers) {
            this.app.use("/" + path, routers[path]);
        }
        this.app.use("/content", content);
        this.app.use("/channels", channels);
    },
    homePage: async function (req, res, next) {
        res.header("Access-Control-Allow-Origin", "*");
        res.header("Access-Control-Allow-Headers", "X-Requested-With");
        res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
        let params = req.method == 'POST' ? req.body : req.query;
        await this.initHook(params, false);
        let data = {
            title: '首页-CMS',
            HOOK_HEADER: await this.hook_header,
            HOOK_LEFT_COLUMN: await this.hook_left_column,
            HOOK_RIGHT_COLUMN: await this.hook_right_column,
            HOOK_TOP: await this.hook_top,
            HOOK_HOME: await this.hook_home,
            HOOK_FOOTER: await this.hook_footer,
        };
        res.render('templates/index', data);
    }
};

function instances(app) {

    return new Router(app);
}

module.exports.getInstances = instances;
