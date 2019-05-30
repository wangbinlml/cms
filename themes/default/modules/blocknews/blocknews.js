const mysql = require('../../../../classes/db/MySQL');
const stringUtil = require('../../../../classes/utils/StringUtils');
const path = require('path');
const moment = require('moment');
function Blocknews() {
    this.name = "Blocknews";
    this.tab = "Blocks";
    this.path = "news";
    this.version = 1.0;
}

Blocknews.prototype = {
    async hookLeftColumn(params) {
        let news = await mysql.query('select a.channel_id,b.content_id,left(b.title,12) title,left(b.description,32) description,b.release_date from tb_content a inner join tb_content_ext b on a.content_id = b.content_id'+
        ' order by a.sort_date desc limit 5');
        let file = path.join(__dirname, 'blocknews.ejs');
        return await
            stringUtil.renderFileSync(ejs, file, {news: news,moment: moment}, {});
    }
}

function instance() {
    return new Blocknews();
}

module.exports.getInstance = instance;
