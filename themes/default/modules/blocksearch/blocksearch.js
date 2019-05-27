var path = require('path');
var stringUtil = require('../../../../classes/utils/StringUtils');

function BlockSearch() {
    this.name = "blocksearch";
    this.tab = "Blocks";
    this.version = 1.0;
}

BlockSearch.prototype = {
    _init() {
        //super._init();
    },
    install() {
        /*if (!super::install() || !this.registerHook('top') || !this.registerHook('header'))
            return false;*/
        return true;
    },
    hookLeftColumn(params) {
        var ejs = global.ejs;
    },

    hookRightColumn(params) {
        var ejs = global.ejs;
    },

    hookTop(params) {
        var ejs = global.ejs;
    },
    getContent() {

    },
    displayForm() {

    },
    async hookHeader(params) {
        var ejs = global.ejs;
        let file = path.join(__dirname, 'blocksearch.ejs');
        return await
            stringUtil.renderFileSync(ejs, file, {}, {});
    }
}
;

function instance() {
    return new BlockSearch();
}

module.exports.instance = instance;
