var express = require('express');
var router = express.Router();
var mdl = require('../classes/Module').instances();
/* GET home page. */
router.get('/', async function (req, res, next) {
    let rt = global.rt;
    let mysql = global.mysql;
    let params = req.method == 'POST' ? req.body : req.query;
    let sql = "select e.type_id,e.type_name,a.content_id,a.channel_id,b.title,b.description,b.release_date," +
        " b.media_type,b.media_path,b.content_img,c.views,c.downloads,d.img_path,f.txt " +
        " from tb_content a" +
        " inner join tb_content_ext b on a.content_id = b.content_id" +
        " inner join tb_content_count c on b.content_id = c.content_id" +
        " inner join tb_content_type e on e.type_id = a.type_id" +
        " left join tb_content_picture d on c.content_id = d.content_id" +
        " left join tb_content_txt f on f.content_id = a.content_id" +
        " where a.content_id = ?";
    global.logger.info("detail：" + sql);
    let detail = await mysql.query(sql, params.content_id);
    let data = {
        HOOK_HEADER: await rt.hook_header,
        HOOK_TOP: await rt.hook_top,
        HOOK_FOOTER: await rt.hook_footer,
        HOOK_EXTRA_RIGHT_COLUMN: await mdl.hookExec('ExtraRight', params, true),
        data: {}
    };
    data.title = "详情";
    if(detail && detail.length>0) {
        let obj = {};
        let images = [];
        for(let i = 0; i<detail.length; i++) {
            if(i == 0) {
                obj = detail[i];

            }
            if(detail[i]['img_path']) {
                images.push(detail[i]['img_path']);
            }

        }
        obj.images = images;
        data.data = obj;
        data.title = obj.title;
    }
    res.render('templates/content', data);
});

module.exports = router;
