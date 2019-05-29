const path = require('path');
const stringUtil = require('../../../../classes/utils/StringUtils');

function BlockSearch() {
    this.name = "blocksearch";
    this.tab = "Blocks";
    this.path = "search"
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
        let ejs = global.ejs;
    },

    hookRightColumn(params) {
        let ejs = global.ejs;
    },

    hookTop(params) {
        let ejs = global.ejs;
    },
    getContent() {

    },
    displayForm() {

    },
    async hookHeader(params) {
        let ejs = global.ejs;
        let file = path.join(__dirname, 'blocksearch.ejs');
        if(params.keyword == undefined) {
            params.keyword = "";
        }
        return await
            stringUtil.renderFileSync(ejs, file, params, {});
    },
    async hookTop(params) {
        return await instance().hookHeader(params);
    }
}


function instance() {
    return new BlockSearch();
}

module.exports.instance = instance;
