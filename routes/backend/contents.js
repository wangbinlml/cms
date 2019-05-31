const express = require('express');
const mysql = require('../../classes/db/MySQL');
const common = require('../../classes/Common');
const log = require('../../classes/utils/Logger').getLogger("system");
const router = express.Router();
const _ = require('lodash');
const moment = require("moment");

/* GET users listing. */
router.get('/', (req, res, next) => {
    res.
    render('backend/contents', {
        user: req.session.user,
        menus: req.session.menus,
        menu_active: req.session.menu_active['/admin/contents'] || {},
        title: '内容管理',
        router: '/admin/contents'
    });
});
router.get('/load', async(req, res, next) => {
    let sqlcount = "select count(*) count from tb_move where is_del=0";
    let sql = "select * from tb_move where is_del=0";

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

    let s_name = req.query.s_name;
    if (s_name) {
        sqlcount = sqlcount + " and name like '%" + s_name + "%'";
        sql = sql + " and name like '%" + s_name + "%'";
    }

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
        let tag_id = result[i].tag_id;
        if(tag_id == 1) {
            tag_id = "动作片";
        } else if(tag_id == 2) {
            tag_id = "科幻片";
        } else if(tag_id == 3) {
            tag_id = "剧情片";
        } else if(tag_id == 4) {
            tag_id = "喜剧片";
        } else if(tag_id == 5) {
            tag_id = "恐怖片";
        }

        backResult.data.push({
            id: result[i].id,
            is: result[i].id + "_",
            name: result[i].name,
            tag: tag_id,
            year: result[i].year,
            area: result[i].area,
            hot: result[i].hot,
            flash: result[i].flash,
            views: result[i].views,
            source: result[i].source,
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