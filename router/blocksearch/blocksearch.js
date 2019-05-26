var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
    res.render('modules/blocksearch/blocksearch.ejs', {
        title: 'blocksearch'
    });
});

module.exports = router;
