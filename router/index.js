var express = require('express');
var router = express.Router();
var mdl = require('../classes/Module').instances();
/* GET home page. */
router.get('/', async function (req, res, next) {
    var data = {
        title: 'Express',
        'HOOK_HEADER': await mdl.hookExec('Header'),
        'HOOK_LEFT_COLUMN': await mdl.hookExec('LeftColumn'),
        'HOOK_TOP': await mdl.hookExec('Top'),
        'HOOK_HOME': await mdl.hookExec('Home'),
        'HOOK_RIGHT_COLUMN' : await mdl.hookExec('RightColumn'),
        'HOOK_FOOTER': await mdl.hookExec('Footer'),
    };
    res.render('templates/index', data);
});

module.exports = router;
