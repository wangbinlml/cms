const fs = require('fs');
const mysql = require('./db/MySQL');
const stringUtils = require('./utils/StringUtils');
var express = require('express');
var Module = require('../classes/Module');
var router = express.Router();
function Router() {
    // module name
    this.name;
    // desc
    this.desc = "";
}
Router.prototype = {
    combine: async function (req, res, next, dt) {
        var module = new Module();
        var data = {
            title: 'Express',
            'HOOK_HEADER': await module.hookExec('header'),
            'HOOK_LEFT_COLUMN': await module.hookExec('leftColumn'),
            'HOOK_TOP': await module.hookExec('top'),
            'HOOK_HOME': await module.hookExec('home'),
            'HOOK_RIGHT_COLUMN' : await module.hookExec('rightColumn'),
            'HOOK_FOOTER': await module.hookExec('footer'),
        };
        data = Object.assign(data, dt);
        res.render('index', data);
    }
}

module.exports = router;