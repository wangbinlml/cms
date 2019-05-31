const express = require('express');
const router = express.Router();
const mdl = require('../classes/Module').instances();
const Pagination = require('../classes/utils/Pagination');

router.get('/', async function(req, res, next) {
    let rt = global.rt;
    let mysql = global.mysql;
    let params = req.method == 'POST' ? req.body : req.query;
    let channel_id = params.cid || "1";
    let current_page = params.current_page || "1";

    let channel = await mysql.query("select * from tb_channel_ext where channel_id=?", channel_id);

    let countSql = "select count(*) count from tb_content a" +
        " inner join tb_content_ext b on a.content_id = b.content_id" +
        " inner join tb_content_count c on b.content_id = c.content_id" +
        " inner join tb_content_type e on e.type_id = a.type_id" +
        " left join tb_content_picture d on c.content_id = d.content_id" +
        " left join tb_content_txt f on f.content_id = a.content_id" +
        " where a.channel_id = " + channel_id;

    let sql = "select e.type_id,e.type_name,a.content_id,a.channel_id,b.title,b.description,b.release_date," +
        " b.media_type,b.media_path,b.content_img,c.views,c.downloads,d.img_path,f.txt " +
        " from tb_content a" +
        " inner join tb_content_ext b on a.content_id = b.content_id" +
        " inner join tb_content_count c on b.content_id = c.content_id" +
        " inner join tb_content_type e on e.type_id = a.type_id" +
        " left join tb_content_picture d on c.content_id = d.content_id" +
        " left join tb_content_txt f on f.content_id = a.content_id" +
        " where a.channel_id = "+channel_id+" limit ?, ?";
    global.logger.info("detail：" + sql);
    let detail = await await Pagination.getData([countSql,sql], current_page,30);
    detail.cid = channel_id;
    let data = {
        HOOK_HEADER: await rt.hook_header,
        HOOK_TOP: await rt.hook_top,
        HOOK_FOOTER: await rt.hook_footer,
        HOOK_EXTRA_RIGHT_COLUMN: await mdl.hookExec('ExtraRight', params, true),
        data: detail
    };
    data.title = channel[0]['channel_name'];
    res.render('templates/channels', data);
});

module.exports = router;
