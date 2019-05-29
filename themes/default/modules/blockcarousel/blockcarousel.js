const mysql = require('../../../../classes/db/MySQL');
const stringUtil = require('../../../../classes/utils/StringUtils');
const path = require('path');
function Blockcarousel() {
    this.name = "Blockcarousel";
    this.tab = "Blocks";
    this.path = "carousel";
    this.version = 1.0;
}

Blockcarousel.prototype = {
    async hookLeftColumn(params) {
        let carousels = [];
        let images = await mysql.query('select distinct content_id from tb_content_picture order by content_id desc limit 10');
        for (var i=0; i<images.length; i++) {
            let content_id = images[i]['content_id'];
            let pic = await mysql.query('select  distinct a.content_id, d.title, c.img_path from tb_content a' +
                ' inner join tb_content_type b on a.type_id = b.type_id' +
                ' inner join tb_content_picture c on a.content_id = c.content_id' +
                ' inner join tb_content_ext d on d.content_id = a.content_id' +
                ' where a.type_id = 2 and a.content_id = '+content_id+' limit 1');
            carousels.push(pic[0]);
        }
        let file = path.join(__dirname, 'blockcarousel.ejs');
        return await
            stringUtil.renderFileSync(ejs, file, {carousels: carousels}, {});
    }
}

function instance() {
    return new Blockcarousel();
}

module.exports.getInstance = instance;
