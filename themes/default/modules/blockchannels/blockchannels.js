var mysql = require('../../../../classes/db/MySQL');
var stringUtils = require('../../../../classes/utils/StringUtils');

function BlockChannels() {
    this.name = "blockchannels";
    this.tab = "Blocks";
    this.version = 1.0;
}

BlockChannels.prototype = {
    createCategoryTree(data) {
        let flag;
        let str = '<ul class="nav navbar-nav">';
        for (var i = 0; i < data.length; i++) {
            var nodeText = data[i]['channel_name'];
            var nodeId = data[i]['id'];
            var link = data[i]['link'];
            var is_blank = data[i]['is_blank'];
            var channel_path = data[i]['channel_path'];
            var children = data[i]['children'];
            var href = '/channels/'+nodeId;
            if(link) {
                href = link;
            }
            //若有子分类，则遍历子分类
            if(children.length > 0) {
                flag = true;
                str += "<li class='dropdown'><a class='dropdown-toggle' data-toggle='dropdown' ";
                if(is_blank) {
                    str += 'target=_blank';
                }
                str += " id=" + nodeId + " href='"+href+"'>" + nodeText + "...<b class='caret'></b></a><ul class='dropdown-menu'>"
                str += this.createCategoryTree(children);
            } else {
                //若没有子分类
                flag = false;
                str += "<li><a class='category' " + "id=" + nodeId + " href='"+href+"'>" + nodeText + "</a>";
            }
            if (flag) {
                str += "</ul></li>"
            } else {
                str += "</li>";
            }
        }
        return str += '</ul>';
    },
    async hookHeader(params) {
        let channels = await mysql.query('select a.channel_id id,a.channel_path,a.parent_id ,b.channel_name,b.link,b.is_blank from ' +
            'tb_channel a inner join tb_channel_ext b on  a.channel_id = b.channel_id where is_display = 1 order by a.parent_id, a.priority asc');
        let data = stringUtils.recursion(channels, 0);
        return this.createCategoryTree(data);
    },

    async hookTop(params) {
        return await instance().hookHeader(params);
    }
}
function instance() {
    return new BlockChannels();
}

module.exports.instance = instance;
