var express = require('express');
var router = express.Router();
var mdl = require('../classes/Module').instances();
/* GET home page. */
router.get('/', async function (req, res, next) {
    var data = {
        title: 'Express',
        'HOOK_HEADER': await mdl.hookExec('Header'),
        'HOOK_LEFT_COLUMN': await mdl.hookExec('leftColumn'),
        'HOOK_TOP': await mdl.hookExec('top'),
        'HOOK_HOME': await mdl.hookExec('home'),
        'HOOK_RIGHT_COLUMN' : await mdl.hookExec('rightColumn'),
        'HOOK_FOOTER': await mdl.hookExec('footer'),
    };
    res.render('templates/index', data);
});

module.exports = router;
