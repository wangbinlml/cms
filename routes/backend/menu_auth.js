const mysql = require('../../classes/db/MySQL');
const log = require('../../classes/utils/Logger').getLogger("system");
const _ = require('lodash');
module.exports.check = function (req) {
    var url = req.url;
    log.info("requst url:", url);
    if (url.indexOf('/admin') == -1) {
        return true;
    }
    var urls = url.split("/");
    //一级路由名字
    var cname = urls.length>0 ? "/"+urls[1]+"/"+urls[2] : "/admin";
    var menu_roles = req.session.menu_roles;
    var exists = false;
    if (url.indexOf('/login') == 0 || url == '/admin' || url == '/401' || url == '/error' || url.indexOf('/verify') == 0) {
        exists = true;
    } else {
        for (var i = 0; i < menu_roles.length; i++) {
            var menu_role = menu_roles[i];
            var menu_url = menu_role['menu_url'];
            if(menu_url == "/admin") {
                continue;
            }
            if (menu_url != "" && cname == menu_url) {
                exists = true;
                break;
            }
        }
    }
    return exists;
};

module.exports.setMenus = async (req, user_id) => {
    var sql = "select a.user_id,b.role_id,b.role_name,b.description,d.menu_id,d.parent_id,d.menu_name,d.menu_url,d.menu_icon from tb_employee_role a LEFT JOIN tb_role b ON a.role_id =b.role_id LEFT JOIN tb_menu_role c ON b.role_id = c.role_id LEFT JOIN tb_menu d ON c.menu_id = d.menu_id where a.user_id=? GROUP BY d.menu_id ORDER BY d.parent_id ASC,d.priority ASC";
    var menu_roles = await mysql.query(sql, user_id);
    var menus = [];
    var userRole = [];
    var menu_active = {};
    if (menu_roles.length) {
        for (var i = 0; i < menu_roles.length; i++) {
            var menuRoleObj = menu_roles[i];
            var parent_id = menuRoleObj['parent_id'];
            if (_.indexOf(userRole, menuRoleObj['role_id']) == -1) {
                userRole.push(menuRoleObj['role_id']);
            }
            if (parent_id == 0) {
                var menuObj = {};
                menuObj['parent_id'] = parent_id;
                menuObj['menu_id'] = menuRoleObj['menu_id'];
                menuObj['menu_name'] = menuRoleObj['menu_name'];
                menuObj['menu_url'] = menuRoleObj['menu_url'];
                menuObj['menu_icon'] = menuRoleObj['menu_icon'];
                menuObj['menu_child'] = [];
                menus.push(menuObj);
                menu_active[menuRoleObj['menu_url']] = {}
            } else {
                for (var j = 0; j < menus.length; j++) {
                    var menuObj = menus[j];
                    var pid = menuObj['menu_id'];
                    if (pid == parent_id) {
                        var childObj = {}, menu_id = menuRoleObj['menu_id'], menu_url = menuRoleObj['menu_url'];
                        childObj['menu_id'] = menu_id;
                        childObj['parent_id'] = menuRoleObj['parent_id'];
                        childObj['menu_name'] = menuRoleObj['menu_name'];
                        childObj['menu_url'] = menu_url;
                        childObj['menu_icon'] = menuRoleObj['menu_icon'];
                        menuObj['menu_child'].push(childObj);
                        menu_active[menu_url] = {parent_id: parent_id, menu_id: menu_id}
                    }
                }
            }

        }
    }
    req.session.userRole = userRole;
    req.session.menus = menus;
    req.session.menu_roles = menu_roles;
    req.session.menu_active = menu_active;
};