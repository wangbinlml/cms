const mysql = require('../../../../classes/db/MySQL');
const stringUtil = require('../../../../classes/utils/StringUtils');
const path = require('path');
function Blockhottopics() {
    this.name = "Blockhottopics";
    this.tab = "Blocks";
    this.path = "topics";
    this.version = 1.0;
}

Blockhottopics.prototype = {
    async hookLeftColumn(params) {
        let topics = await mysql.query('select distinct c.*, d.views from tb_topic a\n' +
            ' inner join tb_content_topic b on a.topic_id = b.topic_id' +
            ' inner join tb_content e on b.content_id = e.content_id' +
            ' inner join tb_content_ext c on e.content_id = c.content_id' +
            ' inner join tb_content_count d on b.content_id=d.content_id' +
            ' order by  d.views desc limit 10;');
        let file = path.join(__dirname, 'blockhottopics.ejs');
        return await
            stringUtil.renderFileSync(ejs, file, {topics: topics}, {});
    }
}

function instance() {
    return new Blockhottopics();
}

module.exports.getInstance = instance;
