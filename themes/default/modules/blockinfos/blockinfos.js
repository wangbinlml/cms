var mysql = require('../../../../classes/db/MySQL');

function BlockSearch() {
    this.name = "blockinfos";
    this.tab = "Blocks";
    this.version = 1.0;
}

BlockInfos.prototype = {
    async hookLeftColumn(params) {
        let ejs = global.ejs;
        let cmslinks = await mysql.query('SELECT id_cms, meta_title FROM tb_cms');
        let file = path.join(__dirname, 'blockinfos.ejs');
        let str = await stringUtil.renderFileSync(ejs, file, cmslinks, {});
        return str;
    },

    async hookRightColumn(params) {
        return await this.hookLeftColumn(params);
    }
}
