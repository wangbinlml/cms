var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', async function (req, res, next) {
    var data = {
        title: 'Express',
        //'HOOK_HEADER': await module.hookExec('header'),
        //'HOOK_LEFT_COLUMN': await module.hookExec('leftColumn'),
        //'HOOK_TOP': await module.hookExec('top'),
        //'HOOK_HOME': await module.hookExec('home'),
        //'HOOK_RIGHT_COLUMN' : await module.hookExec('rightColumn'),
        //'HOOK_FOOTER': await module.hookExec('footer'),
    };
    res.render('templates/index', data);
});

module.exports = router;
