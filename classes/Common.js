const stringUtils = require("./utils/StringUtils");
const mysql = require('./db/MySQL');
const log = require('../classes/utils/Logger').getLogger("system");
module.exports.saveLoginLog = async (req) => {
    var user = req.session.user;
    var ip = req.ip;
    var locations = await stringUtils.getLocations(ip);
    log.info("客户端用户IP：", ip);
    await mysql.query("insert into tb_login_log(user_id,user_name,name,ip,locations,login_time) values(?,?,?,?,?,?)", [user.id_employee, user.username, user.nickname, ip, locations, new Date()]);
};
module.exports.saveOperateLog = async (req, operations) => {
    var user = req.session.user;
    await mysql.query("insert into tb_operation_logs(user_id,user_name,name,operations,operate_time) values(?,?,?,?,?)", [user.id_employee, user.username, user.nickname, operations, new Date()]);
};