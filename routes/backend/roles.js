const express = require('express');
const mysql = require('../../classes/db/MySQL');
const log = require('../../classes/utils/Logger').getLogger("system");
const router = express.Router();
const _ = require('lodash');
const common = require("../../classes/Common");
const moment = require("moment");

/* GET users listing. */
router.get('/', (req, res, next) => {
    res.render('backend/role', {
        user: req.session.user,
        menus: req.session.menus,
        menu_active: req.session.menu_active['/admin/roles'] || {},
        title: '角色管理',
        router: '/admin/roles'
    });
});
router.get('/load', async(req, res, next) => {
    let sqlcount = "select count(*) count from tb_role where is_del=0";
    let sql = "select * from tb_role where is_del=0";

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

    let search = req.query.search;
    if (search) {
        sqlcount = sqlcount + " and role_name like '%" + search.value + "%'";
        sql = sql + " and role_name like '%" + search.value + "%'";
    }

    let memuCount = await mysql.query(sqlcount);
    sql = sql + " ORDER BY role_id DESC limit " + start + "," + length;
    let result = await mysql.query(sql);
    let backResult = {
        draw: draw,
        recordsTotal: memuCount['0']['count'],
        recordsFiltered: memuCount['0']['count'],
        data: []
    };
    for (let i in result) {
        backResult.data.push({
            role_id: result[i].role_id,
            is: result[i].role_id + "_",
            role_name: result[i].role_name,
            description: result[i].description,
            created_at: result[i].created_at ? moment(result[i].created_at).format("YYYY-MM-DD HH:mm:ss") : "",
            modified_at: result[i].modified_at != "0000-00-00 00:00:00" ? moment(result[i].modified_at).format("YYYY-MM-DD HH:mm:ss") : ""
        });
    }
    res.status(200).json(backResult);
});
router.get('/save', async(req, res, next) => {
    let result = {
        error: 0,
        msg: ""
    };
    try {
        let user = req.session.user;
        log.info("role save params: ", req.query);
        let e_id = req.query.e_id;
        let e_role_name = req.query.e_role_name;
        let e_description = req.query.e_description;
        if (e_role_name == "" || e_role_name.trim() == "") {
            result.msg = "角色不能为空";
        }
        if (result.msg != "") {
            result.error = 1;
        } else {
            let ret, sql;
            if (e_id) {
                sql = "update tb_role set role_name=?,description=?, modified_id=?, modified_at=? where role_id=?";
                let params = [e_role_name, e_description, user.id, new Date(), e_id];
                ret = await mysql.query(sql, params);
                await common.saveOperateLog(req, "更新角色：" + e_role_name + ";ID: " + e_id);
            } else {
                sql = "select * from tb_role where role_name=? and is_del=0";
                let users = await mysql.query(sql, e_role_name);
                if (users.length > 0) {
                    result.error = 1;
                    result.msg = "角色名已经存在！";
                } else {
                    sql = "insert tb_role(role_name, description,creator_id) values (?,?,?)";
                    ret = await mysql.query(sql, [e_role_name, e_description, user.id]);
                    await common.saveOperateLog(req, "新增角色名称：" + e_role_name);
                }
            }
            log.info("save role ret: ", ret);
        }
        res.status(200).json(result);
    } catch (e) {
        log.error("save role ret:", e);
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

    let conn = await mysql.getConnection();
    await mysql.beginTransaction(conn);
    try {
        let user = req.session.user;
        log.info("delete role params: ", req.body);
        let ids = req.body.ids;
        if (ids && ids.trim() != "") {
            ids = ids.split(",");
            let sql = 'delete from tb_menu_role where role_id in (';
            let sql2 = 'delete from tb_user_role where role_id in (';
            let sql3 = 'update tb_role set is_del=1, modified_at=?, modified_id=? where role_id in (';
            for (let i = 0; i < ids.length; i++) {
                if (i == 0) {
                    sql = sql + ids[i];
                    sql2 = sql2 + ids[i];
                    sql3 = sql3 + ids[i];
                } else {
                    sql = sql + "," + ids[i];
                    sql2 = sql2 + "," + ids[i];
                    sql3 = sql3 + "," + ids[i];
                }
            }
            sql = sql + ")";
            sql2 = sql2 + ")";
            sql3 = sql3 + ")";
            await mysql.query2(conn, sql);
            await mysql.query2(conn, sql2);
            await mysql.query2(conn, sql3, [new Date(), user.id]);
            await mysql.commit(conn);
            await common.saveOperateLog(req, "删除角色ID: " + ids);
        } else {
            result.error = 1;
            result.msg = "删除失败，必须选择一项";
            await mysql.rollback(conn);
        }
    } catch (e) {
        log.error("delete role ret:", e);
        result.error = 1;
        result.msg = "删除失败，请联系管理员";
        await mysql.rollback(conn);
    }
    res.status(200).json(result);
});
module.exports = router;