const mysql = require('../../../../classes/db/MySQL');
const stringUtil = require('../../../../classes/utils/StringUtils');
const path = require('path');
function Blockfriendlink() {
    this.name = "Blockfriendlink";
    this.tab = "Blocks";
    this.path = "friendlink";
    this.version = 1.0;
}

Blockfriendlink.prototype = {
    async hookFooter(params) {
        let links = await mysql.query('select * from tb_friendlink where is_enabled = 1 order by priority desc');
        let file = path.join(__dirname, 'blockfriendlink.ejs');
        let output = await stringUtil.renderFileSync(ejs, file, {links: links}, {})
        return output;
    }
}

function instance() {
    return new Blockfriendlink();
}

module.exports.getInstance = instance;
