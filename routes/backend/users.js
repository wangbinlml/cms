const express = require('express');
const mysql = require('../../classes/db/MySQL');
const router = express.Router();
const log = require('../../classes/utils/Logger').getLogger("system");
const moment = require('moment');
const common = require("../../classes/Common");
const stringUtils = require('../../classes/utils/StringUtils');
const _ = require('lodash');
const UUID = require('uuid');
/* GET users listing. */
router.get('/', (req, res, next) => {
    res.render('backend/user', {
        user: req.session.user,
        menus: req.session.menus,
        menu_active: req.session.menu_active['/admin/users'] || {},
        title: '用户管理'
    });
});
router.get('/load', async(req, res, next) => {
    try {
        let sqlcount = "select count(*) count from tb_user where is_del=0 ";
        let sql = "select * from tb_user where is_del=0 ";

        let s_name = req.query.s_name;
        let s_user_name = req.query.s_user_name;

        if (s_name) {
            sqlcount = sqlcount + " and name like '%" + s_name.trim() + "%'";
            sql = sql + " and name like '%" + s_name.trim() + "%'";
        }
        if (s_user_name) {
            sqlcount = sqlcount + " and user_name like '%" + s_user_name.trim() + "%'";
            sql = sql + " and user_name like '%" + s_user_name.trim() + "%'";
        }
        let start = req.query.start;
        let length = req.query.length;
        let draw = req.query.draw;
        if (!start || !draw || !length) {
            res.status(401).json("invoke error!");
            return;
        }

        start = parseInt(start) || 0;
        length = parseInt(length) || 0;
        draw = parseInt(draw) || 0;
        let memuCount = await mysql.query(sqlcount);
        sql = sql + " ORDER BY id DESC limit " + start + "," + length;
        let result = await mysql.query(sql);
        let backResult = {
            draw: draw,
            recordsTotal: memuCount['0']['count'],
            recordsFiltered: memuCount['0']['count'],
            data: []
        };
        for (let i in result) {
            backResult.data.push({
                id: result[i].id,
                is: result[i].id + "_",
                user_name: result[i].user_name,
                name: result[i].name,
                mail: result[i].mail,
                phone: result[i].tel,
                created_at: result[i].created_at ? moment(result[i].created_at).format("YYYY-MM-DD HH:mm:ss") : "",
                modified_at: result[i].modified_at != "0000-00-00 00:00:00" ? moment(result[i].modified_at).format("YYYY-MM-DD HH:mm:ss") : "",
                sex: result[i].sex == "1" ? "男" : "女",
                birthday: result[i].birthday ? moment(result[i].birthday).format("YYYY-MM-DD") : ""
            });
        }
        res.status(200).json(backResult);
    } catch (e) {
        log.error("e");
        res.status(500).json({error: 1, msg: '内部错误'});
    }
});

router.get('/save', async(req, res, next) => {
    let result = {
        error: 0,
        msg: ""
    };
    try {
        let user = req.session.user;
        log.info("user save params: ", req.query);
        let e_id = req.query.e_id;
        let e_user_name = req.query.e_user_name;
        let e_name = req.query.e_name;
        let e_phone = req.query.e_phone;
        let e_sex = req.query.e_sex;
        let e_birthday = req.query.e_birthday;
        let e_mail = req.query.e_mail;
        let e_password = req.query.e_password;
        if (e_user_name == "" || e_user_name.trim() == "") {
            result.msg = "登录名不能为空";
        } else if (e_name == "" || e_name.trim() == "") {
            result.msg = "用户名称不能为空";
        } else if (e_id == "" && (e_password == "" || e_password.trim() == "")) {
            result.msg = "密码不能为空";
        } else if (e_birthday == "" || e_birthday.trim() == "") {
            result.msg = "生日不能为空";
        } else if (e_phone == "" || e_phone.trim() == "") {
            result.msg = "手机号不能为空";
        } else if (e_mail == "" || e_mail.trim() == "") {
            result.msg = "邮箱不能为空";
        }
        if (result.msg != "") {
            result.error = 1;
        } else {
            let ret, sql;
            let salt = UUID.v1();
            if (e_id) {
                sql = "update tb_user set name=?,user_name=?,birthday=?,tel=?,sex=?,mail=?, modified_id=?, modified_at=?";
                let params = [e_name, e_user_name, e_birthday || null, e_phone, e_sex, e_mail, user.id, new Date()];
                if (e_password != "" || e_password.trim() != "") {
                    sql = sql + ",password=? ";
                    sql = sql + ",salt=? ";
                    params.push(stringUtils.createPassword(e_password.trim()+salt));
                    params.push(salt);
                }
                sql = sql + "where id=?";
                params.push(e_id);
                ret = await mysql.query(sql, params);
                await common.saveOperateLog(req, "更新用户：" + e_name + ";ID: " + e_id);
            } else {
                sql = "select * from tb_user where user_name=? and is_del=0";
                let users = await mysql.query(sql, e_user_name);
                if (users.length > 0) {
                    result.error = 1;
                    result.msg = "用户名已经存在！";
                } else {
                    sql = "insert tb_user(user_name, password,name,mail,tel,sex,birthday,salt,creator_id) values (?,?,?,?,?,?,?,?,?)";
                    let password = stringUtils.createPassword(e_password.trim()+salt);
                    ret = await mysql.query(sql, [e_user_name, password, e_name, e_mail, e_phone, e_sex, e_birthday, salt, user.id]);
                    await common.saveOperateLog(req, "新增用户：" + e_name);
                }
            }
            log.info("save user ret: ", ret);
        }
        res.status(200).json(result);
    } catch (e) {
        log.error("save user ret:", e);
        result.error = 1;
        result.msg = "保存失败，请联系管理员";
        res.status(200).json(result);
    }
});
router.delete('/delete', async(req, res, next) => {
    let result = {
        error: 0,
        msg: ""
    };

    let user = req.session.user;
    let conn = await mysql.getConnection();
    await mysql.beginTransaction(conn);
    try {
        log.info("delete user params: ", req.body);
        let ids = req.body.ids;
        let user = req.session.user;
        let user_id = user.id;
        if (ids && ids.trim() != "") {
            ids = ids.split(",");
            if (_.indexOf(ids, user_id + "") != -1) {
                await mysql.rollback(conn);
                result.error = 1;
                result.msg = "不能删除自己";
                res.status(200).json(result);
                return;
            } else {
                let sql = 'update tb_user set is_del=1, modified_at=?, modified_id=? where id in (';
                let sql2 = 'delete from tb_user_role where user_id in (';
                for (let i = 0; i < ids.length; i++) {
                    if (i == 0) {
                        sql = sql + ids[i];
                        sql2 = sql2 + ids[i];
                    } else {
                        sql = sql + "," + ids[i];
                        sql2 = sql2 + "," + ids[i];
                    }
                }
                sql = sql + ")";
                sql2 = sql2 + ")";
                await mysql.query2(conn, sql, [new Date(), user.id]);
                await mysql.query2(conn, sql2);
                await mysql.commit(conn);
                await common.saveOperateLog(req, "删除用户ID: " + ids);
            }
        } else {
            result.error = 1;
            result.msg = "删除失败，必须选择一项";
            await mysql.rollback(conn);
        }
    } catch (e) {
        log.error("delete user ret:", e);
        result.error = 1;
        result.msg = "删除失败，请联系管理员";
        await mysql.rollback(conn);
    }
    res.status(200).json(result);
});
module.exports = router;