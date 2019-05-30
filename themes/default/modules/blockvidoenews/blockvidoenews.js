const mysql = require('../../../../classes/db/MySQL');
const stringUtil = require('../../../../classes/utils/StringUtils');
const path = require('path');
function Blockvidoenews() {
    this.name = "Blockcarousel";
    this.tab = "Blocks";
    this.path = "carousel";
    this.version = 1.0;
}

Blockvidoenews.prototype = {
    async hookHome(params) {
        let vidoes = await mysql.query('select a.channel_id,b.content_id,b.title,b.type_img,left(b.description,32) description from tb_content a inner join tb_content_ext b on a.content_id = b.content_id' +
            ' where a.channel_id = 77 order by a.sort_date desc limit 10');
        let file = path.join(__dirname, 'blockvidoenews.ejs');
        let output = await stringUtil.renderFileSync(ejs, file, {vidoes: vidoes}, {})
        return output;
    }
}

function instance() {
    return new Blockvidoenews();
}

module.exports.getInstance = instance;
