const express = require('express');
const router = express.Router();

router.get('/', async function (req, res, next) {
    let rt = global.rt;
    let params = req.method == 'POST' ? req.body : req.query;
    await rt.initHook(params, false);
    let data = await rt.getHook();
    data.title = '搜索结果';
    data.keyword = params.keyword;
    res.render('templates/search', data);
});

module.exports = router;
