var mysql = require('../../../../classes/db/MySQL');
var stringUtils = require('../../../../classes/utils/StringUtils');

function BlockChannels() {
    this.name = "blockchannels";
    this.tab = "Blocks";
    this.version = 1.0;
}

BlockChannels.prototype = {
    createCategoryTree(data, params) {
        let flag;
        let str = '';
        for (var i = 0; i < data.length; i++) {
            var nodeText = data[i]['channel_name'];
            var nodeId = data[i]['id'];
            var parentId = data[i]['parent_id'];
            var link = data[i]['link'];
            var is_blank = data[i]['is_blank'];
            var channel_path = data[i]['channel_path'];
            var children = data[i]['children'];
            var href = '/channels?cid='+nodeId+"&pid="+parentId;
            if(link) {
                href = link;
            }
            var active = "";
            if(params && (params.cid == nodeId || params.pid == nodeId)) {
                active = 'active';
            }
            //若有子分类，则遍历子分类
            if(children.length > 0) {
                flag = true;
                str += "<li class='dropdown "+active+"'><a class='dropdown-toggle' data-toggle='dropdown' ";
                if(is_blank) {
                    str += 'target=_blank';
                }
                str += " id=" + nodeId + " href='"+href+"'>" + nodeText + "...<b class='caret'></b></a><ul class='dropdown-menu'>"
                str += this.createCategoryTree(children, params);
            } else {
                //若没有子分类
                flag = false;
                str += "<li class='"+active+"'><a class='category'" + "id=" + nodeId + " href='"+href+"'>" + nodeText + "</a>";
            }
            if (flag) {
                str += "</ul></li>"
            } else {
                str += "</li>";
            }
        }
        return str;
    },
    async hookHeader(params) {
        let channels = await mysql.query('select a.channel_id id,a.channel_path,a.parent_id,b.channel_name,b.link,b.is_blank from ' +
            'tb_channel a inner join tb_channel_ext b on  a.channel_id = b.channel_id where is_display = 1 order by a.parent_id, a.priority asc');
        let data = stringUtils.recursion(channels, 0);
        return '<ul class="nav navbar-nav">'+this.createCategoryTree(data, params)+"</ul>";
    },

    async hookTop(params) {
        return await instance().hookHeader(params);
    }
}
function instance() {
    return new BlockChannels();
}

module.exports.instance = instance;
